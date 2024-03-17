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
-- BIN_OP_EQ[uxn_opcodes_h_l2548_c6_c5ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2548_c2_2780]
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2548_c2_2780]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2548_c2_2780]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2548_c2_2780]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2548_c2_2780]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2548_c2_2780]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2548_c2_2780]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2548_c2_2780]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2548_c2_2780]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2548_c2_2780]
signal t8_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2548_c2_2780]
signal n8_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_b27b]
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2561_c7_a197]
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2561_c7_a197]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_a197]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_a197]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_a197]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2561_c7_a197]
signal t8_MUX_uxn_opcodes_h_l2561_c7_a197_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2561_c7_a197_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2561_c7_a197]
signal n8_MUX_uxn_opcodes_h_l2561_c7_a197_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2561_c7_a197_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_7bb6]
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2564_c7_6c5c]
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c7_6c5c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c7_6c5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c7_6c5c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c7_6c5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2564_c7_6c5c]
signal t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2564_c7_6c5c]
signal n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2566_c30_a72c]
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_f580]
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2571_c7_5b69]
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c7_5b69]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c7_5b69]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c7_5b69]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2571_c7_5b69]
signal n8_MUX_uxn_opcodes_h_l2571_c7_5b69_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_243c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_cond,
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_return_output);

-- t8_MUX_uxn_opcodes_h_l2548_c2_2780
t8_MUX_uxn_opcodes_h_l2548_c2_2780 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2548_c2_2780_cond,
t8_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue,
t8_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse,
t8_MUX_uxn_opcodes_h_l2548_c2_2780_return_output);

-- n8_MUX_uxn_opcodes_h_l2548_c2_2780
n8_MUX_uxn_opcodes_h_l2548_c2_2780 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2548_c2_2780_cond,
n8_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue,
n8_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse,
n8_MUX_uxn_opcodes_h_l2548_c2_2780_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_left,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_right,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_cond,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_return_output);

-- t8_MUX_uxn_opcodes_h_l2561_c7_a197
t8_MUX_uxn_opcodes_h_l2561_c7_a197 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2561_c7_a197_cond,
t8_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue,
t8_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse,
t8_MUX_uxn_opcodes_h_l2561_c7_a197_return_output);

-- n8_MUX_uxn_opcodes_h_l2561_c7_a197
n8_MUX_uxn_opcodes_h_l2561_c7_a197 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2561_c7_a197_cond,
n8_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue,
n8_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse,
n8_MUX_uxn_opcodes_h_l2561_c7_a197_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_left,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_right,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output);

-- t8_MUX_uxn_opcodes_h_l2564_c7_6c5c
t8_MUX_uxn_opcodes_h_l2564_c7_6c5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond,
t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue,
t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse,
t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output);

-- n8_MUX_uxn_opcodes_h_l2564_c7_6c5c
n8_MUX_uxn_opcodes_h_l2564_c7_6c5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond,
n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue,
n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse,
n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c
sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_ins,
sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_x,
sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_y,
sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_left,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_right,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_cond,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output);

