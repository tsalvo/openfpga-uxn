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
-- Submodules: 4
entity screen_xy_ram_update_0CLK_99656e7d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 write0_address : in unsigned(0 downto 0);
 write0_value : in unsigned(15 downto 0);
 write0_enable : in unsigned(0 downto 0);
 read1_enable : in unsigned(0 downto 0);
 return_output : out unsigned(15 downto 0));
end screen_xy_ram_update_0CLK_99656e7d;
architecture arch of screen_xy_ram_update_0CLK_99656e7d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal rwaddr0 : unsigned(31 downto 0) := to_unsigned(0, 32);
signal wdata : unsigned(15 downto 0) := to_unsigned(0, 16);
signal rdvalue1 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_rwaddr0 : unsigned(31 downto 0);
signal REG_COMB_wdata : unsigned(15 downto 0);
signal REG_COMB_rdvalue1 : unsigned(15 downto 0);

-- Each function instance gets signals
-- screen_xy_ram[uxn_ram_device_h_l32_c46_de86]
signal screen_xy_ram_uxn_ram_device_h_l32_c46_de86_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_xy_ram_uxn_ram_device_h_l32_c46_de86_addr0 : unsigned(31 downto 0);
signal screen_xy_ram_uxn_ram_device_h_l32_c46_de86_wr_data0 : unsigned(15 downto 0);
signal screen_xy_ram_uxn_ram_device_h_l32_c46_de86_wr_en0 : unsigned(0 downto 0);
signal screen_xy_ram_uxn_ram_device_h_l32_c46_de86_valid0 : unsigned(0 downto 0);
signal screen_xy_ram_uxn_ram_device_h_l32_c46_de86_addr1 : unsigned(31 downto 0);
signal screen_xy_ram_uxn_ram_device_h_l32_c46_de86_valid1 : unsigned(0 downto 0);
signal screen_xy_ram_uxn_ram_device_h_l32_c46_de86_return_output : screen_xy_ram_outputs_t;

-- BIN_OP_AND[uxn_ram_device_h_l41_c13_f420]
signal BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_return_output : unsigned(0 downto 0);

-- MUX[uxn_ram_device_h_l41_c13_586f]
signal MUX_uxn_ram_device_h_l41_c13_586f_cond : unsigned(0 downto 0);
signal MUX_uxn_ram_device_h_l41_c13_586f_iftrue : unsigned(15 downto 0);
signal MUX_uxn_ram_device_h_l41_c13_586f_iffalse : unsigned(15 downto 0);
signal MUX_uxn_ram_device_h_l41_c13_586f_return_output : unsigned(15 downto 0);

function CAST_TO_uint32_t_uint1_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(0 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- screen_xy_ram_uxn_ram_device_h_l32_c46_de86
screen_xy_ram_uxn_ram_device_h_l32_c46_de86 : entity work.screen_xy_ram_0CLK_b45f1687 port map (
clk,
screen_xy_ram_uxn_ram_device_h_l32_c46_de86_CLOCK_ENABLE,
screen_xy_ram_uxn_ram_device_h_l32_c46_de86_addr0,
screen_xy_ram_uxn_ram_device_h_l32_c46_de86_wr_data0,
screen_xy_ram_uxn_ram_device_h_l32_c46_de86_wr_en0,
screen_xy_ram_uxn_ram_device_h_l32_c46_de86_valid0,
screen_xy_ram_uxn_ram_device_h_l32_c46_de86_addr1,
screen_xy_ram_uxn_ram_device_h_l32_c46_de86_valid1,
screen_xy_ram_uxn_ram_device_h_l32_c46_de86_return_output);

-- BIN_OP_AND_uxn_ram_device_h_l41_c13_f420
BIN_OP_AND_uxn_ram_device_h_l41_c13_f420 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_left,
BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_right,
BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_return_output);

-- MUX_uxn_ram_device_h_l41_c13_586f
MUX_uxn_ram_device_h_l41_c13_586f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_ram_device_h_l41_c13_586f_cond,
MUX_uxn_ram_device_h_l41_c13_586f_iftrue,
MUX_uxn_ram_device_h_l41_c13_586f_iffalse,
MUX_uxn_ram_device_h_l41_c13_586f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 write0_address,
 write0_value,
 write0_enable,
 read1_enable,
 -- Registers
 rwaddr0,
 wdata,
 rdvalue1,
 -- All submodule outputs
 screen_xy_ram_uxn_ram_device_h_l32_c46_de86_return_output,
 BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_return_output,
 MUX_uxn_ram_device_h_l41_c13_586f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_write0_address : unsigned(0 downto 0);
 variable VAR_write0_value : unsigned(15 downto 0);
 variable VAR_write0_enable : unsigned(0 downto 0);
 variable VAR_read1_enable : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_ram_device_h_l26_c12_a593_return_output : unsigned(31 downto 0);
 variable VAR_rw_valid : unsigned(0 downto 0);
 variable VAR_rd_valid : unsigned(0 downto 0);
 variable VAR_screen_xy_ram_out : screen_xy_ram_outputs_t;
 variable VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_addr0 : unsigned(31 downto 0);
 variable VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_wr_data0 : unsigned(15 downto 0);
 variable VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_wr_en0 : unsigned(0 downto 0);
 variable VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_valid0 : unsigned(0 downto 0);
 variable VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_addr1 : unsigned(31 downto 0);
 variable VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_valid1 : unsigned(0 downto 0);
 variable VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_return_output : screen_xy_ram_outputs_t;
 variable VAR_MUX_uxn_ram_device_h_l41_c13_586f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_ram_device_h_l41_c13_586f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_ram_device_h_l41_c13_586f_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_xy_ram_outputs_t_valid1_d41d_uxn_ram_device_h_l41_c13_ec85_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_xy_ram_outputs_t_rd_data1_d41d_uxn_ram_device_h_l41_c55_9f05_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_ram_device_h_l41_c13_586f_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_rwaddr0 : unsigned(31 downto 0);
