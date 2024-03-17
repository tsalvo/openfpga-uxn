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
-- BIN_OP_EQ[uxn_opcodes_h_l2340_c6_5b40]
signal BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2340_c2_d36d]
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2340_c2_d36d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2340_c2_d36d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2340_c2_d36d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2340_c2_d36d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2340_c2_d36d]
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2340_c2_d36d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2340_c2_d36d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2340_c2_d36d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2340_c2_d36d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2340_c2_d36d]
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2340_c2_d36d]
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2340_c2_d36d]
signal t16_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2353_c11_e474]
signal BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2353_c7_48b5]
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2353_c7_48b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2353_c7_48b5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2353_c7_48b5]
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2353_c7_48b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2353_c7_48b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2353_c7_48b5]
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2353_c7_48b5]
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2353_c7_48b5]
signal t16_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2356_c11_206a]
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2356_c7_3ac4]
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2356_c7_3ac4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2356_c7_3ac4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2356_c7_3ac4]
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2356_c7_3ac4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2356_c7_3ac4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2356_c7_3ac4]
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2356_c7_3ac4]
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2356_c7_3ac4]
signal t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2358_c3_2f33]
signal CONST_SL_8_uxn_opcodes_h_l2358_c3_2f33_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2358_c3_2f33_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_cc21]
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2361_c7_b6ff]
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_b6ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2361_c7_b6ff]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2361_c7_b6ff]
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_b6ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_b6ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2361_c7_b6ff]
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2361_c7_b6ff]
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2361_c7_b6ff]
signal t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2362_c3_5435]
signal BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2365_c11_103b]
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2365_c7_a558]
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2365_c7_a558]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2365_c7_a558]
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2365_c7_a558]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2365_c7_a558]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2365_c7_a558]
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2365_c7_a558]
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2367_c30_2983]
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_7fb2]
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2372_c7_d572]
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_d572]
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_d572]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_d572]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2372_c7_d572]
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2375_c22_32d2]
signal BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_return_output : unsigned(16 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
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
-- BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_left,
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_right,
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_cond,
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d
n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_cond,
n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d
n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_cond,
n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue,
n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse,
n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output);

-- t16_MUX_uxn_opcodes_h_l2340_c2_d36d
t16_MUX_uxn_opcodes_h_l2340_c2_d36d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2340_c2_d36d_cond,
t16_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue,
t16_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse,
t16_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_left,
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_right,
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_cond,
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5
n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_cond,
n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue,
n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse,
n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5
n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_cond,
n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue,
n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse,
n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output);

-- t16_MUX_uxn_opcodes_h_l2353_c7_48b5
t16_MUX_uxn_opcodes_h_l2353_c7_48b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2353_c7_48b5_cond,
t16_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue,
t16_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse,
t16_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_left,
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_right,
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond,
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4
n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond,
n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue,
n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse,
n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4
n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond,
n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue,
n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse,
n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output);

-- t16_MUX_uxn_opcodes_h_l2356_c7_3ac4
t16_MUX_uxn_opcodes_h_l2356_c7_3ac4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond,
t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue,
t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse,
t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2358_c3_2f33
CONST_SL_8_uxn_opcodes_h_l2358_c3_2f33 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2358_c3_2f33_x,
CONST_SL_8_uxn_opcodes_h_l2358_c3_2f33_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_left,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_right,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond,
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff
n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond,
n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue,
n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse,
n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff
n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond,
n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue,
n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse,
n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output);

