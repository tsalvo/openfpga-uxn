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
-- Submodules: 6
entity controller_dei_0CLK_336c9a77 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end controller_dei_0CLK_336c9a77;
architecture arch of controller_dei_0CLK_336c9a77 is
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
signal device_port : unsigned(3 downto 0) := to_unsigned(0, 4);
signal REG_COMB_result : device_in_result_t;
signal REG_COMB_device_port : unsigned(3 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l525_c6_7458]
signal BIN_OP_EQ_uxn_device_h_l525_c6_7458_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l525_c6_7458_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l525_c6_7458_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l530_c1_ff96]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l525_c2_c450]
signal result_MUX_uxn_device_h_l525_c2_c450_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l525_c2_c450_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l525_c2_c450_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l525_c2_c450_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l531_c12_1a32]
signal generic_dei_uxn_device_h_l531_c12_1a32_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l531_c12_1a32_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l531_c12_1a32_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l531_c12_1a32_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l531_c12_1a32_return_output : device_in_result_t;

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

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
-- BIN_OP_EQ_uxn_device_h_l525_c6_7458
BIN_OP_EQ_uxn_device_h_l525_c6_7458 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l525_c6_7458_left,
BIN_OP_EQ_uxn_device_h_l525_c6_7458_right,
BIN_OP_EQ_uxn_device_h_l525_c6_7458_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_return_output);

-- result_MUX_uxn_device_h_l525_c2_c450
result_MUX_uxn_device_h_l525_c2_c450 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l525_c2_c450_cond,
result_MUX_uxn_device_h_l525_c2_c450_iftrue,
result_MUX_uxn_device_h_l525_c2_c450_iffalse,
result_MUX_uxn_device_h_l525_c2_c450_return_output);

-- generic_dei_uxn_device_h_l531_c12_1a32
generic_dei_uxn_device_h_l531_c12_1a32 : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l531_c12_1a32_CLOCK_ENABLE,
generic_dei_uxn_device_h_l531_c12_1a32_device_address,
generic_dei_uxn_device_h_l531_c12_1a32_phase,
generic_dei_uxn_device_h_l531_c12_1a32_previous_device_ram_read,
generic_dei_uxn_device_h_l531_c12_1a32_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 controller0_buttons,
 previous_device_ram_read,
 -- Registers
 result,
 device_port,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l525_c6_7458_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_return_output,
 result_MUX_uxn_device_h_l525_c2_c450_return_output,
 generic_dei_uxn_device_h_l531_c12_1a32_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l523_c16_bc8a_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l525_c6_7458_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l525_c6_7458_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l525_c6_7458_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l525_c2_c450_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l525_c2_c450_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l525_c2_c450_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l525_c2_c450_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l525_c2_c450_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l526_c3_d570 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l531_c12_1a32_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l531_c12_1a32_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l531_c12_1a32_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l531_c12_1a32_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l531_c12_1a32_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
variable REG_VAR_device_port : unsigned(3 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_device_port := device_port;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_device_ram_address_uxn_device_h_l526_c3_d570 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l525_c6_7458_right := to_unsigned(2, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_phase := phase;
     VAR_controller0_buttons := controller0_buttons;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l531_c12_1a32_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l531_c12_1a32_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l531_c12_1a32_previous_device_ram_read := VAR_previous_device_ram_read;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l525_c2_c450] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l525_c2_c450_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l526_c3_d570,
     VAR_controller0_buttons,
     to_unsigned(1, 1));

     -- CAST_TO_uint4_t[uxn_device_h_l523_c16_bc8a] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l523_c16_bc8a_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l525_c6_7458_left := VAR_CAST_TO_uint4_t_uxn_device_h_l523_c16_bc8a_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l523_c16_bc8a_return_output;
     VAR_result_MUX_uxn_device_h_l525_c2_c450_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l525_c2_c450_return_output;
     -- BIN_OP_EQ[uxn_device_h_l525_c6_7458] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l525_c6_7458_left <= VAR_BIN_OP_EQ_uxn_device_h_l525_c6_7458_left;
     BIN_OP_EQ_uxn_device_h_l525_c6_7458_right <= VAR_BIN_OP_EQ_uxn_device_h_l525_c6_7458_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l525_c6_7458_return_output := BIN_OP_EQ_uxn_device_h_l525_c6_7458_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_cond := VAR_BIN_OP_EQ_uxn_device_h_l525_c6_7458_return_output;
     VAR_result_MUX_uxn_device_h_l525_c2_c450_cond := VAR_BIN_OP_EQ_uxn_device_h_l525_c6_7458_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l530_c1_ff96] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_return_output;

     -- Submodule level 3
     VAR_generic_dei_uxn_device_h_l531_c12_1a32_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l530_c1_ff96_return_output;
     -- generic_dei[uxn_device_h_l531_c12_1a32] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l531_c12_1a32_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l531_c12_1a32_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l531_c12_1a32_device_address <= VAR_generic_dei_uxn_device_h_l531_c12_1a32_device_address;
     generic_dei_uxn_device_h_l531_c12_1a32_phase <= VAR_generic_dei_uxn_device_h_l531_c12_1a32_phase;
     generic_dei_uxn_device_h_l531_c12_1a32_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l531_c12_1a32_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l531_c12_1a32_return_output := generic_dei_uxn_device_h_l531_c12_1a32_return_output;

     -- Submodule level 4
     VAR_result_MUX_uxn_device_h_l525_c2_c450_iffalse := VAR_generic_dei_uxn_device_h_l531_c12_1a32_return_output;
     -- result_MUX[uxn_device_h_l525_c2_c450] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l525_c2_c450_cond <= VAR_result_MUX_uxn_device_h_l525_c2_c450_cond;
     result_MUX_uxn_device_h_l525_c2_c450_iftrue <= VAR_result_MUX_uxn_device_h_l525_c2_c450_iftrue;
     result_MUX_uxn_device_h_l525_c2_c450_iffalse <= VAR_result_MUX_uxn_device_h_l525_c2_c450_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l525_c2_c450_return_output := result_MUX_uxn_device_h_l525_c2_c450_return_output;

     -- Submodule level 5
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l525_c2_c450_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l525_c2_c450_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_port <= REG_VAR_device_port;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
     device_port <= REG_COMB_device_port;
 end if;
 end if;
end process;

end arch;
