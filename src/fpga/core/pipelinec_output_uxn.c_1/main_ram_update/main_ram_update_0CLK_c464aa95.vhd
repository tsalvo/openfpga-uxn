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
-- Submodules: 10
entity main_ram_update_0CLK_c464aa95 is
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
end main_ram_update_0CLK_c464aa95;
architecture arch of main_ram_update_0CLK_c464aa95 is
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
signal REG_COMB_rdaddr : unsigned(31 downto 0);
signal REG_COMB_rwaddr : unsigned(31 downto 0);
signal REG_COMB_wdata : unsigned(7 downto 0);
signal REG_COMB_rdvalue0 : unsigned(7 downto 0);
signal REG_COMB_rdvalue1 : unsigned(7 downto 0);

-- Each function instance gets signals
-- main_ram[uxn_ram_main_h_l36_c31_9ea0]
signal main_ram_uxn_ram_main_h_l36_c31_9ea0_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l36_c31_9ea0_addr0 : unsigned(31 downto 0);
signal main_ram_uxn_ram_main_h_l36_c31_9ea0_wr_data0 : unsigned(7 downto 0);
signal main_ram_uxn_ram_main_h_l36_c31_9ea0_wr_en0 : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l36_c31_9ea0_valid0 : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l36_c31_9ea0_rd_en0 : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l36_c31_9ea0_addr1 : unsigned(31 downto 0);
signal main_ram_uxn_ram_main_h_l36_c31_9ea0_valid1 : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l36_c31_9ea0_rd_en1 : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l36_c31_9ea0_return_output : main_ram_outputs_t;

-- BIN_OP_AND[uxn_ram_main_h_l47_c13_e618]
signal BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_return_output : unsigned(0 downto 0);

-- MUX[uxn_ram_main_h_l47_c13_b95e]
signal MUX_uxn_ram_main_h_l47_c13_b95e_cond : unsigned(0 downto 0);
signal MUX_uxn_ram_main_h_l47_c13_b95e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_ram_main_h_l47_c13_b95e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_ram_main_h_l47_c13_b95e_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_ram_main_h_l48_c13_f82e]
signal BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_return_output : unsigned(0 downto 0);

-- MUX[uxn_ram_main_h_l48_c13_c9ef]
signal MUX_uxn_ram_main_h_l48_c13_c9ef_cond : unsigned(0 downto 0);
signal MUX_uxn_ram_main_h_l48_c13_c9ef_iftrue : unsigned(7 downto 0);
signal MUX_uxn_ram_main_h_l48_c13_c9ef_iffalse : unsigned(7 downto 0);
signal MUX_uxn_ram_main_h_l48_c13_c9ef_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_ram_main_h_l50_c21_2c25]
signal CONST_SL_8_uxn_ram_main_h_l50_c21_2c25_x : unsigned(7 downto 0);
signal CONST_SL_8_uxn_ram_main_h_l50_c21_2c25_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_ram_main_h_l50_c21_ae7d]
signal BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_return_output : unsigned(7 downto 0);

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
-- main_ram_uxn_ram_main_h_l36_c31_9ea0
main_ram_uxn_ram_main_h_l36_c31_9ea0 : entity work.main_ram_0CLK_b45f1687 port map (
clk,
main_ram_uxn_ram_main_h_l36_c31_9ea0_CLOCK_ENABLE,
main_ram_uxn_ram_main_h_l36_c31_9ea0_addr0,
main_ram_uxn_ram_main_h_l36_c31_9ea0_wr_data0,
main_ram_uxn_ram_main_h_l36_c31_9ea0_wr_en0,
main_ram_uxn_ram_main_h_l36_c31_9ea0_valid0,
main_ram_uxn_ram_main_h_l36_c31_9ea0_rd_en0,
main_ram_uxn_ram_main_h_l36_c31_9ea0_addr1,
main_ram_uxn_ram_main_h_l36_c31_9ea0_valid1,
main_ram_uxn_ram_main_h_l36_c31_9ea0_rd_en1,
main_ram_uxn_ram_main_h_l36_c31_9ea0_return_output);

-- BIN_OP_AND_uxn_ram_main_h_l47_c13_e618
BIN_OP_AND_uxn_ram_main_h_l47_c13_e618 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_left,
BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_right,
BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_return_output);

