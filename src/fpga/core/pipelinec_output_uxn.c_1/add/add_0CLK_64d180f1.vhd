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
-- Submodules: 38
entity add_0CLK_64d180f1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add_0CLK_64d180f1;
architecture arch of add_0CLK_64d180f1 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l841_c6_b55b]
signal BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l841_c2_8263]
signal n8_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l841_c2_8263]
signal t8_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l841_c2_8263]
signal result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l841_c2_8263]
signal result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l841_c2_8263]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l841_c2_8263]
signal result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l841_c2_8263]
signal result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l841_c2_8263]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l841_c2_8263]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l841_c2_8263]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l841_c2_8263]
signal result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l854_c11_0deb]
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l854_c7_f883]
signal n8_MUX_uxn_opcodes_h_l854_c7_f883_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l854_c7_f883_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l854_c7_f883_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l854_c7_f883_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l854_c7_f883]
signal t8_MUX_uxn_opcodes_h_l854_c7_f883_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l854_c7_f883_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l854_c7_f883_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l854_c7_f883_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c7_f883]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l854_c7_f883]
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c7_f883]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l854_c7_f883]
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l854_c7_f883]
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l857_c11_f09d]
signal BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l857_c7_5eb3]
signal n8_MUX_uxn_opcodes_h_l857_c7_5eb3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l857_c7_5eb3]
signal t8_MUX_uxn_opcodes_h_l857_c7_5eb3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l857_c7_5eb3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l857_c7_5eb3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l857_c7_5eb3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l857_c7_5eb3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l857_c7_5eb3]
signal result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l860_c11_7e7c]
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l860_c7_36d0]
signal n8_MUX_uxn_opcodes_h_l860_c7_36d0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l860_c7_36d0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l860_c7_36d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l860_c7_36d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l860_c7_36d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l860_c7_36d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l860_c7_36d0]
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l862_c30_6c36]
signal sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l865_c21_5c9b]
signal BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e848( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b
BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_left,
BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_right,
BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output);

-- n8_MUX_uxn_opcodes_h_l841_c2_8263
n8_MUX_uxn_opcodes_h_l841_c2_8263 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l841_c2_8263_cond,
n8_MUX_uxn_opcodes_h_l841_c2_8263_iftrue,
n8_MUX_uxn_opcodes_h_l841_c2_8263_iffalse,
n8_MUX_uxn_opcodes_h_l841_c2_8263_return_output);

-- t8_MUX_uxn_opcodes_h_l841_c2_8263
t8_MUX_uxn_opcodes_h_l841_c2_8263 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l841_c2_8263_cond,
t8_MUX_uxn_opcodes_h_l841_c2_8263_iftrue,
t8_MUX_uxn_opcodes_h_l841_c2_8263_iffalse,
t8_MUX_uxn_opcodes_h_l841_c2_8263_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263
result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263
result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263
result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263
result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263
result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_cond,
result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263
result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263
result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb
BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_left,
BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_right,
BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_return_output);

-- n8_MUX_uxn_opcodes_h_l854_c7_f883
n8_MUX_uxn_opcodes_h_l854_c7_f883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l854_c7_f883_cond,
n8_MUX_uxn_opcodes_h_l854_c7_f883_iftrue,
n8_MUX_uxn_opcodes_h_l854_c7_f883_iffalse,
n8_MUX_uxn_opcodes_h_l854_c7_f883_return_output);

-- t8_MUX_uxn_opcodes_h_l854_c7_f883
t8_MUX_uxn_opcodes_h_l854_c7_f883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l854_c7_f883_cond,
t8_MUX_uxn_opcodes_h_l854_c7_f883_iftrue,
t8_MUX_uxn_opcodes_h_l854_c7_f883_iffalse,
t8_MUX_uxn_opcodes_h_l854_c7_f883_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883
result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_cond,
result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d
BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_left,
BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_right,
BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_return_output);

-- n8_MUX_uxn_opcodes_h_l857_c7_5eb3
n8_MUX_uxn_opcodes_h_l857_c7_5eb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l857_c7_5eb3_cond,
n8_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue,
n8_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse,
n8_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output);

