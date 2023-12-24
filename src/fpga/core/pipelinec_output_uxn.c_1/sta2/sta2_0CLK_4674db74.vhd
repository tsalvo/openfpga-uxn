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
-- BIN_OP_EQ[uxn_opcodes_h_l2356_c6_0abe]
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2356_c2_68c3]
signal n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2356_c2_68c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2356_c2_68c3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2356_c2_68c3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2356_c2_68c3]
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2356_c2_68c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2356_c2_68c3]
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2356_c2_68c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2356_c2_68c3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2356_c2_68c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2356_c2_68c3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2356_c2_68c3]
signal n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2356_c2_68c3]
signal t16_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2369_c11_f27f]
signal BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2369_c7_4ea9]
signal n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2369_c7_4ea9]
signal result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2369_c7_4ea9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2369_c7_4ea9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2369_c7_4ea9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2369_c7_4ea9]
signal result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2369_c7_4ea9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2369_c7_4ea9]
signal n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2369_c7_4ea9]
signal t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_e6b8]
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2372_c7_c91d]
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2372_c7_c91d]
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2372_c7_c91d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_c91d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_c91d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_c91d]
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_c91d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2372_c7_c91d]
signal n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2372_c7_c91d]
signal t16_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2374_c3_364c]
signal CONST_SL_8_uxn_opcodes_h_l2374_c3_364c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2374_c3_364c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2377_c11_d5cf]
signal BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2377_c7_2f71]
signal n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2377_c7_2f71]
signal result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2377_c7_2f71]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2377_c7_2f71]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2377_c7_2f71]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2377_c7_2f71]
signal result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2377_c7_2f71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2377_c7_2f71]
signal n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2377_c7_2f71]
signal t16_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2378_c3_1ef1]
signal BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2381_c11_f80f]
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2381_c7_d030]
signal n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2381_c7_d030]
signal result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2381_c7_d030]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2381_c7_d030]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2381_c7_d030]
signal result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2381_c7_d030]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2381_c7_d030]
signal n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2383_c30_c374]
signal sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2388_c11_71f1]
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2388_c7_3b8c]
signal n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2388_c7_3b8c]
signal result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2388_c7_3b8c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2388_c7_3b8c]
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2388_c7_3b8c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2391_c22_feef]
signal BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_return_output : unsigned(16 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_775a( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_ram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe
BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_left,
BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_right,
BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3
n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_cond,
n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue,
n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse,
n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3
result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3
result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3
result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3
result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_cond,
result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3
result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3
n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_cond,
n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue,
n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse,
n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output);

-- t16_MUX_uxn_opcodes_h_l2356_c2_68c3
t16_MUX_uxn_opcodes_h_l2356_c2_68c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2356_c2_68c3_cond,
t16_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue,
t16_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse,
t16_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_left,
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_right,
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9
n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond,
n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue,
n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse,
n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9
result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond,
result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9
result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9
result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9
n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond,
n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue,
n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse,
n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output);

-- t16_MUX_uxn_opcodes_h_l2369_c7_4ea9
t16_MUX_uxn_opcodes_h_l2369_c7_4ea9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond,
t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue,
t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse,
t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_left,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_right,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d
n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_cond,
n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_cond,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d
result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d
n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_cond,
n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue,
n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse,
n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output);

-- t16_MUX_uxn_opcodes_h_l2372_c7_c91d
t16_MUX_uxn_opcodes_h_l2372_c7_c91d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2372_c7_c91d_cond,
t16_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue,
t16_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse,
t16_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2374_c3_364c
CONST_SL_8_uxn_opcodes_h_l2374_c3_364c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2374_c3_364c_x,
CONST_SL_8_uxn_opcodes_h_l2374_c3_364c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_left,
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_right,
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71
n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_cond,
n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue,
n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse,
n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71
result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_cond,
result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71
result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71
result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_cond,
result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71
n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_cond,
n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue,
n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse,
n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output);

