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
entity inc_0CLK_348f0530 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc_0CLK_348f0530;
architecture arch of inc_0CLK_348f0530 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1296_c6_50ea]
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1296_c2_0d13]
signal result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c2_0d13]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c2_0d13]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c2_0d13]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c2_0d13]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1296_c2_0d13]
signal t8_MUX_uxn_opcodes_h_l1296_c2_0d13_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_4945]
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1303_c7_88fe]
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_88fe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_88fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_88fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_88fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1303_c7_88fe]
signal t8_MUX_uxn_opcodes_h_l1303_c7_88fe_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1306_c11_f467]
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1306_c7_b660]
signal result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1306_c7_b660]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1306_c7_b660]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1306_c7_b660]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1306_c7_b660]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1306_c7_b660]
signal t8_MUX_uxn_opcodes_h_l1306_c7_b660_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1306_c7_b660_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1309_c30_6b6e]
signal sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1312_c21_dc40]
signal BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1314_c11_7aeb]
signal BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1314_c7_6709]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1314_c7_6709]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1314_c7_6709]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_return_output : signed(3 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea
BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_left,
BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_right,
BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13
result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_cond,
result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output);

-- t8_MUX_uxn_opcodes_h_l1296_c2_0d13
t8_MUX_uxn_opcodes_h_l1296_c2_0d13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1296_c2_0d13_cond,
t8_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue,
t8_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse,
t8_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_left,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_right,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_cond,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output);

-- t8_MUX_uxn_opcodes_h_l1303_c7_88fe
t8_MUX_uxn_opcodes_h_l1303_c7_88fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1303_c7_88fe_cond,
t8_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue,
t8_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse,
t8_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_left,
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_right,
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660
result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_cond,
result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_return_output);

-- t8_MUX_uxn_opcodes_h_l1306_c7_b660
t8_MUX_uxn_opcodes_h_l1306_c7_b660 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1306_c7_b660_cond,
t8_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue,
t8_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse,
t8_MUX_uxn_opcodes_h_l1306_c7_b660_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e
sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_ins,
sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_x,
sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_y,
sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40
BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_left,
BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_right,
BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_left,
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_right,
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709
result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output,
 t8_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output,
 t8_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_return_output,
 t8_MUX_uxn_opcodes_h_l1306_c7_b660_return_output,
 sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_0f16 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1296_c2_0d13_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_cbc0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1306_c7_b660_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1303_c7_88fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1312_c3_3ad0 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_713c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1306_c7_b660_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1306_c7_b660_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1315_c3_bce8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1303_l1306_l1296_DUPLICATE_a78a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1303_l1296_l1314_DUPLICATE_4134_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1303_l1296_l1314_DUPLICATE_bb56_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1303_l1306_l1314_DUPLICATE_1eea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1292_l1320_DUPLICATE_36d8_return_output : opcode_result_t;
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1315_c3_bce8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1315_c3_bce8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_0f16 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_0f16;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_cbc0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_cbc0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_713c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_713c;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_left := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1303_l1296_l1314_DUPLICATE_bb56 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1303_l1296_l1314_DUPLICATE_bb56_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1303_l1306_l1296_DUPLICATE_a78a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1303_l1306_l1296_DUPLICATE_a78a_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1314_c11_7aeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1296_c6_50ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_4945] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_left;
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_return_output := BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1303_l1306_l1314_DUPLICATE_1eea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1303_l1306_l1314_DUPLICATE_1eea_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1306_c11_f467] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_left;
     BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_return_output := BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1312_c21_dc40] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1303_l1296_l1314_DUPLICATE_4134 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1303_l1296_l1314_DUPLICATE_4134_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1309_c30_6b6e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_ins;
     sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_x;
     sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_return_output := sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1306_c7_b660] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1306_c7_b660_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1296_c2_0d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c6_50ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1303_c7_88fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_4945_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1306_c7_b660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_f467_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_7aeb_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l1312_c3_3ad0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1312_c21_dc40_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1303_l1296_l1314_DUPLICATE_bb56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1303_l1296_l1314_DUPLICATE_bb56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1303_l1296_l1314_DUPLICATE_bb56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1303_l1306_l1314_DUPLICATE_1eea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1303_l1306_l1314_DUPLICATE_1eea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1303_l1306_l1314_DUPLICATE_1eea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1303_l1296_l1314_DUPLICATE_4134_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1303_l1296_l1314_DUPLICATE_4134_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1303_l1296_l1314_DUPLICATE_4134_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1303_l1306_l1296_DUPLICATE_a78a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1303_l1306_l1296_DUPLICATE_a78a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1303_l1306_l1296_DUPLICATE_a78a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1306_c7_b660_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1309_c30_6b6e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1312_c3_3ad0;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1314_c7_6709] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_return_output;

     -- t8_MUX[uxn_opcodes_h_l1306_c7_b660] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1306_c7_b660_cond <= VAR_t8_MUX_uxn_opcodes_h_l1306_c7_b660_cond;
     t8_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue;
     t8_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1306_c7_b660_return_output := t8_MUX_uxn_opcodes_h_l1306_c7_b660_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1314_c7_6709] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1306_c7_b660] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_return_output := result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1306_c7_b660] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1314_c7_6709] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_6709_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_6709_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1314_c7_6709_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_b660_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1306_c7_b660_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1306_c7_b660_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1306_c7_b660] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1303_c7_88fe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output := result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_88fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1306_c7_b660] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1306_c7_b660] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_return_output;

     -- t8_MUX[uxn_opcodes_h_l1303_c7_88fe] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1303_c7_88fe_cond <= VAR_t8_MUX_uxn_opcodes_h_l1303_c7_88fe_cond;
     t8_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue;
     t8_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output := t8_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_b660_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_b660_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_b660_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1296_c2_0d13] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output := result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_88fe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_88fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output;

     -- t8_MUX[uxn_opcodes_h_l1296_c2_0d13] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1296_c2_0d13_cond <= VAR_t8_MUX_uxn_opcodes_h_l1296_c2_0d13_cond;
     t8_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue;
     t8_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output := t8_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c2_0d13] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_88fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_88fe_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c2_0d13] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c2_0d13] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c2_0d13] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1292_l1320_DUPLICATE_36d8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1292_l1320_DUPLICATE_36d8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c2_0d13_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1292_l1320_DUPLICATE_36d8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1292_l1320_DUPLICATE_36d8_return_output;
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
