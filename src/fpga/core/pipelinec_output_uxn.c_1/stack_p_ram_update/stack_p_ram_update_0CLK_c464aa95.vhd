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
entity stack_p_ram_update_0CLK_c464aa95 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 address0 : in unsigned(0 downto 0);
 write0_value : in unsigned(7 downto 0);
 write0_enable : in unsigned(0 downto 0);
 read0_enable : in unsigned(0 downto 0);
 address1 : in unsigned(0 downto 0);
 read1_enable : in unsigned(0 downto 0);
 return_output : out unsigned(15 downto 0));
end stack_p_ram_update_0CLK_c464aa95;
architecture arch of stack_p_ram_update_0CLK_c464aa95 is
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
-- stack_p_ram[uxn_stack_h_l138_c42_ae80]
signal stack_p_ram_uxn_stack_h_l138_c42_ae80_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_p_ram_uxn_stack_h_l138_c42_ae80_addr0 : unsigned(31 downto 0);
signal stack_p_ram_uxn_stack_h_l138_c42_ae80_wr_data0 : unsigned(7 downto 0);
signal stack_p_ram_uxn_stack_h_l138_c42_ae80_wr_en0 : unsigned(0 downto 0);
signal stack_p_ram_uxn_stack_h_l138_c42_ae80_valid0 : unsigned(0 downto 0);
signal stack_p_ram_uxn_stack_h_l138_c42_ae80_addr1 : unsigned(31 downto 0);
signal stack_p_ram_uxn_stack_h_l138_c42_ae80_valid1 : unsigned(0 downto 0);
signal stack_p_ram_uxn_stack_h_l138_c42_ae80_return_output : stack_p_ram_outputs_t;

-- BIN_OP_AND[uxn_stack_h_l147_c13_4bbb]
signal BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_return_output : unsigned(0 downto 0);

-- MUX[uxn_stack_h_l147_c13_bd62]
signal MUX_uxn_stack_h_l147_c13_bd62_cond : unsigned(0 downto 0);
signal MUX_uxn_stack_h_l147_c13_bd62_iftrue : unsigned(7 downto 0);
signal MUX_uxn_stack_h_l147_c13_bd62_iffalse : unsigned(7 downto 0);
signal MUX_uxn_stack_h_l147_c13_bd62_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l148_c13_eba1]
signal BIN_OP_AND_uxn_stack_h_l148_c13_eba1_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_stack_h_l148_c13_eba1_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_stack_h_l148_c13_eba1_return_output : unsigned(0 downto 0);

-- MUX[uxn_stack_h_l148_c13_1aac]
signal MUX_uxn_stack_h_l148_c13_1aac_cond : unsigned(0 downto 0);
signal MUX_uxn_stack_h_l148_c13_1aac_iftrue : unsigned(7 downto 0);
signal MUX_uxn_stack_h_l148_c13_1aac_iffalse : unsigned(7 downto 0);
signal MUX_uxn_stack_h_l148_c13_1aac_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_stack_h_l150_c21_ad31]
signal CONST_SL_8_uxn_stack_h_l150_c21_ad31_x : unsigned(7 downto 0);
signal CONST_SL_8_uxn_stack_h_l150_c21_ad31_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_stack_h_l150_c21_b1ee]
signal BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_return_output : unsigned(7 downto 0);

function CAST_TO_uint32_t_uint1_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(0 downto 0);
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
-- stack_p_ram_uxn_stack_h_l138_c42_ae80
stack_p_ram_uxn_stack_h_l138_c42_ae80 : entity work.stack_p_ram_0CLK_b45f1687 port map (
clk,
stack_p_ram_uxn_stack_h_l138_c42_ae80_CLOCK_ENABLE,
stack_p_ram_uxn_stack_h_l138_c42_ae80_addr0,
stack_p_ram_uxn_stack_h_l138_c42_ae80_wr_data0,
stack_p_ram_uxn_stack_h_l138_c42_ae80_wr_en0,
stack_p_ram_uxn_stack_h_l138_c42_ae80_valid0,
stack_p_ram_uxn_stack_h_l138_c42_ae80_addr1,
stack_p_ram_uxn_stack_h_l138_c42_ae80_valid1,
stack_p_ram_uxn_stack_h_l138_c42_ae80_return_output);

-- BIN_OP_AND_uxn_stack_h_l147_c13_4bbb
BIN_OP_AND_uxn_stack_h_l147_c13_4bbb : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_left,
BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_right,
BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_return_output);

