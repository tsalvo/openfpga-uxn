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
-- Submodules: 12
entity stack_r_ram_update_0CLK_79ef54d6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 address0 : in unsigned(7 downto 0);
 write0_value : in unsigned(7 downto 0);
 write0_enable : in unsigned(0 downto 0);
 read0_enable : in unsigned(0 downto 0);
 address1 : in unsigned(7 downto 0);
 read1_enable : in unsigned(0 downto 0);
 return_output : out unsigned(15 downto 0));
end stack_r_ram_update_0CLK_79ef54d6;
architecture arch of stack_r_ram_update_0CLK_79ef54d6 is
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
-- stack_r_ram[uxn_stack_h_l96_c42_4ed5]
signal stack_r_ram_uxn_stack_h_l96_c42_4ed5_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_r_ram_uxn_stack_h_l96_c42_4ed5_addr0 : unsigned(31 downto 0);
signal stack_r_ram_uxn_stack_h_l96_c42_4ed5_wr_data0 : unsigned(7 downto 0);
signal stack_r_ram_uxn_stack_h_l96_c42_4ed5_wr_en0 : unsigned(0 downto 0);
signal stack_r_ram_uxn_stack_h_l96_c42_4ed5_valid0 : unsigned(0 downto 0);
signal stack_r_ram_uxn_stack_h_l96_c42_4ed5_rd_en0 : unsigned(0 downto 0);
signal stack_r_ram_uxn_stack_h_l96_c42_4ed5_addr1 : unsigned(31 downto 0);
signal stack_r_ram_uxn_stack_h_l96_c42_4ed5_valid1 : unsigned(0 downto 0);
signal stack_r_ram_uxn_stack_h_l96_c42_4ed5_rd_en1 : unsigned(0 downto 0);
signal stack_r_ram_uxn_stack_h_l96_c42_4ed5_return_output : stack_r_ram_outputs_t;

-- BIN_OP_AND[uxn_stack_h_l107_c13_4325]
signal BIN_OP_AND_uxn_stack_h_l107_c13_4325_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_stack_h_l107_c13_4325_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_stack_h_l107_c13_4325_return_output : unsigned(0 downto 0);

-- MUX[uxn_stack_h_l107_c13_6d34]
signal MUX_uxn_stack_h_l107_c13_6d34_cond : unsigned(0 downto 0);
signal MUX_uxn_stack_h_l107_c13_6d34_iftrue : unsigned(7 downto 0);
signal MUX_uxn_stack_h_l107_c13_6d34_iffalse : unsigned(7 downto 0);
signal MUX_uxn_stack_h_l107_c13_6d34_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l108_c13_1570]
signal BIN_OP_AND_uxn_stack_h_l108_c13_1570_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_stack_h_l108_c13_1570_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_stack_h_l108_c13_1570_return_output : unsigned(0 downto 0);

-- MUX[uxn_stack_h_l108_c13_19fd]
signal MUX_uxn_stack_h_l108_c13_19fd_cond : unsigned(0 downto 0);
signal MUX_uxn_stack_h_l108_c13_19fd_iftrue : unsigned(7 downto 0);
signal MUX_uxn_stack_h_l108_c13_19fd_iffalse : unsigned(7 downto 0);
signal MUX_uxn_stack_h_l108_c13_19fd_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_stack_h_l111_c2_bba9]
signal CONST_SL_8_uxn_stack_h_l111_c2_bba9_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_stack_h_l111_c2_bba9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_stack_h_l112_c2_851f]
signal BIN_OP_OR_uxn_stack_h_l112_c2_851f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_stack_h_l112_c2_851f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_stack_h_l112_c2_851f_return_output : unsigned(15 downto 0);

-- printf_uxn_stack_h_l114_c2_a15f[uxn_stack_h_l114_c2_a15f]
signal printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg0 : unsigned(31 downto 0);
signal printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg1 : unsigned(31 downto 0);
signal printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg2 : unsigned(31 downto 0);
signal printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg3 : unsigned(31 downto 0);
signal printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg4 : unsigned(31 downto 0);
signal printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg5 : unsigned(31 downto 0);
signal printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg6 : unsigned(31 downto 0);

