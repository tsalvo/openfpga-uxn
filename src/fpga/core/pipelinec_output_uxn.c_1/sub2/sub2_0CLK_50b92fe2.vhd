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
-- Submodules: 71
entity sub2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_50b92fe2;
architecture arch of sub2_0CLK_50b92fe2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2497_c6_cfbb]
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2497_c2_bfab]
signal n16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2497_c2_bfab]
signal t16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2497_c2_bfab]
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c2_bfab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c2_bfab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2497_c2_bfab]
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c2_bfab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2497_c2_bfab]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2497_c2_bfab]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2497_c2_bfab]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2497_c2_bfab]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2497_c2_bfab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_1631]
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2510_c7_8e97]
signal n16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2510_c7_8e97]
signal t16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2510_c7_8e97]
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_8e97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_8e97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_8e97]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2510_c7_8e97]
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_8e97]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_f084]
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2513_c7_bd6e]
signal n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2513_c7_bd6e]
signal t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2513_c7_bd6e]
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_bd6e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_bd6e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_bd6e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2513_c7_bd6e]
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_bd6e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2518_c11_f8bc]
signal BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2518_c7_5566]
signal n16_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2518_c7_5566]
signal t16_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2518_c7_5566]
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2518_c7_5566]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2518_c7_5566]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2518_c7_5566]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2518_c7_5566]
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2518_c7_5566]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2519_c3_8b8c]
signal BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2522_c11_f584]
signal BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2522_c7_1776]
signal n16_MUX_uxn_opcodes_h_l2522_c7_1776_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2522_c7_1776_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2522_c7_1776]
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2522_c7_1776]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2522_c7_1776]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2522_c7_1776]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2522_c7_1776]
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2522_c7_1776]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2526_c11_e399]
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2526_c7_44de]
signal n16_MUX_uxn_opcodes_h_l2526_c7_44de_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_44de_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2526_c7_44de]
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2526_c7_44de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2526_c7_44de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2526_c7_44de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2526_c7_44de]
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2526_c7_44de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2527_c3_dba1]
signal BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2528_c11_42f7]
signal BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2529_c30_54e9]
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_c6e4]
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2534_c7_cd04]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_cd04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2534_c7_cd04]
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_cd04]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2537_c31_5e1b]
signal CONST_SR_8_uxn_opcodes_h_l2537_c31_5e1b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2537_c31_5e1b_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a6df( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_left,
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_right,
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output);

-- n16_MUX_uxn_opcodes_h_l2497_c2_bfab
n16_MUX_uxn_opcodes_h_l2497_c2_bfab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond,
n16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue,
n16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse,
n16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output);

-- t16_MUX_uxn_opcodes_h_l2497_c2_bfab
t16_MUX_uxn_opcodes_h_l2497_c2_bfab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond,
t16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue,
t16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse,
t16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab
tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond,
tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue,
tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse,
tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_cond,
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_left,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_right,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_return_output);

-- n16_MUX_uxn_opcodes_h_l2510_c7_8e97
n16_MUX_uxn_opcodes_h_l2510_c7_8e97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond,
n16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue,
n16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse,
n16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output);

-- t16_MUX_uxn_opcodes_h_l2510_c7_8e97
t16_MUX_uxn_opcodes_h_l2510_c7_8e97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond,
t16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue,
t16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse,
t16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97
tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond,
tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue,
tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse,
tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_cond,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_left,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_right,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_return_output);

-- n16_MUX_uxn_opcodes_h_l2513_c7_bd6e
n16_MUX_uxn_opcodes_h_l2513_c7_bd6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond,
n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue,
n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse,
n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output);

-- t16_MUX_uxn_opcodes_h_l2513_c7_bd6e
t16_MUX_uxn_opcodes_h_l2513_c7_bd6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond,
t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue,
t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse,
t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e
tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond,
tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_left,
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_right,
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_return_output);

-- n16_MUX_uxn_opcodes_h_l2518_c7_5566
n16_MUX_uxn_opcodes_h_l2518_c7_5566 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2518_c7_5566_cond,
n16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue,
n16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse,
n16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output);

-- t16_MUX_uxn_opcodes_h_l2518_c7_5566
t16_MUX_uxn_opcodes_h_l2518_c7_5566 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2518_c7_5566_cond,
t16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue,
t16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse,
t16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2518_c7_5566
tmp16_MUX_uxn_opcodes_h_l2518_c7_5566 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_cond,
tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue,
tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse,
tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_cond,
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c
BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_left,
BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_right,
BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_left,
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_right,
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_return_output);

-- n16_MUX_uxn_opcodes_h_l2522_c7_1776
n16_MUX_uxn_opcodes_h_l2522_c7_1776 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2522_c7_1776_cond,
n16_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue,
n16_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse,
n16_MUX_uxn_opcodes_h_l2522_c7_1776_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2522_c7_1776
tmp16_MUX_uxn_opcodes_h_l2522_c7_1776 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_cond,
tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue,
tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse,
tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_cond,
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_left,
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_right,
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_return_output);

