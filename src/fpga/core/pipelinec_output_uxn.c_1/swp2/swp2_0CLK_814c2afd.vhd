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
-- Submodules: 67
entity swp2_0CLK_814c2afd is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_814c2afd;
architecture arch of swp2_0CLK_814c2afd is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16_high : unsigned(7 downto 0);
signal REG_COMB_t16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2586_c6_7f06]
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2586_c2_7bde]
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2586_c2_7bde]
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2586_c2_7bde]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2586_c2_7bde]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c2_7bde]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2586_c2_7bde]
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c2_7bde]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c2_7bde]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2586_c2_7bde]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2586_c2_7bde]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c2_7bde]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2586_c2_7bde]
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2586_c2_7bde]
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_8dce]
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2599_c7_96dc]
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2599_c7_96dc]
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2599_c7_96dc]
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2599_c7_96dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2599_c7_96dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2599_c7_96dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2599_c7_96dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2599_c7_96dc]
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2599_c7_96dc]
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2602_c11_28a1]
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2602_c7_e1fd]
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2602_c7_e1fd]
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2602_c7_e1fd]
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2602_c7_e1fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2602_c7_e1fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2602_c7_e1fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2602_c7_e1fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2602_c7_e1fd]
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2602_c7_e1fd]
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2606_c11_75e9]
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2606_c7_c493]
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2606_c7_c493]
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2606_c7_c493]
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2606_c7_c493]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2606_c7_c493]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2606_c7_c493]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2606_c7_c493]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2606_c7_c493]
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2610_c11_14ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2610_c7_c974]
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2610_c7_c974]
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2610_c7_c974]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2610_c7_c974]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2610_c7_c974]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2610_c7_c974]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2610_c7_c974]
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2612_c30_a1fb]
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2617_c11_8769]
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2617_c7_ef60]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2617_c7_ef60]
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2617_c7_ef60]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2617_c7_ef60]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2617_c7_ef60]
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2623_c11_72b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2623_c7_ee39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2623_c7_ee39]
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2623_c7_ee39]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2627_c11_2c8d]
signal BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2627_c7_1214]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2627_c7_1214]
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2627_c7_1214]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_return_output : unsigned(3 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_375c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_left,
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_right,
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde
t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_cond,
t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue,
t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse,
t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde
n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_cond,
n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue,
n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse,
n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_cond,
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde
n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_cond,
n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue,
n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse,
n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde
t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_cond,
t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue,
t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse,
t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_left,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_right,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc
t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_cond,
t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue,
t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse,
t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc
n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_cond,
n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue,
n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse,
n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc
n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_cond,
n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue,
n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse,
n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc
t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_cond,
t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue,
t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse,
t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_left,
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_right,
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd
t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond,
t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue,
t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse,
t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd
n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond,
n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue,
n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse,
n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd
n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond,
n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue,
n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse,
n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd
t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond,
t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue,
t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse,
t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_left,
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_right,
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2606_c7_c493
t16_low_MUX_uxn_opcodes_h_l2606_c7_c493 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_cond,
t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue,
t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse,
t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2606_c7_c493
n16_high_MUX_uxn_opcodes_h_l2606_c7_c493 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_cond,
n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue,
n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse,
n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_cond,
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2606_c7_c493
n16_low_MUX_uxn_opcodes_h_l2606_c7_c493 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_cond,
n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue,
n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse,
n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2610_c7_c974
n16_high_MUX_uxn_opcodes_h_l2610_c7_c974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_cond,
n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue,
n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse,
n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_cond,
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2610_c7_c974
n16_low_MUX_uxn_opcodes_h_l2610_c7_c974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_cond,
n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue,
n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse,
n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb
sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_ins,
sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_x,
sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_y,
sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_left,
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_right,
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_cond,
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60
n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_cond,
n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue,
n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse,
n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_cond,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_left,
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_right,
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_cond,
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16_high,
 t16_low,
 n16_high,
 n16_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output,
 t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
 n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
 n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
 t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_return_output,
 t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output,
 n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output,
 n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output,
 t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_return_output,
 t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output,
 n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output,
 n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output,
 t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_return_output,
 t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_return_output,
 n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_return_output,
 n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_return_output,
 n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_return_output,
 n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_return_output,
 sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output,
 n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_e873 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2591_c3_e41b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2600_c3_9f3b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_68c4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_6179 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2614_c3_a580 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_ec0e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2619_c3_98ca : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_b33d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2628_c3_53c0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2627_c7_1214_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_050a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2610_l2606_l2602_l2599_l2627_l2623_l2617_DUPLICATE_37df_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2599_l2610_l2602_l2606_DUPLICATE_0394_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2599_l2602_l2617_l2606_DUPLICATE_41a0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2582_l2633_DUPLICATE_10a9_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16_high : unsigned(7 downto 0);
variable REG_VAR_t16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16_high := t16_high;
  REG_VAR_t16_low := t16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2628_c3_53c0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2628_c3_53c0;
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_b33d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_b33d;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_e873 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_e873;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2619_c3_98ca := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2619_c3_98ca;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_68c4 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_68c4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2614_c3_a580 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2614_c3_a580;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2600_c3_9f3b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2600_c3_9f3b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_ec0e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_ec0e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_right := to_unsigned(6, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2591_c3_e41b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2591_c3_e41b;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_6179 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_6179;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse := t16_low;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2599_l2610_l2602_l2606_DUPLICATE_0394 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2599_l2610_l2602_l2606_DUPLICATE_0394_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2586_c2_7bde_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_050a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_050a_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2586_c2_7bde_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2586_c2_7bde_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2602_c11_28a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2610_c11_14ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2612_c30_a1fb] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_ins;
     sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_x;
     sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_return_output := sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2627_c7_1214] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2627_c7_1214_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2599_l2602_l2617_l2606_DUPLICATE_41a0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2599_l2602_l2617_l2606_DUPLICATE_41a0_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2627_c11_2c8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2586_c6_7f06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_left;
     BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output := BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_8dce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_left;
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_return_output := BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2610_l2606_l2602_l2599_l2627_l2623_l2617_DUPLICATE_37df LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2610_l2606_l2602_l2599_l2627_l2623_l2617_DUPLICATE_37df_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2606_c11_75e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2623_c11_72b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2586_c2_7bde_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2617_c11_8769] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_left;
     BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_return_output := BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_7f06_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8dce_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_28a1_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_75e9_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_14ac_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_8769_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_72b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_2c8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2599_l2602_l2617_l2606_DUPLICATE_41a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2599_l2602_l2617_l2606_DUPLICATE_41a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2599_l2602_l2617_l2606_DUPLICATE_41a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2599_l2602_l2617_l2606_DUPLICATE_41a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2610_l2606_l2602_l2599_l2627_l2623_l2617_DUPLICATE_37df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2610_l2606_l2602_l2599_l2627_l2623_l2617_DUPLICATE_37df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2610_l2606_l2602_l2599_l2627_l2623_l2617_DUPLICATE_37df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2610_l2606_l2602_l2599_l2627_l2623_l2617_DUPLICATE_37df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2610_l2606_l2602_l2599_l2627_l2623_l2617_DUPLICATE_37df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2610_l2606_l2602_l2599_l2627_l2623_l2617_DUPLICATE_37df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2610_l2606_l2602_l2599_l2627_l2623_l2617_DUPLICATE_37df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2599_l2610_l2602_l2606_DUPLICATE_0394_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2599_l2610_l2602_l2606_DUPLICATE_0394_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2599_l2610_l2602_l2606_DUPLICATE_0394_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2599_l2610_l2602_l2606_DUPLICATE_0394_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_050a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_050a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_050a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_050a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_050a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2586_c2_7bde_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2586_c2_7bde_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2586_c2_7bde_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2586_c2_7bde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2627_c7_1214_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_a1fb_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2617_c7_ef60] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_cond;
     n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output := n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2627_c7_1214] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2617_c7_ef60] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2627_c7_1214] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_return_output := result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2602_c7_e1fd] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond;
     t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output := t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2627_c7_1214] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2610_c7_c974] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_cond;
     n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_return_output := n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2610_c7_c974] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2606_c7_c493] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_cond;
     t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_return_output := t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_c974_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1214_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_c974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1214_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1214_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2623_c7_ee39] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output := result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2623_c7_ee39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2606_c7_c493] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2610_c7_c974] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2606_c7_c493] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_cond;
     n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_return_output := n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2599_c7_96dc] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_cond;
     t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output := t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2602_c7_e1fd] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond;
     t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output := t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2623_c7_ee39] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2610_c7_c974] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_cond;
     n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_return_output := n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_c974_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_c974_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_ee39_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2602_c7_e1fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_cond;
     t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output := t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2606_c7_c493] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_cond;
     n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_return_output := n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2617_c7_ef60] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output := result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2617_c7_ef60] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2599_c7_96dc] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_cond;
     t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output := t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2606_c7_c493] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2602_c7_e1fd] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond;
     n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output := n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2617_c7_ef60] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_ef60_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2599_c7_96dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2599_c7_96dc] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_cond;
     n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output := n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2610_c7_c974] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_return_output := result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2602_c7_e1fd] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond;
     n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output := n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2602_c7_e1fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2610_c7_c974] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_cond;
     t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output := t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2610_c7_c974] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_c974_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_c974_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_c974_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2606_c7_c493] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2606_c7_c493] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_return_output := result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2606_c7_c493] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_cond;
     n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output := n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2599_c7_96dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2599_c7_96dc] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_cond;
     n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output := n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_c493_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2602_c7_e1fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2602_c7_e1fd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2602_c7_e1fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_cond;
     n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output := n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_e1fd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2599_c7_96dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2599_c7_96dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2599_c7_96dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_96dc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output := result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c2_7bde] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2582_l2633_DUPLICATE_10a9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2582_l2633_DUPLICATE_10a9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7bde_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2582_l2633_DUPLICATE_10a9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2582_l2633_DUPLICATE_10a9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16_high <= REG_VAR_t16_high;
REG_COMB_t16_low <= REG_VAR_t16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16_high <= REG_COMB_t16_high;
     t16_low <= REG_COMB_t16_low;
     n16_high <= REG_COMB_n16_high;
     n16_low <= REG_COMB_n16_low;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
