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
-- BIN_OP_EQ[uxn_opcodes_h_l2356_c6_2266]
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2356_c2_e6ed]
signal t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(15 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2356_c2_e6ed]
signal n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2356_c2_e6ed]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2356_c2_e6ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2356_c2_e6ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2356_c2_e6ed]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2356_c2_e6ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2356_c2_e6ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2356_c2_e6ed]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2356_c2_e6ed]
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2356_c2_e6ed]
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2356_c2_e6ed]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2356_c2_e6ed]
signal n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2369_c11_299a]
signal BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2369_c7_13ff]
signal t16_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(15 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2369_c7_13ff]
signal n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2369_c7_13ff]
signal result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2369_c7_13ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2369_c7_13ff]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2369_c7_13ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2369_c7_13ff]
signal result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2369_c7_13ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2369_c7_13ff]
signal n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_d835]
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2372_c7_e984]
signal t16_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(15 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2372_c7_e984]
signal n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2372_c7_e984]
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_e984]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2372_c7_e984]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_e984]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_e984]
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_e984]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2372_c7_e984]
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2374_c3_3462]
signal CONST_SL_8_uxn_opcodes_h_l2374_c3_3462_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2374_c3_3462_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2377_c11_254f]
signal BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2377_c7_518e]
signal t16_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(15 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2377_c7_518e]
signal n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2377_c7_518e]
signal result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2377_c7_518e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2377_c7_518e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2377_c7_518e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2377_c7_518e]
signal result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2377_c7_518e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2377_c7_518e]
signal n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2378_c3_cee5]
signal BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2381_c11_cc2a]
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2381_c7_6824]
signal n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2381_c7_6824]
signal result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2381_c7_6824]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2381_c7_6824]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2381_c7_6824]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2381_c7_6824]
signal result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2381_c7_6824]
signal n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2383_c30_3870]
signal sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2388_c11_8fd8]
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2388_c7_9829]
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2388_c7_9829]
signal result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2388_c7_9829]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2388_c7_9829]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2388_c7_9829]
signal n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2391_c22_f9ab]
signal BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_return_output : unsigned(16 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_42c1( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.u8_value := ref_toks_9;
      base.is_vram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266
BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_left,
BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_right,
BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output);

-- t16_MUX_uxn_opcodes_h_l2356_c2_e6ed
t16_MUX_uxn_opcodes_h_l2356_c2_e6ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond,
t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue,
t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse,
t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed
n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond,
n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue,
n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse,
n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed
result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed
result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed
result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond,
result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed
result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond,
result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed
result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed
n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond,
n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue,
n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse,
n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_left,
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_right,
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_return_output);

-- t16_MUX_uxn_opcodes_h_l2369_c7_13ff
t16_MUX_uxn_opcodes_h_l2369_c7_13ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2369_c7_13ff_cond,
t16_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue,
t16_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse,
t16_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff
n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_cond,
n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue,
n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse,
n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff
result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_cond,
result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff
result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff
result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_cond,
result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff
n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_cond,
n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue,
n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse,
n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_left,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_right,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_return_output);

-- t16_MUX_uxn_opcodes_h_l2372_c7_e984
t16_MUX_uxn_opcodes_h_l2372_c7_e984 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2372_c7_e984_cond,
t16_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue,
t16_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse,
t16_MUX_uxn_opcodes_h_l2372_c7_e984_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2372_c7_e984
n16_high_MUX_uxn_opcodes_h_l2372_c7_e984 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_cond,
n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue,
n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse,
n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_cond,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984
result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_cond,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2372_c7_e984
n16_low_MUX_uxn_opcodes_h_l2372_c7_e984 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_cond,
n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue,
n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse,
n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2374_c3_3462
CONST_SL_8_uxn_opcodes_h_l2374_c3_3462 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2374_c3_3462_x,
CONST_SL_8_uxn_opcodes_h_l2374_c3_3462_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_left,
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_right,
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_return_output);

