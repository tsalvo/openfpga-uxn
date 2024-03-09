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
-- BIN_OP_EQ[uxn_opcodes_h_l2548_c6_1916]
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2548_c2_fcca]
signal t8_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2548_c2_fcca]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2548_c2_fcca]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2548_c2_fcca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2548_c2_fcca]
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2548_c2_fcca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2548_c2_fcca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2548_c2_fcca]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2548_c2_fcca]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2548_c2_fcca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2548_c2_fcca]
signal n8_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_2e95]
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2561_c7_1348]
signal t8_MUX_uxn_opcodes_h_l2561_c7_1348_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2561_c7_1348_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2561_c7_1348]
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_1348]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2561_c7_1348]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_1348]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_1348]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2561_c7_1348]
signal n8_MUX_uxn_opcodes_h_l2561_c7_1348_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2561_c7_1348_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_08b9]
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2564_c7_dc4a]
signal t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2564_c7_dc4a]
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c7_dc4a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c7_dc4a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c7_dc4a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c7_dc4a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2564_c7_dc4a]
signal n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2566_c30_5142]
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_191f]
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c7_aac1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2571_c7_aac1]
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c7_aac1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c7_aac1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2571_c7_aac1]
signal n8_MUX_uxn_opcodes_h_l2571_c7_aac1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_left,
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_right,
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output);

-- t8_MUX_uxn_opcodes_h_l2548_c2_fcca
t8_MUX_uxn_opcodes_h_l2548_c2_fcca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2548_c2_fcca_cond,
t8_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue,
t8_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse,
t8_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_cond,
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output);

-- n8_MUX_uxn_opcodes_h_l2548_c2_fcca
n8_MUX_uxn_opcodes_h_l2548_c2_fcca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2548_c2_fcca_cond,
n8_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue,
n8_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse,
n8_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_left,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_right,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_return_output);

-- t8_MUX_uxn_opcodes_h_l2561_c7_1348
t8_MUX_uxn_opcodes_h_l2561_c7_1348 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2561_c7_1348_cond,
t8_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue,
t8_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse,
t8_MUX_uxn_opcodes_h_l2561_c7_1348_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_cond,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_return_output);

-- n8_MUX_uxn_opcodes_h_l2561_c7_1348
n8_MUX_uxn_opcodes_h_l2561_c7_1348 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2561_c7_1348_cond,
n8_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue,
n8_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse,
n8_MUX_uxn_opcodes_h_l2561_c7_1348_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_left,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_right,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_return_output);

-- t8_MUX_uxn_opcodes_h_l2564_c7_dc4a
t8_MUX_uxn_opcodes_h_l2564_c7_dc4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond,
t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue,
t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse,
t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output);

-- n8_MUX_uxn_opcodes_h_l2564_c7_dc4a
n8_MUX_uxn_opcodes_h_l2564_c7_dc4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond,
n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue,
n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse,
n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2566_c30_5142
sp_relative_shift_uxn_opcodes_h_l2566_c30_5142 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_ins,
sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_x,
sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_y,
sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_left,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_right,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output);

