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
-- BIN_OP_EQ[uxn_opcodes_h_l2547_c6_6162]
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2547_c2_6629]
signal t8_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2547_c2_6629]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2547_c2_6629]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2547_c2_6629]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2547_c2_6629]
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2547_c2_6629]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2547_c2_6629]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2547_c2_6629]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2547_c2_6629]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2547_c2_6629]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2547_c2_6629]
signal n8_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_bfcb]
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2560_c7_b094]
signal t8_MUX_uxn_opcodes_h_l2560_c7_b094_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2560_c7_b094_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2560_c7_b094]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2560_c7_b094]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2560_c7_b094]
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2560_c7_b094]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2560_c7_b094]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2560_c7_b094]
signal n8_MUX_uxn_opcodes_h_l2560_c7_b094_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2560_c7_b094_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2563_c11_3e9a]
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2563_c7_734d]
signal t8_MUX_uxn_opcodes_h_l2563_c7_734d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2563_c7_734d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2563_c7_734d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2563_c7_734d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2563_c7_734d]
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2563_c7_734d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2563_c7_734d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2563_c7_734d]
signal n8_MUX_uxn_opcodes_h_l2563_c7_734d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2563_c7_734d_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2565_c30_82d3]
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2570_c11_b652]
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2570_c7_a918]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2570_c7_a918]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2570_c7_a918]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2570_c7_a918]
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2570_c7_a918]
signal n8_MUX_uxn_opcodes_h_l2570_c7_a918_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2570_c7_a918_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_71f0( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_left,
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_right,
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output);

-- t8_MUX_uxn_opcodes_h_l2547_c2_6629
t8_MUX_uxn_opcodes_h_l2547_c2_6629 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2547_c2_6629_cond,
t8_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue,
t8_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse,
t8_MUX_uxn_opcodes_h_l2547_c2_6629_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_cond,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_return_output);

-- n8_MUX_uxn_opcodes_h_l2547_c2_6629
n8_MUX_uxn_opcodes_h_l2547_c2_6629 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2547_c2_6629_cond,
n8_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue,
n8_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse,
n8_MUX_uxn_opcodes_h_l2547_c2_6629_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_left,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_right,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_return_output);

-- t8_MUX_uxn_opcodes_h_l2560_c7_b094
t8_MUX_uxn_opcodes_h_l2560_c7_b094 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2560_c7_b094_cond,
t8_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue,
t8_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse,
t8_MUX_uxn_opcodes_h_l2560_c7_b094_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_cond,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_return_output);

-- n8_MUX_uxn_opcodes_h_l2560_c7_b094
n8_MUX_uxn_opcodes_h_l2560_c7_b094 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2560_c7_b094_cond,
n8_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue,
n8_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse,
n8_MUX_uxn_opcodes_h_l2560_c7_b094_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_left,
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_right,
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_return_output);

-- t8_MUX_uxn_opcodes_h_l2563_c7_734d
t8_MUX_uxn_opcodes_h_l2563_c7_734d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2563_c7_734d_cond,
t8_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue,
t8_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse,
t8_MUX_uxn_opcodes_h_l2563_c7_734d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_return_output);

-- n8_MUX_uxn_opcodes_h_l2563_c7_734d
n8_MUX_uxn_opcodes_h_l2563_c7_734d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2563_c7_734d_cond,
n8_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue,
n8_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse,
n8_MUX_uxn_opcodes_h_l2563_c7_734d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3
sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_ins,
sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_x,
sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_y,
sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_left,
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_right,
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_cond,
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_return_output);

