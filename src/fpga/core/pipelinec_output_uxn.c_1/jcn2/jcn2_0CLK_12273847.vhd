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
-- Submodules: 50
entity jcn2_0CLK_12273847 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_12273847;
architecture arch of jcn2_0CLK_12273847 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l693_c6_972c]
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l693_c2_58c4]
signal t16_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l693_c2_58c4]
signal n8_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l693_c2_58c4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l693_c2_58c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l693_c2_58c4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c2_58c4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l693_c2_58c4]
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l693_c2_58c4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c2_58c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l693_c2_58c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c2_58c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l706_c11_f095]
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l706_c7_f063]
signal t16_MUX_uxn_opcodes_h_l706_c7_f063_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_f063_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_f063_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_f063_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l706_c7_f063]
signal n8_MUX_uxn_opcodes_h_l706_c7_f063_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_f063_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_f063_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_f063_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l706_c7_f063]
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l706_c7_f063]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l706_c7_f063]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_f063]
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l706_c7_f063]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l709_c11_227b]
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l709_c7_29a6]
signal t16_MUX_uxn_opcodes_h_l709_c7_29a6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_29a6_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l709_c7_29a6]
signal n8_MUX_uxn_opcodes_h_l709_c7_29a6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_29a6_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l709_c7_29a6]
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l709_c7_29a6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l709_c7_29a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l709_c7_29a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l709_c7_29a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l711_c3_2309]
signal CONST_SL_8_uxn_opcodes_h_l711_c3_2309_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l711_c3_2309_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l714_c11_e26b]
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l714_c7_533c]
signal t16_MUX_uxn_opcodes_h_l714_c7_533c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_533c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_533c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_533c_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l714_c7_533c]
signal n8_MUX_uxn_opcodes_h_l714_c7_533c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_533c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_533c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_533c_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_533c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l714_c7_533c]
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l714_c7_533c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_533c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l715_c3_eb54]
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l717_c11_5a12]
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l717_c7_a7d1]
signal n8_MUX_uxn_opcodes_h_l717_c7_a7d1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_a7d1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l717_c7_a7d1]
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_a7d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_a7d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l719_c30_18b1]
signal sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l720_c26_a2b5]
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l720_c26_02f9]
signal MUX_uxn_opcodes_h_l720_c26_02f9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_02f9_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_02f9_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_02f9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l721_c22_9a02]
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l721_c22_f0d4]
signal MUX_uxn_opcodes_h_l721_c22_f0d4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_f0d4_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_f0d4_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_f0d4_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c
BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_left,
BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_right,
BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output);

-- t16_MUX_uxn_opcodes_h_l693_c2_58c4
t16_MUX_uxn_opcodes_h_l693_c2_58c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l693_c2_58c4_cond,
t16_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue,
t16_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse,
t16_MUX_uxn_opcodes_h_l693_c2_58c4_return_output);

-- n8_MUX_uxn_opcodes_h_l693_c2_58c4
n8_MUX_uxn_opcodes_h_l693_c2_58c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l693_c2_58c4_cond,
n8_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue,
n8_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse,
n8_MUX_uxn_opcodes_h_l693_c2_58c4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4
result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_cond,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095
BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_left,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_right,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_return_output);

-- t16_MUX_uxn_opcodes_h_l706_c7_f063
t16_MUX_uxn_opcodes_h_l706_c7_f063 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l706_c7_f063_cond,
t16_MUX_uxn_opcodes_h_l706_c7_f063_iftrue,
t16_MUX_uxn_opcodes_h_l706_c7_f063_iffalse,
t16_MUX_uxn_opcodes_h_l706_c7_f063_return_output);

-- n8_MUX_uxn_opcodes_h_l706_c7_f063
n8_MUX_uxn_opcodes_h_l706_c7_f063 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l706_c7_f063_cond,
n8_MUX_uxn_opcodes_h_l706_c7_f063_iftrue,
n8_MUX_uxn_opcodes_h_l706_c7_f063_iffalse,
n8_MUX_uxn_opcodes_h_l706_c7_f063_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063
result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_cond,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b
BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_left,
BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_right,
BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_return_output);

-- t16_MUX_uxn_opcodes_h_l709_c7_29a6
t16_MUX_uxn_opcodes_h_l709_c7_29a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l709_c7_29a6_cond,
t16_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue,
t16_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse,
t16_MUX_uxn_opcodes_h_l709_c7_29a6_return_output);

