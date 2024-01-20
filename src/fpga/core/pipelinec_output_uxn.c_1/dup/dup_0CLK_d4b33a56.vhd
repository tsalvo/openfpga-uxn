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
-- Submodules: 31
entity dup_0CLK_d4b33a56 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup_0CLK_d4b33a56;
architecture arch of dup_0CLK_d4b33a56 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2755_c6_e41b]
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2755_c2_690d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2755_c2_690d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2755_c2_690d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2755_c2_690d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2755_c2_690d]
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2755_c2_690d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2755_c2_690d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c2_690d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c2_690d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2755_c2_690d]
signal t8_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_4a2d]
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2768_c7_d90e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2768_c7_d90e]
signal result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2768_c7_d90e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2768_c7_d90e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2768_c7_d90e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2768_c7_d90e]
signal t8_MUX_uxn_opcodes_h_l2768_c7_d90e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2769_c30_f09d]
signal sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_b538]
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2771_c7_e3ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2771_c7_e3ea]
signal result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2771_c7_e3ea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2771_c7_e3ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2771_c7_e3ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2771_c7_e3ea]
signal t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2777_c11_077f]
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2777_c7_2c58]
signal result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2777_c7_2c58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2777_c7_2c58]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output : unsigned(3 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b
BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_left,
BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_right,
BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d
result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d
result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d
result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d
result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_return_output);

-- t8_MUX_uxn_opcodes_h_l2755_c2_690d
t8_MUX_uxn_opcodes_h_l2755_c2_690d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2755_c2_690d_cond,
t8_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue,
t8_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse,
t8_MUX_uxn_opcodes_h_l2755_c2_690d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_left,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_right,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e
result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e
result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e
result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output);

-- t8_MUX_uxn_opcodes_h_l2768_c7_d90e
t8_MUX_uxn_opcodes_h_l2768_c7_d90e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2768_c7_d90e_cond,
t8_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue,
t8_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse,
t8_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d
sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_ins,
sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_x,
sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_y,
sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_left,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_right,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea
result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond,
result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea
result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output);

-- t8_MUX_uxn_opcodes_h_l2771_c7_e3ea
t8_MUX_uxn_opcodes_h_l2771_c7_e3ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond,
t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue,
t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse,
t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_left,
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_right,
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58
result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_cond,
result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58
result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
 t8_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output,
 t8_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output,
 sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output,
 t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2760_c3_cdbb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2765_c3_4bc7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2755_c2_690d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2755_c2_690d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2768_c7_d90e_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2773_c3_48db : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_c7_e3ea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2778_c3_e8bc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2777_l2768_l2755_DUPLICATE_0795_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2768_l2771_DUPLICATE_3812_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2777_l2768_l2771_DUPLICATE_74fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2777_l2768_l2771_DUPLICATE_0724_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2751_l2783_DUPLICATE_bbf1_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2773_c3_48db := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2773_c3_48db;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2760_c3_cdbb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2760_c3_cdbb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2765_c3_4bc7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2765_c3_4bc7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2778_c3_e8bc := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2778_c3_e8bc;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_b538] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_left;
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_return_output := BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_4a2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2769_c30_f09d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_ins;
     sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_x;
     sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_return_output := sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2755_c2_690d] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2755_c2_690d_return_output := result.is_pc_updated;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l2771_c7_e3ea] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_c7_e3ea_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2777_l2768_l2755_DUPLICATE_0795 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2777_l2768_l2755_DUPLICATE_0795_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2755_c2_690d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2755_c2_690d_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2768_l2771_DUPLICATE_3812 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2768_l2771_DUPLICATE_3812_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2777_l2768_l2771_DUPLICATE_74fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2777_l2768_l2771_DUPLICATE_74fb_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2755_c2_690d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2755_c2_690d_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2755_c2_690d] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2755_c2_690d_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2755_c6_e41b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2777_c11_077f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2777_l2768_l2771_DUPLICATE_0724 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2777_l2768_l2771_DUPLICATE_0724_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2755_c2_690d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c6_e41b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2768_c7_d90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_4a2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_b538_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_077f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2777_l2768_l2771_DUPLICATE_74fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2777_l2768_l2771_DUPLICATE_74fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2777_l2768_l2771_DUPLICATE_74fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2768_l2771_DUPLICATE_3812_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2768_l2771_DUPLICATE_3812_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2777_l2768_l2771_DUPLICATE_0724_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2777_l2768_l2771_DUPLICATE_0724_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2777_l2768_l2771_DUPLICATE_0724_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2777_l2768_l2755_DUPLICATE_0795_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2777_l2768_l2755_DUPLICATE_0795_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2777_l2768_l2755_DUPLICATE_0795_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2755_c2_690d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2755_c2_690d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2755_c2_690d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2755_c2_690d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2771_c7_e3ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2769_c30_f09d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2777_c7_2c58] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output := result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output;

     -- t8_MUX[uxn_opcodes_h_l2771_c7_e3ea] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond <= VAR_t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond;
     t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue;
     t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output := t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2755_c2_690d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2777_c7_2c58] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2755_c2_690d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2771_c7_e3ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2755_c2_690d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2771_c7_e3ea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2755_c2_690d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2777_c7_2c58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2777_c7_2c58_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2768_c7_d90e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2771_c7_e3ea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output := result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2771_c7_e3ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output;

     -- t8_MUX[uxn_opcodes_h_l2768_c7_d90e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2768_c7_d90e_cond <= VAR_t8_MUX_uxn_opcodes_h_l2768_c7_d90e_cond;
     t8_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue;
     t8_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output := t8_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2768_c7_d90e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2771_c7_e3ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2771_c7_e3ea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2768_c7_d90e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2755_c2_690d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output;

     -- t8_MUX[uxn_opcodes_h_l2755_c2_690d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2755_c2_690d_cond <= VAR_t8_MUX_uxn_opcodes_h_l2755_c2_690d_cond;
     t8_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue;
     t8_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2755_c2_690d_return_output := t8_MUX_uxn_opcodes_h_l2755_c2_690d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2755_c2_690d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2768_c7_d90e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2768_c7_d90e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2768_c7_d90e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2755_c2_690d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c2_690d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c2_690d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2755_c2_690d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2751_l2783_DUPLICATE_bbf1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2751_l2783_DUPLICATE_bbf1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c2_690d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c2_690d_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2751_l2783_DUPLICATE_bbf1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2751_l2783_DUPLICATE_bbf1_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
