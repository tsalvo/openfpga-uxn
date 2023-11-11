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
entity system_dei_0CLK_ef67fea2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end system_dei_0CLK_ef67fea2;
architecture arch of system_dei_0CLK_ef67fea2 is
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
-- BIN_OP_EQ[uxn_device_h_l310_c6_9ff4]
signal BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l315_c7_6e07]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l310_c2_377e]
signal result_MUX_uxn_device_h_l310_c2_377e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l310_c2_377e_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l310_c2_377e_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l310_c2_377e_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l315_c11_21ca]
signal BIN_OP_EQ_uxn_device_h_l315_c11_21ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l315_c11_21ca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l315_c11_21ca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l320_c1_f4c8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l315_c7_6e07]
signal result_MUX_uxn_device_h_l315_c7_6e07_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l315_c7_6e07_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l315_c7_6e07_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l315_c7_6e07_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l321_c12_42db]
signal generic_dei_uxn_device_h_l321_c12_42db_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l321_c12_42db_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l321_c12_42db_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l321_c12_42db_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l321_c12_42db_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l310_c6_9ff4
BIN_OP_EQ_uxn_device_h_l310_c6_9ff4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_left,
BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_right,
BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_return_output);

-- result_MUX_uxn_device_h_l310_c2_377e
result_MUX_uxn_device_h_l310_c2_377e : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l310_c2_377e_cond,
result_MUX_uxn_device_h_l310_c2_377e_iftrue,
result_MUX_uxn_device_h_l310_c2_377e_iffalse,
result_MUX_uxn_device_h_l310_c2_377e_return_output);

-- BIN_OP_EQ_uxn_device_h_l315_c11_21ca
BIN_OP_EQ_uxn_device_h_l315_c11_21ca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l315_c11_21ca_left,
BIN_OP_EQ_uxn_device_h_l315_c11_21ca_right,
BIN_OP_EQ_uxn_device_h_l315_c11_21ca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_return_output);

-- result_MUX_uxn_device_h_l315_c7_6e07
result_MUX_uxn_device_h_l315_c7_6e07 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l315_c7_6e07_cond,
result_MUX_uxn_device_h_l315_c7_6e07_iftrue,
result_MUX_uxn_device_h_l315_c7_6e07_iffalse,
result_MUX_uxn_device_h_l315_c7_6e07_return_output);

