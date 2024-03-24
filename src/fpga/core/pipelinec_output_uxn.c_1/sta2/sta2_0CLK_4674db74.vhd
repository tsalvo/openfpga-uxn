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
-- BIN_OP_EQ[uxn_opcodes_h_l2340_c6_32f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2340_c2_aaa2]
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2340_c2_aaa2]
signal t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(15 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2340_c2_aaa2]
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2340_c2_aaa2]
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2340_c2_aaa2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2340_c2_aaa2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2340_c2_aaa2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2340_c2_aaa2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2340_c2_aaa2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2340_c2_aaa2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2340_c2_aaa2]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2340_c2_aaa2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2340_c2_aaa2]
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2353_c11_acae]
signal BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2353_c7_4ff1]
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2353_c7_4ff1]
signal t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(15 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2353_c7_4ff1]
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2353_c7_4ff1]
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2353_c7_4ff1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2353_c7_4ff1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2353_c7_4ff1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2353_c7_4ff1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2353_c7_4ff1]
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2356_c11_21ad]
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2356_c7_462d]
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2356_c7_462d]
signal t16_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(15 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2356_c7_462d]
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2356_c7_462d]
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2356_c7_462d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2356_c7_462d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2356_c7_462d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2356_c7_462d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2356_c7_462d]
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2358_c3_1060]
signal CONST_SL_8_uxn_opcodes_h_l2358_c3_1060_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2358_c3_1060_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_c1a3]
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2361_c7_9051]
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2361_c7_9051]
signal t16_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(15 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2361_c7_9051]
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2361_c7_9051]
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_9051]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_9051]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_9051]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2361_c7_9051]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2361_c7_9051]
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2362_c3_2a53]
signal BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2365_c11_465b]
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2365_c7_961c]
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2365_c7_961c]
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2365_c7_961c]
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2365_c7_961c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2365_c7_961c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2365_c7_961c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2365_c7_961c]
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2367_c30_df12]
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_b6e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2372_c7_2f6d]
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2372_c7_2f6d]
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_2f6d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_2f6d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_2f6d]
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2375_c22_03c4]
signal BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_return_output : unsigned(16 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
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
-- BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2
n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond,
n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue,
n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse,
n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output);

-- t16_MUX_uxn_opcodes_h_l2340_c2_aaa2
t16_MUX_uxn_opcodes_h_l2340_c2_aaa2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond,
t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue,
t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse,
t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2
n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond,
n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue,
n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse,
n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond,
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_left,
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_right,
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1
n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond,
n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue,
n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse,
n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output);

-- t16_MUX_uxn_opcodes_h_l2353_c7_4ff1
t16_MUX_uxn_opcodes_h_l2353_c7_4ff1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond,
t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue,
t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse,
t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1
n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond,
n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue,
n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse,
n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond,
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_left,
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_right,
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2356_c7_462d
n16_low_MUX_uxn_opcodes_h_l2356_c7_462d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_cond,
n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_return_output);

-- t16_MUX_uxn_opcodes_h_l2356_c7_462d
t16_MUX_uxn_opcodes_h_l2356_c7_462d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2356_c7_462d_cond,
t16_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue,
t16_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse,
t16_MUX_uxn_opcodes_h_l2356_c7_462d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2356_c7_462d
n16_high_MUX_uxn_opcodes_h_l2356_c7_462d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_cond,
n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue,
n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse,
n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_cond,
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2358_c3_1060
CONST_SL_8_uxn_opcodes_h_l2358_c3_1060 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2358_c3_1060_x,
CONST_SL_8_uxn_opcodes_h_l2358_c3_1060_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_left,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_right,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2361_c7_9051
n16_low_MUX_uxn_opcodes_h_l2361_c7_9051 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_cond,
n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue,
n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse,
n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_return_output);

