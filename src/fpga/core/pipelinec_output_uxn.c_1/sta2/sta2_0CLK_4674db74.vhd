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
-- BIN_OP_EQ[uxn_opcodes_h_l2340_c6_b33d]
signal BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2340_c2_9afb]
signal t16_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2340_c2_9afb]
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2340_c2_9afb]
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2340_c2_9afb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2340_c2_9afb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2340_c2_9afb]
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2340_c2_9afb]
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2340_c2_9afb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2340_c2_9afb]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2340_c2_9afb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2340_c2_9afb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2340_c2_9afb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2340_c2_9afb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2353_c11_330d]
signal BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2353_c7_f05e]
signal t16_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2353_c7_f05e]
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2353_c7_f05e]
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2353_c7_f05e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2353_c7_f05e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2353_c7_f05e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2353_c7_f05e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2353_c7_f05e]
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2353_c7_f05e]
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2356_c11_bf7a]
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2356_c7_29c4]
signal t16_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2356_c7_29c4]
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2356_c7_29c4]
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2356_c7_29c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2356_c7_29c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2356_c7_29c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2356_c7_29c4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2356_c7_29c4]
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2356_c7_29c4]
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2358_c3_34c6]
signal CONST_SL_8_uxn_opcodes_h_l2358_c3_34c6_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2358_c3_34c6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_05dd]
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2361_c7_661d]
signal t16_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2361_c7_661d]
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2361_c7_661d]
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_661d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_661d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_661d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2361_c7_661d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2361_c7_661d]
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2361_c7_661d]
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2362_c3_6f09]
signal BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2365_c11_a6ef]
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2365_c7_b5b1]
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2365_c7_b5b1]
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2365_c7_b5b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2365_c7_b5b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2365_c7_b5b1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2365_c7_b5b1]
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2365_c7_b5b1]
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2367_c30_c519]
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_e150]
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2372_c7_2930]
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_2930]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2372_c7_2930]
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_2930]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_2930]
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2375_c22_2e6c]
signal BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_return_output : unsigned(16 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
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
-- BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_left,
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_right,
BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output);

-- t16_MUX_uxn_opcodes_h_l2340_c2_9afb
t16_MUX_uxn_opcodes_h_l2340_c2_9afb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2340_c2_9afb_cond,
t16_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue,
t16_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse,
t16_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb
n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_cond,
n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue,
n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse,
n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb
n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_cond,
n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue,
n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse,
n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_cond,
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_left,
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_right,
BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_return_output);

-- t16_MUX_uxn_opcodes_h_l2353_c7_f05e
t16_MUX_uxn_opcodes_h_l2353_c7_f05e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2353_c7_f05e_cond,
t16_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue,
t16_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse,
t16_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e
n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_cond,
n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue,
n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse,
n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e
n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_cond,
n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue,
n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse,
n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_cond,
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_left,
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_right,
BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_return_output);

-- t16_MUX_uxn_opcodes_h_l2356_c7_29c4
t16_MUX_uxn_opcodes_h_l2356_c7_29c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2356_c7_29c4_cond,
t16_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue,
t16_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse,
t16_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4
n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_cond,
n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue,
n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse,
n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4
n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_cond,
n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue,
n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse,
n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_cond,
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2358_c3_34c6
CONST_SL_8_uxn_opcodes_h_l2358_c3_34c6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2358_c3_34c6_x,
CONST_SL_8_uxn_opcodes_h_l2358_c3_34c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_left,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_right,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_return_output);

