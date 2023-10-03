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
-- Submodules: 13
entity main_ram_update_0CLK_b912fe6f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 address0 : in unsigned(15 downto 0);
 write0_value : in unsigned(7 downto 0);
 write0_enable : in unsigned(0 downto 0);
 read0_enable : in unsigned(0 downto 0);
 address1 : in unsigned(15 downto 0);
 read1_enable : in unsigned(0 downto 0);
 return_output : out unsigned(15 downto 0));
end main_ram_update_0CLK_b912fe6f;
architecture arch of main_ram_update_0CLK_b912fe6f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal rdaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal rwaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal wdata : unsigned(7 downto 0) := to_unsigned(0, 8);
signal rdvalue0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal rdvalue1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_rdaddr : unsigned(31 downto 0);
signal REG_COMB_rwaddr : unsigned(31 downto 0);
signal REG_COMB_wdata : unsigned(7 downto 0);
signal REG_COMB_rdvalue0 : unsigned(7 downto 0);
signal REG_COMB_rdvalue1 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(15 downto 0);

-- Each function instance gets signals
-- BIN_OP_OR[uxn_ram_main_h_l35_c21_ee3d]
signal BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_return_output : unsigned(0 downto 0);

-- main_ram[uxn_ram_main_h_l37_c31_55db]
signal main_ram_uxn_ram_main_h_l37_c31_55db_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l37_c31_55db_addr0 : unsigned(31 downto 0);
signal main_ram_uxn_ram_main_h_l37_c31_55db_wr_data0 : unsigned(7 downto 0);
signal main_ram_uxn_ram_main_h_l37_c31_55db_wr_en0 : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l37_c31_55db_valid0 : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l37_c31_55db_rd_en0 : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l37_c31_55db_addr1 : unsigned(31 downto 0);
signal main_ram_uxn_ram_main_h_l37_c31_55db_valid1 : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l37_c31_55db_rd_en1 : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l37_c31_55db_return_output : main_ram_outputs_t;

-- BIN_OP_AND[uxn_ram_main_h_l48_c13_4c3e]
signal BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_return_output : unsigned(0 downto 0);

-- MUX[uxn_ram_main_h_l48_c13_76b5]
signal MUX_uxn_ram_main_h_l48_c13_76b5_cond : unsigned(0 downto 0);
signal MUX_uxn_ram_main_h_l48_c13_76b5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_ram_main_h_l48_c13_76b5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_ram_main_h_l48_c13_76b5_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_ram_main_h_l49_c13_3172]
signal BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_return_output : unsigned(0 downto 0);

-- MUX[uxn_ram_main_h_l49_c13_31bb]
signal MUX_uxn_ram_main_h_l49_c13_31bb_cond : unsigned(0 downto 0);
signal MUX_uxn_ram_main_h_l49_c13_31bb_iftrue : unsigned(7 downto 0);
signal MUX_uxn_ram_main_h_l49_c13_31bb_iffalse : unsigned(7 downto 0);
signal MUX_uxn_ram_main_h_l49_c13_31bb_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_ram_main_h_l52_c2_4f7b]
signal CONST_SL_8_uxn_ram_main_h_l52_c2_4f7b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_ram_main_h_l52_c2_4f7b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_ram_main_h_l53_c2_8166]
signal BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_return_output : unsigned(15 downto 0);

-- printf_uxn_ram_main_h_l55_c2_3b91[uxn_ram_main_h_l55_c2_3b91]
signal printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg0 : unsigned(31 downto 0);
signal printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg1 : unsigned(31 downto 0);
signal printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg2 : unsigned(31 downto 0);
signal printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg3 : unsigned(31 downto 0);
signal printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg4 : unsigned(31 downto 0);
signal printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg5 : unsigned(31 downto 0);
signal printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg6 : unsigned(31 downto 0);

function CAST_TO_uint32_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d
BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_left,
BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_right,
BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_return_output);