-- t16_MUX_uxn_opcodes_h_l2377_c7_2f71
t16_MUX_uxn_opcodes_h_l2377_c7_2f71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2377_c7_2f71_cond,
t16_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue,
t16_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse,
t16_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1
BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_left,
BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_right,
BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_left,
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_right,
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2381_c7_d030
n16_low_MUX_uxn_opcodes_h_l2381_c7_d030 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_cond,
n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue,
n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse,
n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030
result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_cond,
result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030
result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030
result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_cond,
result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2381_c7_d030
n16_high_MUX_uxn_opcodes_h_l2381_c7_d030 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_cond,
n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue,
n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse,
n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2383_c30_c374
sp_relative_shift_uxn_opcodes_h_l2383_c30_c374 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_ins,
sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_x,
sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_y,
sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_left,
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_right,
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c
n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond,
n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue,
n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse,
n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c
result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef
BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_left,
BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_right,
BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output,
 n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
 n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
 t16_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_return_output,
 n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output,
 n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output,
 t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_return_output,
 n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output,
 n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output,
 t16_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output,
 CONST_SL_8_uxn_opcodes_h_l2374_c3_364c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_return_output,
 n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output,
 n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output,
 t16_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_return_output,
 n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_return_output,
 n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_return_output,
 sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_return_output,
 n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2361_c3_22fc : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_7af6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_f8a2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2375_c3_a7ba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_c91d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_364c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_364c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2379_c3_e7df : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2377_c7_2f71_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_2f71_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2391_c3_e38c : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2390_c3_8f52 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_c304_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_b4a3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2377_l2369_l2381_l2372_DUPLICATE_8e38_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2388_l2377_l2369_l2372_DUPLICATE_2a07_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2388_l2381_l2377_l2372_l2369_DUPLICATE_8c1d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2378_DUPLICATE_4a40_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l2396_l2351_DUPLICATE_2b4e_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_7af6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_7af6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2379_c3_e7df := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2379_c3_e7df;
     VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_y := to_signed(-4, 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2375_c3_a7ba := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2375_c3_a7ba;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_f8a2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_f8a2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2361_c3_22fc := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2361_c3_22fc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2390_c3_8f52 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2390_c3_8f52;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2388_c11_71f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2356_c2_68c3_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2356_c2_68c3_return_output := result.is_pc_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2391_c22_feef] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2356_c6_0abe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2356_c2_68c3_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_b4a3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_b4a3_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_c304 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_c304_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2377_c7_2f71] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2377_c7_2f71_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2381_c11_f80f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2383_c30_c374] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_ins;
     sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_x;
     sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_return_output := sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2377_c11_d5cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2356_c2_68c3_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_e6b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2378_DUPLICATE_4a40 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2378_DUPLICATE_4a40_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2369_c11_f27f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2377_l2369_l2381_l2372_DUPLICATE_8e38 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2377_l2369_l2381_l2372_DUPLICATE_8e38_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2388_l2381_l2377_l2372_l2369_DUPLICATE_8c1d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2388_l2381_l2377_l2372_l2369_DUPLICATE_8c1d_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2388_l2377_l2369_l2372_DUPLICATE_2a07 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2388_l2377_l2369_l2372_DUPLICATE_2a07_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_0abe_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_f27f_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_c91d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e6b8_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_2f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_d5cf_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_f80f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_71f1_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2391_c3_e38c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_feef_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2378_DUPLICATE_4a40_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_364c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2378_DUPLICATE_4a40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2388_l2377_l2369_l2372_DUPLICATE_2a07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2388_l2377_l2369_l2372_DUPLICATE_2a07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2388_l2377_l2369_l2372_DUPLICATE_2a07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2388_l2377_l2369_l2372_DUPLICATE_2a07_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_b4a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_b4a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_b4a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_b4a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_b4a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2388_l2381_l2377_l2372_l2369_DUPLICATE_8c1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2388_l2381_l2377_l2372_l2369_DUPLICATE_8c1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2388_l2381_l2377_l2372_l2369_DUPLICATE_8c1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2388_l2381_l2377_l2372_l2369_DUPLICATE_8c1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2388_l2381_l2377_l2372_l2369_DUPLICATE_8c1d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2377_l2369_l2381_l2372_DUPLICATE_8e38_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2377_l2369_l2381_l2372_DUPLICATE_8e38_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2377_l2369_l2381_l2372_DUPLICATE_8e38_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2377_l2369_l2381_l2372_DUPLICATE_8e38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_c304_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_c304_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_c304_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_c304_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2388_l2377_l2372_l2369_l2356_DUPLICATE_c304_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2356_c2_68c3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2356_c2_68c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2356_c2_68c3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2356_c2_68c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2377_c7_2f71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_c374_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2391_c3_e38c;
     -- CONST_SL_8[uxn_opcodes_h_l2374_c3_364c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2374_c3_364c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_364c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_364c_return_output := CONST_SL_8_uxn_opcodes_h_l2374_c3_364c_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2381_c7_d030] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_cond;
     n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_return_output := n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2388_c7_3b8c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2388_c7_3b8c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2388_c7_3b8c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2381_c7_d030] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2378_c3_1ef1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_left;
     BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_return_output := BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2388_c7_3b8c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond;
     n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output := n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2377_c7_2f71] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2388_c7_3b8c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_1ef1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_364c_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_d030_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_d030_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_3b8c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_c91d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2377_c7_2f71] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_cond;
     n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output := n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2377_c7_2f71] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2381_c7_d030] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2381_c7_d030] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_cond;
     n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_return_output := n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_return_output;

     -- t16_MUX[uxn_opcodes_h_l2377_c7_2f71] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2377_c7_2f71_cond <= VAR_t16_MUX_uxn_opcodes_h_l2377_c7_2f71_cond;
     t16_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue;
     t16_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output := t16_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2381_c7_d030] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_return_output := result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2381_c7_d030] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_return_output := result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2381_c7_d030] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_d030_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_d030_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_d030_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_d030_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_d030_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2377_c7_2f71] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output := result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2369_c7_4ea9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2377_c7_2f71] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output := result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2372_c7_c91d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_cond;
     n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output := n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2372_c7_c91d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2377_c7_2f71] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2377_c7_2f71] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_cond;
     n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output := n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2377_c7_2f71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;

     -- t16_MUX[uxn_opcodes_h_l2372_c7_c91d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2372_c7_c91d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_c91d_cond;
     t16_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue;
     t16_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output := t16_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_2f71_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2372_c7_c91d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output := result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2369_c7_4ea9] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond;
     n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output := n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_c91d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2369_c7_4ea9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2369_c7_4ea9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond;
     t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue;
     t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output := t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2372_c7_c91d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_cond;
     n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output := n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_c91d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_c91d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_c91d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2369_c7_4ea9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output := result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2356_c2_68c3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2356_c2_68c3_cond;
     t16_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue;
     t16_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output := t16_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2369_c7_4ea9] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond;
     n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output := n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2369_c7_4ea9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_cond;
     n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output := n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2369_c7_4ea9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2369_c7_4ea9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_4ea9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_cond;
     n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output := n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2356_c2_68c3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output := result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l2396_l2351_DUPLICATE_2b4e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l2396_l2351_DUPLICATE_2b4e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_775a(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_68c3_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l2396_l2351_DUPLICATE_2b4e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l2396_l2351_DUPLICATE_2b4e_return_output;
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