-- MUX_uxn_stack_h_l147_c13_bd62
MUX_uxn_stack_h_l147_c13_bd62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_stack_h_l147_c13_bd62_cond,
MUX_uxn_stack_h_l147_c13_bd62_iftrue,
MUX_uxn_stack_h_l147_c13_bd62_iffalse,
MUX_uxn_stack_h_l147_c13_bd62_return_output);

-- BIN_OP_AND_uxn_stack_h_l148_c13_eba1
BIN_OP_AND_uxn_stack_h_l148_c13_eba1 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l148_c13_eba1_left,
BIN_OP_AND_uxn_stack_h_l148_c13_eba1_right,
BIN_OP_AND_uxn_stack_h_l148_c13_eba1_return_output);

-- MUX_uxn_stack_h_l148_c13_1aac
MUX_uxn_stack_h_l148_c13_1aac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_stack_h_l148_c13_1aac_cond,
MUX_uxn_stack_h_l148_c13_1aac_iftrue,
MUX_uxn_stack_h_l148_c13_1aac_iffalse,
MUX_uxn_stack_h_l148_c13_1aac_return_output);

-- CONST_SL_8_uxn_stack_h_l150_c21_ad31
CONST_SL_8_uxn_stack_h_l150_c21_ad31 : entity work.CONST_SL_8_uint8_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_stack_h_l150_c21_ad31_x,
CONST_SL_8_uxn_stack_h_l150_c21_ad31_return_output);