-- t16_MUX_uxn_opcodes_h_l2361_c7_661d
t16_MUX_uxn_opcodes_h_l2361_c7_661d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2361_c7_661d_cond,
t16_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue,
t16_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse,
t16_MUX_uxn_opcodes_h_l2361_c7_661d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2361_c7_661d
n16_low_MUX_uxn_opcodes_h_l2361_c7_661d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_cond,
n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2361_c7_661d
n16_high_MUX_uxn_opcodes_h_l2361_c7_661d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_cond,
n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue,
n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse,
n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_cond,
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09
BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_left,
BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_right,
BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_left,
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_right,
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1
n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond,
n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue,
n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse,
n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1
n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond,
n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue,
n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse,
n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond,
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2367_c30_c519
sp_relative_shift_uxn_opcodes_h_l2367_c30_c519 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_ins,
sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_x,
sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_y,
sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_left,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_right,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2372_c7_2930
n16_low_MUX_uxn_opcodes_h_l2372_c7_2930 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_cond,
n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue,
n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse,
n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_cond,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_cond,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_left,
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_right,
BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output,
 t16_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
 n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
 n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_return_output,
 t16_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output,
 n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output,
 n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_return_output,
 t16_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output,
 n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output,
 n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output,
 CONST_SL_8_uxn_opcodes_h_l2358_c3_34c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_return_output,
 t16_MUX_uxn_opcodes_h_l2361_c7_661d_return_output,
 n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_return_output,
 n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_return_output,
 n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output,
 n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output,
 sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_return_output,
 n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2345_c3_9e65 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2350_c3_ac8c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_4f69 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_87c7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_34c6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_34c6_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2363_c3_c2eb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2361_c7_661d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2374_c3_2030 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2375_c3_b499 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_42bd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_7680_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2356_l2372_l2361_l2353_DUPLICATE_211e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_cb4f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2356_l2361_l2353_l2365_DUPLICATE_65e2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2362_l2357_DUPLICATE_46e5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l2380_l2335_DUPLICATE_7aec_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2345_c3_9e65 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2345_c3_9e65;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_y := to_signed(-4, 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2363_c3_c2eb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2363_c3_c2eb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_4f69 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_4f69;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2374_c3_2030 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2374_c3_2030;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_87c7 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_87c7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2350_c3_ac8c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2350_c3_ac8c;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2353_c11_330d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_42bd LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_42bd_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2356_l2372_l2361_l2353_DUPLICATE_211e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2356_l2372_l2361_l2353_DUPLICATE_211e_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2375_c22_2e6c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2361_c7_661d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2361_c7_661d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2356_c11_bf7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2340_c2_9afb_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_7680 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_7680_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2340_c2_9afb_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2340_c6_b33d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2356_l2361_l2353_l2365_DUPLICATE_65e2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2356_l2361_l2353_l2365_DUPLICATE_65e2_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2365_c11_a6ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_e150] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_left;
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_return_output := BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2340_c2_9afb_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_05dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2340_c2_9afb_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2362_l2357_DUPLICATE_46e5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2362_l2357_DUPLICATE_46e5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l2367_c30_c519] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_ins;
     sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_x;
     sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_return_output := sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_cb4f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_cb4f_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_9afb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2340_c6_b33d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_f05e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2353_c11_330d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_29c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2356_c11_bf7a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_05dd_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_a6ef_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_e150_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2375_c3_b499 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2375_c22_2e6c_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2362_l2357_DUPLICATE_46e5_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_34c6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2362_l2357_DUPLICATE_46e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2356_l2372_l2361_l2353_DUPLICATE_211e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2356_l2372_l2361_l2353_DUPLICATE_211e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2356_l2372_l2361_l2353_DUPLICATE_211e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2356_l2372_l2361_l2353_DUPLICATE_211e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_42bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_42bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_42bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_42bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_42bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_cb4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_cb4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_cb4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_cb4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2365_l2361_l2356_l2353_DUPLICATE_cb4f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2356_l2361_l2353_l2365_DUPLICATE_65e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2356_l2361_l2353_l2365_DUPLICATE_65e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2356_l2361_l2353_l2365_DUPLICATE_65e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2356_l2361_l2353_l2365_DUPLICATE_65e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_7680_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_7680_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_7680_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_7680_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2340_l2372_l2361_l2356_l2353_DUPLICATE_7680_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2340_c2_9afb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2340_c2_9afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2340_c2_9afb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2340_c2_9afb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2361_c7_661d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_c519_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2375_c3_b499;
     -- n16_low_MUX[uxn_opcodes_h_l2372_c7_2930] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_cond;
     n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_return_output := n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_661d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2365_c7_b5b1] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond;
     n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output := n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2372_c7_2930] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_return_output := result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2358_c3_34c6] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2358_c3_34c6_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_34c6_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_34c6_return_output := CONST_SL_8_uxn_opcodes_h_l2358_c3_34c6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2365_c7_b5b1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_2930] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_2930] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2362_c3_6f09] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_left;
     BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_return_output := BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_2930] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_return_output := result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2362_c3_6f09_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2358_c3_34c6_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2372_c7_2930_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_2930_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_2930_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2372_c7_2930_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_2930_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2361_c7_661d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_cond;
     n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_return_output := n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2361_c7_661d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2361_c7_661d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2361_c7_661d_cond;
     t16_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue;
     t16_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2361_c7_661d_return_output := t16_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2365_c7_b5b1] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond;
     n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output := n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2356_c7_29c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2365_c7_b5b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2365_c7_b5b1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output := result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2365_c7_b5b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2361_c7_661d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2365_c7_b5b1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2365_c7_b5b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2361_c7_661d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_return_output := result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2353_c7_f05e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2356_c7_29c4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2356_c7_29c4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2356_c7_29c4_cond;
     t16_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue;
     t16_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output := t16_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2361_c7_661d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_cond;
     n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_return_output := n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2356_c7_29c4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2356_c7_29c4] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_cond;
     n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output := n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_661d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_661d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2361_c7_661d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_661d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;
     -- t16_MUX[uxn_opcodes_h_l2353_c7_f05e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2353_c7_f05e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2353_c7_f05e_cond;
     t16_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue;
     t16_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output := t16_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2356_c7_29c4] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_cond;
     n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output := n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2356_c7_29c4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output := result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2356_c7_29c4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2356_c7_29c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2353_c7_f05e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2356_c7_29c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2353_c7_f05e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_cond;
     n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output := n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2356_c7_29c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_cond;
     n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output := n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2353_c7_f05e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output := result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2353_c7_f05e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2353_c7_f05e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2353_c7_f05e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2340_c2_9afb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2340_c2_9afb_cond;
     t16_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue;
     t16_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output := t16_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2353_c7_f05e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_cond;
     n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output := n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2353_c7_f05e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_cond;
     n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output := n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output := result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2340_c2_9afb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l2380_l2335_DUPLICATE_7aec LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l2380_l2335_DUPLICATE_7aec_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7557(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2340_c2_9afb_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l2380_l2335_DUPLICATE_7aec_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l2380_l2335_DUPLICATE_7aec_return_output;
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