-- main_ram_uxn_ram_main_h_l37_c31_55db
main_ram_uxn_ram_main_h_l37_c31_55db : entity work.main_ram_0CLK_b45f1687 port map (
clk,
main_ram_uxn_ram_main_h_l37_c31_55db_CLOCK_ENABLE,
main_ram_uxn_ram_main_h_l37_c31_55db_addr0,
main_ram_uxn_ram_main_h_l37_c31_55db_wr_data0,
main_ram_uxn_ram_main_h_l37_c31_55db_wr_en0,
main_ram_uxn_ram_main_h_l37_c31_55db_valid0,
main_ram_uxn_ram_main_h_l37_c31_55db_rd_en0,
main_ram_uxn_ram_main_h_l37_c31_55db_addr1,
main_ram_uxn_ram_main_h_l37_c31_55db_valid1,
main_ram_uxn_ram_main_h_l37_c31_55db_rd_en1,
main_ram_uxn_ram_main_h_l37_c31_55db_return_output);

-- BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e
BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_left,
BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_right,
BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_return_output);

-- MUX_uxn_ram_main_h_l48_c13_76b5
MUX_uxn_ram_main_h_l48_c13_76b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_ram_main_h_l48_c13_76b5_cond,
MUX_uxn_ram_main_h_l48_c13_76b5_iftrue,
MUX_uxn_ram_main_h_l48_c13_76b5_iffalse,
MUX_uxn_ram_main_h_l48_c13_76b5_return_output);

-- BIN_OP_AND_uxn_ram_main_h_l49_c13_3172
BIN_OP_AND_uxn_ram_main_h_l49_c13_3172 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_left,
BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_right,
BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_return_output);

-- MUX_uxn_ram_main_h_l49_c13_31bb
MUX_uxn_ram_main_h_l49_c13_31bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_ram_main_h_l49_c13_31bb_cond,
MUX_uxn_ram_main_h_l49_c13_31bb_iftrue,
MUX_uxn_ram_main_h_l49_c13_31bb_iffalse,
MUX_uxn_ram_main_h_l49_c13_31bb_return_output);

-- CONST_SL_8_uxn_ram_main_h_l52_c2_4f7b
CONST_SL_8_uxn_ram_main_h_l52_c2_4f7b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_ram_main_h_l52_c2_4f7b_x,
CONST_SL_8_uxn_ram_main_h_l52_c2_4f7b_return_output);

-- BIN_OP_OR_uxn_ram_main_h_l53_c2_8166
BIN_OP_OR_uxn_ram_main_h_l53_c2_8166 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_left,
BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_right,
BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_return_output);

-- printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91
printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91 : entity work.printf_uxn_ram_main_h_l55_c2_3b91_0CLK_de264c78 port map (
printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_CLOCK_ENABLE,
printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg0,
printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg1,
printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg2,
printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg3,
printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg4,
printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg5,
printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg6);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 address0,
 write0_value,
 write0_enable,
 read0_enable,
 address1,
 read1_enable,
 -- Registers
 rdaddr,
 rwaddr,
 wdata,
 rdvalue0,
 rdvalue1,
 result,
 -- All submodule outputs
 BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_return_output,
 main_ram_uxn_ram_main_h_l37_c31_55db_return_output,
 BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_return_output,
 MUX_uxn_ram_main_h_l48_c13_76b5_return_output,
 BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_return_output,
 MUX_uxn_ram_main_h_l49_c13_31bb_return_output,
 CONST_SL_8_uxn_ram_main_h_l52_c2_4f7b_return_output,
 BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_address0 : unsigned(15 downto 0);
 variable VAR_write0_value : unsigned(7 downto 0);
 variable VAR_write0_enable : unsigned(0 downto 0);
 variable VAR_read0_enable : unsigned(0 downto 0);
 variable VAR_address1 : unsigned(15 downto 0);
 variable VAR_read1_enable : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_ram_main_h_l30_c11_0ad5_return_output : unsigned(31 downto 0);
 variable VAR_wdata_uxn_ram_main_h_l31_c2_17ba : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_ram_main_h_l32_c11_0145_return_output : unsigned(31 downto 0);
 variable VAR_rw_valid : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_return_output : unsigned(0 downto 0);
 variable VAR_rd_valid : unsigned(0 downto 0);
 variable VAR_ram_out : main_ram_outputs_t;
 variable VAR_main_ram_uxn_ram_main_h_l37_c31_55db_addr0 : unsigned(31 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l37_c31_55db_wr_data0 : unsigned(7 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l37_c31_55db_wr_en0 : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l37_c31_55db_valid0 : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l37_c31_55db_rd_en0 : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l37_c31_55db_addr1 : unsigned(31 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l37_c31_55db_valid1 : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l37_c31_55db_rd_en1 : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l37_c31_55db_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l37_c31_55db_return_output : main_ram_outputs_t;
 variable VAR_MUX_uxn_ram_main_h_l48_c13_76b5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_ram_main_h_l48_c13_76b5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_main_h_l48_c13_76b5_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_main_ram_outputs_t_valid0_d41d_uxn_ram_main_h_l48_c13_6164_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data0_d41d_uxn_ram_main_h_l48_c45_c107_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_main_h_l48_c13_76b5_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_main_h_l49_c13_31bb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_ram_main_h_l49_c13_31bb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_main_h_l49_c13_31bb_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_main_ram_outputs_t_valid1_d41d_uxn_ram_main_h_l49_c13_d86c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data1_d41d_uxn_ram_main_h_l49_c45_bf02_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_main_h_l49_c13_31bb_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_ram_main_h_l51_c11_2eff_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_ram_main_h_l52_c2_4f7b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_ram_main_h_l52_c2_4f7b_x : unsigned(15 downto 0);
 variable VAR_result_uxn_ram_main_h_l53_c2_f76c : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_left : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_ram_main_h_l53_c13_2a4a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg4 : unsigned(31 downto 0);
 variable VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg5 : unsigned(31 downto 0);
 variable VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg6 : unsigned(31 downto 0);
 -- State registers comb logic variables
variable REG_VAR_rdaddr : unsigned(31 downto 0);
variable REG_VAR_rwaddr : unsigned(31 downto 0);
variable REG_VAR_wdata : unsigned(7 downto 0);
variable REG_VAR_rdvalue0 : unsigned(7 downto 0);
variable REG_VAR_rdvalue1 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_rdaddr := rdaddr;
  REG_VAR_rwaddr := rwaddr;
  REG_VAR_wdata := wdata;
  REG_VAR_rdvalue0 := rdvalue0;
  REG_VAR_rdvalue1 := rdvalue1;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_ram_main_h_l48_c13_76b5_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_ram_main_h_l49_c13_31bb_iffalse := resize(to_unsigned(0, 1), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_address0 := address0;
     VAR_write0_value := write0_value;
     VAR_write0_enable := write0_enable;
     VAR_read0_enable := read0_enable;
     VAR_address1 := address1;
     VAR_read1_enable := read1_enable;

     -- Submodule level 0
     VAR_main_ram_uxn_ram_main_h_l37_c31_55db_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_right := VAR_read0_enable;
     VAR_BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_left := VAR_read0_enable;
     VAR_main_ram_uxn_ram_main_h_l37_c31_55db_rd_en0 := VAR_read0_enable;
     VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg4 := resize(VAR_read0_enable, 32);
     VAR_BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_right := VAR_read1_enable;
     VAR_main_ram_uxn_ram_main_h_l37_c31_55db_rd_en1 := VAR_read1_enable;
     VAR_main_ram_uxn_ram_main_h_l37_c31_55db_valid1 := VAR_read1_enable;
     VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg5 := resize(VAR_read1_enable, 32);
     VAR_BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_right := VAR_write0_enable;
     VAR_main_ram_uxn_ram_main_h_l37_c31_55db_wr_en0 := VAR_write0_enable;
     VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg1 := resize(VAR_write0_enable, 32);
     VAR_wdata_uxn_ram_main_h_l31_c2_17ba := VAR_write0_value;
     VAR_main_ram_uxn_ram_main_h_l37_c31_55db_wr_data0 := VAR_wdata_uxn_ram_main_h_l31_c2_17ba;
     VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg2 := resize(VAR_wdata_uxn_ram_main_h_l31_c2_17ba, 32);
     REG_VAR_wdata := VAR_wdata_uxn_ram_main_h_l31_c2_17ba;
     -- BIN_OP_OR[uxn_ram_main_h_l35_c21_ee3d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_left <= VAR_BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_left;
     BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_right <= VAR_BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_return_output := BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_return_output;

     -- CAST_TO_uint32_t[uxn_ram_main_h_l30_c11_0ad5] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_main_h_l30_c11_0ad5_return_output := CAST_TO_uint32_t_uint16_t(
     VAR_address0);

     -- CAST_TO_uint32_t[uxn_ram_main_h_l32_c11_0145] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_main_h_l32_c11_0145_return_output := CAST_TO_uint32_t_uint16_t(
     VAR_address1);

     -- Submodule level 1
     VAR_main_ram_uxn_ram_main_h_l37_c31_55db_valid0 := VAR_BIN_OP_OR_uxn_ram_main_h_l35_c21_ee3d_return_output;
     VAR_main_ram_uxn_ram_main_h_l37_c31_55db_addr0 := VAR_CAST_TO_uint32_t_uxn_ram_main_h_l30_c11_0ad5_return_output;
     VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg0 := VAR_CAST_TO_uint32_t_uxn_ram_main_h_l30_c11_0ad5_return_output;
     REG_VAR_rwaddr := VAR_CAST_TO_uint32_t_uxn_ram_main_h_l30_c11_0ad5_return_output;
     VAR_main_ram_uxn_ram_main_h_l37_c31_55db_addr1 := VAR_CAST_TO_uint32_t_uxn_ram_main_h_l32_c11_0145_return_output;
     VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg3 := VAR_CAST_TO_uint32_t_uxn_ram_main_h_l32_c11_0145_return_output;
     REG_VAR_rdaddr := VAR_CAST_TO_uint32_t_uxn_ram_main_h_l32_c11_0145_return_output;
     -- main_ram[uxn_ram_main_h_l37_c31_55db] LATENCY=0
     -- Clock enable
     main_ram_uxn_ram_main_h_l37_c31_55db_CLOCK_ENABLE <= VAR_main_ram_uxn_ram_main_h_l37_c31_55db_CLOCK_ENABLE;
     -- Inputs
     main_ram_uxn_ram_main_h_l37_c31_55db_addr0 <= VAR_main_ram_uxn_ram_main_h_l37_c31_55db_addr0;
     main_ram_uxn_ram_main_h_l37_c31_55db_wr_data0 <= VAR_main_ram_uxn_ram_main_h_l37_c31_55db_wr_data0;
     main_ram_uxn_ram_main_h_l37_c31_55db_wr_en0 <= VAR_main_ram_uxn_ram_main_h_l37_c31_55db_wr_en0;
     main_ram_uxn_ram_main_h_l37_c31_55db_valid0 <= VAR_main_ram_uxn_ram_main_h_l37_c31_55db_valid0;
     main_ram_uxn_ram_main_h_l37_c31_55db_rd_en0 <= VAR_main_ram_uxn_ram_main_h_l37_c31_55db_rd_en0;
     main_ram_uxn_ram_main_h_l37_c31_55db_addr1 <= VAR_main_ram_uxn_ram_main_h_l37_c31_55db_addr1;
     main_ram_uxn_ram_main_h_l37_c31_55db_valid1 <= VAR_main_ram_uxn_ram_main_h_l37_c31_55db_valid1;
     main_ram_uxn_ram_main_h_l37_c31_55db_rd_en1 <= VAR_main_ram_uxn_ram_main_h_l37_c31_55db_rd_en1;
     -- Outputs
     VAR_main_ram_uxn_ram_main_h_l37_c31_55db_return_output := main_ram_uxn_ram_main_h_l37_c31_55db_return_output;

     -- Submodule level 2
     -- CONST_REF_RD_uint1_t_main_ram_outputs_t_valid0_d41d[uxn_ram_main_h_l48_c13_6164] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_main_ram_outputs_t_valid0_d41d_uxn_ram_main_h_l48_c13_6164_return_output := VAR_main_ram_uxn_ram_main_h_l37_c31_55db_return_output.valid0;

     -- CONST_REF_RD_uint1_t_main_ram_outputs_t_valid1_d41d[uxn_ram_main_h_l49_c13_d86c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_main_ram_outputs_t_valid1_d41d_uxn_ram_main_h_l49_c13_d86c_return_output := VAR_main_ram_uxn_ram_main_h_l37_c31_55db_return_output.valid1;

     -- CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data0_d41d[uxn_ram_main_h_l48_c45_c107] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data0_d41d_uxn_ram_main_h_l48_c45_c107_return_output := VAR_main_ram_uxn_ram_main_h_l37_c31_55db_return_output.rd_data0;

     -- CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data1_d41d[uxn_ram_main_h_l49_c45_bf02] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data1_d41d_uxn_ram_main_h_l49_c45_bf02_return_output := VAR_main_ram_uxn_ram_main_h_l37_c31_55db_return_output.rd_data1;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_left := VAR_CONST_REF_RD_uint1_t_main_ram_outputs_t_valid0_d41d_uxn_ram_main_h_l48_c13_6164_return_output;
     VAR_BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_left := VAR_CONST_REF_RD_uint1_t_main_ram_outputs_t_valid1_d41d_uxn_ram_main_h_l49_c13_d86c_return_output;
     VAR_MUX_uxn_ram_main_h_l48_c13_76b5_iftrue := VAR_CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data0_d41d_uxn_ram_main_h_l48_c45_c107_return_output;
     VAR_MUX_uxn_ram_main_h_l49_c13_31bb_iftrue := VAR_CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data1_d41d_uxn_ram_main_h_l49_c45_bf02_return_output;
     -- BIN_OP_AND[uxn_ram_main_h_l48_c13_4c3e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_left <= VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_left;
     BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_right <= VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_return_output := BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_return_output;

     -- BIN_OP_AND[uxn_ram_main_h_l49_c13_3172] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_left <= VAR_BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_left;
     BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_right <= VAR_BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_return_output := BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_ram_main_h_l48_c13_76b5_cond := VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_4c3e_return_output;
     VAR_MUX_uxn_ram_main_h_l49_c13_31bb_cond := VAR_BIN_OP_AND_uxn_ram_main_h_l49_c13_3172_return_output;
     -- MUX[uxn_ram_main_h_l49_c13_31bb] LATENCY=0
     -- Inputs
     MUX_uxn_ram_main_h_l49_c13_31bb_cond <= VAR_MUX_uxn_ram_main_h_l49_c13_31bb_cond;
     MUX_uxn_ram_main_h_l49_c13_31bb_iftrue <= VAR_MUX_uxn_ram_main_h_l49_c13_31bb_iftrue;
     MUX_uxn_ram_main_h_l49_c13_31bb_iffalse <= VAR_MUX_uxn_ram_main_h_l49_c13_31bb_iffalse;
     -- Outputs
     VAR_MUX_uxn_ram_main_h_l49_c13_31bb_return_output := MUX_uxn_ram_main_h_l49_c13_31bb_return_output;

     -- MUX[uxn_ram_main_h_l48_c13_76b5] LATENCY=0
     -- Inputs
     MUX_uxn_ram_main_h_l48_c13_76b5_cond <= VAR_MUX_uxn_ram_main_h_l48_c13_76b5_cond;
     MUX_uxn_ram_main_h_l48_c13_76b5_iftrue <= VAR_MUX_uxn_ram_main_h_l48_c13_76b5_iftrue;
     MUX_uxn_ram_main_h_l48_c13_76b5_iffalse <= VAR_MUX_uxn_ram_main_h_l48_c13_76b5_iffalse;
     -- Outputs
     VAR_MUX_uxn_ram_main_h_l48_c13_76b5_return_output := MUX_uxn_ram_main_h_l48_c13_76b5_return_output;

     -- Submodule level 5
     REG_VAR_rdvalue0 := VAR_MUX_uxn_ram_main_h_l48_c13_76b5_return_output;
     REG_VAR_rdvalue1 := VAR_MUX_uxn_ram_main_h_l49_c13_31bb_return_output;
     -- CAST_TO_uint16_t[uxn_ram_main_h_l53_c13_2a4a] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_ram_main_h_l53_c13_2a4a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_MUX_uxn_ram_main_h_l49_c13_31bb_return_output);

     -- CAST_TO_uint16_t[uxn_ram_main_h_l51_c11_2eff] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_ram_main_h_l51_c11_2eff_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_MUX_uxn_ram_main_h_l48_c13_76b5_return_output);

     -- Submodule level 6
     VAR_CONST_SL_8_uxn_ram_main_h_l52_c2_4f7b_x := VAR_CAST_TO_uint16_t_uxn_ram_main_h_l51_c11_2eff_return_output;
     VAR_BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_right := VAR_CAST_TO_uint16_t_uxn_ram_main_h_l53_c13_2a4a_return_output;
     -- CONST_SL_8[uxn_ram_main_h_l52_c2_4f7b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_ram_main_h_l52_c2_4f7b_x <= VAR_CONST_SL_8_uxn_ram_main_h_l52_c2_4f7b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_ram_main_h_l52_c2_4f7b_return_output := CONST_SL_8_uxn_ram_main_h_l52_c2_4f7b_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_left := VAR_CONST_SL_8_uxn_ram_main_h_l52_c2_4f7b_return_output;
     -- BIN_OP_OR[uxn_ram_main_h_l53_c2_8166] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_left <= VAR_BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_left;
     BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_right <= VAR_BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_return_output := BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_return_output;

     -- Submodule level 8
     VAR_result_uxn_ram_main_h_l53_c2_f76c := VAR_BIN_OP_OR_uxn_ram_main_h_l53_c2_8166_return_output;
     VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg6 := resize(VAR_result_uxn_ram_main_h_l53_c2_f76c, 32);
     REG_VAR_result := VAR_result_uxn_ram_main_h_l53_c2_f76c;
     VAR_return_output := VAR_result_uxn_ram_main_h_l53_c2_f76c;
     -- printf_uxn_ram_main_h_l55_c2_3b91[uxn_ram_main_h_l55_c2_3b91] LATENCY=0
     -- Clock enable
     printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_CLOCK_ENABLE <= VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg0 <= VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg0;
     printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg1 <= VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg1;
     printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg2 <= VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg2;
     printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg3 <= VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg3;
     printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg4 <= VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg4;
     printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg5 <= VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg5;
     printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg6 <= VAR_printf_uxn_ram_main_h_l55_c2_3b91_uxn_ram_main_h_l55_c2_3b91_arg6;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_rdaddr <= REG_VAR_rdaddr;
REG_COMB_rwaddr <= REG_VAR_rwaddr;
REG_COMB_wdata <= REG_VAR_wdata;
REG_COMB_rdvalue0 <= REG_VAR_rdvalue0;
REG_COMB_rdvalue1 <= REG_VAR_rdvalue1;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     rdaddr <= REG_COMB_rdaddr;
     rwaddr <= REG_COMB_rwaddr;
     wdata <= REG_COMB_wdata;
     rdvalue0 <= REG_COMB_rdvalue0;
     rdvalue1 <= REG_COMB_rdvalue1;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
