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
-- BIN_OP_EQ[uxn_device_h_l276_c6_073f]
signal BIN_OP_EQ_uxn_device_h_l276_c6_073f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l276_c6_073f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l276_c6_073f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l281_c7_11af]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l276_c2_5350]
signal result_MUX_uxn_device_h_l276_c2_5350_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l276_c2_5350_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l276_c2_5350_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l276_c2_5350_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l281_c11_bc54]
signal BIN_OP_EQ_uxn_device_h_l281_c11_bc54_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l281_c11_bc54_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l281_c11_bc54_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l286_c1_a6a1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l281_c7_11af]
signal result_MUX_uxn_device_h_l281_c7_11af_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l281_c7_11af_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l281_c7_11af_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l281_c7_11af_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l287_c12_754e]
signal generic_dei_uxn_device_h_l287_c12_754e_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l287_c12_754e_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l287_c12_754e_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l287_c12_754e_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l287_c12_754e_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l276_c6_073f
BIN_OP_EQ_uxn_device_h_l276_c6_073f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l276_c6_073f_left,
BIN_OP_EQ_uxn_device_h_l276_c6_073f_right,
BIN_OP_EQ_uxn_device_h_l276_c6_073f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_return_output);

-- result_MUX_uxn_device_h_l276_c2_5350
result_MUX_uxn_device_h_l276_c2_5350 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l276_c2_5350_cond,
result_MUX_uxn_device_h_l276_c2_5350_iftrue,
result_MUX_uxn_device_h_l276_c2_5350_iffalse,
result_MUX_uxn_device_h_l276_c2_5350_return_output);

-- BIN_OP_EQ_uxn_device_h_l281_c11_bc54
BIN_OP_EQ_uxn_device_h_l281_c11_bc54 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l281_c11_bc54_left,
BIN_OP_EQ_uxn_device_h_l281_c11_bc54_right,
BIN_OP_EQ_uxn_device_h_l281_c11_bc54_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_return_output);

-- result_MUX_uxn_device_h_l281_c7_11af
result_MUX_uxn_device_h_l281_c7_11af : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l281_c7_11af_cond,
result_MUX_uxn_device_h_l281_c7_11af_iftrue,
result_MUX_uxn_device_h_l281_c7_11af_iffalse,
result_MUX_uxn_device_h_l281_c7_11af_return_output);