-- t8_MUX_uxn_opcodes_h_l857_c7_5eb3
t8_MUX_uxn_opcodes_h_l857_c7_5eb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l857_c7_5eb3_cond,
t8_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue,
t8_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse,
t8_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3
result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_cond,
result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c
BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_left,
BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_right,
BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_return_output);

-- n8_MUX_uxn_opcodes_h_l860_c7_36d0
n8_MUX_uxn_opcodes_h_l860_c7_36d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l860_c7_36d0_cond,
n8_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue,
n8_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse,
n8_MUX_uxn_opcodes_h_l860_c7_36d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0
result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_cond,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l862_c30_6c36
sp_relative_shift_uxn_opcodes_h_l862_c30_6c36 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_ins,
sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_x,
sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_y,
sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b
BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_left,
BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_right,
BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output,
 n8_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
 t8_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_return_output,
 n8_MUX_uxn_opcodes_h_l854_c7_f883_return_output,
 t8_MUX_uxn_opcodes_h_l854_c7_f883_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_return_output,
 n8_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output,
 t8_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_return_output,
 n8_MUX_uxn_opcodes_h_l860_c7_36d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_return_output,
 sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_f883_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l854_c7_f883_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l846_c3_603c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l851_c3_f86f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_f883_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_f883_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_f883_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l854_c7_f883_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l854_c7_f883_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l854_c7_f883_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_ca9a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l860_c7_36d0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l857_c7_5eb3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l857_c7_5eb3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l860_c7_36d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_8856 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l865_c3_f258 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l841_l857_l860_DUPLICATE_76f0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_562d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_ed13_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_5b28_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l857_l860_DUPLICATE_5d75_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l869_l837_DUPLICATE_a6c6_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l851_c3_f86f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l851_c3_f86f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_ca9a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_ca9a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l846_c3_603c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l846_c3_603c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_8856 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_8856;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_y := resize(to_signed(-1, 2), 4);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l841_c2_8263_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_f883_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l841_c2_8263_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l854_c7_f883_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l841_l857_l860_DUPLICATE_76f0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l841_l857_l860_DUPLICATE_76f0_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_562d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_562d_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_5b28 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_5b28_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l854_c11_0deb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_left;
     BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_return_output := BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l860_c11_7e7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l841_c2_8263] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l841_c2_8263_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l857_c11_f09d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_left;
     BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_return_output := BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l841_c2_8263] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l841_c2_8263_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_ed13 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_ed13_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l841_c6_b55b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_left;
     BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output := BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l862_c30_6c36] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_ins;
     sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_x <= VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_x;
     sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_y <= VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_return_output := sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l857_l860_DUPLICATE_5d75 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l857_l860_DUPLICATE_5d75_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l841_c2_8263] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l841_c2_8263_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l841_c2_8263] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l841_c2_8263_return_output := result.is_vram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l865_c21_5c9b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l841_c2_8263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l841_c2_8263_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c6_b55b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_f883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l854_c7_f883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_0deb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l857_c7_5eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l857_c7_5eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_f09d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l860_c7_36d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_7e7c_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l865_c3_f258 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l865_c21_5c9b_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_ed13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_ed13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_ed13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_5b28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_5b28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_5b28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_562d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_562d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l857_l860_DUPLICATE_562d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l857_l860_DUPLICATE_5d75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l857_l860_DUPLICATE_5d75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l841_l857_l860_DUPLICATE_76f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l841_l857_l860_DUPLICATE_76f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l841_l857_l860_DUPLICATE_76f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l841_l857_l860_DUPLICATE_76f0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l841_c2_8263_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l841_c2_8263_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l841_c2_8263_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l841_c2_8263_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l862_c30_6c36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue := VAR_result_u8_value_uxn_opcodes_h_l865_c3_f258;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l860_c7_36d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l860_c7_36d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l841_c2_8263] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l841_c2_8263] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l860_c7_36d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l841_c2_8263] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l860_c7_36d0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_return_output := result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_return_output;

     -- n8_MUX[uxn_opcodes_h_l860_c7_36d0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l860_c7_36d0_cond <= VAR_n8_MUX_uxn_opcodes_h_l860_c7_36d0_cond;
     n8_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue;
     n8_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l860_c7_36d0_return_output := n8_MUX_uxn_opcodes_h_l860_c7_36d0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l841_c2_8263] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output;

     -- t8_MUX[uxn_opcodes_h_l857_c7_5eb3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l857_c7_5eb3_cond <= VAR_t8_MUX_uxn_opcodes_h_l857_c7_5eb3_cond;
     t8_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue;
     t8_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output := t8_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l860_c7_36d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l860_c7_36d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_36d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_36d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l860_c7_36d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_36d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l860_c7_36d0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l854_c7_f883_iffalse := VAR_t8_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l857_c7_5eb3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l857_c7_5eb3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l857_c7_5eb3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output := result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output;

     -- n8_MUX[uxn_opcodes_h_l857_c7_5eb3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l857_c7_5eb3_cond <= VAR_n8_MUX_uxn_opcodes_h_l857_c7_5eb3_cond;
     n8_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue;
     n8_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output := n8_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output;

     -- t8_MUX[uxn_opcodes_h_l854_c7_f883] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l854_c7_f883_cond <= VAR_t8_MUX_uxn_opcodes_h_l854_c7_f883_cond;
     t8_MUX_uxn_opcodes_h_l854_c7_f883_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l854_c7_f883_iftrue;
     t8_MUX_uxn_opcodes_h_l854_c7_f883_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l854_c7_f883_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l854_c7_f883_return_output := t8_MUX_uxn_opcodes_h_l854_c7_f883_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l857_c7_5eb3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l857_c7_5eb3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_f883_iffalse := VAR_n8_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l857_c7_5eb3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l841_c2_8263_iffalse := VAR_t8_MUX_uxn_opcodes_h_l854_c7_f883_return_output;
     -- n8_MUX[uxn_opcodes_h_l854_c7_f883] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l854_c7_f883_cond <= VAR_n8_MUX_uxn_opcodes_h_l854_c7_f883_cond;
     n8_MUX_uxn_opcodes_h_l854_c7_f883_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l854_c7_f883_iftrue;
     n8_MUX_uxn_opcodes_h_l854_c7_f883_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l854_c7_f883_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_f883_return_output := n8_MUX_uxn_opcodes_h_l854_c7_f883_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l854_c7_f883] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_return_output;

     -- t8_MUX[uxn_opcodes_h_l841_c2_8263] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l841_c2_8263_cond <= VAR_t8_MUX_uxn_opcodes_h_l841_c2_8263_cond;
     t8_MUX_uxn_opcodes_h_l841_c2_8263_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l841_c2_8263_iftrue;
     t8_MUX_uxn_opcodes_h_l841_c2_8263_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l841_c2_8263_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l841_c2_8263_return_output := t8_MUX_uxn_opcodes_h_l841_c2_8263_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l854_c7_f883] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l854_c7_f883] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_cond;
     result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_return_output := result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c7_f883] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c7_f883] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l841_c2_8263_iffalse := VAR_n8_MUX_uxn_opcodes_h_l854_c7_f883_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_f883_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_f883_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_f883_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_f883_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_f883_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l841_c2_8263_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l841_c2_8263] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_return_output;

     -- n8_MUX[uxn_opcodes_h_l841_c2_8263] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l841_c2_8263_cond <= VAR_n8_MUX_uxn_opcodes_h_l841_c2_8263_cond;
     n8_MUX_uxn_opcodes_h_l841_c2_8263_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l841_c2_8263_iftrue;
     n8_MUX_uxn_opcodes_h_l841_c2_8263_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l841_c2_8263_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l841_c2_8263_return_output := n8_MUX_uxn_opcodes_h_l841_c2_8263_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l841_c2_8263] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l841_c2_8263] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_cond;
     result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_return_output := result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l841_c2_8263] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l841_c2_8263] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l841_c2_8263_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l869_l837_DUPLICATE_a6c6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l869_l837_DUPLICATE_a6c6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c2_8263_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c2_8263_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l869_l837_DUPLICATE_a6c6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l869_l837_DUPLICATE_a6c6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