-- MUX_uxn_ram_main_h_l47_c13_b95e
MUX_uxn_ram_main_h_l47_c13_b95e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_ram_main_h_l47_c13_b95e_cond,
MUX_uxn_ram_main_h_l47_c13_b95e_iftrue,
MUX_uxn_ram_main_h_l47_c13_b95e_iffalse,
MUX_uxn_ram_main_h_l47_c13_b95e_return_output);

-- BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e
BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_left,
BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_right,
BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_return_output);

-- MUX_uxn_ram_main_h_l48_c13_c9ef
MUX_uxn_ram_main_h_l48_c13_c9ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_ram_main_h_l48_c13_c9ef_cond,
MUX_uxn_ram_main_h_l48_c13_c9ef_iftrue,
MUX_uxn_ram_main_h_l48_c13_c9ef_iffalse,
MUX_uxn_ram_main_h_l48_c13_c9ef_return_output);

-- CONST_SL_8_uxn_ram_main_h_l50_c21_2c25
CONST_SL_8_uxn_ram_main_h_l50_c21_2c25 : entity work.CONST_SL_8_uint8_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_ram_main_h_l50_c21_2c25_x,
CONST_SL_8_uxn_ram_main_h_l50_c21_2c25_return_output);

-- BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d
BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_left,
BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_right,
BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_return_output);



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
 -- All submodule outputs
 main_ram_uxn_ram_main_h_l36_c31_9ea0_return_output,
 BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_return_output,
 MUX_uxn_ram_main_h_l47_c13_b95e_return_output,
 BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_return_output,
 MUX_uxn_ram_main_h_l48_c13_c9ef_return_output,
 CONST_SL_8_uxn_ram_main_h_l50_c21_2c25_return_output,
 BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_return_output)
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
 variable VAR_CAST_TO_uint32_t_uxn_ram_main_h_l29_c11_d9bb_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_ram_main_h_l31_c11_b5ab_return_output : unsigned(31 downto 0);
 variable VAR_rw_valid : unsigned(0 downto 0);
 variable VAR_rd_valid : unsigned(0 downto 0);
 variable VAR_ram_out : main_ram_outputs_t;
 variable VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_addr0 : unsigned(31 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_wr_data0 : unsigned(7 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_wr_en0 : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_valid0 : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_rd_en0 : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_addr1 : unsigned(31 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_valid1 : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_rd_en1 : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_return_output : main_ram_outputs_t;
 variable VAR_MUX_uxn_ram_main_h_l47_c13_b95e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_ram_main_h_l47_c13_b95e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_main_h_l47_c13_b95e_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_main_ram_outputs_t_valid0_d41d_uxn_ram_main_h_l47_c13_c28f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data0_d41d_uxn_ram_main_h_l47_c45_5d2e_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_main_h_l47_c13_b95e_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_main_h_l48_c13_c9ef_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_ram_main_h_l48_c13_c9ef_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_main_h_l48_c13_c9ef_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_main_ram_outputs_t_valid1_d41d_uxn_ram_main_h_l48_c13_f159_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data1_d41d_uxn_ram_main_h_l48_c45_9556_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_main_h_l48_c13_c9ef_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_left : unsigned(7 downto 0);
 variable VAR_CONST_SL_8_uxn_ram_main_h_l50_c21_2c25_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SL_8_uxn_ram_main_h_l50_c21_2c25_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_ram_main_h_l50_c9_a77c_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_rdaddr : unsigned(31 downto 0);
variable REG_VAR_rwaddr : unsigned(31 downto 0);
variable REG_VAR_wdata : unsigned(7 downto 0);
variable REG_VAR_rdvalue0 : unsigned(7 downto 0);
variable REG_VAR_rdvalue1 : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_rdaddr := rdaddr;
  REG_VAR_rwaddr := rwaddr;
  REG_VAR_wdata := wdata;
  REG_VAR_rdvalue0 := rdvalue0;
  REG_VAR_rdvalue1 := rdvalue1;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_ram_main_h_l48_c13_c9ef_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_valid1 := to_unsigned(1, 1);
     VAR_MUX_uxn_ram_main_h_l47_c13_b95e_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_valid0 := to_unsigned(1, 1);

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
     VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_right := VAR_read0_enable;
     VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_rd_en0 := VAR_read0_enable;
     VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_right := VAR_read1_enable;
     VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_rd_en1 := VAR_read1_enable;
     VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_wr_en0 := VAR_write0_enable;
     VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_wr_data0 := VAR_write0_value;
     REG_VAR_wdata := VAR_write0_value;
     -- CAST_TO_uint32_t[uxn_ram_main_h_l29_c11_d9bb] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_main_h_l29_c11_d9bb_return_output := CAST_TO_uint32_t_uint16_t(
     VAR_address0);

     -- CAST_TO_uint32_t[uxn_ram_main_h_l31_c11_b5ab] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_main_h_l31_c11_b5ab_return_output := CAST_TO_uint32_t_uint16_t(
     VAR_address1);

     -- Submodule level 1
     VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_addr0 := VAR_CAST_TO_uint32_t_uxn_ram_main_h_l29_c11_d9bb_return_output;
     REG_VAR_rwaddr := VAR_CAST_TO_uint32_t_uxn_ram_main_h_l29_c11_d9bb_return_output;
     VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_addr1 := VAR_CAST_TO_uint32_t_uxn_ram_main_h_l31_c11_b5ab_return_output;
     REG_VAR_rdaddr := VAR_CAST_TO_uint32_t_uxn_ram_main_h_l31_c11_b5ab_return_output;
     -- main_ram[uxn_ram_main_h_l36_c31_9ea0] LATENCY=0
     -- Clock enable
     main_ram_uxn_ram_main_h_l36_c31_9ea0_CLOCK_ENABLE <= VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_CLOCK_ENABLE;
     -- Inputs
     main_ram_uxn_ram_main_h_l36_c31_9ea0_addr0 <= VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_addr0;
     main_ram_uxn_ram_main_h_l36_c31_9ea0_wr_data0 <= VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_wr_data0;
     main_ram_uxn_ram_main_h_l36_c31_9ea0_wr_en0 <= VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_wr_en0;
     main_ram_uxn_ram_main_h_l36_c31_9ea0_valid0 <= VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_valid0;
     main_ram_uxn_ram_main_h_l36_c31_9ea0_rd_en0 <= VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_rd_en0;
     main_ram_uxn_ram_main_h_l36_c31_9ea0_addr1 <= VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_addr1;
     main_ram_uxn_ram_main_h_l36_c31_9ea0_valid1 <= VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_valid1;
     main_ram_uxn_ram_main_h_l36_c31_9ea0_rd_en1 <= VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_rd_en1;
     -- Outputs
     VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_return_output := main_ram_uxn_ram_main_h_l36_c31_9ea0_return_output;

     -- Submodule level 2
     -- CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data0_d41d[uxn_ram_main_h_l47_c45_5d2e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data0_d41d_uxn_ram_main_h_l47_c45_5d2e_return_output := VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_return_output.rd_data0;

     -- CONST_REF_RD_uint1_t_main_ram_outputs_t_valid0_d41d[uxn_ram_main_h_l47_c13_c28f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_main_ram_outputs_t_valid0_d41d_uxn_ram_main_h_l47_c13_c28f_return_output := VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_return_output.valid0;

     -- CONST_REF_RD_uint1_t_main_ram_outputs_t_valid1_d41d[uxn_ram_main_h_l48_c13_f159] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_main_ram_outputs_t_valid1_d41d_uxn_ram_main_h_l48_c13_f159_return_output := VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_return_output.valid1;

     -- CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data1_d41d[uxn_ram_main_h_l48_c45_9556] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data1_d41d_uxn_ram_main_h_l48_c45_9556_return_output := VAR_main_ram_uxn_ram_main_h_l36_c31_9ea0_return_output.rd_data1;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_left := VAR_CONST_REF_RD_uint1_t_main_ram_outputs_t_valid0_d41d_uxn_ram_main_h_l47_c13_c28f_return_output;
     VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_left := VAR_CONST_REF_RD_uint1_t_main_ram_outputs_t_valid1_d41d_uxn_ram_main_h_l48_c13_f159_return_output;
     VAR_MUX_uxn_ram_main_h_l47_c13_b95e_iftrue := VAR_CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data0_d41d_uxn_ram_main_h_l47_c45_5d2e_return_output;
     VAR_MUX_uxn_ram_main_h_l48_c13_c9ef_iftrue := VAR_CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data1_d41d_uxn_ram_main_h_l48_c45_9556_return_output;
     -- BIN_OP_AND[uxn_ram_main_h_l48_c13_f82e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_left <= VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_left;
     BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_right <= VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_return_output := BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_return_output;

     -- BIN_OP_AND[uxn_ram_main_h_l47_c13_e618] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_left <= VAR_BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_left;
     BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_right <= VAR_BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_return_output := BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_ram_main_h_l47_c13_b95e_cond := VAR_BIN_OP_AND_uxn_ram_main_h_l47_c13_e618_return_output;
     VAR_MUX_uxn_ram_main_h_l48_c13_c9ef_cond := VAR_BIN_OP_AND_uxn_ram_main_h_l48_c13_f82e_return_output;
     -- MUX[uxn_ram_main_h_l48_c13_c9ef] LATENCY=0
     -- Inputs
     MUX_uxn_ram_main_h_l48_c13_c9ef_cond <= VAR_MUX_uxn_ram_main_h_l48_c13_c9ef_cond;
     MUX_uxn_ram_main_h_l48_c13_c9ef_iftrue <= VAR_MUX_uxn_ram_main_h_l48_c13_c9ef_iftrue;
     MUX_uxn_ram_main_h_l48_c13_c9ef_iffalse <= VAR_MUX_uxn_ram_main_h_l48_c13_c9ef_iffalse;
     -- Outputs
     VAR_MUX_uxn_ram_main_h_l48_c13_c9ef_return_output := MUX_uxn_ram_main_h_l48_c13_c9ef_return_output;

     -- MUX[uxn_ram_main_h_l47_c13_b95e] LATENCY=0
     -- Inputs
     MUX_uxn_ram_main_h_l47_c13_b95e_cond <= VAR_MUX_uxn_ram_main_h_l47_c13_b95e_cond;
     MUX_uxn_ram_main_h_l47_c13_b95e_iftrue <= VAR_MUX_uxn_ram_main_h_l47_c13_b95e_iftrue;
     MUX_uxn_ram_main_h_l47_c13_b95e_iffalse <= VAR_MUX_uxn_ram_main_h_l47_c13_b95e_iffalse;
     -- Outputs
     VAR_MUX_uxn_ram_main_h_l47_c13_b95e_return_output := MUX_uxn_ram_main_h_l47_c13_b95e_return_output;

     -- Submodule level 5
     VAR_CONST_SL_8_uxn_ram_main_h_l50_c21_2c25_x := VAR_MUX_uxn_ram_main_h_l47_c13_b95e_return_output;
     REG_VAR_rdvalue0 := VAR_MUX_uxn_ram_main_h_l47_c13_b95e_return_output;
     VAR_BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_right := VAR_MUX_uxn_ram_main_h_l48_c13_c9ef_return_output;
     REG_VAR_rdvalue1 := VAR_MUX_uxn_ram_main_h_l48_c13_c9ef_return_output;
     -- CONST_SL_8[uxn_ram_main_h_l50_c21_2c25] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_ram_main_h_l50_c21_2c25_x <= VAR_CONST_SL_8_uxn_ram_main_h_l50_c21_2c25_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_ram_main_h_l50_c21_2c25_return_output := CONST_SL_8_uxn_ram_main_h_l50_c21_2c25_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_left := VAR_CONST_SL_8_uxn_ram_main_h_l50_c21_2c25_return_output;
     -- BIN_OP_OR[uxn_ram_main_h_l50_c21_ae7d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_left <= VAR_BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_left;
     BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_right <= VAR_BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_return_output := BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_return_output;

     -- Submodule level 7
     -- CAST_TO_uint16_t[uxn_ram_main_h_l50_c9_a77c] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_ram_main_h_l50_c9_a77c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_BIN_OP_OR_uxn_ram_main_h_l50_c21_ae7d_return_output);

     -- Submodule level 8
     VAR_return_output := VAR_CAST_TO_uint16_t_uxn_ram_main_h_l50_c9_a77c_return_output;
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
 end if;
 end if;
end process;

end arch;
