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
-- Submodules: 9
entity system_dei_0CLK_5e0132c5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end system_dei_0CLK_5e0132c5;
architecture arch of system_dei_0CLK_5e0132c5 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : device_in_result_t := (
device_ram_address => to_unsigned(0, 8),
dei_value => to_unsigned(0, 8),
is_dei_done => to_unsigned(0, 1))
;
signal REG_COMB_result : device_in_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l276_c6_0416]
signal BIN_OP_EQ_uxn_device_h_l276_c6_0416_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l276_c6_0416_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l276_c6_0416_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l281_c7_90cb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l276_c2_e6f2]
signal result_MUX_uxn_device_h_l276_c2_e6f2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l276_c2_e6f2_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l276_c2_e6f2_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l276_c2_e6f2_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l281_c11_a5a2]
signal BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l286_c1_91ab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l281_c7_90cb]
signal result_MUX_uxn_device_h_l281_c7_90cb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l281_c7_90cb_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l281_c7_90cb_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l281_c7_90cb_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l287_c12_1f59]
signal generic_dei_uxn_device_h_l287_c12_1f59_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l287_c12_1f59_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l287_c12_1f59_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l287_c12_1f59_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l287_c12_1f59_return_output : device_in_result_t;

function CONST_REF_RD_device_in_result_t_device_in_result_t_5662( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return device_in_result_t is
 
  variable base : device_in_result_t; 
  variable return_output : device_in_result_t;
begin
      base.device_ram_address := ref_toks_0;
      base.dei_value := ref_toks_1;
      base.is_dei_done := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l276_c6_0416
BIN_OP_EQ_uxn_device_h_l276_c6_0416 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l276_c6_0416_left,
BIN_OP_EQ_uxn_device_h_l276_c6_0416_right,
BIN_OP_EQ_uxn_device_h_l276_c6_0416_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_return_output);

-- result_MUX_uxn_device_h_l276_c2_e6f2
result_MUX_uxn_device_h_l276_c2_e6f2 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l276_c2_e6f2_cond,
result_MUX_uxn_device_h_l276_c2_e6f2_iftrue,
result_MUX_uxn_device_h_l276_c2_e6f2_iffalse,
result_MUX_uxn_device_h_l276_c2_e6f2_return_output);

-- BIN_OP_EQ_uxn_device_h_l281_c11_a5a2
BIN_OP_EQ_uxn_device_h_l281_c11_a5a2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_left,
BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_right,
BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_return_output);

-- result_MUX_uxn_device_h_l281_c7_90cb
result_MUX_uxn_device_h_l281_c7_90cb : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l281_c7_90cb_cond,
result_MUX_uxn_device_h_l281_c7_90cb_iftrue,
result_MUX_uxn_device_h_l281_c7_90cb_iffalse,
result_MUX_uxn_device_h_l281_c7_90cb_return_output);