-- n8_MUX_uxn_opcodes_h_l709_c7_29a6
n8_MUX_uxn_opcodes_h_l709_c7_29a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l709_c7_29a6_cond,
n8_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue,
n8_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse,
n8_MUX_uxn_opcodes_h_l709_c7_29a6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6
result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_cond,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l711_c3_2309
CONST_SL_8_uxn_opcodes_h_l711_c3_2309 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l711_c3_2309_x,
CONST_SL_8_uxn_opcodes_h_l711_c3_2309_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b
BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_left,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_right,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_return_output);

-- t16_MUX_uxn_opcodes_h_l714_c7_533c
t16_MUX_uxn_opcodes_h_l714_c7_533c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l714_c7_533c_cond,
t16_MUX_uxn_opcodes_h_l714_c7_533c_iftrue,
t16_MUX_uxn_opcodes_h_l714_c7_533c_iffalse,
t16_MUX_uxn_opcodes_h_l714_c7_533c_return_output);

-- n8_MUX_uxn_opcodes_h_l714_c7_533c
n8_MUX_uxn_opcodes_h_l714_c7_533c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l714_c7_533c_cond,
n8_MUX_uxn_opcodes_h_l714_c7_533c_iftrue,
n8_MUX_uxn_opcodes_h_l714_c7_533c_iffalse,
n8_MUX_uxn_opcodes_h_l714_c7_533c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c
result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_cond,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54
BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_left,
BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_right,
BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12
BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_left,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_right,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_return_output);

-- n8_MUX_uxn_opcodes_h_l717_c7_a7d1
n8_MUX_uxn_opcodes_h_l717_c7_a7d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l717_c7_a7d1_cond,
n8_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue,
n8_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse,
n8_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1
result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_cond,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l719_c30_18b1
sp_relative_shift_uxn_opcodes_h_l719_c30_18b1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_ins,
sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_x,
sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_y,
sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5
BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_left,
BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_right,
BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_return_output);

-- MUX_uxn_opcodes_h_l720_c26_02f9
MUX_uxn_opcodes_h_l720_c26_02f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l720_c26_02f9_cond,
MUX_uxn_opcodes_h_l720_c26_02f9_iftrue,
MUX_uxn_opcodes_h_l720_c26_02f9_iffalse,
MUX_uxn_opcodes_h_l720_c26_02f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02
BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_left,
BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_right,
BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_return_output);