-- t16_MUX_uxn_opcodes_h_l2361_c7_b6ff
t16_MUX_uxn_opcodes_h_l2361_c7_b6ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond,
t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue,
t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse,
t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435
BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_left,
BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_right,
BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_left,
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_right,
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_cond,
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_cond,
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2365_c7_a558
n16_low_MUX_uxn_opcodes_h_l2365_c7_a558 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_cond,
n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue,
n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse,
n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2365_c7_a558
n16_high_MUX_uxn_opcodes_h_l2365_c7_a558 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_cond,
n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue,
n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse,
n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2367_c30_2983
sp_relative_shift_uxn_opcodes_h_l2367_c30_2983 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_ins,
sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_x,
sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_y,
sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_left,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_right,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_cond,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_cond,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2372_c7_d572
n16_low_MUX_uxn_opcodes_h_l2372_c7_d572 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_cond,
n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue,
n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse,
n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_left,
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_right,
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
 n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
 n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
 t16_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output,
 n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output,
 n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output,
 t16_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output,
 n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output,
 n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output,
 t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output,
 CONST_SL_8_uxn_opcodes_h_l2358_c3_2f33_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output,
 n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output,
 n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output,
 t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_return_output,
 n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_return_output,
 n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_return_output,
 sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_return_output,
 n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2350_c3_54c0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2345_c3_8e9f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_d36d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_3aef : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_f486 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_2f33_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_2f33_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2363_c3_a9dc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2361_c7_b6ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2375_c3_7faf : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2374_c3_52f3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_aeaa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_e4b2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2353_l2365_l2356_l2361_DUPLICATE_743f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2353_l2356_l2372_l2361_DUPLICATE_fd81_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2356_l2353_l2372_l2365_l2361_DUPLICATE_f727_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2362_l2357_DUPLICATE_3c88_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l2380_l2335_DUPLICATE_1f66_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2374_c3_52f3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2374_c3_52f3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_f486 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_f486;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2345_c3_8e9f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2345_c3_8e9f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_3aef := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_3aef;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2363_c3_a9dc := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2363_c3_a9dc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2350_c3_54c0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2350_c3_54c0;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_y := to_signed(-4, 4);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse := t16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2340_c2_d36d_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2356_c11_206a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2353_l2356_l2372_l2361_DUPLICATE_fd81 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2353_l2356_l2372_l2361_DUPLICATE_fd81_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2356_l2353_l2372_l2365_l2361_DUPLICATE_f727 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2356_l2353_l2372_l2365_l2361_DUPLICATE_f727_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2340_c2_d36d_return_output := result.is_stack_index_flipped;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2361_c7_b6ff] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2361_c7_b6ff_return_output := result.stack_address_sp_offset;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2340_c2_d36d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_cc21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_left;
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_return_output := BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2367_c30_2983] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_ins;
     sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_x;
     sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_return_output := sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_7fb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2362_l2357_DUPLICATE_3c88 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2362_l2357_DUPLICATE_3c88_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_e4b2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_e4b2_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2340_c6_5b40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_left;
     BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output := BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2353_c11_e474] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_left;
     BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_return_output := BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2353_l2365_l2356_l2361_DUPLICATE_743f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2353_l2365_l2356_l2361_DUPLICATE_743f_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2365_c11_103b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2375_c22_32d2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2340_c2_d36d_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_aeaa LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_aeaa_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_d36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_5b40_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_e474_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_206a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_cc21_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_103b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7fb2_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2375_c3_7faf := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_32d2_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2362_l2357_DUPLICATE_3c88_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_2f33_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2362_l2357_DUPLICATE_3c88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2353_l2356_l2372_l2361_DUPLICATE_fd81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2353_l2356_l2372_l2361_DUPLICATE_fd81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2353_l2356_l2372_l2361_DUPLICATE_fd81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2353_l2356_l2372_l2361_DUPLICATE_fd81_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_e4b2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_e4b2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_e4b2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_e4b2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_e4b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2356_l2353_l2372_l2365_l2361_DUPLICATE_f727_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2356_l2353_l2372_l2365_l2361_DUPLICATE_f727_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2356_l2353_l2372_l2365_l2361_DUPLICATE_f727_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2356_l2353_l2372_l2365_l2361_DUPLICATE_f727_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2356_l2353_l2372_l2365_l2361_DUPLICATE_f727_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2353_l2365_l2356_l2361_DUPLICATE_743f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2353_l2365_l2356_l2361_DUPLICATE_743f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2353_l2365_l2356_l2361_DUPLICATE_743f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2353_l2365_l2356_l2361_DUPLICATE_743f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_aeaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_aeaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_aeaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_aeaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2356_l2353_l2340_l2372_l2361_DUPLICATE_aeaa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2340_c2_d36d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2340_c2_d36d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2340_c2_d36d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2340_c2_d36d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2361_c7_b6ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_2983_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2375_c3_7faf;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_d572] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_d572] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_return_output := result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2365_c7_a558] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_cond;
     n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_return_output := n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_b6ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2358_c3_2f33] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2358_c3_2f33_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_2f33_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_2f33_return_output := CONST_SL_8_uxn_opcodes_h_l2358_c3_2f33_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2372_c7_d572] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_return_output := result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2362_c3_5435] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_left;
     BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_return_output := BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_d572] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2365_c7_a558] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2372_c7_d572] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_cond;
     n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_return_output := n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_5435_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_2f33_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_a558_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_d572_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_d572_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_a558_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_d572_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_d572_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_d572_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2361_c7_b6ff] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2361_c7_b6ff] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond;
     n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output := n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2365_c7_a558] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2365_c7_a558] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_return_output := result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2356_c7_3ac4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2365_c7_a558] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2365_c7_a558] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_cond;
     n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_return_output := n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2365_c7_a558] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_return_output := result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_return_output;

     -- t16_MUX[uxn_opcodes_h_l2361_c7_b6ff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond <= VAR_t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond;
     t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue;
     t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output := t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_a558_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_a558_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_a558_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_a558_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_a558_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2356_c7_3ac4] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond;
     n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output := n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2361_c7_b6ff] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output := result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_b6ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2361_c7_b6ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output := result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2361_c7_b6ff] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond;
     n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output := n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2356_c7_3ac4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2353_c7_48b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2356_c7_3ac4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond;
     t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue;
     t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output := t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_b6ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_b6ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2356_c7_3ac4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2356_c7_3ac4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2353_c7_48b5] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_cond;
     n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output := n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2356_c7_3ac4] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond;
     n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output := n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2356_c7_3ac4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output := result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2353_c7_48b5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2353_c7_48b5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2353_c7_48b5_cond;
     t16_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue;
     t16_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output := t16_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2356_c7_3ac4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2353_c7_48b5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_3ac4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2353_c7_48b5] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_cond;
     n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output := n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2340_c2_d36d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2340_c2_d36d_cond;
     t16_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue;
     t16_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output := t16_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2353_c7_48b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2353_c7_48b5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2353_c7_48b5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output := result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_cond;
     n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output := n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2353_c7_48b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_48b5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output := result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_cond;
     n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output := n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2340_c2_d36d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l2380_l2335_DUPLICATE_1f66 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l2380_l2335_DUPLICATE_1f66_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_d36d_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l2380_l2335_DUPLICATE_1f66_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l2380_l2335_DUPLICATE_1f66_return_output;
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
