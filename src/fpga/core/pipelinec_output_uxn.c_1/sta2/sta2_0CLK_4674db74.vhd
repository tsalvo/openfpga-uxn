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
-- Submodules: 64
entity sta2_0CLK_4674db74 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_4674db74;
architecture arch of sta2_0CLK_4674db74 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2339_c6_d6b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2339_c2_1554]
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2339_c2_1554]
signal t16_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2339_c2_1554]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2339_c2_1554]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2339_c2_1554]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2339_c2_1554]
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2339_c2_1554]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2339_c2_1554]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2339_c2_1554]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2339_c2_1554]
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2339_c2_1554]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2339_c2_1554]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2339_c2_1554]
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2352_c11_5c03]
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2352_c7_26a2]
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2352_c7_26a2]
signal t16_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2352_c7_26a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c7_26a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2352_c7_26a2]
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2352_c7_26a2]
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2352_c7_26a2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2352_c7_26a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2352_c7_26a2]
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2355_c11_fb7c]
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2355_c7_1f16]
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2355_c7_1f16]
signal t16_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2355_c7_1f16]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2355_c7_1f16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2355_c7_1f16]
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2355_c7_1f16]
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2355_c7_1f16]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2355_c7_1f16]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2355_c7_1f16]
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2357_c3_a2dd]
signal CONST_SL_8_uxn_opcodes_h_l2357_c3_a2dd_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2357_c3_a2dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_071d]
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2360_c7_e450]
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2360_c7_e450]
signal t16_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_e450]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_e450]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2360_c7_e450]
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2360_c7_e450]
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2360_c7_e450]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_e450]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2360_c7_e450]
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2361_c3_dfe8]
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_5aea]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2364_c7_1f31]
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_1f31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_1f31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_1f31]
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2364_c7_1f31]
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2364_c7_1f31]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2364_c7_1f31]
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2366_c30_cce1]
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2371_c11_1af4]
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2371_c7_ee93]
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2371_c7_ee93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2371_c7_ee93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2371_c7_ee93]
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2371_c7_ee93]
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2374_c22_6e6f]
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_return_output : unsigned(16 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_1899( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2339_c2_1554
n16_high_MUX_uxn_opcodes_h_l2339_c2_1554 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_cond,
n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue,
n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse,
n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_return_output);

-- t16_MUX_uxn_opcodes_h_l2339_c2_1554
t16_MUX_uxn_opcodes_h_l2339_c2_1554 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2339_c2_1554_cond,
t16_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue,
t16_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse,
t16_MUX_uxn_opcodes_h_l2339_c2_1554_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_cond,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_cond,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2339_c2_1554
n16_low_MUX_uxn_opcodes_h_l2339_c2_1554 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_cond,
n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue,
n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse,
n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_left,
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_right,
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2
n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_cond,
n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue,
n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse,
n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output);

-- t16_MUX_uxn_opcodes_h_l2352_c7_26a2
t16_MUX_uxn_opcodes_h_l2352_c7_26a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2352_c7_26a2_cond,
t16_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue,
t16_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse,
t16_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_cond,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2
n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_cond,
n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue,
n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse,
n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_left,
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_right,
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16
n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_cond,
n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue,
n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse,
n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output);

-- t16_MUX_uxn_opcodes_h_l2355_c7_1f16
t16_MUX_uxn_opcodes_h_l2355_c7_1f16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2355_c7_1f16_cond,
t16_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue,
t16_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse,
t16_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_cond,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_cond,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16
n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_cond,
n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue,
n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse,
n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2357_c3_a2dd
CONST_SL_8_uxn_opcodes_h_l2357_c3_a2dd : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2357_c3_a2dd_x,
CONST_SL_8_uxn_opcodes_h_l2357_c3_a2dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_left,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_right,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2360_c7_e450
n16_high_MUX_uxn_opcodes_h_l2360_c7_e450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_cond,
n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue,
n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse,
n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_return_output);

