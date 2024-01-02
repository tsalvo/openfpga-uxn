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
-- Submodules: 28
entity inc_0CLK_121b1df5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc_0CLK_121b1df5;
architecture arch of inc_0CLK_121b1df5 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1323_c6_5cfe]
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1323_c2_8653]
signal t8_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1323_c2_8653]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1323_c2_8653]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c2_8653]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c2_8653]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c2_8653]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1323_c2_8653]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1323_c2_8653]
signal result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1323_c2_8653]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1323_c2_8653]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1336_c11_90f3]
signal BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1336_c7_bf1d]
signal t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1336_c7_bf1d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1336_c7_bf1d]
signal result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1336_c7_bf1d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1336_c7_bf1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1336_c7_bf1d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1339_c11_351b]
signal BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1339_c7_fd74]
signal t8_MUX_uxn_opcodes_h_l1339_c7_fd74_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1339_c7_fd74]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1339_c7_fd74]
signal result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1339_c7_fd74]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1339_c7_fd74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1339_c7_fd74]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1341_c30_a14d]
signal sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1344_c21_5cbb]
signal BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee25( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe
BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_left,
BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_right,
BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output);

-- t8_MUX_uxn_opcodes_h_l1323_c2_8653
t8_MUX_uxn_opcodes_h_l1323_c2_8653 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1323_c2_8653_cond,
t8_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue,
t8_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse,
t8_MUX_uxn_opcodes_h_l1323_c2_8653_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653
result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653
result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_cond,
result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653
result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653
result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3
BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_left,
BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_right,
BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_return_output);

-- t8_MUX_uxn_opcodes_h_l1336_c7_bf1d
t8_MUX_uxn_opcodes_h_l1336_c7_bf1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond,
t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue,
t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse,
t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d
result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d
result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d
result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b
BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_left,
BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_right,
BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_return_output);

-- t8_MUX_uxn_opcodes_h_l1339_c7_fd74
t8_MUX_uxn_opcodes_h_l1339_c7_fd74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1339_c7_fd74_cond,
t8_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue,
t8_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse,
t8_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74
result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74
result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_cond,
result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74
result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74
result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d
sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_ins,
sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_x,
sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_y,
sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb
BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_left,
BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_right,
BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output,
 t8_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_return_output,
 t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_return_output,
 t8_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output,
 sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1328_c3_cbea : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1333_c3_1570 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1337_c3_f22b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1339_c7_fd74_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1344_c3_92e3 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1343_c3_1a4f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1339_c7_fd74_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1339_l1323_l1336_DUPLICATE_427b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1339_l1336_DUPLICATE_6cbc_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1339_l1336_DUPLICATE_3ec8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1339_l1336_DUPLICATE_9bf3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1319_l1348_DUPLICATE_093d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1328_c3_cbea := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1328_c3_cbea;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1343_c3_1a4f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1343_c3_1a4f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1337_c3_f22b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1337_c3_f22b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1333_c3_1570 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1333_c3_1570;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_left := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1339_c11_351b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1323_c6_5cfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1323_c2_8653] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1323_c2_8653_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1323_c2_8653] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1323_c2_8653_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1339_l1336_DUPLICATE_9bf3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1339_l1336_DUPLICATE_9bf3_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1323_c2_8653] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1323_c2_8653_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l1341_c30_a14d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_ins;
     sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_x;
     sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_return_output := sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1323_c2_8653] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1323_c2_8653_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1336_c11_90f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1339_l1323_l1336_DUPLICATE_427b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1339_l1323_l1336_DUPLICATE_427b_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1344_c21_5cbb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1339_l1336_DUPLICATE_3ec8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1339_l1336_DUPLICATE_3ec8_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1339_l1336_DUPLICATE_6cbc LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1339_l1336_DUPLICATE_6cbc_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1339_c7_fd74] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1339_c7_fd74_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1323_c2_8653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_5cfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_90f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1339_c7_fd74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_351b_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l1344_c3_92e3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_5cbb_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1339_l1336_DUPLICATE_6cbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1339_l1336_DUPLICATE_6cbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1339_l1336_DUPLICATE_9bf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1339_l1336_DUPLICATE_9bf3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1339_l1336_DUPLICATE_3ec8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1339_l1336_DUPLICATE_3ec8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1339_l1323_l1336_DUPLICATE_427b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1339_l1323_l1336_DUPLICATE_427b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1339_l1323_l1336_DUPLICATE_427b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1323_c2_8653_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1323_c2_8653_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1323_c2_8653_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1323_c2_8653_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1339_c7_fd74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_a14d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1344_c3_92e3;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1323_c2_8653] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1339_c7_fd74] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1323_c2_8653] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1339_c7_fd74] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1339_c7_fd74] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output := result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1339_c7_fd74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1323_c2_8653] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1339_c7_fd74] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1323_c2_8653] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_return_output;

     -- t8_MUX[uxn_opcodes_h_l1339_c7_fd74] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1339_c7_fd74_cond <= VAR_t8_MUX_uxn_opcodes_h_l1339_c7_fd74_cond;
     t8_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1339_c7_fd74_iftrue;
     t8_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1339_c7_fd74_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output := t8_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1339_c7_fd74_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1336_c7_bf1d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1336_c7_bf1d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1336_c7_bf1d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1336_c7_bf1d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond;
     t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue;
     t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output := t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1336_c7_bf1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1336_c7_bf1d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1336_c7_bf1d_return_output;
     -- t8_MUX[uxn_opcodes_h_l1323_c2_8653] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1323_c2_8653_cond <= VAR_t8_MUX_uxn_opcodes_h_l1323_c2_8653_cond;
     t8_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue;
     t8_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1323_c2_8653_return_output := t8_MUX_uxn_opcodes_h_l1323_c2_8653_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c2_8653] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c2_8653] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1323_c2_8653] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1323_c2_8653] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_return_output := result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c2_8653] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_return_output;

     -- Submodule level 4
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1323_c2_8653_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1319_l1348_DUPLICATE_093d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1319_l1348_DUPLICATE_093d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_8653_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_8653_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1319_l1348_DUPLICATE_093d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1319_l1348_DUPLICATE_093d_return_output;
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