-- n8_MUX_uxn_opcodes_h_l2571_c7_aac1
n8_MUX_uxn_opcodes_h_l2571_c7_aac1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2571_c7_aac1_cond,
n8_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue,
n8_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse,
n8_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output,
 t8_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
 n8_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_return_output,
 t8_MUX_uxn_opcodes_h_l2561_c7_1348_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_return_output,
 n8_MUX_uxn_opcodes_h_l2561_c7_1348_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_return_output,
 t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output,
 n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output,
 n8_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_1348_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_7d1c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2553_c3_b301 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_1348_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_fcca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_1348_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_c0f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_1348_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_0b49 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_abca : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2571_c7_aac1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2573_c3_acef : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_aac1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_d668_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_eb5a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2564_l2561_DUPLICATE_f59d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_b9a7_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2579_l2544_DUPLICATE_e176_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_c0f4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_c0f4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_7d1c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_7d1c;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2573_c3_acef := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2573_c3_acef;
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_abca := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_abca;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2553_c3_b301 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2553_c3_b301;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_0b49 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_0b49;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_2e95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_left;
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_return_output := BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2548_c6_1916] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_left;
     BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output := BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2564_l2561_DUPLICATE_f59d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2564_l2561_DUPLICATE_f59d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_191f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_d668 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_d668_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_08b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_eb5a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_eb5a_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2548_c2_fcca] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2548_c2_fcca_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l2566_c30_5142] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_ins;
     sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_x;
     sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_return_output := sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2548_c2_fcca] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2548_c2_fcca_return_output := result.is_ram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2571_c7_aac1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2571_c7_aac1_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2548_c2_fcca] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2548_c2_fcca_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2548_c2_fcca] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2548_c2_fcca_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_b9a7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_b9a7_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_1916_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_1348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_1348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_2e95_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_08b9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_aac1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_191f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_b9a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_b9a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_eb5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_eb5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_eb5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2564_l2561_DUPLICATE_f59d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2564_l2561_DUPLICATE_f59d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_d668_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_d668_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_d668_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2548_c2_fcca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2548_c2_fcca_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2548_c2_fcca_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2548_c2_fcca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2571_c7_aac1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_5142_return_output;
     -- t8_MUX[uxn_opcodes_h_l2564_c7_dc4a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond;
     t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue;
     t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output := t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2548_c2_fcca] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output;

     -- n8_MUX[uxn_opcodes_h_l2571_c7_aac1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2571_c7_aac1_cond <= VAR_n8_MUX_uxn_opcodes_h_l2571_c7_aac1_cond;
     n8_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue;
     n8_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output := n8_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c7_dc4a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2571_c7_aac1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2548_c2_fcca] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c7_aac1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c7_aac1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2548_c2_fcca] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c7_aac1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2548_c2_fcca] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_aac1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output;
     -- t8_MUX[uxn_opcodes_h_l2561_c7_1348] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2561_c7_1348_cond <= VAR_t8_MUX_uxn_opcodes_h_l2561_c7_1348_cond;
     t8_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue;
     t8_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_1348_return_output := t8_MUX_uxn_opcodes_h_l2561_c7_1348_return_output;

     -- n8_MUX[uxn_opcodes_h_l2564_c7_dc4a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond;
     n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue;
     n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output := n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2564_c7_dc4a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2561_c7_1348] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c7_dc4a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c7_dc4a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c7_dc4a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_1348_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_dc4a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2561_c7_1348_return_output;
     -- n8_MUX[uxn_opcodes_h_l2561_c7_1348] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2561_c7_1348_cond <= VAR_n8_MUX_uxn_opcodes_h_l2561_c7_1348_cond;
     n8_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue;
     n8_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_1348_return_output := n8_MUX_uxn_opcodes_h_l2561_c7_1348_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_1348] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2548_c2_fcca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_1348] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2561_c7_1348] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_return_output := result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_1348] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_return_output;

     -- t8_MUX[uxn_opcodes_h_l2548_c2_fcca] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2548_c2_fcca_cond <= VAR_t8_MUX_uxn_opcodes_h_l2548_c2_fcca_cond;
     t8_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue;
     t8_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output := t8_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2561_c7_1348_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_1348_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_1348_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_1348_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_1348_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2548_c2_fcca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2548_c2_fcca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output;

     -- n8_MUX[uxn_opcodes_h_l2548_c2_fcca] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2548_c2_fcca_cond <= VAR_n8_MUX_uxn_opcodes_h_l2548_c2_fcca_cond;
     n8_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue;
     n8_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output := n8_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2548_c2_fcca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output := result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2548_c2_fcca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2579_l2544_DUPLICATE_e176 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2579_l2544_DUPLICATE_e176_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_fcca_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2579_l2544_DUPLICATE_e176_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2579_l2544_DUPLICATE_e176_return_output;
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