-- t16_MUX_uxn_opcodes_h_l2361_c7_9051
t16_MUX_uxn_opcodes_h_l2361_c7_9051 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2361_c7_9051_cond,
t16_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue,
t16_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse,
t16_MUX_uxn_opcodes_h_l2361_c7_9051_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2361_c7_9051
n16_high_MUX_uxn_opcodes_h_l2361_c7_9051 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_cond,
n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue,
n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse,
n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_cond,
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_cond,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53
BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_left,
BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_right,
BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_left,
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_right,
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2365_c7_961c
n16_low_MUX_uxn_opcodes_h_l2365_c7_961c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_cond,
n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue,
n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse,
n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2365_c7_961c
n16_high_MUX_uxn_opcodes_h_l2365_c7_961c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_cond,
n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue,
n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse,
n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2367_c30_df12
sp_relative_shift_uxn_opcodes_h_l2367_c30_df12 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_ins,
sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_x,
sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_y,
sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d
n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond,
n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_left,
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_right,
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output,
 n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
 t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
 n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_return_output,
 n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output,
 t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output,
 n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_return_output,
 n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_return_output,
 t16_MUX_uxn_opcodes_h_l2356_c7_462d_return_output,
 n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_return_output,
 CONST_SL_8_uxn_opcodes_h_l2358_c3_1060_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_return_output,
 n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_return_output,
 t16_MUX_uxn_opcodes_h_l2361_c7_9051_return_output,
 n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_return_output,
 n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_return_output,
 n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_return_output,
 sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_return_output,
 n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2350_c3_15ef : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2345_c3_14af : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_21a8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_d3b1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_1060_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_1060_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2363_c3_1ca5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2361_c7_9051_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2375_c3_752b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2374_c3_a51f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_429f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_7850_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2361_l2353_l2356_l2372_DUPLICATE_f2d7_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2353_l2372_l2365_l2361_l2356_DUPLICATE_cf77_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2361_l2353_l2365_l2356_DUPLICATE_6438_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2357_l2362_DUPLICATE_e0f0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l2335_l2380_DUPLICATE_d3ef_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_d3b1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_d3b1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2374_c3_a51f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2374_c3_a51f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_y := to_signed(-4, 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_21a8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_21a8;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2345_c3_14af := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2345_c3_14af;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2363_c3_1ca5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2363_c3_1ca5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2350_c3_15ef := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2350_c3_15ef;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse := t16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2361_l2353_l2356_l2372_DUPLICATE_f2d7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2361_l2353_l2356_l2372_DUPLICATE_f2d7_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2353_c11_acae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2340_c2_aaa2_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2361_l2353_l2365_l2356_DUPLICATE_6438 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2361_l2353_l2365_l2356_DUPLICATE_6438_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_429f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_429f_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2361_c7_9051] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2361_c7_9051_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_7850 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_7850_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2340_c2_aaa2_return_output := result.is_pc_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2375_c22_03c4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2367_c30_df12] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_ins;
     sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_x;
     sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_return_output := sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2340_c2_aaa2_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_b6e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2356_c11_21ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_c1a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2340_c6_32f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2357_l2362_DUPLICATE_e0f0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2357_l2362_DUPLICATE_e0f0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2365_c11_465b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2353_l2372_l2365_l2361_l2356_DUPLICATE_cf77 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2353_l2372_l2365_l2361_l2356_DUPLICATE_cf77_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2340_c2_aaa2_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_32f4_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_acae_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_462d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_21ad_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_c1a3_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_465b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_b6e1_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2375_c3_752b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_03c4_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2357_l2362_DUPLICATE_e0f0_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_1060_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2357_l2362_DUPLICATE_e0f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2361_l2353_l2356_l2372_DUPLICATE_f2d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2361_l2353_l2356_l2372_DUPLICATE_f2d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2361_l2353_l2356_l2372_DUPLICATE_f2d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2361_l2353_l2356_l2372_DUPLICATE_f2d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_429f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_429f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_429f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_429f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_429f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2353_l2372_l2365_l2361_l2356_DUPLICATE_cf77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2353_l2372_l2365_l2361_l2356_DUPLICATE_cf77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2353_l2372_l2365_l2361_l2356_DUPLICATE_cf77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2353_l2372_l2365_l2361_l2356_DUPLICATE_cf77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2353_l2372_l2365_l2361_l2356_DUPLICATE_cf77_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2361_l2353_l2365_l2356_DUPLICATE_6438_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2361_l2353_l2365_l2356_DUPLICATE_6438_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2361_l2353_l2365_l2356_DUPLICATE_6438_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2361_l2353_l2365_l2356_DUPLICATE_6438_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_7850_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_7850_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_7850_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_7850_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2353_l2340_l2372_l2361_l2356_DUPLICATE_7850_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2340_c2_aaa2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2340_c2_aaa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2340_c2_aaa2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2340_c2_aaa2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2361_c7_9051_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_df12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2375_c3_752b;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2372_c7_2f6d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output := result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_2f6d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2372_c7_2f6d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond;
     n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output := n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_9051] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2358_c3_1060] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2358_c3_1060_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_1060_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_1060_return_output := CONST_SL_8_uxn_opcodes_h_l2358_c3_1060_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2365_c7_961c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_cond;
     n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_return_output := n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_2f6d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2365_c7_961c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_2f6d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2362_c3_2a53] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_left;
     BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_return_output := BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_2a53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_1060_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_961c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_961c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2f6d_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2361_c7_9051] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2365_c7_961c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2361_c7_9051] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2361_c7_9051_cond <= VAR_t16_MUX_uxn_opcodes_h_l2361_c7_9051_cond;
     t16_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue;
     t16_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_9051_return_output := t16_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2356_c7_462d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2365_c7_961c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2365_c7_961c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2365_c7_961c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2361_c7_9051] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_cond;
     n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_return_output := n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2365_c7_961c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_cond;
     n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_return_output := n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_961c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_961c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_961c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_961c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_961c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2353_c7_4ff1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2356_c7_462d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2356_c7_462d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_cond;
     n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_return_output := n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2361_c7_9051] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_return_output := result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_9051] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2361_c7_9051] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_return_output := result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;

     -- t16_MUX[uxn_opcodes_h_l2356_c7_462d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2356_c7_462d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2356_c7_462d_cond;
     t16_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue;
     t16_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_462d_return_output := t16_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_9051] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2361_c7_9051] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_cond;
     n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_return_output := n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_9051_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2353_c7_4ff1] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond;
     n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output := n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2356_c7_462d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2356_c7_462d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_cond;
     n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_return_output := n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2353_c7_4ff1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond;
     t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue;
     t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output := t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2353_c7_4ff1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2356_c7_462d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_return_output := result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2356_c7_462d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2356_c7_462d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_462d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2353_c7_4ff1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output := result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2353_c7_4ff1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;

     -- t16_MUX[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond;
     t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue;
     t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output := t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond;
     n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output := n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2353_c7_4ff1] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond;
     n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output := n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2353_c7_4ff1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2353_c7_4ff1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_4ff1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond;
     n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output := n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2340_c2_aaa2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output := result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l2335_l2380_DUPLICATE_d3ef LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l2335_l2380_DUPLICATE_d3ef_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a906(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_aaa2_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l2335_l2380_DUPLICATE_d3ef_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l2335_l2380_DUPLICATE_d3ef_return_output;
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