-- n8_MUX_uxn_opcodes_h_l2570_c7_a918
n8_MUX_uxn_opcodes_h_l2570_c7_a918 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2570_c7_a918_cond,
n8_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue,
n8_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse,
n8_MUX_uxn_opcodes_h_l2570_c7_a918_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output,
 t8_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
 n8_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_return_output,
 t8_MUX_uxn_opcodes_h_l2560_c7_b094_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_return_output,
 n8_MUX_uxn_opcodes_h_l2560_c7_b094_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_return_output,
 t8_MUX_uxn_opcodes_h_l2563_c7_734d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_return_output,
 n8_MUX_uxn_opcodes_h_l2563_c7_734d_return_output,
 sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_return_output,
 n8_MUX_uxn_opcodes_h_l2570_c7_a918_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_b094_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2552_c3_ea08 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_2562 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_b094_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_6629_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_6629_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_734d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_b094_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2561_c3_42bf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_734d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_b094_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_734d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_695b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a918_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_734d_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_42c3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2570_c7_a918_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2572_c3_0228 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a918_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2560_l2547_l2570_DUPLICATE_f472_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2560_l2563_DUPLICATE_ac63_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2560_l2570_DUPLICATE_00a6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2560_l2563_l2570_DUPLICATE_cfb4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2578_l2543_DUPLICATE_2001_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2561_c3_42bf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2561_c3_42bf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2572_c3_0228 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2572_c3_0228;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_695b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_695b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_2562 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_2562;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2552_c3_ea08 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2552_c3_ea08;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_42c3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_42c3;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2560_l2570_DUPLICATE_00a6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2560_l2570_DUPLICATE_00a6_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2547_c6_6162] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_left;
     BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output := BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2570_c11_b652] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_left;
     BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_return_output := BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2547_c2_6629] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2547_c2_6629_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2547_c2_6629] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2547_c2_6629_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2560_l2563_DUPLICATE_ac63 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2560_l2563_DUPLICATE_ac63_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_bfcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2560_l2547_l2570_DUPLICATE_f472 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2560_l2547_l2570_DUPLICATE_f472_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2547_c2_6629] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2547_c2_6629_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l2565_c30_82d3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_ins;
     sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_x;
     sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_return_output := sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2563_c11_3e9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2570_c7_a918] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2570_c7_a918_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2547_c2_6629] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2547_c2_6629_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2560_l2563_l2570_DUPLICATE_cfb4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2560_l2563_l2570_DUPLICATE_cfb4_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_6162_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_b094_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_b094_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_bfcb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_734d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_734d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_3e9a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_b652_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2560_l2570_DUPLICATE_00a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2560_l2570_DUPLICATE_00a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2560_l2563_l2570_DUPLICATE_cfb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2560_l2563_l2570_DUPLICATE_cfb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2560_l2563_l2570_DUPLICATE_cfb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2560_l2563_DUPLICATE_ac63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2560_l2563_DUPLICATE_ac63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2560_l2547_l2570_DUPLICATE_f472_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2560_l2547_l2570_DUPLICATE_f472_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2560_l2547_l2570_DUPLICATE_f472_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2547_c2_6629_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2547_c2_6629_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2547_c2_6629_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2547_c2_6629_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2570_c7_a918_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_82d3_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2547_c2_6629] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output;

     -- t8_MUX[uxn_opcodes_h_l2563_c7_734d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2563_c7_734d_cond <= VAR_t8_MUX_uxn_opcodes_h_l2563_c7_734d_cond;
     t8_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue;
     t8_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_734d_return_output := t8_MUX_uxn_opcodes_h_l2563_c7_734d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2570_c7_a918] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_return_output := result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2570_c7_a918] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2547_c2_6629] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2563_c7_734d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2547_c2_6629] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2547_c2_6629] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2570_c7_a918] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2570_c7_a918] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_return_output;

     -- n8_MUX[uxn_opcodes_h_l2570_c7_a918] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2570_c7_a918_cond <= VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a918_cond;
     n8_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a918_iftrue;
     n8_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a918_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a918_return_output := n8_MUX_uxn_opcodes_h_l2570_c7_a918_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a918_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a918_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_734d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a918_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a918_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a918_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2563_c7_734d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2563_c7_734d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2563_c7_734d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2563_c7_734d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2563_c7_734d_cond;
     n8_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue;
     n8_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_734d_return_output := n8_MUX_uxn_opcodes_h_l2563_c7_734d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2563_c7_734d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2563_c7_734d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2563_c7_734d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2560_c7_b094] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_return_output;

     -- t8_MUX[uxn_opcodes_h_l2560_c7_b094] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2560_c7_b094_cond <= VAR_t8_MUX_uxn_opcodes_h_l2560_c7_b094_cond;
     t8_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue;
     t8_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_b094_return_output := t8_MUX_uxn_opcodes_h_l2560_c7_b094_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2563_c7_734d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_734d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_b094_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_734d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_734d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_734d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2560_c7_b094_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2560_c7_b094] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2560_c7_b094] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2560_c7_b094] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_return_output := result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2547_c2_6629] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output;

     -- t8_MUX[uxn_opcodes_h_l2547_c2_6629] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2547_c2_6629_cond <= VAR_t8_MUX_uxn_opcodes_h_l2547_c2_6629_cond;
     t8_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue;
     t8_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_6629_return_output := t8_MUX_uxn_opcodes_h_l2547_c2_6629_return_output;

     -- n8_MUX[uxn_opcodes_h_l2560_c7_b094] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2560_c7_b094_cond <= VAR_n8_MUX_uxn_opcodes_h_l2560_c7_b094_cond;
     n8_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue;
     n8_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_b094_return_output := n8_MUX_uxn_opcodes_h_l2560_c7_b094_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2560_c7_b094] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2560_c7_b094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_b094_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_b094_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_b094_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_b094_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2547_c2_6629_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2547_c2_6629] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2547_c2_6629] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_return_output;

     -- n8_MUX[uxn_opcodes_h_l2547_c2_6629] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2547_c2_6629_cond <= VAR_n8_MUX_uxn_opcodes_h_l2547_c2_6629_cond;
     n8_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue;
     n8_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_6629_return_output := n8_MUX_uxn_opcodes_h_l2547_c2_6629_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2547_c2_6629] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_return_output := result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2547_c2_6629] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2547_c2_6629_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2578_l2543_DUPLICATE_2001 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2578_l2543_DUPLICATE_2001_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_6629_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_6629_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2578_l2543_DUPLICATE_2001_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2578_l2543_DUPLICATE_2001_return_output;
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