-- t16_MUX_uxn_opcodes_h_l2360_c7_e450
t16_MUX_uxn_opcodes_h_l2360_c7_e450 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2360_c7_e450_cond,
t16_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue,
t16_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse,
t16_MUX_uxn_opcodes_h_l2360_c7_e450_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_cond,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_cond,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2360_c7_e450
n16_low_MUX_uxn_opcodes_h_l2360_c7_e450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_cond,
n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue,
n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse,
n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8
BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_left,
BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_right,
BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31
n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_cond,
n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue,
n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse,
n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_cond,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_cond,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31
n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_cond,
n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue,
n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse,
n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1
sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_ins,
sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_x,
sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_y,
sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_left,
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_right,
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_cond,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_cond,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93
n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_cond,
n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue,
n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse,
n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_left,
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_right,
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 n16_high,
 n16_low,
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output,
 n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
 t16_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
 n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_return_output,
 n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output,
 t16_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output,
 n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_return_output,
 n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output,
 t16_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output,
 n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output,
 CONST_SL_8_uxn_opcodes_h_l2357_c3_a2dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_return_output,
 n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_return_output,
 t16_MUX_uxn_opcodes_h_l2360_c7_e450_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_return_output,
 n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_return_output,
 n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output,
 n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output,
 sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output,
 n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_96d8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_387b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_0b60 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_7969 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_a2dd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_a2dd_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_271d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_e450_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2374_c3_2845 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_8ce7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_c55f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_caad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_ab0e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_a841_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_697d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_dd2a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l2379_l2334_DUPLICATE_b7b6_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n16_high := n16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_0b60 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_0b60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_96d8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_96d8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_387b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_387b;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_8ce7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_8ce7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_271d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_271d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_7969 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_7969;
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_y := to_signed(-4, 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse := t16;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2360_c7_e450] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_e450_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_a841 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_a841_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_caad LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_caad_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2371_c11_1af4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2339_c6_d6b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2355_c11_fb7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_1554_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_dd2a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_dd2a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_5aea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_1554_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_071d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_c55f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_c55f_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2352_c11_5c03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_left;
     BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_return_output := BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_697d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_697d_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_1554_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_ab0e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_ab0e_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2374_c22_6e6f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_1554_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l2366_c30_cce1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_ins;
     sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_x;
     sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_return_output := sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_1554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_d6b0_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_26a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_5c03_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_1f16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_fb7c_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_e450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_071d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5aea_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_1af4_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2374_c3_2845 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6e6f_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_dd2a_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_a2dd_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_dd2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_ab0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_ab0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_ab0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_ab0e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_caad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_caad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_caad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_caad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_caad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_a841_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_a841_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_a841_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_a841_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_a841_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_697d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_697d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_697d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_697d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_c55f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_c55f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_c55f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_c55f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_c55f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_1554_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_1554_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_1554_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_1554_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_e450_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_cce1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2374_c3_2845;
     -- n16_low_MUX[uxn_opcodes_h_l2371_c7_ee93] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_cond;
     n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output := n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2371_c7_ee93] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output := result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2361_c3_dfe8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_left;
     BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_return_output := BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2371_c7_ee93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2364_c7_1f31] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_cond;
     n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output := n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_e450] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2364_c7_1f31] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2357_c3_a2dd] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2357_c3_a2dd_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_a2dd_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_a2dd_return_output := CONST_SL_8_uxn_opcodes_h_l2357_c3_a2dd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2371_c7_ee93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2371_c7_ee93] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output := result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_dfe8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_a2dd_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_ee93_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_1f31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2364_c7_1f31] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output := result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2355_c7_1f16] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2360_c7_e450] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_1f31] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output := result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2360_c7_e450] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_cond;
     n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_return_output := n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;

     -- t16_MUX[uxn_opcodes_h_l2360_c7_e450] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2360_c7_e450_cond <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_e450_cond;
     t16_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue;
     t16_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_e450_return_output := t16_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2364_c7_1f31] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_cond;
     n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output := n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_1f31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_1f31_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_e450] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;

     -- t16_MUX[uxn_opcodes_h_l2355_c7_1f16] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2355_c7_1f16_cond <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_1f16_cond;
     t16_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue;
     t16_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output := t16_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2360_c7_e450] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_return_output := result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2360_c7_e450] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_return_output := result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2355_c7_1f16] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2355_c7_1f16] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_cond;
     n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output := n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2360_c7_e450] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_cond;
     n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_return_output := n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_e450] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2352_c7_26a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_e450_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;
     -- t16_MUX[uxn_opcodes_h_l2352_c7_26a2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2352_c7_26a2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_26a2_cond;
     t16_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue;
     t16_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output := t16_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2355_c7_1f16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2355_c7_1f16] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output := result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2355_c7_1f16] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2355_c7_1f16] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output := result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2352_c7_26a2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2355_c7_1f16] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_cond;
     n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output := n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2352_c7_26a2] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_cond;
     n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output := n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_1f16_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c7_26a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2339_c2_1554_cond <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_1554_cond;
     t16_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue;
     t16_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_1554_return_output := t16_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2352_c7_26a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2352_c7_26a2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output := result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_cond;
     n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_return_output := n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2352_c7_26a2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2352_c7_26a2] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_cond;
     n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output := n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_26a2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_return_output := result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_return_output := result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2339_c2_1554] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_cond;
     n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_return_output := n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_1554_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l2379_l2334_DUPLICATE_b7b6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l2379_l2334_DUPLICATE_b7b6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1899(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_1554_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_1554_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l2379_l2334_DUPLICATE_b7b6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l2379_l2334_DUPLICATE_b7b6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     n16_high <= REG_COMB_n16_high;
     n16_low <= REG_COMB_n16_low;
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
