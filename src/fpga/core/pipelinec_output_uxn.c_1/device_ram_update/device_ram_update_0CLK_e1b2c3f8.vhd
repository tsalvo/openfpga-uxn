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
-- Submodules: 7
entity device_ram_update_0CLK_e1b2c3f8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 address0 : in unsigned(7 downto 0);
 write0_value : in unsigned(7 downto 0);
 write0_enable : in unsigned(0 downto 0);
 address1 : in unsigned(7 downto 0);
 write1_value : in unsigned(7 downto 0);
 write1_enable : in unsigned(0 downto 0);
 return_output : out unsigned(15 downto 0));
end device_ram_update_0CLK_e1b2c3f8;
architecture arch of device_ram_update_0CLK_e1b2c3f8 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal rwaddr0 : unsigned(31 downto 0) := to_unsigned(0, 32);
signal rwaddr1 : unsigned(31 downto 0) := to_unsigned(0, 32);
signal wdata0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal wdata1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal rdvalue0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal rdvalue1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_rwaddr0 : unsigned(31 downto 0);
signal REG_COMB_rwaddr1 : unsigned(31 downto 0);
signal REG_COMB_wdata0 : unsigned(7 downto 0);
signal REG_COMB_wdata1 : unsigned(7 downto 0);
signal REG_COMB_rdvalue0 : unsigned(7 downto 0);
signal REG_COMB_rdvalue1 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(15 downto 0);

-- Each function instance gets signals
-- device_ram[uxn_ram_device_h_l39_c40_b1bf]
signal device_ram_uxn_ram_device_h_l39_c40_b1bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_uxn_ram_device_h_l39_c40_b1bf_addr0 : unsigned(31 downto 0);
signal device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_data0 : unsigned(7 downto 0);
signal device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_en0 : unsigned(0 downto 0);
signal device_ram_uxn_ram_device_h_l39_c40_b1bf_valid0 : unsigned(0 downto 0);
signal device_ram_uxn_ram_device_h_l39_c40_b1bf_addr1 : unsigned(31 downto 0);
signal device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_data1 : unsigned(7 downto 0);
signal device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_en1 : unsigned(0 downto 0);
signal device_ram_uxn_ram_device_h_l39_c40_b1bf_valid1 : unsigned(0 downto 0);
signal device_ram_uxn_ram_device_h_l39_c40_b1bf_return_output : device_ram_outputs_t;

-- CONST_SL_8[uxn_ram_device_h_l54_c2_397f]
signal CONST_SL_8_uxn_ram_device_h_l54_c2_397f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_ram_device_h_l54_c2_397f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_ram_device_h_l55_c2_b1d9]
signal BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_return_output : unsigned(15 downto 0);

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
-- device_ram_uxn_ram_device_h_l39_c40_b1bf
device_ram_uxn_ram_device_h_l39_c40_b1bf : entity work.device_ram_0CLK_b45f1687 port map (
clk,
device_ram_uxn_ram_device_h_l39_c40_b1bf_CLOCK_ENABLE,
device_ram_uxn_ram_device_h_l39_c40_b1bf_addr0,
device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_data0,
device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_en0,
device_ram_uxn_ram_device_h_l39_c40_b1bf_valid0,
device_ram_uxn_ram_device_h_l39_c40_b1bf_addr1,
device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_data1,
device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_en1,
device_ram_uxn_ram_device_h_l39_c40_b1bf_valid1,
device_ram_uxn_ram_device_h_l39_c40_b1bf_return_output);

-- CONST_SL_8_uxn_ram_device_h_l54_c2_397f
CONST_SL_8_uxn_ram_device_h_l54_c2_397f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_ram_device_h_l54_c2_397f_x,
CONST_SL_8_uxn_ram_device_h_l54_c2_397f_return_output);

-- BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9
BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_left,
BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_right,
BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 address0,
 write0_value,
 write0_enable,
 address1,
 write1_value,
 write1_enable,
 -- Registers
 rwaddr0,
 rwaddr1,
 wdata0,
 wdata1,
 rdvalue0,
 rdvalue1,
 result,
 -- All submodule outputs
 device_ram_uxn_ram_device_h_l39_c40_b1bf_return_output,
 CONST_SL_8_uxn_ram_device_h_l54_c2_397f_return_output,
 BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_address0 : unsigned(7 downto 0);
 variable VAR_write0_value : unsigned(7 downto 0);
 variable VAR_write0_enable : unsigned(0 downto 0);
 variable VAR_address1 : unsigned(7 downto 0);
 variable VAR_write1_value : unsigned(7 downto 0);
 variable VAR_write1_enable : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_ram_device_h_l30_c12_47e3_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_ram_device_h_l31_c12_352e_return_output : unsigned(31 downto 0);
 variable VAR_rw_valid0 : unsigned(0 downto 0);
 variable VAR_rw_valid1 : unsigned(0 downto 0);
 variable VAR_device_ram_out : device_ram_outputs_t;
 variable VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_addr0 : unsigned(31 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_data0 : unsigned(7 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_en0 : unsigned(0 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_valid0 : unsigned(0 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_addr1 : unsigned(31 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_data1 : unsigned(7 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_en1 : unsigned(0 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_valid1 : unsigned(0 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_return_output : device_ram_outputs_t;
 variable VAR_CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data0_d41d_uxn_ram_device_h_l50_c13_8a5f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data1_d41d_uxn_ram_device_h_l51_c13_17a8_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_ram_device_h_l53_c11_6ae9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_ram_device_h_l54_c2_397f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_ram_device_h_l54_c2_397f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_left : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_ram_device_h_l55_c13_a261_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_rwaddr0 : unsigned(31 downto 0);
variable REG_VAR_rwaddr1 : unsigned(31 downto 0);
variable REG_VAR_wdata0 : unsigned(7 downto 0);
variable REG_VAR_wdata1 : unsigned(7 downto 0);
variable REG_VAR_rdvalue0 : unsigned(7 downto 0);
variable REG_VAR_rdvalue1 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_rwaddr0 := rwaddr0;
  REG_VAR_rwaddr1 := rwaddr1;
  REG_VAR_wdata0 := wdata0;
  REG_VAR_wdata1 := wdata1;
  REG_VAR_rdvalue0 := rdvalue0;
  REG_VAR_rdvalue1 := rdvalue1;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_valid0 := to_unsigned(1, 1);
     VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_valid1 := to_unsigned(1, 1);

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
     VAR_address1 := address1;
     VAR_write1_value := write1_value;
     VAR_write1_enable := write1_enable;

     -- Submodule level 0
     VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_en0 := VAR_write0_enable;
     VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_data0 := VAR_write0_value;
     REG_VAR_wdata0 := VAR_write0_value;
     VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_en1 := VAR_write1_enable;
     VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_data1 := VAR_write1_value;
     REG_VAR_wdata1 := VAR_write1_value;
     -- CAST_TO_uint32_t[uxn_ram_device_h_l30_c12_47e3] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_device_h_l30_c12_47e3_return_output := CAST_TO_uint32_t_uint8_t(
     VAR_address0);

     -- CAST_TO_uint32_t[uxn_ram_device_h_l31_c12_352e] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_device_h_l31_c12_352e_return_output := CAST_TO_uint32_t_uint8_t(
     VAR_address1);

     -- Submodule level 1
     VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_addr0 := VAR_CAST_TO_uint32_t_uxn_ram_device_h_l30_c12_47e3_return_output;
     REG_VAR_rwaddr0 := VAR_CAST_TO_uint32_t_uxn_ram_device_h_l30_c12_47e3_return_output;
     VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_addr1 := VAR_CAST_TO_uint32_t_uxn_ram_device_h_l31_c12_352e_return_output;
     REG_VAR_rwaddr1 := VAR_CAST_TO_uint32_t_uxn_ram_device_h_l31_c12_352e_return_output;
     -- device_ram[uxn_ram_device_h_l39_c40_b1bf] LATENCY=0
     -- Clock enable
     device_ram_uxn_ram_device_h_l39_c40_b1bf_CLOCK_ENABLE <= VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_CLOCK_ENABLE;
     -- Inputs
     device_ram_uxn_ram_device_h_l39_c40_b1bf_addr0 <= VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_addr0;
     device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_data0 <= VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_data0;
     device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_en0 <= VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_en0;
     device_ram_uxn_ram_device_h_l39_c40_b1bf_valid0 <= VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_valid0;
     device_ram_uxn_ram_device_h_l39_c40_b1bf_addr1 <= VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_addr1;
     device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_data1 <= VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_data1;
     device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_en1 <= VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_wr_en1;
     device_ram_uxn_ram_device_h_l39_c40_b1bf_valid1 <= VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_valid1;
     -- Outputs
     VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_return_output := device_ram_uxn_ram_device_h_l39_c40_b1bf_return_output;

     -- Submodule level 2
     -- CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data1_d41d[uxn_ram_device_h_l51_c13_17a8] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data1_d41d_uxn_ram_device_h_l51_c13_17a8_return_output := VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_return_output.rd_data1;

     -- CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data0_d41d[uxn_ram_device_h_l50_c13_8a5f] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data0_d41d_uxn_ram_device_h_l50_c13_8a5f_return_output := VAR_device_ram_uxn_ram_device_h_l39_c40_b1bf_return_output.rd_data0;

     -- Submodule level 3
     REG_VAR_rdvalue0 := VAR_CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data0_d41d_uxn_ram_device_h_l50_c13_8a5f_return_output;
     REG_VAR_rdvalue1 := VAR_CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data1_d41d_uxn_ram_device_h_l51_c13_17a8_return_output;
     -- CAST_TO_uint16_t[uxn_ram_device_h_l53_c11_6ae9] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_ram_device_h_l53_c11_6ae9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data0_d41d_uxn_ram_device_h_l50_c13_8a5f_return_output);

     -- CAST_TO_uint16_t[uxn_ram_device_h_l55_c13_a261] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_ram_device_h_l55_c13_a261_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_CONST_REF_RD_uint8_t_device_ram_outputs_t_rd_data1_d41d_uxn_ram_device_h_l51_c13_17a8_return_output);

     -- Submodule level 4
     VAR_CONST_SL_8_uxn_ram_device_h_l54_c2_397f_x := VAR_CAST_TO_uint16_t_uxn_ram_device_h_l53_c11_6ae9_return_output;
     VAR_BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_right := VAR_CAST_TO_uint16_t_uxn_ram_device_h_l55_c13_a261_return_output;
     -- CONST_SL_8[uxn_ram_device_h_l54_c2_397f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_ram_device_h_l54_c2_397f_x <= VAR_CONST_SL_8_uxn_ram_device_h_l54_c2_397f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_ram_device_h_l54_c2_397f_return_output := CONST_SL_8_uxn_ram_device_h_l54_c2_397f_return_output;

     -- Submodule level 5
     VAR_BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_left := VAR_CONST_SL_8_uxn_ram_device_h_l54_c2_397f_return_output;
     -- BIN_OP_OR[uxn_ram_device_h_l55_c2_b1d9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_left <= VAR_BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_left;
     BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_right <= VAR_BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_return_output := BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_return_output;

     -- Submodule level 6
     REG_VAR_result := VAR_BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_return_output;
     VAR_return_output := VAR_BIN_OP_OR_uxn_ram_device_h_l55_c2_b1d9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_rwaddr0 <= REG_VAR_rwaddr0;
REG_COMB_rwaddr1 <= REG_VAR_rwaddr1;
REG_COMB_wdata0 <= REG_VAR_wdata0;
REG_COMB_wdata1 <= REG_VAR_wdata1;
REG_COMB_rdvalue0 <= REG_VAR_rdvalue0;
REG_COMB_rdvalue1 <= REG_VAR_rdvalue1;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     rwaddr0 <= REG_COMB_rwaddr0;
     rwaddr1 <= REG_COMB_rwaddr1;
     wdata0 <= REG_COMB_wdata0;
     wdata1 <= REG_COMB_wdata1;
     rdvalue0 <= REG_COMB_rdvalue0;
     rdvalue1 <= REG_COMB_rdvalue1;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
