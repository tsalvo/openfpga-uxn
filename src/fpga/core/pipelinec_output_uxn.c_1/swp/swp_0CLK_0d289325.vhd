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
-- Submodules: 36
entity swp_0CLK_0d289325 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp_0CLK_0d289325;
architecture arch of swp_0CLK_0d289325 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2570_c6_13cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2570_c2_893c]
signal n8_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2570_c2_893c]
signal t8_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2570_c2_893c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2570_c2_893c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2570_c2_893c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2570_c2_893c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2570_c2_893c]
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2570_c2_893c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2570_c2_893c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2570_c2_893c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2570_c2_893c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2583_c11_b57a]
signal BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2583_c7_566a]
signal n8_MUX_uxn_opcodes_h_l2583_c7_566a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2583_c7_566a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2583_c7_566a]
signal t8_MUX_uxn_opcodes_h_l2583_c7_566a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2583_c7_566a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2583_c7_566a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2583_c7_566a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2583_c7_566a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2583_c7_566a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2583_c7_566a]
signal result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2586_c11_eb0f]
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2586_c7_ef57]
signal n8_MUX_uxn_opcodes_h_l2586_c7_ef57_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2586_c7_ef57]
signal t8_MUX_uxn_opcodes_h_l2586_c7_ef57_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c7_ef57]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c7_ef57]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c7_ef57]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c7_ef57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2586_c7_ef57]
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2588_c30_1985]
signal sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2593_c11_09de]
signal BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2593_c7_c661]
signal n8_MUX_uxn_opcodes_h_l2593_c7_c661_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2593_c7_c661_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2593_c7_c661]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2593_c7_c661]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2593_c7_c661]
signal result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2593_c7_c661]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_return_output : signed(3 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd
BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output);

-- n8_MUX_uxn_opcodes_h_l2570_c2_893c
n8_MUX_uxn_opcodes_h_l2570_c2_893c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2570_c2_893c_cond,
n8_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue,
n8_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse,
n8_MUX_uxn_opcodes_h_l2570_c2_893c_return_output);

-- t8_MUX_uxn_opcodes_h_l2570_c2_893c
t8_MUX_uxn_opcodes_h_l2570_c2_893c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2570_c2_893c_cond,
t8_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue,
t8_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse,
t8_MUX_uxn_opcodes_h_l2570_c2_893c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c
result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c
result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c
result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c
result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c
result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_left,
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_right,
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_return_output);

-- n8_MUX_uxn_opcodes_h_l2583_c7_566a
n8_MUX_uxn_opcodes_h_l2583_c7_566a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2583_c7_566a_cond,
n8_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue,
n8_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse,
n8_MUX_uxn_opcodes_h_l2583_c7_566a_return_output);

-- t8_MUX_uxn_opcodes_h_l2583_c7_566a
t8_MUX_uxn_opcodes_h_l2583_c7_566a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2583_c7_566a_cond,
t8_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue,
t8_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse,
t8_MUX_uxn_opcodes_h_l2583_c7_566a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a
result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_left,
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_right,
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_return_output);

-- n8_MUX_uxn_opcodes_h_l2586_c7_ef57
n8_MUX_uxn_opcodes_h_l2586_c7_ef57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2586_c7_ef57_cond,
n8_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue,
n8_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse,
n8_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output);

-- t8_MUX_uxn_opcodes_h_l2586_c7_ef57
t8_MUX_uxn_opcodes_h_l2586_c7_ef57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2586_c7_ef57_cond,
t8_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue,
t8_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse,
t8_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57
result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_cond,
result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2588_c30_1985
sp_relative_shift_uxn_opcodes_h_l2588_c30_1985 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_ins,
sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_x,
sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_y,
sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de
BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_left,
BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_right,
BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_return_output);