-- generic_dei_uxn_device_h_l287_c12_754e
generic_dei_uxn_device_h_l287_c12_754e : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l287_c12_754e_CLOCK_ENABLE,
generic_dei_uxn_device_h_l287_c12_754e_device_address,
generic_dei_uxn_device_h_l287_c12_754e_phase,
generic_dei_uxn_device_h_l287_c12_754e_previous_device_ram_read,
generic_dei_uxn_device_h_l287_c12_754e_return_output);



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
 BIN_OP_EQ_uxn_device_h_l276_c6_073f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_return_output,
 result_MUX_uxn_device_h_l276_c2_5350_return_output,
 BIN_OP_EQ_uxn_device_h_l281_c11_bc54_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_return_output,
 result_MUX_uxn_device_h_l281_c7_11af_return_output,
 generic_dei_uxn_device_h_l287_c12_754e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l276_c6_073f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l276_c6_073f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l276_c6_073f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l276_c2_5350_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l276_c2_5350_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l276_c2_5350_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l281_c7_11af_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l276_c2_5350_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l276_c2_5350_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l277_c3_ab4a : unsigned(7 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l278_c3_f3e2 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l281_c11_bc54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l281_c11_bc54_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l281_c11_bc54_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l281_c7_11af_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l281_c7_11af_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l281_c7_11af_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l281_c7_11af_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l282_c3_d01f : unsigned(7 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l283_c3_78fe : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l287_c12_754e_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l287_c12_754e_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l287_c12_754e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l287_c12_754e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l287_c12_754e_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_iftrue := to_unsigned(0, 1);
     VAR_result_dei_value_uxn_device_h_l278_c3_f3e2 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l282_c3_d01f := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l277_c3_ab4a := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l281_c11_bc54_right := to_unsigned(5, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_iftrue := to_unsigned(0, 1);
     VAR_result_dei_value_uxn_device_h_l283_c3_78fe := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l276_c6_073f_right := to_unsigned(4, 8);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l281_c7_11af] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l281_c7_11af_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l282_c3_d01f,
     VAR_result_dei_value_uxn_device_h_l283_c3_78fe,
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l276_c2_5350] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l276_c2_5350_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l277_c3_ab4a,
     VAR_result_dei_value_uxn_device_h_l278_c3_f3e2,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l276_c2_5350_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l276_c2_5350_return_output;
     VAR_result_MUX_uxn_device_h_l281_c7_11af_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l281_c7_11af_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_device_h_l276_c6_073f_left := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l281_c11_bc54_left := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l287_c12_754e_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l287_c12_754e_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l287_c12_754e_previous_device_ram_read := VAR_previous_device_ram_read;
     -- BIN_OP_EQ[uxn_device_h_l276_c6_073f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l276_c6_073f_left <= VAR_BIN_OP_EQ_uxn_device_h_l276_c6_073f_left;
     BIN_OP_EQ_uxn_device_h_l276_c6_073f_right <= VAR_BIN_OP_EQ_uxn_device_h_l276_c6_073f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l276_c6_073f_return_output := BIN_OP_EQ_uxn_device_h_l276_c6_073f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l281_c11_bc54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l281_c11_bc54_left <= VAR_BIN_OP_EQ_uxn_device_h_l281_c11_bc54_left;
     BIN_OP_EQ_uxn_device_h_l281_c11_bc54_right <= VAR_BIN_OP_EQ_uxn_device_h_l281_c11_bc54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l281_c11_bc54_return_output := BIN_OP_EQ_uxn_device_h_l281_c11_bc54_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_cond := VAR_BIN_OP_EQ_uxn_device_h_l276_c6_073f_return_output;
     VAR_result_MUX_uxn_device_h_l276_c2_5350_cond := VAR_BIN_OP_EQ_uxn_device_h_l276_c6_073f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_cond := VAR_BIN_OP_EQ_uxn_device_h_l281_c11_bc54_return_output;
     VAR_result_MUX_uxn_device_h_l281_c7_11af_cond := VAR_BIN_OP_EQ_uxn_device_h_l281_c11_bc54_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l281_c7_11af] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l281_c7_11af_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l286_c1_a6a1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_return_output;

     -- Submodule level 3
     VAR_generic_dei_uxn_device_h_l287_c12_754e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l286_c1_a6a1_return_output;
     -- generic_dei[uxn_device_h_l287_c12_754e] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l287_c12_754e_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l287_c12_754e_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l287_c12_754e_device_address <= VAR_generic_dei_uxn_device_h_l287_c12_754e_device_address;
     generic_dei_uxn_device_h_l287_c12_754e_phase <= VAR_generic_dei_uxn_device_h_l287_c12_754e_phase;
     generic_dei_uxn_device_h_l287_c12_754e_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l287_c12_754e_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l287_c12_754e_return_output := generic_dei_uxn_device_h_l287_c12_754e_return_output;

     -- Submodule level 4
     VAR_result_MUX_uxn_device_h_l281_c7_11af_iffalse := VAR_generic_dei_uxn_device_h_l287_c12_754e_return_output;
     -- result_MUX[uxn_device_h_l281_c7_11af] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l281_c7_11af_cond <= VAR_result_MUX_uxn_device_h_l281_c7_11af_cond;
     result_MUX_uxn_device_h_l281_c7_11af_iftrue <= VAR_result_MUX_uxn_device_h_l281_c7_11af_iftrue;
     result_MUX_uxn_device_h_l281_c7_11af_iffalse <= VAR_result_MUX_uxn_device_h_l281_c7_11af_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l281_c7_11af_return_output := result_MUX_uxn_device_h_l281_c7_11af_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_device_h_l276_c2_5350_iffalse := VAR_result_MUX_uxn_device_h_l281_c7_11af_return_output;
     -- result_MUX[uxn_device_h_l276_c2_5350] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l276_c2_5350_cond <= VAR_result_MUX_uxn_device_h_l276_c2_5350_cond;
     result_MUX_uxn_device_h_l276_c2_5350_iftrue <= VAR_result_MUX_uxn_device_h_l276_c2_5350_iftrue;
     result_MUX_uxn_device_h_l276_c2_5350_iffalse <= VAR_result_MUX_uxn_device_h_l276_c2_5350_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l276_c2_5350_return_output := result_MUX_uxn_device_h_l276_c2_5350_return_output;

     -- Submodule level 6
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l276_c2_5350_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l276_c2_5350_return_output;
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