-- BIN_OP_OR_uxn_stack_h_l150_c21_b1ee
BIN_OP_OR_uxn_stack_h_l150_c21_b1ee : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_left,
BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_right,
BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_return_output);



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
 stack_p_ram_uxn_stack_h_l138_c42_ae80_return_output,
 BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_return_output,
 MUX_uxn_stack_h_l147_c13_bd62_return_output,
 BIN_OP_AND_uxn_stack_h_l148_c13_eba1_return_output,
 MUX_uxn_stack_h_l148_c13_1aac_return_output,
 CONST_SL_8_uxn_stack_h_l150_c21_ad31_return_output,
 BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_address0 : unsigned(0 downto 0);
 variable VAR_write0_value : unsigned(7 downto 0);
 variable VAR_write0_enable : unsigned(0 downto 0);
 variable VAR_read0_enable : unsigned(0 downto 0);
 variable VAR_address1 : unsigned(0 downto 0);
 variable VAR_read1_enable : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_stack_h_l131_c11_c016_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_stack_h_l132_c11_9619_return_output : unsigned(31 downto 0);
 variable VAR_rw_valid : unsigned(0 downto 0);
 variable VAR_rd_valid : unsigned(0 downto 0);
 variable VAR_stack_p_ram_out : stack_p_ram_outputs_t;
 variable VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_addr0 : unsigned(31 downto 0);
 variable VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_wr_data0 : unsigned(7 downto 0);
 variable VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_wr_en0 : unsigned(0 downto 0);
 variable VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_valid0 : unsigned(0 downto 0);
 variable VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_addr1 : unsigned(31 downto 0);
 variable VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_valid1 : unsigned(0 downto 0);
 variable VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_return_output : stack_p_ram_outputs_t;
 variable VAR_MUX_uxn_stack_h_l147_c13_bd62_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_stack_h_l147_c13_bd62_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l147_c13_bd62_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_stack_p_ram_outputs_t_valid0_d41d_uxn_stack_h_l147_c13_e186_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_stack_p_ram_outputs_t_rd_data0_d41d_uxn_stack_h_l147_c53_17a4_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l147_c13_bd62_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l148_c13_1aac_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_stack_h_l148_c13_1aac_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l148_c13_1aac_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_stack_p_ram_outputs_t_valid1_d41d_uxn_stack_h_l148_c13_c71d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l148_c13_eba1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l148_c13_eba1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l148_c13_eba1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_stack_p_ram_outputs_t_rd_data1_d41d_uxn_stack_h_l148_c53_f6b4_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l148_c13_1aac_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_left : unsigned(7 downto 0);
 variable VAR_CONST_SL_8_uxn_stack_h_l150_c21_ad31_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SL_8_uxn_stack_h_l150_c21_ad31_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_stack_h_l150_c9_7b4e_return_output : unsigned(15 downto 0);
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
     VAR_MUX_uxn_stack_h_l148_c13_1aac_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_valid0 := to_unsigned(1, 1);
     VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_valid1 := to_unsigned(1, 1);
     VAR_MUX_uxn_stack_h_l147_c13_bd62_iffalse := resize(to_unsigned(0, 1), 8);

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
     VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_right := VAR_read0_enable;
     VAR_BIN_OP_AND_uxn_stack_h_l148_c13_eba1_right := VAR_read1_enable;
     VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_wr_en0 := VAR_write0_enable;
     VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_wr_data0 := VAR_write0_value;
     REG_VAR_wdata := VAR_write0_value;
     -- CAST_TO_uint32_t[uxn_stack_h_l132_c11_9619] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_stack_h_l132_c11_9619_return_output := CAST_TO_uint32_t_uint1_t(
     VAR_address1);

     -- CAST_TO_uint32_t[uxn_stack_h_l131_c11_c016] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_stack_h_l131_c11_c016_return_output := CAST_TO_uint32_t_uint1_t(
     VAR_address0);

     -- Submodule level 1
     REG_VAR_rwaddr := VAR_CAST_TO_uint32_t_uxn_stack_h_l131_c11_c016_return_output;
     VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_addr0 := VAR_CAST_TO_uint32_t_uxn_stack_h_l131_c11_c016_return_output;
     REG_VAR_rdaddr := VAR_CAST_TO_uint32_t_uxn_stack_h_l132_c11_9619_return_output;
     VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_addr1 := VAR_CAST_TO_uint32_t_uxn_stack_h_l132_c11_9619_return_output;
     -- stack_p_ram[uxn_stack_h_l138_c42_ae80] LATENCY=0
     -- Clock enable
     stack_p_ram_uxn_stack_h_l138_c42_ae80_CLOCK_ENABLE <= VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_CLOCK_ENABLE;
     -- Inputs
     stack_p_ram_uxn_stack_h_l138_c42_ae80_addr0 <= VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_addr0;
     stack_p_ram_uxn_stack_h_l138_c42_ae80_wr_data0 <= VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_wr_data0;
     stack_p_ram_uxn_stack_h_l138_c42_ae80_wr_en0 <= VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_wr_en0;
     stack_p_ram_uxn_stack_h_l138_c42_ae80_valid0 <= VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_valid0;
     stack_p_ram_uxn_stack_h_l138_c42_ae80_addr1 <= VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_addr1;
     stack_p_ram_uxn_stack_h_l138_c42_ae80_valid1 <= VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_valid1;
     -- Outputs
     VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_return_output := stack_p_ram_uxn_stack_h_l138_c42_ae80_return_output;

     -- Submodule level 2
     -- CONST_REF_RD_uint8_t_stack_p_ram_outputs_t_rd_data0_d41d[uxn_stack_h_l147_c53_17a4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_stack_p_ram_outputs_t_rd_data0_d41d_uxn_stack_h_l147_c53_17a4_return_output := VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_return_output.rd_data0;

     -- CONST_REF_RD_uint1_t_stack_p_ram_outputs_t_valid1_d41d[uxn_stack_h_l148_c13_c71d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_stack_p_ram_outputs_t_valid1_d41d_uxn_stack_h_l148_c13_c71d_return_output := VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_return_output.valid1;

     -- CONST_REF_RD_uint1_t_stack_p_ram_outputs_t_valid0_d41d[uxn_stack_h_l147_c13_e186] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_stack_p_ram_outputs_t_valid0_d41d_uxn_stack_h_l147_c13_e186_return_output := VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_return_output.valid0;

     -- CONST_REF_RD_uint8_t_stack_p_ram_outputs_t_rd_data1_d41d[uxn_stack_h_l148_c53_f6b4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_stack_p_ram_outputs_t_rd_data1_d41d_uxn_stack_h_l148_c53_f6b4_return_output := VAR_stack_p_ram_uxn_stack_h_l138_c42_ae80_return_output.rd_data1;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_left := VAR_CONST_REF_RD_uint1_t_stack_p_ram_outputs_t_valid0_d41d_uxn_stack_h_l147_c13_e186_return_output;
     VAR_BIN_OP_AND_uxn_stack_h_l148_c13_eba1_left := VAR_CONST_REF_RD_uint1_t_stack_p_ram_outputs_t_valid1_d41d_uxn_stack_h_l148_c13_c71d_return_output;
     VAR_MUX_uxn_stack_h_l147_c13_bd62_iftrue := VAR_CONST_REF_RD_uint8_t_stack_p_ram_outputs_t_rd_data0_d41d_uxn_stack_h_l147_c53_17a4_return_output;
     VAR_MUX_uxn_stack_h_l148_c13_1aac_iftrue := VAR_CONST_REF_RD_uint8_t_stack_p_ram_outputs_t_rd_data1_d41d_uxn_stack_h_l148_c53_f6b4_return_output;
     -- BIN_OP_AND[uxn_stack_h_l148_c13_eba1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l148_c13_eba1_left <= VAR_BIN_OP_AND_uxn_stack_h_l148_c13_eba1_left;
     BIN_OP_AND_uxn_stack_h_l148_c13_eba1_right <= VAR_BIN_OP_AND_uxn_stack_h_l148_c13_eba1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l148_c13_eba1_return_output := BIN_OP_AND_uxn_stack_h_l148_c13_eba1_return_output;

     -- BIN_OP_AND[uxn_stack_h_l147_c13_4bbb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_left <= VAR_BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_left;
     BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_right <= VAR_BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_return_output := BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_stack_h_l147_c13_bd62_cond := VAR_BIN_OP_AND_uxn_stack_h_l147_c13_4bbb_return_output;
     VAR_MUX_uxn_stack_h_l148_c13_1aac_cond := VAR_BIN_OP_AND_uxn_stack_h_l148_c13_eba1_return_output;
     -- MUX[uxn_stack_h_l147_c13_bd62] LATENCY=0
     -- Inputs
     MUX_uxn_stack_h_l147_c13_bd62_cond <= VAR_MUX_uxn_stack_h_l147_c13_bd62_cond;
     MUX_uxn_stack_h_l147_c13_bd62_iftrue <= VAR_MUX_uxn_stack_h_l147_c13_bd62_iftrue;
     MUX_uxn_stack_h_l147_c13_bd62_iffalse <= VAR_MUX_uxn_stack_h_l147_c13_bd62_iffalse;
     -- Outputs
     VAR_MUX_uxn_stack_h_l147_c13_bd62_return_output := MUX_uxn_stack_h_l147_c13_bd62_return_output;

     -- MUX[uxn_stack_h_l148_c13_1aac] LATENCY=0
     -- Inputs
     MUX_uxn_stack_h_l148_c13_1aac_cond <= VAR_MUX_uxn_stack_h_l148_c13_1aac_cond;
     MUX_uxn_stack_h_l148_c13_1aac_iftrue <= VAR_MUX_uxn_stack_h_l148_c13_1aac_iftrue;
     MUX_uxn_stack_h_l148_c13_1aac_iffalse <= VAR_MUX_uxn_stack_h_l148_c13_1aac_iffalse;
     -- Outputs
     VAR_MUX_uxn_stack_h_l148_c13_1aac_return_output := MUX_uxn_stack_h_l148_c13_1aac_return_output;

     -- Submodule level 5
     VAR_CONST_SL_8_uxn_stack_h_l150_c21_ad31_x := VAR_MUX_uxn_stack_h_l147_c13_bd62_return_output;
     REG_VAR_rdvalue0 := VAR_MUX_uxn_stack_h_l147_c13_bd62_return_output;
     VAR_BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_right := VAR_MUX_uxn_stack_h_l148_c13_1aac_return_output;
     REG_VAR_rdvalue1 := VAR_MUX_uxn_stack_h_l148_c13_1aac_return_output;
     -- CONST_SL_8[uxn_stack_h_l150_c21_ad31] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_stack_h_l150_c21_ad31_x <= VAR_CONST_SL_8_uxn_stack_h_l150_c21_ad31_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_stack_h_l150_c21_ad31_return_output := CONST_SL_8_uxn_stack_h_l150_c21_ad31_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_left := VAR_CONST_SL_8_uxn_stack_h_l150_c21_ad31_return_output;
     -- BIN_OP_OR[uxn_stack_h_l150_c21_b1ee] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_left <= VAR_BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_left;
     BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_right <= VAR_BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_return_output := BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_return_output;

     -- Submodule level 7
     -- CAST_TO_uint16_t[uxn_stack_h_l150_c9_7b4e] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_stack_h_l150_c9_7b4e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_BIN_OP_OR_uxn_stack_h_l150_c21_b1ee_return_output);

     -- Submodule level 8
     VAR_return_output := VAR_CAST_TO_uint16_t_uxn_stack_h_l150_c9_7b4e_return_output;
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