-- generic_dei_uxn_device_h_l321_c12_42db
generic_dei_uxn_device_h_l321_c12_42db : entity work.generic_dei_0CLK_5af1a430 port map (
clk,
generic_dei_uxn_device_h_l321_c12_42db_CLOCK_ENABLE,
generic_dei_uxn_device_h_l321_c12_42db_device_address,
generic_dei_uxn_device_h_l321_c12_42db_phase,
generic_dei_uxn_device_h_l321_c12_42db_previous_device_ram_read,
generic_dei_uxn_device_h_l321_c12_42db_return_output);



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
 BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_return_output,
 result_MUX_uxn_device_h_l310_c2_377e_return_output,
 BIN_OP_EQ_uxn_device_h_l315_c11_21ca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_return_output,
 result_MUX_uxn_device_h_l315_c7_6e07_return_output,
 generic_dei_uxn_device_h_l321_c12_42db_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l310_c2_377e_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l310_c2_377e_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l310_c2_377e_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l315_c7_6e07_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l310_c2_377e_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l310_c2_377e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l311_c3_0901 : unsigned(7 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l312_c3_a1ac : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l315_c11_21ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l315_c11_21ca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l315_c11_21ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l315_c7_6e07_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l315_c7_6e07_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l315_c7_6e07_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l315_c7_6e07_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l316_c3_be92 : unsigned(7 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l317_c3_60f7 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l321_c12_42db_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l321_c12_42db_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l321_c12_42db_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l321_c12_42db_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l321_c12_42db_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_device_ram_address_uxn_device_h_l311_c3_0901 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_iftrue := to_unsigned(0, 1);
     VAR_result_dei_value_uxn_device_h_l312_c3_a1ac := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l316_c3_be92 := resize(to_unsigned(0, 1), 8);
     VAR_result_dei_value_uxn_device_h_l317_c3_60f7 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l315_c11_21ca_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_iftrue := to_unsigned(0, 1);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l315_c7_6e07] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l315_c7_6e07_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l316_c3_be92,
     VAR_result_dei_value_uxn_device_h_l317_c3_60f7,
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l310_c2_377e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l310_c2_377e_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l311_c3_0901,
     VAR_result_dei_value_uxn_device_h_l312_c3_a1ac,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l315_c7_6e07_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l315_c7_6e07_return_output;
     VAR_result_MUX_uxn_device_h_l310_c2_377e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l310_c2_377e_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_left := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l315_c11_21ca_left := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l321_c12_42db_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l321_c12_42db_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l321_c12_42db_previous_device_ram_read := VAR_previous_device_ram_read;
     -- BIN_OP_EQ[uxn_device_h_l315_c11_21ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l315_c11_21ca_left <= VAR_BIN_OP_EQ_uxn_device_h_l315_c11_21ca_left;
     BIN_OP_EQ_uxn_device_h_l315_c11_21ca_right <= VAR_BIN_OP_EQ_uxn_device_h_l315_c11_21ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l315_c11_21ca_return_output := BIN_OP_EQ_uxn_device_h_l315_c11_21ca_return_output;

     -- BIN_OP_EQ[uxn_device_h_l310_c6_9ff4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_left <= VAR_BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_left;
     BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_right <= VAR_BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_return_output := BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_return_output;
     VAR_result_MUX_uxn_device_h_l310_c2_377e_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c6_9ff4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_21ca_return_output;
     VAR_result_MUX_uxn_device_h_l315_c7_6e07_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_21ca_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l315_c7_6e07] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_6e07_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l320_c1_f4c8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_return_output;

     -- Submodule level 3
     VAR_generic_dei_uxn_device_h_l321_c12_42db_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c1_f4c8_return_output;
     -- generic_dei[uxn_device_h_l321_c12_42db] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l321_c12_42db_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l321_c12_42db_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l321_c12_42db_device_address <= VAR_generic_dei_uxn_device_h_l321_c12_42db_device_address;
     generic_dei_uxn_device_h_l321_c12_42db_phase <= VAR_generic_dei_uxn_device_h_l321_c12_42db_phase;
     generic_dei_uxn_device_h_l321_c12_42db_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l321_c12_42db_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l321_c12_42db_return_output := generic_dei_uxn_device_h_l321_c12_42db_return_output;

     -- Submodule level 4
     VAR_result_MUX_uxn_device_h_l315_c7_6e07_iffalse := VAR_generic_dei_uxn_device_h_l321_c12_42db_return_output;
     -- result_MUX[uxn_device_h_l315_c7_6e07] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l315_c7_6e07_cond <= VAR_result_MUX_uxn_device_h_l315_c7_6e07_cond;
     result_MUX_uxn_device_h_l315_c7_6e07_iftrue <= VAR_result_MUX_uxn_device_h_l315_c7_6e07_iftrue;
     result_MUX_uxn_device_h_l315_c7_6e07_iffalse <= VAR_result_MUX_uxn_device_h_l315_c7_6e07_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l315_c7_6e07_return_output := result_MUX_uxn_device_h_l315_c7_6e07_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_device_h_l310_c2_377e_iffalse := VAR_result_MUX_uxn_device_h_l315_c7_6e07_return_output;
     -- result_MUX[uxn_device_h_l310_c2_377e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l310_c2_377e_cond <= VAR_result_MUX_uxn_device_h_l310_c2_377e_cond;
     result_MUX_uxn_device_h_l310_c2_377e_iftrue <= VAR_result_MUX_uxn_device_h_l310_c2_377e_iftrue;
     result_MUX_uxn_device_h_l310_c2_377e_iffalse <= VAR_result_MUX_uxn_device_h_l310_c2_377e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l310_c2_377e_return_output := result_MUX_uxn_device_h_l310_c2_377e_return_output;

     -- Submodule level 6
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l310_c2_377e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l310_c2_377e_return_output;
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
