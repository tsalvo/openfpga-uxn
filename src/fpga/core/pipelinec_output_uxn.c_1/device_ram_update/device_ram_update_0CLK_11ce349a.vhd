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
-- Submodules: 11
entity device_ram_update_0CLK_11ce349a is
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
end device_ram_update_0CLK_11ce349a;
architecture arch of device_ram_update_0CLK_11ce349a is
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
-- device_ram[uxn_ram_device_h_l38_c40_fda8]
signal device_ram_uxn_ram_device_h_l38_c40_fda8_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_uxn_ram_device_h_l38_c40_fda8_addr0 : unsigned(31 downto 0);
signal device_ram_uxn_ram_device_h_l38_c40_fda8_wr_data0 : unsigned(7 downto 0);
signal device_ram_uxn_ram_device_h_l38_c40_fda8_wr_en0 : unsigned(0 downto 0);
signal device_ram_uxn_ram_device_h_l38_c40_fda8_valid0 : unsigned(0 downto 0);
signal device_ram_uxn_ram_device_h_l38_c40_fda8_rd_en0 : unsigned(0 downto 0);
signal device_ram_uxn_ram_device_h_l38_c40_fda8_addr1 : unsigned(31 downto 0);
signal device_ram_uxn_ram_device_h_l38_c40_fda8_valid1 : unsigned(0 downto 0);
signal device_ram_uxn_ram_device_h_l38_c40_fda8_rd_en1 : unsigned(0 downto 0);
signal device_ram_uxn_ram_device_h_l38_c40_fda8_return_output : device_ram_outputs_t;

-- BIN_OP_AND[uxn_ram_device_h_l49_c13_3d41]
signal BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_return_output : unsigned(0 downto 0);

-- MUX[uxn_ram_device_h_l49_c13_6331]
signal MUX_uxn_ram_device_h_l49_c13_6331_cond : unsigned(0 downto 0);
signal MUX_uxn_ram_device_h_l49_c13_6331_iftrue : unsigned(7 downto 0);
signal MUX_uxn_ram_device_h_l49_c13_6331_iffalse : unsigned(7 downto 0);
signal MUX_uxn_ram_device_h_l49_c13_6331_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_ram_device_h_l50_c13_210b]
signal BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_return_output : unsigned(0 downto 0);

-- MUX[uxn_ram_device_h_l50_c13_200b]
signal MUX_uxn_ram_device_h_l50_c13_200b_cond : unsigned(0 downto 0);
signal MUX_uxn_ram_device_h_l50_c13_200b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_ram_device_h_l50_c13_200b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_ram_device_h_l50_c13_200b_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_ram_device_h_l53_c2_31a3]
signal CONST_SL_8_uxn_ram_device_h_l53_c2_31a3_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_ram_device_h_l53_c2_31a3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_ram_device_h_l54_c2_c02a]
signal BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_return_output : unsigned(15 downto 0);

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
-- device_ram_uxn_ram_device_h_l38_c40_fda8
device_ram_uxn_ram_device_h_l38_c40_fda8 : entity work.device_ram_0CLK_b45f1687 port map (
clk,
device_ram_uxn_ram_device_h_l38_c40_fda8_CLOCK_ENABLE,
device_ram_uxn_ram_device_h_l38_c40_fda8_addr0,
device_ram_uxn_ram_device_h_l38_c40_fda8_wr_data0,
device_ram_uxn_ram_device_h_l38_c40_fda8_wr_en0,
device_ram_uxn_ram_device_h_l38_c40_fda8_valid0,
device_ram_uxn_ram_device_h_l38_c40_fda8_rd_en0,
device_ram_uxn_ram_device_h_l38_c40_fda8_addr1,
device_ram_uxn_ram_device_h_l38_c40_fda8_valid1,
device_ram_uxn_ram_device_h_l38_c40_fda8_rd_en1,
device_ram_uxn_ram_device_h_l38_c40_fda8_return_output);

-- BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41
BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_left,
BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_right,
BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_return_output);