-- n16_MUX_uxn_opcodes_h_l2526_c7_44de
n16_MUX_uxn_opcodes_h_l2526_c7_44de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2526_c7_44de_cond,
n16_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue,
n16_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse,
n16_MUX_uxn_opcodes_h_l2526_c7_44de_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2526_c7_44de
tmp16_MUX_uxn_opcodes_h_l2526_c7_44de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_cond,
tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue,
tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse,
tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_cond,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1
BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_left,
BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_right,
BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_left,
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_right,
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9
sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_ins,
sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_x,
sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_y,
sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_left,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_right,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_cond,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2537_c31_5e1b
CONST_SR_8_uxn_opcodes_h_l2537_c31_5e1b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2537_c31_5e1b_x,
CONST_SR_8_uxn_opcodes_h_l2537_c31_5e1b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe
CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output,
 n16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
 t16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
 tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_return_output,
 n16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output,
 t16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output,
 tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_return_output,
 n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output,
 t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_return_output,
 n16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output,
 t16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output,
 tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_return_output,
 n16_MUX_uxn_opcodes_h_l2522_c7_1776_return_output,
 tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_return_output,
 n16_MUX_uxn_opcodes_h_l2526_c7_44de_return_output,
 tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_return_output,
 sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output,
 CONST_SR_8_uxn_opcodes_h_l2537_c31_5e1b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2502_c3_2c39 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_8a9b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_5fd2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2516_c3_b2e6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_1776_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_963a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_44de_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_1776_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_44de_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_5e6b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2532_c21_65dc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2535_c3_5481 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_9d10 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5e1b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5e1b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2537_c21_7bfa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2497_l2534_l2522_l2518_l2513_l2510_DUPLICATE_92cc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2534_l2522_l2518_l2513_l2510_DUPLICATE_c2f6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2534_l2526_l2522_l2518_l2513_l2510_DUPLICATE_e730_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_cf9a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2523_l2519_l2527_DUPLICATE_03f2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2534_DUPLICATE_a0bd_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2493_l2541_DUPLICATE_0a7c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_9d10 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_9d10;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2535_c3_5481 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2535_c3_5481;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_y := resize(to_signed(-2, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_8a9b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_8a9b;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_963a := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_963a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2516_c3_b2e6 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2516_c3_b2e6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_5e6b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_5e6b;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2502_c3_2c39 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2502_c3_2c39;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_5fd2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_5fd2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_right := to_unsigned(5, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5e1b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l2537_c31_5e1b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2537_c31_5e1b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5e1b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5e1b_return_output := CONST_SR_8_uxn_opcodes_h_l2537_c31_5e1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_c6e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2497_c2_bfab_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2518_c11_f8bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2497_c6_cfbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2523_l2519_l2527_DUPLICATE_03f2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2523_l2519_l2527_DUPLICATE_03f2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2497_l2534_l2522_l2518_l2513_l2510_DUPLICATE_92cc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2497_l2534_l2522_l2518_l2513_l2510_DUPLICATE_92cc_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2526_c11_e399] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_left;
     BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_return_output := BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_cf9a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_cf9a_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2529_c30_54e9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_ins;
     sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_x;
     sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_return_output := sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2534_l2526_l2522_l2518_l2513_l2510_DUPLICATE_e730 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2534_l2526_l2522_l2518_l2513_l2510_DUPLICATE_e730_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_1631] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_left;
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_return_output := BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2497_c2_bfab_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2522_c11_f584] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_left;
     BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_return_output := BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2534_DUPLICATE_a0bd LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2534_DUPLICATE_a0bd_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2497_c2_bfab_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2497_c2_bfab_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_f084] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_left;
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_return_output := BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2534_l2522_l2518_l2513_l2510_DUPLICATE_c2f6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2534_l2522_l2518_l2513_l2510_DUPLICATE_c2f6_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_cfbb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_1631_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_f084_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_5566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_5566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_f8bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_1776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_f584_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_44de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_e399_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_c6e4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2523_l2519_l2527_DUPLICATE_03f2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2523_l2519_l2527_DUPLICATE_03f2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2523_l2519_l2527_DUPLICATE_03f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2534_l2522_l2518_l2513_l2510_DUPLICATE_c2f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2534_l2522_l2518_l2513_l2510_DUPLICATE_c2f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2534_l2522_l2518_l2513_l2510_DUPLICATE_c2f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2534_l2522_l2518_l2513_l2510_DUPLICATE_c2f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2534_l2522_l2518_l2513_l2510_DUPLICATE_c2f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2534_l2526_l2522_l2518_l2513_l2510_DUPLICATE_e730_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2534_l2526_l2522_l2518_l2513_l2510_DUPLICATE_e730_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2534_l2526_l2522_l2518_l2513_l2510_DUPLICATE_e730_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2534_l2526_l2522_l2518_l2513_l2510_DUPLICATE_e730_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2534_l2526_l2522_l2518_l2513_l2510_DUPLICATE_e730_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2534_l2526_l2522_l2518_l2513_l2510_DUPLICATE_e730_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_cf9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_cf9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_cf9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_cf9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2526_l2522_l2518_l2513_l2510_DUPLICATE_cf9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2534_DUPLICATE_a0bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2522_l2534_DUPLICATE_a0bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2497_l2534_l2522_l2518_l2513_l2510_DUPLICATE_92cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2497_l2534_l2522_l2518_l2513_l2510_DUPLICATE_92cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2497_l2534_l2522_l2518_l2513_l2510_DUPLICATE_92cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2497_l2534_l2522_l2518_l2513_l2510_DUPLICATE_92cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2497_l2534_l2522_l2518_l2513_l2510_DUPLICATE_92cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2497_l2534_l2522_l2518_l2513_l2510_DUPLICATE_92cc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2497_c2_bfab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2497_c2_bfab_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2497_c2_bfab_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2497_c2_bfab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_54e9_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2527_c3_dba1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_left;
     BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_return_output := BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_cd04] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_cd04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2519_c3_8b8c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_left;
     BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_return_output := BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2537_c21_7bfa] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2537_c21_7bfa_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5e1b_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2534_c7_cd04] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2526_c7_44de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_8b8c_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_dba1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2537_c21_7bfa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_93fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_44de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2534_c7_cd04] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output := result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2526_c7_44de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2526_c7_44de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_return_output;

     -- n16_MUX[uxn_opcodes_h_l2526_c7_44de] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2526_c7_44de_cond <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_44de_cond;
     n16_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue;
     n16_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_44de_return_output := n16_MUX_uxn_opcodes_h_l2526_c7_44de_return_output;

     -- t16_MUX[uxn_opcodes_h_l2518_c7_5566] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2518_c7_5566_cond <= VAR_t16_MUX_uxn_opcodes_h_l2518_c7_5566_cond;
     t16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue;
     t16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output := t16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2522_c7_1776] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2528_c11_42f7] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2526_c7_44de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2526_c7_44de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_44de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_1776_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_44de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_44de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_cd04_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;
     -- t16_MUX[uxn_opcodes_h_l2513_c7_bd6e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond;
     t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue;
     t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output := t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2522_c7_1776] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2518_c7_5566] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2522_c7_1776] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2522_c7_1776] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_return_output;

     -- n16_MUX[uxn_opcodes_h_l2522_c7_1776] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2522_c7_1776_cond <= VAR_n16_MUX_uxn_opcodes_h_l2522_c7_1776_cond;
     n16_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue;
     n16_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_1776_return_output := n16_MUX_uxn_opcodes_h_l2522_c7_1776_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2532_c21_65dc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2532_c21_65dc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_42f7_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l2526_c7_44de] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_cond;
     tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_return_output := tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2532_c21_65dc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2522_c7_1776_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_1776_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_1776_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_1776_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_44de_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2522_c7_1776] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_cond;
     tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_return_output := tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_bd6e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2526_c7_44de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_return_output := result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2518_c7_5566] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2518_c7_5566] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2518_c7_5566] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;

     -- t16_MUX[uxn_opcodes_h_l2510_c7_8e97] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond <= VAR_t16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond;
     t16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue;
     t16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output := t16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;

     -- n16_MUX[uxn_opcodes_h_l2518_c7_5566] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2518_c7_5566_cond <= VAR_n16_MUX_uxn_opcodes_h_l2518_c7_5566_cond;
     n16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue;
     n16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output := n16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_44de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_1776_return_output;
     -- n16_MUX[uxn_opcodes_h_l2513_c7_bd6e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond;
     n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue;
     n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output := n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_bd6e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_bd6e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2518_c7_5566] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_cond;
     tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output := tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;

     -- t16_MUX[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond <= VAR_t16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond;
     t16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue;
     t16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output := t16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_8e97] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2522_c7_1776] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_return_output := result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_bd6e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_1776_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;
     -- n16_MUX[uxn_opcodes_h_l2510_c7_8e97] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond <= VAR_n16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond;
     n16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue;
     n16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output := n16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_8e97] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2518_c7_5566] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_return_output := result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2513_c7_bd6e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond;
     tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output := tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_8e97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_8e97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_5566_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2510_c7_8e97] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_cond;
     tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output := tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;

     -- n16_MUX[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond <= VAR_n16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond;
     n16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue;
     n16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output := n16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2513_c7_bd6e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_bd6e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_cond;
     tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output := tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2510_c7_8e97] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output := result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_8e97_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2497_c2_bfab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output := result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2493_l2541_DUPLICATE_0a7c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2493_l2541_DUPLICATE_0a7c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_bfab_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2493_l2541_DUPLICATE_0a7c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2493_l2541_DUPLICATE_0a7c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
