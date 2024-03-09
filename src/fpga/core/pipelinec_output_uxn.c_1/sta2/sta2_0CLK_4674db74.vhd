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
-- BIN_OP_EQ[uxn_opcodes_h_l2340_c6_2a05]
signal BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2340_c2_f6bb]
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2340_c2_f6bb]
signal t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2340_c2_f6bb]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2340_c2_f6bb]
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2340_c2_f6bb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2340_c2_f6bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2340_c2_f6bb]
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2340_c2_f6bb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2340_c2_f6bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2340_c2_f6bb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2340_c2_f6bb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2340_c2_f6bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2340_c2_f6bb]
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2353_c11_b412]
signal BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2353_c7_c1cf]
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2353_c7_c1cf]
signal t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2353_c7_c1cf]
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2353_c7_c1cf]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2353_c7_c1cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2353_c7_c1cf]
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2353_c7_c1cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2353_c7_c1cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2353_c7_c1cf]
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2356_c11_a898]
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2356_c7_6887]
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2356_c7_6887]
signal t16_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2356_c7_6887]
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2356_c7_6887]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2356_c7_6887]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2356_c7_6887]
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2356_c7_6887]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2356_c7_6887]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2356_c7_6887]
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2358_c3_2e81]
signal CONST_SL_8_uxn_opcodes_h_l2358_c3_2e81_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2358_c3_2e81_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_a460]
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2361_c7_7162]
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2361_c7_7162]
signal t16_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2361_c7_7162]
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2361_c7_7162]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_7162]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2361_c7_7162]
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_7162]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_7162]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2361_c7_7162]
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2362_c3_1d94]
signal BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2365_c11_5798]
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2365_c7_d889]
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2365_c7_d889]
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2365_c7_d889]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2365_c7_d889]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2365_c7_d889]
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2365_c7_d889]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2365_c7_d889]
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2367_c30_feb1]
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_180a]
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_2aee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2372_c7_2aee]
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_2aee]
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_2aee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2372_c7_2aee]
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2375_c22_34d3]
signal BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_return_output : unsigned(16 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d9be( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.sp_relative_shift := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_left,
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_right,
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb
n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond,
n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue,
n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse,
n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output);

-- t16_MUX_uxn_opcodes_h_l2340_c2_f6bb
t16_MUX_uxn_opcodes_h_l2340_c2_f6bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond,
t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue,
t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse,
t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond,
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb
n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond,
n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue,
n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse,
n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_left,
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_right,
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf
n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond,
n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue,
n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse,
n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output);

-- t16_MUX_uxn_opcodes_h_l2353_c7_c1cf
t16_MUX_uxn_opcodes_h_l2353_c7_c1cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond,
t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue,
t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse,
t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond,
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf
n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond,
n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue,
n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse,
n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_left,
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_right,
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2356_c7_6887
n16_high_MUX_uxn_opcodes_h_l2356_c7_6887 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_cond,
n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue,
n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse,
n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_return_output);

-- t16_MUX_uxn_opcodes_h_l2356_c7_6887
t16_MUX_uxn_opcodes_h_l2356_c7_6887 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2356_c7_6887_cond,
t16_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue,
t16_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse,
t16_MUX_uxn_opcodes_h_l2356_c7_6887_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_cond,
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_cond,
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2356_c7_6887
n16_low_MUX_uxn_opcodes_h_l2356_c7_6887 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_cond,
n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue,
n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse,
n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2358_c3_2e81
CONST_SL_8_uxn_opcodes_h_l2358_c3_2e81 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2358_c3_2e81_x,
CONST_SL_8_uxn_opcodes_h_l2358_c3_2e81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_left,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_right,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2361_c7_7162
n16_high_MUX_uxn_opcodes_h_l2361_c7_7162 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_cond,
n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue,
n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse,
n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_return_output);