-- MUX_uxn_opcodes_h_l721_c22_f0d4
MUX_uxn_opcodes_h_l721_c22_f0d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l721_c22_f0d4_cond,
MUX_uxn_opcodes_h_l721_c22_f0d4_iftrue,
MUX_uxn_opcodes_h_l721_c22_f0d4_iffalse,
MUX_uxn_opcodes_h_l721_c22_f0d4_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output,
 t16_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
 n8_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_return_output,
 t16_MUX_uxn_opcodes_h_l706_c7_f063_return_output,
 n8_MUX_uxn_opcodes_h_l706_c7_f063_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_return_output,
 t16_MUX_uxn_opcodes_h_l709_c7_29a6_return_output,
 n8_MUX_uxn_opcodes_h_l709_c7_29a6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_return_output,
 CONST_SL_8_uxn_opcodes_h_l711_c3_2309_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_return_output,
 t16_MUX_uxn_opcodes_h_l714_c7_533c_return_output,
 n8_MUX_uxn_opcodes_h_l714_c7_533c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_return_output,
 n8_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output,
 sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_return_output,
 MUX_uxn_opcodes_h_l720_c26_02f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_return_output,
 MUX_uxn_opcodes_h_l721_c22_f0d4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_f063_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_f063_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_1c3c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_947a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_f063_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_f063_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_29a6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_f063_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_f063_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_f063_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_29a6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_f063_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_fc76 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_533c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_29a6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_533c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_29a6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_042f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_29a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_2309_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_2309_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_533c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_533c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_533c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_533c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_533c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_533c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_a7d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_02f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_02f9_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_02f9_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_02f9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_f0d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_f0d4_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_f0d4_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_f0d4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l706_l693_l714_l717_l709_DUPLICATE_0faa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_b5dc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_7c3e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_1f8e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l715_l710_DUPLICATE_1293_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l725_l688_DUPLICATE_94ea_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l720_c26_02f9_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l720_c26_02f9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_fc76 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_fc76;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l721_c22_f0d4_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_042f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_042f;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_947a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_947a;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_1c3c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_1c3c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_f063_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_533c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_left := t16;
     VAR_MUX_uxn_opcodes_h_l721_c22_f0d4_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_f063_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_533c_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l720_c26_a2b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l714_c11_e26b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_left;
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_return_output := BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l719_c30_18b1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_ins;
     sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_x;
     sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_return_output := sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_1f8e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_1f8e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l721_c22_9a02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_left;
     BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_return_output := BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l693_c2_58c4] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_58c4_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l709_c11_227b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_left;
     BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_return_output := BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l693_c2_58c4] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_58c4_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_b5dc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_b5dc_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_7c3e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_7c3e_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l709_c7_29a6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_29a6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l706_c11_f095] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_left;
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_return_output := BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l717_c11_5a12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_left;
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_return_output := BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l706_l693_l714_l717_l709_DUPLICATE_0faa LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l706_l693_l714_l717_l709_DUPLICATE_0faa_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l693_c6_972c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_left;
     BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output := BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l715_l710_DUPLICATE_1293 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l715_l710_DUPLICATE_1293_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l693_c2_58c4] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_58c4_return_output := result.is_ram_write;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l693_c2_58c4] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_58c4_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_58c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_58c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_972c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_f063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_f063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_f095_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_29a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_29a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_227b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_533c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_533c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_e26b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_a7d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5a12_return_output;
     VAR_MUX_uxn_opcodes_h_l720_c26_02f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_a2b5_return_output;
     VAR_MUX_uxn_opcodes_h_l721_c22_f0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_9a02_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l715_l710_DUPLICATE_1293_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_2309_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l715_l710_DUPLICATE_1293_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_7c3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_7c3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_7c3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_7c3e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l706_l693_l714_l717_l709_DUPLICATE_0faa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l706_l693_l714_l717_l709_DUPLICATE_0faa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l706_l693_l714_l717_l709_DUPLICATE_0faa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l706_l693_l714_l717_l709_DUPLICATE_0faa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l706_l693_l714_l717_l709_DUPLICATE_0faa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_1f8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_1f8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_1f8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_1f8e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_b5dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_b5dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_b5dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l714_l706_l717_l709_DUPLICATE_b5dc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_58c4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_58c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_58c4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_58c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_29a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_18b1_return_output;
     -- MUX[uxn_opcodes_h_l721_c22_f0d4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l721_c22_f0d4_cond <= VAR_MUX_uxn_opcodes_h_l721_c22_f0d4_cond;
     MUX_uxn_opcodes_h_l721_c22_f0d4_iftrue <= VAR_MUX_uxn_opcodes_h_l721_c22_f0d4_iftrue;
     MUX_uxn_opcodes_h_l721_c22_f0d4_iffalse <= VAR_MUX_uxn_opcodes_h_l721_c22_f0d4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l721_c22_f0d4_return_output := MUX_uxn_opcodes_h_l721_c22_f0d4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l693_c2_58c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l693_c2_58c4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l715_c3_eb54] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_left;
     BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_return_output := BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_a7d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_a7d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l693_c2_58c4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l693_c2_58c4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l709_c7_29a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l711_c3_2309] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l711_c3_2309_x <= VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_2309_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_2309_return_output := CONST_SL_8_uxn_opcodes_h_l711_c3_2309_return_output;

     -- MUX[uxn_opcodes_h_l720_c26_02f9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l720_c26_02f9_cond <= VAR_MUX_uxn_opcodes_h_l720_c26_02f9_cond;
     MUX_uxn_opcodes_h_l720_c26_02f9_iftrue <= VAR_MUX_uxn_opcodes_h_l720_c26_02f9_iftrue;
     MUX_uxn_opcodes_h_l720_c26_02f9_iffalse <= VAR_MUX_uxn_opcodes_h_l720_c26_02f9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l720_c26_02f9_return_output := MUX_uxn_opcodes_h_l720_c26_02f9_return_output;

     -- n8_MUX[uxn_opcodes_h_l717_c7_a7d1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l717_c7_a7d1_cond <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_a7d1_cond;
     n8_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue;
     n8_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output := n8_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_533c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_eb54_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_2309_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue := VAR_MUX_uxn_opcodes_h_l720_c26_02f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue := VAR_MUX_uxn_opcodes_h_l721_c22_f0d4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_533c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_29a6_return_output;
     -- t16_MUX[uxn_opcodes_h_l714_c7_533c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l714_c7_533c_cond <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_533c_cond;
     t16_MUX_uxn_opcodes_h_l714_c7_533c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_533c_iftrue;
     t16_MUX_uxn_opcodes_h_l714_c7_533c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_533c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_533c_return_output := t16_MUX_uxn_opcodes_h_l714_c7_533c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l706_c7_f063] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l717_c7_a7d1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output := result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l714_c7_533c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_533c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_a7d1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output;

     -- n8_MUX[uxn_opcodes_h_l714_c7_533c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l714_c7_533c_cond <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_533c_cond;
     n8_MUX_uxn_opcodes_h_l714_c7_533c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_533c_iftrue;
     n8_MUX_uxn_opcodes_h_l714_c7_533c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_533c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_533c_return_output := n8_MUX_uxn_opcodes_h_l714_c7_533c_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l714_c7_533c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_533c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_533c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_f063_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_a7d1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l714_c7_533c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l709_c7_29a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l709_c7_29a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_return_output;

     -- t16_MUX[uxn_opcodes_h_l709_c7_29a6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l709_c7_29a6_cond <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_29a6_cond;
     t16_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue;
     t16_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_29a6_return_output := t16_MUX_uxn_opcodes_h_l709_c7_29a6_return_output;

     -- n8_MUX[uxn_opcodes_h_l709_c7_29a6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l709_c7_29a6_cond <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_29a6_cond;
     n8_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue;
     n8_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_29a6_return_output := n8_MUX_uxn_opcodes_h_l709_c7_29a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c2_58c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_533c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l714_c7_533c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_return_output := result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_f063_iffalse := VAR_n8_MUX_uxn_opcodes_h_l709_c7_29a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_29a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_533c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_29a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_533c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_f063_iffalse := VAR_t16_MUX_uxn_opcodes_h_l709_c7_29a6_return_output;
     -- n8_MUX[uxn_opcodes_h_l706_c7_f063] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l706_c7_f063_cond <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_f063_cond;
     n8_MUX_uxn_opcodes_h_l706_c7_f063_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_f063_iftrue;
     n8_MUX_uxn_opcodes_h_l706_c7_f063_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_f063_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_f063_return_output := n8_MUX_uxn_opcodes_h_l706_c7_f063_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l706_c7_f063] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_f063] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l709_c7_29a6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_return_output := result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_return_output;

     -- t16_MUX[uxn_opcodes_h_l706_c7_f063] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l706_c7_f063_cond <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_f063_cond;
     t16_MUX_uxn_opcodes_h_l706_c7_f063_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_f063_iftrue;
     t16_MUX_uxn_opcodes_h_l706_c7_f063_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_f063_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_f063_return_output := t16_MUX_uxn_opcodes_h_l706_c7_f063_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l709_c7_29a6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l706_c7_f063_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f063_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_29a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_f063_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_29a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l706_c7_f063_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l706_c7_f063] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_cond;
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_return_output := result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c2_58c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_return_output;

     -- n8_MUX[uxn_opcodes_h_l693_c2_58c4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l693_c2_58c4_cond <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_58c4_cond;
     n8_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue;
     n8_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_58c4_return_output := n8_MUX_uxn_opcodes_h_l693_c2_58c4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l706_c7_f063] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_return_output;

     -- t16_MUX[uxn_opcodes_h_l693_c2_58c4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l693_c2_58c4_cond <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_58c4_cond;
     t16_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue;
     t16_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_58c4_return_output := t16_MUX_uxn_opcodes_h_l693_c2_58c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l693_c2_58c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l693_c2_58c4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_f063_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_f063_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l693_c2_58c4_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c2_58c4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l693_c2_58c4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_return_output := result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l725_l688_DUPLICATE_94ea LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l725_l688_DUPLICATE_94ea_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_58c4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_58c4_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l725_l688_DUPLICATE_94ea_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l725_l688_DUPLICATE_94ea_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