-- n8_MUX_uxn_opcodes_h_l2571_c7_5b69
n8_MUX_uxn_opcodes_h_l2571_c7_5b69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2571_c7_5b69_cond,
n8_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue,
n8_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse,
n8_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
 t8_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
 n8_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_return_output,
 t8_MUX_uxn_opcodes_h_l2561_c7_a197_return_output,
 n8_MUX_uxn_opcodes_h_l2561_c7_a197_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output,
 t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output,
 n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output,
 sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output,
 n8_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_731f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2553_c3_4fcf : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_a197_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_a197_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_2780_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_2780_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_017b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_a197_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_a197_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_217a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2573_c3_2570 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_9f12 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2571_c7_5b69_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_5b69_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_b78e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2564_l2561_DUPLICATE_8e7f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_c81b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_c54a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2579_l2544_DUPLICATE_4b49_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_217a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_217a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_9f12 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_9f12;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_017b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_017b;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2573_c3_2570 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2573_c3_2570;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_731f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_731f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2553_c3_4fcf := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2553_c3_4fcf;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse := t8;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2548_c2_2780] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2548_c2_2780_return_output := result.is_ram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2571_c7_5b69] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2571_c7_5b69_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_b78e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_b78e_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_7bb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2548_c2_2780] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2548_c2_2780_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2548_c2_2780] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2548_c2_2780_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_c81b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_c81b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2564_l2561_DUPLICATE_8e7f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2564_l2561_DUPLICATE_8e7f_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2548_c2_2780] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2548_c2_2780_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2548_c6_c5ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_c54a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_c54a_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l2566_c30_a72c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_ins;
     sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_x;
     sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_return_output := sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_f580] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_left;
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_return_output := BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_b27b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_2780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_2780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_c5ac_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_a197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_a197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_b27b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_7bb6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_5b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f580_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_c81b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_c81b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_c54a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_c54a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_c54a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2564_l2561_DUPLICATE_8e7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2564_l2561_DUPLICATE_8e7f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_b78e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_b78e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_b78e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2548_c2_2780_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2548_c2_2780_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2548_c2_2780_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2548_c2_2780_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2571_c7_5b69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_a72c_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l2548_c2_2780] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2548_c2_2780] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c7_5b69] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output;

     -- t8_MUX[uxn_opcodes_h_l2564_c7_6c5c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond <= VAR_t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond;
     t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue;
     t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output := t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c7_6c5c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c7_5b69] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c7_5b69] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2571_c7_5b69] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output := result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2548_c2_2780] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2548_c2_2780] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_return_output;

     -- n8_MUX[uxn_opcodes_h_l2571_c7_5b69] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2571_c7_5b69_cond <= VAR_n8_MUX_uxn_opcodes_h_l2571_c7_5b69_cond;
     n8_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2571_c7_5b69_iftrue;
     n8_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2571_c7_5b69_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output := n8_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_5b69_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c7_6c5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2564_c7_6c5c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2564_c7_6c5c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond;
     n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue;
     n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output := n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c7_6c5c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2561_c7_a197] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c7_6c5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output;

     -- t8_MUX[uxn_opcodes_h_l2561_c7_a197] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2561_c7_a197_cond <= VAR_t8_MUX_uxn_opcodes_h_l2561_c7_a197_cond;
     t8_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue;
     t8_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_a197_return_output := t8_MUX_uxn_opcodes_h_l2561_c7_a197_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_a197_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_6c5c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2561_c7_a197_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2548_c2_2780] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_a197] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_a197] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2561_c7_a197] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_return_output := result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_return_output;

     -- t8_MUX[uxn_opcodes_h_l2548_c2_2780] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2548_c2_2780_cond <= VAR_t8_MUX_uxn_opcodes_h_l2548_c2_2780_cond;
     t8_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue;
     t8_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_2780_return_output := t8_MUX_uxn_opcodes_h_l2548_c2_2780_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_a197] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_return_output;

     -- n8_MUX[uxn_opcodes_h_l2561_c7_a197] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2561_c7_a197_cond <= VAR_n8_MUX_uxn_opcodes_h_l2561_c7_a197_cond;
     n8_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2561_c7_a197_iftrue;
     n8_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2561_c7_a197_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_a197_return_output := n8_MUX_uxn_opcodes_h_l2561_c7_a197_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2561_c7_a197_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_a197_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_a197_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_a197_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_a197_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2548_c2_2780_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2548_c2_2780] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2548_c2_2780] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2548_c2_2780] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_return_output;

     -- n8_MUX[uxn_opcodes_h_l2548_c2_2780] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2548_c2_2780_cond <= VAR_n8_MUX_uxn_opcodes_h_l2548_c2_2780_cond;
     n8_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue;
     n8_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_2780_return_output := n8_MUX_uxn_opcodes_h_l2548_c2_2780_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2548_c2_2780] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_return_output := result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2548_c2_2780_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2579_l2544_DUPLICATE_4b49 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2579_l2544_DUPLICATE_4b49_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_2780_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_2780_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2579_l2544_DUPLICATE_4b49_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2579_l2544_DUPLICATE_4b49_return_output;
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