-- generic_dei_uxn_device_h_l287_c12_1f59
generic_dei_uxn_device_h_l287_c12_1f59 : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l287_c12_1f59_CLOCK_ENABLE,
generic_dei_uxn_device_h_l287_c12_1f59_device_address,
generic_dei_uxn_device_h_l287_c12_1f59_phase,
generic_dei_uxn_device_h_l287_c12_1f59_previous_device_ram_read,
generic_dei_uxn_device_h_l287_c12_1f59_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 previous_device_ram_read,
 -- Registers
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l276_c6_0416_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_return_output,
 result_MUX_uxn_device_h_l276_c2_e6f2_return_output,
 BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_return_output,
 result_MUX_uxn_device_h_l281_c7_90cb_return_output,
 generic_dei_uxn_device_h_l287_c12_1f59_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l276_c6_0416_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l276_c6_0416_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l276_c6_0416_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l276_c2_e6f2_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l276_c2_e6f2_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l276_c2_e6f2_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l281_c7_90cb_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l276_c2_e6f2_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l276_c2_e6f2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l277_c3_d47e : unsigned(7 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l278_c3_064d : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l281_c7_90cb_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l281_c7_90cb_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l281_c7_90cb_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l281_c7_90cb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l282_c3_b092 : unsigned(7 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l283_c3_eb38 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l287_c12_1f59_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l287_c12_1f59_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l287_c12_1f59_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l287_c12_1f59_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l287_c12_1f59_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_dei_value_uxn_device_h_l278_c3_064d := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l282_c3_b092 := resize(to_unsigned(0, 1), 8);
     VAR_result_dei_value_uxn_device_h_l283_c3_eb38 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l277_c3_d47e := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_right := to_unsigned(5, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l276_c6_0416_right := to_unsigned(4, 8);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l281_c7_90cb] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l281_c7_90cb_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l282_c3_b092,
     VAR_result_dei_value_uxn_device_h_l283_c3_eb38,
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l276_c2_e6f2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l276_c2_e6f2_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l277_c3_d47e,
     VAR_result_dei_value_uxn_device_h_l278_c3_064d,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l281_c7_90cb_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l281_c7_90cb_return_output;
     VAR_result_MUX_uxn_device_h_l276_c2_e6f2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l276_c2_e6f2_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_phase := phase;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_device_h_l276_c6_0416_left := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_left := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l287_c12_1f59_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l287_c12_1f59_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l287_c12_1f59_previous_device_ram_read := VAR_previous_device_ram_read;
     -- BIN_OP_EQ[uxn_device_h_l276_c6_0416] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l276_c6_0416_left <= VAR_BIN_OP_EQ_uxn_device_h_l276_c6_0416_left;
     BIN_OP_EQ_uxn_device_h_l276_c6_0416_right <= VAR_BIN_OP_EQ_uxn_device_h_l276_c6_0416_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l276_c6_0416_return_output := BIN_OP_EQ_uxn_device_h_l276_c6_0416_return_output;

     -- BIN_OP_EQ[uxn_device_h_l281_c11_a5a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_left <= VAR_BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_left;
     BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_right <= VAR_BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_return_output := BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_cond := VAR_BIN_OP_EQ_uxn_device_h_l276_c6_0416_return_output;
     VAR_result_MUX_uxn_device_h_l276_c2_e6f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l276_c6_0416_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_return_output;
     VAR_result_MUX_uxn_device_h_l281_c7_90cb_cond := VAR_BIN_OP_EQ_uxn_device_h_l281_c11_a5a2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l281_c7_90cb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_90cb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l286_c1_91ab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_return_output;

     -- Submodule level 3
     VAR_generic_dei_uxn_device_h_l287_c12_1f59_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_91ab_return_output;
     -- generic_dei[uxn_device_h_l287_c12_1f59] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l287_c12_1f59_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l287_c12_1f59_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l287_c12_1f59_device_address <= VAR_generic_dei_uxn_device_h_l287_c12_1f59_device_address;
     generic_dei_uxn_device_h_l287_c12_1f59_phase <= VAR_generic_dei_uxn_device_h_l287_c12_1f59_phase;
     generic_dei_uxn_device_h_l287_c12_1f59_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l287_c12_1f59_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l287_c12_1f59_return_output := generic_dei_uxn_device_h_l287_c12_1f59_return_output;

     -- Submodule level 4
     VAR_result_MUX_uxn_device_h_l281_c7_90cb_iffalse := VAR_generic_dei_uxn_device_h_l287_c12_1f59_return_output;
     -- result_MUX[uxn_device_h_l281_c7_90cb] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l281_c7_90cb_cond <= VAR_result_MUX_uxn_device_h_l281_c7_90cb_cond;
     result_MUX_uxn_device_h_l281_c7_90cb_iftrue <= VAR_result_MUX_uxn_device_h_l281_c7_90cb_iftrue;
     result_MUX_uxn_device_h_l281_c7_90cb_iffalse <= VAR_result_MUX_uxn_device_h_l281_c7_90cb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l281_c7_90cb_return_output := result_MUX_uxn_device_h_l281_c7_90cb_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_device_h_l276_c2_e6f2_iffalse := VAR_result_MUX_uxn_device_h_l281_c7_90cb_return_output;
     -- result_MUX[uxn_device_h_l276_c2_e6f2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l276_c2_e6f2_cond <= VAR_result_MUX_uxn_device_h_l276_c2_e6f2_cond;
     result_MUX_uxn_device_h_l276_c2_e6f2_iftrue <= VAR_result_MUX_uxn_device_h_l276_c2_e6f2_iftrue;
     result_MUX_uxn_device_h_l276_c2_e6f2_iffalse <= VAR_result_MUX_uxn_device_h_l276_c2_e6f2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l276_c2_e6f2_return_output := result_MUX_uxn_device_h_l276_c2_e6f2_return_output;

     -- Submodule level 6
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l276_c2_e6f2_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l276_c2_e6f2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