variable REG_VAR_wdata : unsigned(15 downto 0);
variable REG_VAR_rdvalue1 : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_rwaddr0 := rwaddr0;
  REG_VAR_wdata := wdata;
  REG_VAR_rdvalue1 := rdvalue1;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_valid1 := to_unsigned(1, 1);
     VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_addr1 := resize(to_unsigned(0, 1), 32);
     VAR_MUX_uxn_ram_device_h_l41_c13_586f_iffalse := resize(to_unsigned(0, 1), 16);
     VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_valid0 := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_write0_address := write0_address;
     VAR_write0_value := write0_value;
     VAR_write0_enable := write0_enable;
     VAR_read1_enable := read1_enable;

     -- Submodule level 0
     VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_right := VAR_read1_enable;
     VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_wr_en0 := VAR_write0_enable;
     VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_wr_data0 := VAR_write0_value;
     REG_VAR_wdata := VAR_write0_value;
     -- CAST_TO_uint32_t[uxn_ram_device_h_l26_c12_a593] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_device_h_l26_c12_a593_return_output := CAST_TO_uint32_t_uint1_t(
     VAR_write0_address);

     -- Submodule level 1
     REG_VAR_rwaddr0 := VAR_CAST_TO_uint32_t_uxn_ram_device_h_l26_c12_a593_return_output;
     VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_addr0 := VAR_CAST_TO_uint32_t_uxn_ram_device_h_l26_c12_a593_return_output;
     -- screen_xy_ram[uxn_ram_device_h_l32_c46_de86] LATENCY=0
     -- Clock enable
     screen_xy_ram_uxn_ram_device_h_l32_c46_de86_CLOCK_ENABLE <= VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_CLOCK_ENABLE;
     -- Inputs
     screen_xy_ram_uxn_ram_device_h_l32_c46_de86_addr0 <= VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_addr0;
     screen_xy_ram_uxn_ram_device_h_l32_c46_de86_wr_data0 <= VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_wr_data0;
     screen_xy_ram_uxn_ram_device_h_l32_c46_de86_wr_en0 <= VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_wr_en0;
     screen_xy_ram_uxn_ram_device_h_l32_c46_de86_valid0 <= VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_valid0;
     screen_xy_ram_uxn_ram_device_h_l32_c46_de86_addr1 <= VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_addr1;
     screen_xy_ram_uxn_ram_device_h_l32_c46_de86_valid1 <= VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_valid1;
     -- Outputs
     VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_return_output := screen_xy_ram_uxn_ram_device_h_l32_c46_de86_return_output;

     -- Submodule level 2
     -- CONST_REF_RD_uint1_t_screen_xy_ram_outputs_t_valid1_d41d[uxn_ram_device_h_l41_c13_ec85] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_xy_ram_outputs_t_valid1_d41d_uxn_ram_device_h_l41_c13_ec85_return_output := VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_return_output.valid1;

     -- CONST_REF_RD_uint16_t_screen_xy_ram_outputs_t_rd_data1_d41d[uxn_ram_device_h_l41_c55_9f05] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_xy_ram_outputs_t_rd_data1_d41d_uxn_ram_device_h_l41_c55_9f05_return_output := VAR_screen_xy_ram_uxn_ram_device_h_l32_c46_de86_return_output.rd_data1;

     -- Submodule level 3
     VAR_MUX_uxn_ram_device_h_l41_c13_586f_iftrue := VAR_CONST_REF_RD_uint16_t_screen_xy_ram_outputs_t_rd_data1_d41d_uxn_ram_device_h_l41_c55_9f05_return_output;
     VAR_BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_left := VAR_CONST_REF_RD_uint1_t_screen_xy_ram_outputs_t_valid1_d41d_uxn_ram_device_h_l41_c13_ec85_return_output;
     -- BIN_OP_AND[uxn_ram_device_h_l41_c13_f420] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_left <= VAR_BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_left;
     BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_right <= VAR_BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_return_output := BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_ram_device_h_l41_c13_586f_cond := VAR_BIN_OP_AND_uxn_ram_device_h_l41_c13_f420_return_output;
     -- MUX[uxn_ram_device_h_l41_c13_586f] LATENCY=0
     -- Inputs
     MUX_uxn_ram_device_h_l41_c13_586f_cond <= VAR_MUX_uxn_ram_device_h_l41_c13_586f_cond;
     MUX_uxn_ram_device_h_l41_c13_586f_iftrue <= VAR_MUX_uxn_ram_device_h_l41_c13_586f_iftrue;
     MUX_uxn_ram_device_h_l41_c13_586f_iffalse <= VAR_MUX_uxn_ram_device_h_l41_c13_586f_iffalse;
     -- Outputs
     VAR_MUX_uxn_ram_device_h_l41_c13_586f_return_output := MUX_uxn_ram_device_h_l41_c13_586f_return_output;

     -- Submodule level 5
     REG_VAR_rdvalue1 := VAR_MUX_uxn_ram_device_h_l41_c13_586f_return_output;
     VAR_return_output := VAR_MUX_uxn_ram_device_h_l41_c13_586f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_rwaddr0 <= REG_VAR_rwaddr0;
REG_COMB_wdata <= REG_VAR_wdata;
REG_COMB_rdvalue1 <= REG_VAR_rdvalue1;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     rwaddr0 <= REG_COMB_rwaddr0;
     wdata <= REG_COMB_wdata;
     rdvalue1 <= REG_COMB_rdvalue1;
 end if;
 end if;
end process;

end arch;