function CAST_TO_uint32_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
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
-- stack_r_ram_uxn_stack_h_l96_c42_4ed5
stack_r_ram_uxn_stack_h_l96_c42_4ed5 : entity work.stack_r_ram_0CLK_b45f1687 port map (
clk,
stack_r_ram_uxn_stack_h_l96_c42_4ed5_CLOCK_ENABLE,
stack_r_ram_uxn_stack_h_l96_c42_4ed5_addr0,
stack_r_ram_uxn_stack_h_l96_c42_4ed5_wr_data0,
stack_r_ram_uxn_stack_h_l96_c42_4ed5_wr_en0,
stack_r_ram_uxn_stack_h_l96_c42_4ed5_valid0,
stack_r_ram_uxn_stack_h_l96_c42_4ed5_rd_en0,
stack_r_ram_uxn_stack_h_l96_c42_4ed5_addr1,
stack_r_ram_uxn_stack_h_l96_c42_4ed5_valid1,
stack_r_ram_uxn_stack_h_l96_c42_4ed5_rd_en1,
stack_r_ram_uxn_stack_h_l96_c42_4ed5_return_output);

-- BIN_OP_AND_uxn_stack_h_l107_c13_4325
BIN_OP_AND_uxn_stack_h_l107_c13_4325 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l107_c13_4325_left,
BIN_OP_AND_uxn_stack_h_l107_c13_4325_right,
BIN_OP_AND_uxn_stack_h_l107_c13_4325_return_output);

-- MUX_uxn_stack_h_l107_c13_6d34
MUX_uxn_stack_h_l107_c13_6d34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_stack_h_l107_c13_6d34_cond,
MUX_uxn_stack_h_l107_c13_6d34_iftrue,
MUX_uxn_stack_h_l107_c13_6d34_iffalse,
MUX_uxn_stack_h_l107_c13_6d34_return_output);

-- BIN_OP_AND_uxn_stack_h_l108_c13_1570
BIN_OP_AND_uxn_stack_h_l108_c13_1570 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l108_c13_1570_left,
BIN_OP_AND_uxn_stack_h_l108_c13_1570_right,
BIN_OP_AND_uxn_stack_h_l108_c13_1570_return_output);

-- MUX_uxn_stack_h_l108_c13_19fd
MUX_uxn_stack_h_l108_c13_19fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_stack_h_l108_c13_19fd_cond,
MUX_uxn_stack_h_l108_c13_19fd_iftrue,
MUX_uxn_stack_h_l108_c13_19fd_iffalse,
MUX_uxn_stack_h_l108_c13_19fd_return_output);

-- CONST_SL_8_uxn_stack_h_l111_c2_bba9
CONST_SL_8_uxn_stack_h_l111_c2_bba9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_stack_h_l111_c2_bba9_x,
CONST_SL_8_uxn_stack_h_l111_c2_bba9_return_output);

-- BIN_OP_OR_uxn_stack_h_l112_c2_851f
BIN_OP_OR_uxn_stack_h_l112_c2_851f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_stack_h_l112_c2_851f_left,
BIN_OP_OR_uxn_stack_h_l112_c2_851f_right,
BIN_OP_OR_uxn_stack_h_l112_c2_851f_return_output);

-- printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f
printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f : entity work.printf_uxn_stack_h_l114_c2_a15f_0CLK_de264c78 port map (
printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_CLOCK_ENABLE,
printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg0,
printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg1,
printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg2,
printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg3,
printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg4,
printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg5,
printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg6);



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
 stack_r_ram_uxn_stack_h_l96_c42_4ed5_return_output,
 BIN_OP_AND_uxn_stack_h_l107_c13_4325_return_output,
 MUX_uxn_stack_h_l107_c13_6d34_return_output,
 BIN_OP_AND_uxn_stack_h_l108_c13_1570_return_output,
 MUX_uxn_stack_h_l108_c13_19fd_return_output,
 CONST_SL_8_uxn_stack_h_l111_c2_bba9_return_output,
 BIN_OP_OR_uxn_stack_h_l112_c2_851f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_address0 : unsigned(7 downto 0);
 variable VAR_write0_value : unsigned(7 downto 0);
 variable VAR_write0_enable : unsigned(0 downto 0);
 variable VAR_read0_enable : unsigned(0 downto 0);
 variable VAR_address1 : unsigned(7 downto 0);
 variable VAR_read1_enable : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_stack_h_l89_c11_fdad_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_stack_h_l90_c11_b7a9_return_output : unsigned(31 downto 0);
 variable VAR_wdata_uxn_stack_h_l91_c2_c9f0 : unsigned(7 downto 0);
 variable VAR_rw_valid : unsigned(0 downto 0);
 variable VAR_rd_valid : unsigned(0 downto 0);
 variable VAR_stack_r_ram_out : stack_r_ram_outputs_t;
 variable VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_addr0 : unsigned(31 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_wr_data0 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_wr_en0 : unsigned(0 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_valid0 : unsigned(0 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_rd_en0 : unsigned(0 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_addr1 : unsigned(31 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_valid1 : unsigned(0 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_rd_en1 : unsigned(0 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_return_output : stack_r_ram_outputs_t;
 variable VAR_MUX_uxn_stack_h_l107_c13_6d34_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_stack_h_l107_c13_6d34_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l107_c13_6d34_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_stack_r_ram_outputs_t_valid0_d41d_uxn_stack_h_l107_c13_5f8e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l107_c13_4325_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l107_c13_4325_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l107_c13_4325_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_stack_r_ram_outputs_t_rd_data0_d41d_uxn_stack_h_l107_c53_7fd3_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l107_c13_6d34_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l108_c13_19fd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_stack_h_l108_c13_19fd_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l108_c13_19fd_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_stack_r_ram_outputs_t_valid1_d41d_uxn_stack_h_l108_c13_1519_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l108_c13_1570_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l108_c13_1570_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l108_c13_1570_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_stack_r_ram_outputs_t_rd_data1_d41d_uxn_stack_h_l108_c53_bb70_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l108_c13_19fd_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_stack_h_l110_c11_68ae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_stack_h_l111_c2_bba9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_stack_h_l111_c2_bba9_x : unsigned(15 downto 0);
 variable VAR_result_uxn_stack_h_l112_c2_e590 : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_stack_h_l112_c2_851f_left : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_stack_h_l112_c13_57f0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_stack_h_l112_c2_851f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_stack_h_l112_c2_851f_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg4 : unsigned(31 downto 0);
 variable VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg5 : unsigned(31 downto 0);
 variable VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg6 : unsigned(31 downto 0);
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
     VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_valid0 := to_unsigned(1, 1);
     VAR_MUX_uxn_stack_h_l108_c13_19fd_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_valid1 := to_unsigned(1, 1);
     VAR_MUX_uxn_stack_h_l107_c13_6d34_iffalse := resize(to_unsigned(0, 1), 8);

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
     VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_stack_h_l107_c13_4325_right := VAR_read0_enable;
     VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg4 := resize(VAR_read0_enable, 32);
     VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_rd_en0 := VAR_read0_enable;
     VAR_BIN_OP_AND_uxn_stack_h_l108_c13_1570_right := VAR_read1_enable;
     VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg5 := resize(VAR_read1_enable, 32);
     VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_rd_en1 := VAR_read1_enable;
     VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg1 := resize(VAR_write0_enable, 32);
     VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_wr_en0 := VAR_write0_enable;
     VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_wr_data0 := VAR_write0_value;
     VAR_wdata_uxn_stack_h_l91_c2_c9f0 := VAR_write0_value;
     VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg2 := resize(VAR_wdata_uxn_stack_h_l91_c2_c9f0, 32);
     REG_VAR_wdata := VAR_wdata_uxn_stack_h_l91_c2_c9f0;
     -- CAST_TO_uint32_t[uxn_stack_h_l89_c11_fdad] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_stack_h_l89_c11_fdad_return_output := CAST_TO_uint32_t_uint8_t(
     VAR_address0);

     -- CAST_TO_uint32_t[uxn_stack_h_l90_c11_b7a9] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_stack_h_l90_c11_b7a9_return_output := CAST_TO_uint32_t_uint8_t(
     VAR_address1);

     -- Submodule level 1
     VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg0 := VAR_CAST_TO_uint32_t_uxn_stack_h_l89_c11_fdad_return_output;
     REG_VAR_rwaddr := VAR_CAST_TO_uint32_t_uxn_stack_h_l89_c11_fdad_return_output;
     VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_addr0 := VAR_CAST_TO_uint32_t_uxn_stack_h_l89_c11_fdad_return_output;
     VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg3 := VAR_CAST_TO_uint32_t_uxn_stack_h_l90_c11_b7a9_return_output;
     REG_VAR_rdaddr := VAR_CAST_TO_uint32_t_uxn_stack_h_l90_c11_b7a9_return_output;
     VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_addr1 := VAR_CAST_TO_uint32_t_uxn_stack_h_l90_c11_b7a9_return_output;
     -- stack_r_ram[uxn_stack_h_l96_c42_4ed5] LATENCY=0
     -- Clock enable
     stack_r_ram_uxn_stack_h_l96_c42_4ed5_CLOCK_ENABLE <= VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_CLOCK_ENABLE;
     -- Inputs
     stack_r_ram_uxn_stack_h_l96_c42_4ed5_addr0 <= VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_addr0;
     stack_r_ram_uxn_stack_h_l96_c42_4ed5_wr_data0 <= VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_wr_data0;
     stack_r_ram_uxn_stack_h_l96_c42_4ed5_wr_en0 <= VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_wr_en0;
     stack_r_ram_uxn_stack_h_l96_c42_4ed5_valid0 <= VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_valid0;
     stack_r_ram_uxn_stack_h_l96_c42_4ed5_rd_en0 <= VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_rd_en0;
     stack_r_ram_uxn_stack_h_l96_c42_4ed5_addr1 <= VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_addr1;
     stack_r_ram_uxn_stack_h_l96_c42_4ed5_valid1 <= VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_valid1;
     stack_r_ram_uxn_stack_h_l96_c42_4ed5_rd_en1 <= VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_rd_en1;
     -- Outputs
     VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_return_output := stack_r_ram_uxn_stack_h_l96_c42_4ed5_return_output;

     -- Submodule level 2
     -- CONST_REF_RD_uint1_t_stack_r_ram_outputs_t_valid0_d41d[uxn_stack_h_l107_c13_5f8e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_stack_r_ram_outputs_t_valid0_d41d_uxn_stack_h_l107_c13_5f8e_return_output := VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_return_output.valid0;

     -- CONST_REF_RD_uint1_t_stack_r_ram_outputs_t_valid1_d41d[uxn_stack_h_l108_c13_1519] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_stack_r_ram_outputs_t_valid1_d41d_uxn_stack_h_l108_c13_1519_return_output := VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_return_output.valid1;

     -- CONST_REF_RD_uint8_t_stack_r_ram_outputs_t_rd_data1_d41d[uxn_stack_h_l108_c53_bb70] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_stack_r_ram_outputs_t_rd_data1_d41d_uxn_stack_h_l108_c53_bb70_return_output := VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_return_output.rd_data1;

     -- CONST_REF_RD_uint8_t_stack_r_ram_outputs_t_rd_data0_d41d[uxn_stack_h_l107_c53_7fd3] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_stack_r_ram_outputs_t_rd_data0_d41d_uxn_stack_h_l107_c53_7fd3_return_output := VAR_stack_r_ram_uxn_stack_h_l96_c42_4ed5_return_output.rd_data0;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_stack_h_l107_c13_4325_left := VAR_CONST_REF_RD_uint1_t_stack_r_ram_outputs_t_valid0_d41d_uxn_stack_h_l107_c13_5f8e_return_output;
     VAR_BIN_OP_AND_uxn_stack_h_l108_c13_1570_left := VAR_CONST_REF_RD_uint1_t_stack_r_ram_outputs_t_valid1_d41d_uxn_stack_h_l108_c13_1519_return_output;
     VAR_MUX_uxn_stack_h_l107_c13_6d34_iftrue := VAR_CONST_REF_RD_uint8_t_stack_r_ram_outputs_t_rd_data0_d41d_uxn_stack_h_l107_c53_7fd3_return_output;
     VAR_MUX_uxn_stack_h_l108_c13_19fd_iftrue := VAR_CONST_REF_RD_uint8_t_stack_r_ram_outputs_t_rd_data1_d41d_uxn_stack_h_l108_c53_bb70_return_output;
     -- BIN_OP_AND[uxn_stack_h_l107_c13_4325] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l107_c13_4325_left <= VAR_BIN_OP_AND_uxn_stack_h_l107_c13_4325_left;
     BIN_OP_AND_uxn_stack_h_l107_c13_4325_right <= VAR_BIN_OP_AND_uxn_stack_h_l107_c13_4325_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l107_c13_4325_return_output := BIN_OP_AND_uxn_stack_h_l107_c13_4325_return_output;

     -- BIN_OP_AND[uxn_stack_h_l108_c13_1570] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l108_c13_1570_left <= VAR_BIN_OP_AND_uxn_stack_h_l108_c13_1570_left;
     BIN_OP_AND_uxn_stack_h_l108_c13_1570_right <= VAR_BIN_OP_AND_uxn_stack_h_l108_c13_1570_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l108_c13_1570_return_output := BIN_OP_AND_uxn_stack_h_l108_c13_1570_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_stack_h_l107_c13_6d34_cond := VAR_BIN_OP_AND_uxn_stack_h_l107_c13_4325_return_output;
     VAR_MUX_uxn_stack_h_l108_c13_19fd_cond := VAR_BIN_OP_AND_uxn_stack_h_l108_c13_1570_return_output;
     -- MUX[uxn_stack_h_l108_c13_19fd] LATENCY=0
     -- Inputs
     MUX_uxn_stack_h_l108_c13_19fd_cond <= VAR_MUX_uxn_stack_h_l108_c13_19fd_cond;
     MUX_uxn_stack_h_l108_c13_19fd_iftrue <= VAR_MUX_uxn_stack_h_l108_c13_19fd_iftrue;
     MUX_uxn_stack_h_l108_c13_19fd_iffalse <= VAR_MUX_uxn_stack_h_l108_c13_19fd_iffalse;
     -- Outputs
     VAR_MUX_uxn_stack_h_l108_c13_19fd_return_output := MUX_uxn_stack_h_l108_c13_19fd_return_output;

     -- MUX[uxn_stack_h_l107_c13_6d34] LATENCY=0
     -- Inputs
     MUX_uxn_stack_h_l107_c13_6d34_cond <= VAR_MUX_uxn_stack_h_l107_c13_6d34_cond;
     MUX_uxn_stack_h_l107_c13_6d34_iftrue <= VAR_MUX_uxn_stack_h_l107_c13_6d34_iftrue;
     MUX_uxn_stack_h_l107_c13_6d34_iffalse <= VAR_MUX_uxn_stack_h_l107_c13_6d34_iffalse;
     -- Outputs
     VAR_MUX_uxn_stack_h_l107_c13_6d34_return_output := MUX_uxn_stack_h_l107_c13_6d34_return_output;

     -- Submodule level 5
     REG_VAR_rdvalue0 := VAR_MUX_uxn_stack_h_l107_c13_6d34_return_output;
     REG_VAR_rdvalue1 := VAR_MUX_uxn_stack_h_l108_c13_19fd_return_output;
     -- CAST_TO_uint16_t[uxn_stack_h_l110_c11_68ae] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_stack_h_l110_c11_68ae_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_MUX_uxn_stack_h_l107_c13_6d34_return_output);

     -- CAST_TO_uint16_t[uxn_stack_h_l112_c13_57f0] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_stack_h_l112_c13_57f0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_MUX_uxn_stack_h_l108_c13_19fd_return_output);

     -- Submodule level 6
     VAR_CONST_SL_8_uxn_stack_h_l111_c2_bba9_x := VAR_CAST_TO_uint16_t_uxn_stack_h_l110_c11_68ae_return_output;
     VAR_BIN_OP_OR_uxn_stack_h_l112_c2_851f_right := VAR_CAST_TO_uint16_t_uxn_stack_h_l112_c13_57f0_return_output;
     -- CONST_SL_8[uxn_stack_h_l111_c2_bba9] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_stack_h_l111_c2_bba9_x <= VAR_CONST_SL_8_uxn_stack_h_l111_c2_bba9_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_stack_h_l111_c2_bba9_return_output := CONST_SL_8_uxn_stack_h_l111_c2_bba9_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_stack_h_l112_c2_851f_left := VAR_CONST_SL_8_uxn_stack_h_l111_c2_bba9_return_output;
     -- BIN_OP_OR[uxn_stack_h_l112_c2_851f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_stack_h_l112_c2_851f_left <= VAR_BIN_OP_OR_uxn_stack_h_l112_c2_851f_left;
     BIN_OP_OR_uxn_stack_h_l112_c2_851f_right <= VAR_BIN_OP_OR_uxn_stack_h_l112_c2_851f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_stack_h_l112_c2_851f_return_output := BIN_OP_OR_uxn_stack_h_l112_c2_851f_return_output;

     -- Submodule level 8
     VAR_result_uxn_stack_h_l112_c2_e590 := VAR_BIN_OP_OR_uxn_stack_h_l112_c2_851f_return_output;
     VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg6 := resize(VAR_result_uxn_stack_h_l112_c2_e590, 32);
     REG_VAR_result := VAR_result_uxn_stack_h_l112_c2_e590;
     VAR_return_output := VAR_result_uxn_stack_h_l112_c2_e590;
     -- printf_uxn_stack_h_l114_c2_a15f[uxn_stack_h_l114_c2_a15f] LATENCY=0
     -- Clock enable
     printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_CLOCK_ENABLE <= VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg0 <= VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg0;
     printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg1 <= VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg1;
     printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg2 <= VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg2;
     printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg3 <= VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg3;
     printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg4 <= VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg4;
     printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg5 <= VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg5;
     printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg6 <= VAR_printf_uxn_stack_h_l114_c2_a15f_uxn_stack_h_l114_c2_a15f_arg6;
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