-- t16_MUX_uxn_opcodes_h_l2377_c7_518e
t16_MUX_uxn_opcodes_h_l2377_c7_518e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2377_c7_518e_cond,
t16_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue,
t16_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse,
t16_MUX_uxn_opcodes_h_l2377_c7_518e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2377_c7_518e
n16_high_MUX_uxn_opcodes_h_l2377_c7_518e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_cond,
n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue,
n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse,
n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e
result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_cond,
result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e
result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e
result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2377_c7_518e
n16_low_MUX_uxn_opcodes_h_l2377_c7_518e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_cond,
n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue,
n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse,
n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5
BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_left,
BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_right,
BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_left,
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_right,
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2381_c7_6824
n16_high_MUX_uxn_opcodes_h_l2381_c7_6824 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_cond,
n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue,
n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse,
n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824
result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_cond,
result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824
result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824
result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_cond,
result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2381_c7_6824
n16_low_MUX_uxn_opcodes_h_l2381_c7_6824 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_cond,
n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue,
n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse,
n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2383_c30_3870
sp_relative_shift_uxn_opcodes_h_l2383_c30_3870 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_ins,
sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_x,
sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_y,
sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_left,
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_right,
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_cond,
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829
result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_cond,
result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2388_c7_9829
n16_low_MUX_uxn_opcodes_h_l2388_c7_9829 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_cond,
n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue,
n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse,
n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab
BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_left,
BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_right,
BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output,
 t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
 n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
 n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_return_output,
 t16_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output,
 n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output,
 n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_return_output,
 t16_MUX_uxn_opcodes_h_l2372_c7_e984_return_output,
 n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_return_output,
 n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_return_output,
 CONST_SL_8_uxn_opcodes_h_l2374_c3_3462_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_return_output,
 t16_MUX_uxn_opcodes_h_l2377_c7_518e_return_output,
 n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_return_output,
 n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_return_output,
 n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_return_output,
 n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_return_output,
 sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_return_output,
 n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2361_c3_b720 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_aeb6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_ddeb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2375_c3_1266 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_3462_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_3462_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2379_c3_118b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2377_c7_518e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2391_c3_1ac8 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2390_c3_f366 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_3cf5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_da85_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2388_l2381_DUPLICATE_0d5f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2377_l2369_l2381_l2372_DUPLICATE_3b10_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2388_l2377_l2369_l2372_DUPLICATE_c3b0_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2378_DUPLICATE_8416_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l2396_l2351_DUPLICATE_8a72_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2375_c3_1266 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2375_c3_1266;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_ddeb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_ddeb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_aeb6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_aeb6;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2361_c3_b720 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2361_c3_b720;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2379_c3_118b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2379_c3_118b;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_y := to_signed(-4, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2390_c3_f366 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2390_c3_f366;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse := t16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2356_c2_e6ed_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_da85 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_da85_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2356_c6_2266] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_left;
     BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output := BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2388_l2381_DUPLICATE_0d5f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2388_l2381_DUPLICATE_0d5f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2388_c11_8fd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_d835] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_left;
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_return_output := BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2377_l2369_l2381_l2372_DUPLICATE_3b10 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2377_l2369_l2381_l2372_DUPLICATE_3b10_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2383_c30_3870] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_ins;
     sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_x;
     sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_return_output := sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2388_l2377_l2369_l2372_DUPLICATE_c3b0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2388_l2377_l2369_l2372_DUPLICATE_c3b0_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2356_c2_e6ed_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2369_c11_299a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2356_c2_e6ed_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_3cf5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_3cf5_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2377_c7_518e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2377_c7_518e_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2356_c2_e6ed_return_output := result.is_stack_index_flipped;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2391_c22_f9ab] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2378_DUPLICATE_8416 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2378_DUPLICATE_8416_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2377_c11_254f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2381_c11_cc2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c6_2266_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_13ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_299a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_e984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d835_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_518e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_254f_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_cc2a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_8fd8_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2391_c3_1ac8 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2391_c22_f9ab_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2378_DUPLICATE_8416_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_3462_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2378_DUPLICATE_8416_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2388_l2377_l2369_l2372_DUPLICATE_c3b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2388_l2377_l2369_l2372_DUPLICATE_c3b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2388_l2377_l2369_l2372_DUPLICATE_c3b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2388_l2377_l2369_l2372_DUPLICATE_c3b0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_3cf5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_3cf5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_3cf5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_3cf5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_3cf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2388_l2381_DUPLICATE_0d5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2388_l2381_DUPLICATE_0d5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2388_l2381_DUPLICATE_0d5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2388_l2381_DUPLICATE_0d5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2388_l2381_DUPLICATE_0d5f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2377_l2369_l2381_l2372_DUPLICATE_3b10_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2377_l2369_l2381_l2372_DUPLICATE_3b10_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2377_l2369_l2381_l2372_DUPLICATE_3b10_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2377_l2369_l2381_l2372_DUPLICATE_3b10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_da85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_da85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_da85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_da85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2356_l2388_DUPLICATE_da85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2356_c2_e6ed_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2356_c2_e6ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2356_c2_e6ed_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2356_c2_e6ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2377_c7_518e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2383_c30_3870_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2391_c3_1ac8;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2388_c7_9829] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_cond;
     n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_return_output := n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2381_c7_6824] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_cond;
     n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_return_output := n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2377_c7_518e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2381_c7_6824] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2388_c7_9829] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_return_output := result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2388_c7_9829] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2374_c3_3462] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2374_c3_3462_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_3462_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_3462_return_output := CONST_SL_8_uxn_opcodes_h_l2374_c3_3462_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2378_c3_cee5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_left;
     BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_return_output := BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2388_c7_9829] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2388_c7_9829] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_return_output := result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2378_c3_cee5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_3462_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2381_c7_6824_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2388_c7_9829_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_9829_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2381_c7_6824_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_9829_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2388_c7_9829_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2388_c7_9829_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2377_c7_518e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_cond;
     n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_return_output := n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2377_c7_518e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2381_c7_6824] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2381_c7_6824] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_return_output := result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2381_c7_6824] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_cond;
     n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_return_output := n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2381_c7_6824] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_return_output := result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2381_c7_6824] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_return_output;

     -- t16_MUX[uxn_opcodes_h_l2377_c7_518e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2377_c7_518e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2377_c7_518e_cond;
     t16_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue;
     t16_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_518e_return_output := t16_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_e984] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2381_c7_6824_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_6824_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_6824_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2381_c7_6824_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2381_c7_6824_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2377_c7_518e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_cond;
     n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_return_output := n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2377_c7_518e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2372_c7_e984] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2372_c7_e984] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_cond;
     n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_return_output := n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2377_c7_518e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2369_c7_13ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2377_c7_518e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_return_output := result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2377_c7_518e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2372_c7_e984] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2372_c7_e984_cond <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_e984_cond;
     t16_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue;
     t16_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_e984_return_output := t16_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2377_c7_518e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2372_c7_e984] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_return_output := result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;

     -- t16_MUX[uxn_opcodes_h_l2369_c7_13ff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2369_c7_13ff_cond <= VAR_t16_MUX_uxn_opcodes_h_l2369_c7_13ff_cond;
     t16_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue;
     t16_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output := t16_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_e984] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2372_c7_e984] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_cond;
     n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_return_output := n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_e984] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_return_output := result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2369_c7_13ff] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2369_c7_13ff] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_cond;
     n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output := n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_e984] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_e984_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2369_c7_13ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond;
     n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output := n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2369_c7_13ff] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output := result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2369_c7_13ff] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_cond;
     n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output := n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2369_c7_13ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output := result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;

     -- t16_MUX[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond <= VAR_t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond;
     t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue;
     t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output := t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2369_c7_13ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_13ff_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output := result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output := result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2356_c2_e6ed] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_cond;
     n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output := n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l2396_l2351_DUPLICATE_8a72 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l2396_l2351_DUPLICATE_8a72_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_42c1(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2356_c2_e6ed_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l2396_l2351_DUPLICATE_8a72_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l2396_l2351_DUPLICATE_8a72_return_output;
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