-- MUX_uxn_ram_device_h_l49_c13_6331
MUX_uxn_ram_device_h_l49_c13_6331 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_ram_device_h_l49_c13_6331_cond,
MUX_uxn_ram_device_h_l49_c13_6331_iftrue,
MUX_uxn_ram_device_h_l49_c13_6331_iffalse,
MUX_uxn_ram_device_h_l49_c13_6331_return_output);

-- BIN_OP_AND_uxn_ram_device_h_l50_c13_210b
BIN_OP_AND_uxn_ram_device_h_l50_c13_210b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_left,
BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_right,
BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_return_output);

-- MUX_uxn_ram_device_h_l50_c13_200b
MUX_uxn_ram_device_h_l50_c13_200b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_ram_device_h_l50_c13_200b_cond,
MUX_uxn_ram_device_h_l50_c13_200b_iftrue,
MUX_uxn_ram_device_h_l50_c13_200b_iffalse,
MUX_uxn_ram_device_h_l50_c13_200b_return_output);

-- CONST_SL_8_uxn_ram_device_h_l53_c2_31a3
CONST_SL_8_uxn_ram_device_h_l53_c2_31a3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_ram_device_h_l53_c2_31a3_x,
CONST_SL_8_uxn_ram_device_h_l53_c2_31a3_return_output);

-- BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a
BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_left,
BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_right,
BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_return_output);



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
 device_ram_uxn_ram_device_h_l38_c40_fda8_return_output,
 BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_return_output,
 MUX_uxn_ram_device_h_l49_c13_6331_return_output,
 BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_return_output,
 MUX_uxn_ram_device_h_l50_c13_200b_return_output,
 CONST_SL_8_uxn_ram_device_h_l53_c2_31a3_return_output,
 BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_return_output)
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
 variable VAR_CAST_TO_uint32_t_uxn_ram_device_h_l31_c11_8ed6_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_ram_device_h_l32_c11_4b96_return_output : unsigned(31 downto 0);
 variable VAR_rw_valid : unsigned(0 downto 0);
 variable VAR_rd_valid : unsigned(0 downto 0);
 variable VAR_device_ram_out : device_ram_outputs_t;
 variable VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_addr0 : unsigned(31 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_wr_data0 : unsigned(7 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_wr_en0 : unsigned(0 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_valid0 : unsigned(0 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_rd_en0 : unsigned(0 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_addr1 : unsigned(31 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_valid1 : unsigned(0 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_rd_en1 : unsigned(0 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_return_output : device_ram_outputs_t;
 variable VAR_MUX_uxn_ram_device_h_l49_c13_6331_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_ram_device_h_l49_c13_6331_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_device_h_l49_c13_6331_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_ram_outputs_t_valid0_d41d_uxn_ram_device_h_l49_c13_8404_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data0_d41d_uxn_ram_device_h_l49_c52_975b_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_device_h_l49_c13_6331_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_device_h_l50_c13_200b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_ram_device_h_l50_c13_200b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_device_h_l50_c13_200b_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_ram_outputs_t_valid1_d41d_uxn_ram_device_h_l50_c13_1ee1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data1_d41d_uxn_ram_device_h_l50_c52_62fd_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_device_h_l50_c13_200b_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_ram_device_h_l52_c11_bb1c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_ram_device_h_l53_c2_31a3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_ram_device_h_l53_c2_31a3_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_left : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_ram_device_h_l54_c13_3c7c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_return_output : unsigned(15 downto 0);
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
     VAR_MUX_uxn_ram_device_h_l49_c13_6331_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_valid1 := to_unsigned(1, 1);
     VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_valid0 := to_unsigned(1, 1);
     VAR_MUX_uxn_ram_device_h_l50_c13_200b_iffalse := resize(to_unsigned(0, 1), 8);

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
     VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_right := VAR_read0_enable;
     VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_rd_en0 := VAR_read0_enable;
     VAR_BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_right := VAR_read1_enable;
     VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_rd_en1 := VAR_read1_enable;
     VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_wr_en0 := VAR_write0_enable;
     VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_wr_data0 := VAR_write0_value;
     REG_VAR_wdata := VAR_write0_value;
     -- CAST_TO_uint32_t[uxn_ram_device_h_l32_c11_4b96] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_device_h_l32_c11_4b96_return_output := CAST_TO_uint32_t_uint8_t(
     VAR_address1);

     -- CAST_TO_uint32_t[uxn_ram_device_h_l31_c11_8ed6] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_device_h_l31_c11_8ed6_return_output := CAST_TO_uint32_t_uint8_t(
     VAR_address0);

     -- Submodule level 1
     VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_addr0 := VAR_CAST_TO_uint32_t_uxn_ram_device_h_l31_c11_8ed6_return_output;
     REG_VAR_rwaddr := VAR_CAST_TO_uint32_t_uxn_ram_device_h_l31_c11_8ed6_return_output;
     VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_addr1 := VAR_CAST_TO_uint32_t_uxn_ram_device_h_l32_c11_4b96_return_output;
     REG_VAR_rdaddr := VAR_CAST_TO_uint32_t_uxn_ram_device_h_l32_c11_4b96_return_output;
     -- device_ram[uxn_ram_device_h_l38_c40_fda8] LATENCY=0
     -- Clock enable
     device_ram_uxn_ram_device_h_l38_c40_fda8_CLOCK_ENABLE <= VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_CLOCK_ENABLE;
     -- Inputs
     device_ram_uxn_ram_device_h_l38_c40_fda8_addr0 <= VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_addr0;
     device_ram_uxn_ram_device_h_l38_c40_fda8_wr_data0 <= VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_wr_data0;
     device_ram_uxn_ram_device_h_l38_c40_fda8_wr_en0 <= VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_wr_en0;
     device_ram_uxn_ram_device_h_l38_c40_fda8_valid0 <= VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_valid0;
     device_ram_uxn_ram_device_h_l38_c40_fda8_rd_en0 <= VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_rd_en0;
     device_ram_uxn_ram_device_h_l38_c40_fda8_addr1 <= VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_addr1;
     device_ram_uxn_ram_device_h_l38_c40_fda8_valid1 <= VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_valid1;
     device_ram_uxn_ram_device_h_l38_c40_fda8_rd_en1 <= VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_rd_en1;
     -- Outputs
     VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_return_output := device_ram_uxn_ram_device_h_l38_c40_fda8_return_output;

     -- Submodule level 2
     -- CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data0_d41d[uxn_ram_device_h_l49_c52_975b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data0_d41d_uxn_ram_device_h_l49_c52_975b_return_output := VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_return_output.rd_data0;

     -- CONST_REF_RD_uint1_t_device_ram_outputs_t_valid0_d41d[uxn_ram_device_h_l49_c13_8404] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_ram_outputs_t_valid0_d41d_uxn_ram_device_h_l49_c13_8404_return_output := VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_return_output.valid0;

     -- CONST_REF_RD_uint1_t_device_ram_outputs_t_valid1_d41d[uxn_ram_device_h_l50_c13_1ee1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_ram_outputs_t_valid1_d41d_uxn_ram_device_h_l50_c13_1ee1_return_output := VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_return_output.valid1;

     -- CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data1_d41d[uxn_ram_device_h_l50_c52_62fd] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data1_d41d_uxn_ram_device_h_l50_c52_62fd_return_output := VAR_device_ram_uxn_ram_device_h_l38_c40_fda8_return_output.rd_data1;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_left := VAR_CONST_REF_RD_uint1_t_device_ram_outputs_t_valid0_d41d_uxn_ram_device_h_l49_c13_8404_return_output;
     VAR_BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_left := VAR_CONST_REF_RD_uint1_t_device_ram_outputs_t_valid1_d41d_uxn_ram_device_h_l50_c13_1ee1_return_output;
     VAR_MUX_uxn_ram_device_h_l49_c13_6331_iftrue := VAR_CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data0_d41d_uxn_ram_device_h_l49_c52_975b_return_output;
     VAR_MUX_uxn_ram_device_h_l50_c13_200b_iftrue := VAR_CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data1_d41d_uxn_ram_device_h_l50_c52_62fd_return_output;
     -- BIN_OP_AND[uxn_ram_device_h_l50_c13_210b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_left <= VAR_BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_left;
     BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_right <= VAR_BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_return_output := BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_return_output;

     -- BIN_OP_AND[uxn_ram_device_h_l49_c13_3d41] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_left <= VAR_BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_left;
     BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_right <= VAR_BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_return_output := BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_ram_device_h_l49_c13_6331_cond := VAR_BIN_OP_AND_uxn_ram_device_h_l49_c13_3d41_return_output;
     VAR_MUX_uxn_ram_device_h_l50_c13_200b_cond := VAR_BIN_OP_AND_uxn_ram_device_h_l50_c13_210b_return_output;
     -- MUX[uxn_ram_device_h_l49_c13_6331] LATENCY=0
     -- Inputs
     MUX_uxn_ram_device_h_l49_c13_6331_cond <= VAR_MUX_uxn_ram_device_h_l49_c13_6331_cond;
     MUX_uxn_ram_device_h_l49_c13_6331_iftrue <= VAR_MUX_uxn_ram_device_h_l49_c13_6331_iftrue;
     MUX_uxn_ram_device_h_l49_c13_6331_iffalse <= VAR_MUX_uxn_ram_device_h_l49_c13_6331_iffalse;
     -- Outputs
     VAR_MUX_uxn_ram_device_h_l49_c13_6331_return_output := MUX_uxn_ram_device_h_l49_c13_6331_return_output;

     -- MUX[uxn_ram_device_h_l50_c13_200b] LATENCY=0
     -- Inputs
     MUX_uxn_ram_device_h_l50_c13_200b_cond <= VAR_MUX_uxn_ram_device_h_l50_c13_200b_cond;
     MUX_uxn_ram_device_h_l50_c13_200b_iftrue <= VAR_MUX_uxn_ram_device_h_l50_c13_200b_iftrue;
     MUX_uxn_ram_device_h_l50_c13_200b_iffalse <= VAR_MUX_uxn_ram_device_h_l50_c13_200b_iffalse;
     -- Outputs
     VAR_MUX_uxn_ram_device_h_l50_c13_200b_return_output := MUX_uxn_ram_device_h_l50_c13_200b_return_output;

     -- Submodule level 5
     REG_VAR_rdvalue0 := VAR_MUX_uxn_ram_device_h_l49_c13_6331_return_output;
     REG_VAR_rdvalue1 := VAR_MUX_uxn_ram_device_h_l50_c13_200b_return_output;
     -- CAST_TO_uint16_t[uxn_ram_device_h_l54_c13_3c7c] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_ram_device_h_l54_c13_3c7c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_MUX_uxn_ram_device_h_l50_c13_200b_return_output);

     -- CAST_TO_uint16_t[uxn_ram_device_h_l52_c11_bb1c] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_ram_device_h_l52_c11_bb1c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_MUX_uxn_ram_device_h_l49_c13_6331_return_output);

     -- Submodule level 6
     VAR_CONST_SL_8_uxn_ram_device_h_l53_c2_31a3_x := VAR_CAST_TO_uint16_t_uxn_ram_device_h_l52_c11_bb1c_return_output;
     VAR_BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_right := VAR_CAST_TO_uint16_t_uxn_ram_device_h_l54_c13_3c7c_return_output;
     -- CONST_SL_8[uxn_ram_device_h_l53_c2_31a3] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_ram_device_h_l53_c2_31a3_x <= VAR_CONST_SL_8_uxn_ram_device_h_l53_c2_31a3_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_ram_device_h_l53_c2_31a3_return_output := CONST_SL_8_uxn_ram_device_h_l53_c2_31a3_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_left := VAR_CONST_SL_8_uxn_ram_device_h_l53_c2_31a3_return_output;
     -- BIN_OP_OR[uxn_ram_device_h_l54_c2_c02a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_left <= VAR_BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_left;
     BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_right <= VAR_BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_return_output := BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_return_output;

     -- Submodule level 8
     REG_VAR_result := VAR_BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_return_output;
     VAR_return_output := VAR_BIN_OP_OR_uxn_ram_device_h_l54_c2_c02a_return_output;
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