-- n8_MUX_uxn_opcodes_h_l2593_c7_c661
n8_MUX_uxn_opcodes_h_l2593_c7_c661 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2593_c7_c661_cond,
n8_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue,
n8_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse,
n8_MUX_uxn_opcodes_h_l2593_c7_c661_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661
result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661
result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_cond,
result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661
result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output,
 n8_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
 t8_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_return_output,
 n8_MUX_uxn_opcodes_h_l2583_c7_566a_return_output,
 t8_MUX_uxn_opcodes_h_l2583_c7_566a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_return_output,
 n8_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output,
 t8_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output,
 sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_return_output,
 n8_MUX_uxn_opcodes_h_l2593_c7_c661_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2583_c7_566a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2583_c7_566a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2575_c3_d189 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2580_c3_406f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2583_c7_566a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2583_c7_566a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_9db6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2593_c7_c661_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ef57_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2586_c7_ef57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2590_c3_d98c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2593_c7_c661_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_69db : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2593_c7_c661_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2595_c3_841e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2593_l2583_l2570_DUPLICATE_5635_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2583_l2586_DUPLICATE_1e32_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2593_l2583_DUPLICATE_762d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2593_l2583_l2586_DUPLICATE_2695_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2566_l2601_DUPLICATE_ee06_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2595_c3_841e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2595_c3_841e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_69db := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_69db;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2590_c3_d98c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2590_c3_d98c;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2580_c3_406f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2580_c3_406f;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2575_c3_d189 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2575_c3_d189;
     VAR_sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_9db6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_9db6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2583_l2586_DUPLICATE_1e32 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2583_l2586_DUPLICATE_1e32_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2586_c11_eb0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2570_c2_893c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2570_c2_893c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2593_l2583_l2570_DUPLICATE_5635 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2593_l2583_l2570_DUPLICATE_5635_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2570_c2_893c] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2570_c2_893c_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2570_c2_893c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2570_c2_893c_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2593_l2583_DUPLICATE_762d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2593_l2583_DUPLICATE_762d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2583_c11_b57a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2570_c2_893c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2570_c2_893c_return_output := result.is_stack_index_flipped;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2593_c7_c661] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2593_c7_c661_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l2588_c30_1985] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_ins;
     sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_x;
     sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_return_output := sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2570_c6_13cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2593_c11_09de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2593_l2583_l2586_DUPLICATE_2695 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2593_l2583_l2586_DUPLICATE_2695_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l2570_c2_893c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2570_c2_893c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c6_13cd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2583_c7_566a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2583_c7_566a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_b57a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ef57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2586_c7_ef57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_eb0f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2593_c7_c661_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2593_c11_09de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2593_l2583_DUPLICATE_762d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2593_l2583_DUPLICATE_762d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2593_l2583_l2586_DUPLICATE_2695_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2593_l2583_l2586_DUPLICATE_2695_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2593_l2583_l2586_DUPLICATE_2695_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2583_l2586_DUPLICATE_1e32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2583_l2586_DUPLICATE_1e32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2593_l2583_l2570_DUPLICATE_5635_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2593_l2583_l2570_DUPLICATE_5635_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2593_l2583_l2570_DUPLICATE_5635_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2570_c2_893c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2570_c2_893c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2570_c2_893c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2570_c2_893c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2593_c7_c661_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2588_c30_1985_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c7_ef57] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2593_c7_c661] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2593_c7_c661] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_return_output := result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_return_output;

     -- n8_MUX[uxn_opcodes_h_l2593_c7_c661] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2593_c7_c661_cond <= VAR_n8_MUX_uxn_opcodes_h_l2593_c7_c661_cond;
     n8_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue;
     n8_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2593_c7_c661_return_output := n8_MUX_uxn_opcodes_h_l2593_c7_c661_return_output;

     -- t8_MUX[uxn_opcodes_h_l2586_c7_ef57] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2586_c7_ef57_cond <= VAR_t8_MUX_uxn_opcodes_h_l2586_c7_ef57_cond;
     t8_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue;
     t8_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output := t8_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2570_c2_893c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2593_c7_c661] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2593_c7_c661] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2570_c2_893c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2570_c2_893c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2570_c2_893c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2593_c7_c661_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2593_c7_c661_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2593_c7_c661_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2593_c7_c661_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2593_c7_c661_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c7_ef57] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output;

     -- t8_MUX[uxn_opcodes_h_l2583_c7_566a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2583_c7_566a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2583_c7_566a_cond;
     t8_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue;
     t8_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2583_c7_566a_return_output := t8_MUX_uxn_opcodes_h_l2583_c7_566a_return_output;

     -- n8_MUX[uxn_opcodes_h_l2586_c7_ef57] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2586_c7_ef57_cond <= VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ef57_cond;
     n8_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue;
     n8_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output := n8_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c7_ef57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c7_ef57] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2583_c7_566a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2586_c7_ef57] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output := result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_566a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_ef57_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2583_c7_566a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2583_c7_566a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_return_output;

     -- n8_MUX[uxn_opcodes_h_l2583_c7_566a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2583_c7_566a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2583_c7_566a_cond;
     n8_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue;
     n8_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2583_c7_566a_return_output := n8_MUX_uxn_opcodes_h_l2583_c7_566a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2583_c7_566a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2570_c2_893c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output;

     -- t8_MUX[uxn_opcodes_h_l2570_c2_893c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2570_c2_893c_cond <= VAR_t8_MUX_uxn_opcodes_h_l2570_c2_893c_cond;
     t8_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue;
     t8_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2570_c2_893c_return_output := t8_MUX_uxn_opcodes_h_l2570_c2_893c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2583_c7_566a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2583_c7_566a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2583_c7_566a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_566a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_566a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_566a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_566a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2570_c2_893c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2570_c2_893c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2570_c2_893c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2570_c2_893c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2570_c2_893c_cond;
     n8_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue;
     n8_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2570_c2_893c_return_output := n8_MUX_uxn_opcodes_h_l2570_c2_893c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2570_c2_893c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2570_c2_893c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2570_c2_893c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2570_c2_893c_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2566_l2601_DUPLICATE_ee06 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2566_l2601_DUPLICATE_ee06_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2570_c2_893c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c2_893c_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2566_l2601_DUPLICATE_ee06_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2566_l2601_DUPLICATE_ee06_return_output;
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