-- t16_MUX_uxn_opcodes_h_l2361_c7_7162
t16_MUX_uxn_opcodes_h_l2361_c7_7162 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2361_c7_7162_cond,
t16_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue,
t16_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse,
t16_MUX_uxn_opcodes_h_l2361_c7_7162_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_cond,
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_cond,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2361_c7_7162
n16_low_MUX_uxn_opcodes_h_l2361_c7_7162 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_cond,
n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue,
n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse,
n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94
BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_left,
BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_right,
BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_left,
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_right,
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2365_c7_d889
n16_high_MUX_uxn_opcodes_h_l2365_c7_d889 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_cond,
n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue,
n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse,
n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_cond,
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_cond,
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2365_c7_d889
n16_low_MUX_uxn_opcodes_h_l2365_c7_d889 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_cond,
n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue,
n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse,
n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1
sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_ins,
sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_x,
sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_y,
sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_left,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_right,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_cond,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_cond,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee
n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_cond,
n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue,
n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse,
n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_left,
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_right,
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output,
 n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
 t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
 n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_return_output,
 n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output,
 t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output,
 n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_return_output,
 n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_return_output,
 t16_MUX_uxn_opcodes_h_l2356_c7_6887_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_return_output,
 n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_return_output,
 CONST_SL_8_uxn_opcodes_h_l2358_c3_2e81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_return_output,
 n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_return_output,
 t16_MUX_uxn_opcodes_h_l2361_c7_7162_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_return_output,
 n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_return_output,
 n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_return_output,
 n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_return_output,
 sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output,
 n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2350_c3_6235 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2345_c3_7950 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_4369 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_cffe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_2e81_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_2e81_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2363_c3_5f47 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2361_c7_7162_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2375_c3_aa61 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2374_c3_dbda : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_7e7e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_a12b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2356_l2361_l2353_l2365_DUPLICATE_78a3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_7d63_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2356_l2372_l2361_l2353_DUPLICATE_86ac_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2362_l2357_DUPLICATE_b829_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l2335_l2380_DUPLICATE_5420_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_cffe := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_cffe;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2363_c3_5f47 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2363_c3_5f47;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_y := to_signed(-4, 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2345_c3_7950 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2345_c3_7950;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2374_c3_dbda := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2374_c3_dbda;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_4369 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_4369;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2350_c3_6235 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2350_c3_6235;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse := t16;
     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2340_c2_f6bb_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_180a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2375_c22_34d3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2340_c2_f6bb_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2356_c11_a898] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_left;
     BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_return_output := BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2361_c7_7162] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2361_c7_7162_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_7e7e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_7e7e_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2356_l2372_l2361_l2353_DUPLICATE_86ac LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2356_l2372_l2361_l2353_DUPLICATE_86ac_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_7d63 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_7d63_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2340_c2_f6bb_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2353_c11_b412] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_left;
     BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_return_output := BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2340_c2_f6bb_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_a460] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_left;
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_return_output := BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2365_c11_5798] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_left;
     BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_return_output := BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2367_c30_feb1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_ins;
     sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_x;
     sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_return_output := sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2340_c6_2a05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_left;
     BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output := BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_a12b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_a12b_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2362_l2357_DUPLICATE_b829 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2362_l2357_DUPLICATE_b829_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2356_l2361_l2353_l2365_DUPLICATE_78a3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2356_l2361_l2353_l2365_DUPLICATE_78a3_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_2a05_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_b412_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_6887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_a898_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_7162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_a460_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_5798_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_180a_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2375_c3_aa61 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_34d3_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2362_l2357_DUPLICATE_b829_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_2e81_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2362_l2357_DUPLICATE_b829_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2356_l2372_l2361_l2353_DUPLICATE_86ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2356_l2372_l2361_l2353_DUPLICATE_86ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2356_l2372_l2361_l2353_DUPLICATE_86ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2356_l2372_l2361_l2353_DUPLICATE_86ac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_7e7e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_7e7e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_7e7e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_7e7e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_7e7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_7d63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_7d63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_7d63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_7d63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_7d63_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2356_l2361_l2353_l2365_DUPLICATE_78a3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2356_l2361_l2353_l2365_DUPLICATE_78a3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2356_l2361_l2353_l2365_DUPLICATE_78a3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2356_l2361_l2353_l2365_DUPLICATE_78a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_a12b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_a12b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_a12b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_a12b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2361_l2356_l2353_l2340_DUPLICATE_a12b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2340_c2_f6bb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2340_c2_f6bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2340_c2_f6bb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2340_c2_f6bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2361_c7_7162_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_feb1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2375_c3_aa61;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_2aee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2365_c7_d889] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2358_c3_2e81] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2358_c3_2e81_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_2e81_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_2e81_return_output := CONST_SL_8_uxn_opcodes_h_l2358_c3_2e81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_7162] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2365_c7_d889] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_cond;
     n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_return_output := n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2362_c3_1d94] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_left;
     BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_return_output := BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_2aee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output := result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_2aee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2372_c7_2aee] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_cond;
     n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output := n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2372_c7_2aee] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output := result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_1d94_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_2e81_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_d889_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_d889_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2aee_return_output;
     -- t16_MUX[uxn_opcodes_h_l2361_c7_7162] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2361_c7_7162_cond <= VAR_t16_MUX_uxn_opcodes_h_l2361_c7_7162_cond;
     t16_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue;
     t16_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_7162_return_output := t16_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2365_c7_d889] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2361_c7_7162] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2365_c7_d889] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_cond;
     n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_return_output := n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2365_c7_d889] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2361_c7_7162] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_cond;
     n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_return_output := n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2365_c7_d889] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_return_output := result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2365_c7_d889] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_return_output := result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2356_c7_6887] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_d889_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_d889_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_d889_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_d889_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_d889_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_7162] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2356_c7_6887] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2361_c7_7162] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_return_output := result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_7162] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2353_c7_c1cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;

     -- t16_MUX[uxn_opcodes_h_l2356_c7_6887] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2356_c7_6887_cond <= VAR_t16_MUX_uxn_opcodes_h_l2356_c7_6887_cond;
     t16_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue;
     t16_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_6887_return_output := t16_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2361_c7_7162] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_cond;
     n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_return_output := n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2361_c7_7162] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_return_output := result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2356_c7_6887] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_cond;
     n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_return_output := n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_7162_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2353_c7_c1cf] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2356_c7_6887] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_cond;
     n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_return_output := n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2356_c7_6887] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2353_c7_c1cf] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond;
     n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output := n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;

     -- t16_MUX[uxn_opcodes_h_l2353_c7_c1cf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond <= VAR_t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond;
     t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue;
     t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output := t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2356_c7_6887] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_return_output := result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2356_c7_6887] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2356_c7_6887] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_return_output := result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_6887_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;
     -- t16_MUX[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond;
     t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue;
     t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output := t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2353_c7_c1cf] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond;
     n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output := n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2353_c7_c1cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2353_c7_c1cf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2353_c7_c1cf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output := result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond;
     n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output := n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2353_c7_c1cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_c1cf_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output := result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2340_c2_f6bb] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_cond;
     n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output := n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l2335_l2380_DUPLICATE_5420 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l2335_l2380_DUPLICATE_5420_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d9be(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_f6bb_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l2335_l2380_DUPLICATE_5420_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l2335_l2380_DUPLICATE_5420_return_output;
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
