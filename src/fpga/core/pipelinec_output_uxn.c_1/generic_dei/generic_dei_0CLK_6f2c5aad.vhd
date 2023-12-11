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
entity generic_dei_0CLK_6f2c5aad is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end generic_dei_0CLK_6f2c5aad;
architecture arch of generic_dei_0CLK_6f2c5aad is
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
-- BIN_OP_LT[uxn_device_h_l275_c6_371a]
signal BIN_OP_LT_uxn_device_h_l275_c6_371a_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_device_h_l275_c6_371a_right : unsigned(1 downto 0);
signal BIN_OP_LT_uxn_device_h_l275_c6_371a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l275_c2_0578]
signal result_MUX_uxn_device_h_l275_c2_0578_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l275_c2_0578_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l275_c2_0578_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l275_c2_0578_return_output : device_in_result_t;

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
-- BIN_OP_LT_uxn_device_h_l275_c6_371a
BIN_OP_LT_uxn_device_h_l275_c6_371a : entity work.BIN_OP_LT_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_device_h_l275_c6_371a_left,
BIN_OP_LT_uxn_device_h_l275_c6_371a_right,
BIN_OP_LT_uxn_device_h_l275_c6_371a_return_output);

-- result_MUX_uxn_device_h_l275_c2_0578
result_MUX_uxn_device_h_l275_c2_0578 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l275_c2_0578_cond,
result_MUX_uxn_device_h_l275_c2_0578_iftrue,
result_MUX_uxn_device_h_l275_c2_0578_iffalse,
result_MUX_uxn_device_h_l275_c2_0578_return_output);



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
 BIN_OP_LT_uxn_device_h_l275_c6_371a_return_output,
 result_MUX_uxn_device_h_l275_c2_0578_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l275_c6_371a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l275_c6_371a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l275_c6_371a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l275_c2_0578_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l275_c2_0578_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l275_c2_0578_iffalse : device_in_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l275_c2_0578_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l275_c2_0578_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l275_c2_0578_cond : unsigned(0 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l277_c3_8c20 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l281_c3_743c : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_LT_uxn_device_h_l275_c6_371a_right := to_unsigned(2, 2);
     VAR_result_device_ram_address_uxn_device_h_l281_c3_743c := resize(to_unsigned(0, 1), 8);
     VAR_result_dei_value_uxn_device_h_l277_c3_8c20 := resize(to_unsigned(0, 1), 8);

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
     VAR_BIN_OP_LT_uxn_device_h_l275_c6_371a_left := VAR_phase;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l275_c2_0578] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l275_c2_0578_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_device_address,
     VAR_result_dei_value_uxn_device_h_l277_c3_8c20,
     to_unsigned(0, 1));

     -- BIN_OP_LT[uxn_device_h_l275_c6_371a] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_device_h_l275_c6_371a_left <= VAR_BIN_OP_LT_uxn_device_h_l275_c6_371a_left;
     BIN_OP_LT_uxn_device_h_l275_c6_371a_right <= VAR_BIN_OP_LT_uxn_device_h_l275_c6_371a_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_device_h_l275_c6_371a_return_output := BIN_OP_LT_uxn_device_h_l275_c6_371a_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l275_c2_0578] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l275_c2_0578_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l281_c3_743c,
     VAR_previous_device_ram_read,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l275_c2_0578_cond := VAR_BIN_OP_LT_uxn_device_h_l275_c6_371a_return_output;
     VAR_result_MUX_uxn_device_h_l275_c2_0578_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l275_c2_0578_return_output;
     VAR_result_MUX_uxn_device_h_l275_c2_0578_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l275_c2_0578_return_output;
     -- result_MUX[uxn_device_h_l275_c2_0578] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l275_c2_0578_cond <= VAR_result_MUX_uxn_device_h_l275_c2_0578_cond;
     result_MUX_uxn_device_h_l275_c2_0578_iftrue <= VAR_result_MUX_uxn_device_h_l275_c2_0578_iftrue;
     result_MUX_uxn_device_h_l275_c2_0578_iffalse <= VAR_result_MUX_uxn_device_h_l275_c2_0578_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l275_c2_0578_return_output := result_MUX_uxn_device_h_l275_c2_0578_return_output;

     -- Submodule level 2
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l275_c2_0578_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l275_c2_0578_return_output;
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
