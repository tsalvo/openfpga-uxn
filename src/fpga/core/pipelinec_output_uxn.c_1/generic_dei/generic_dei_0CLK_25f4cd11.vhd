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
entity generic_dei_0CLK_25f4cd11 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end generic_dei_0CLK_25f4cd11;
architecture arch of generic_dei_0CLK_25f4cd11 is
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
-- BIN_OP_EQ[uxn_device_h_l448_c6_58ab]
signal BIN_OP_EQ_uxn_device_h_l448_c6_58ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l448_c6_58ab_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l448_c6_58ab_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l448_c2_5e1c]
signal result_MUX_uxn_device_h_l448_c2_5e1c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l448_c2_5e1c_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l448_c2_5e1c_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l448_c2_5e1c_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l453_c11_fe39]
signal BIN_OP_EQ_uxn_device_h_l453_c11_fe39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l453_c11_fe39_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l453_c11_fe39_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l453_c7_95aa]
signal result_MUX_uxn_device_h_l453_c7_95aa_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l453_c7_95aa_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l453_c7_95aa_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l453_c7_95aa_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l458_c11_b563]
signal BIN_OP_EQ_uxn_device_h_l458_c11_b563_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l458_c11_b563_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l458_c11_b563_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l458_c7_5ba7]
signal result_MUX_uxn_device_h_l458_c7_5ba7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l458_c7_5ba7_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l458_c7_5ba7_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l458_c7_5ba7_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l448_c6_58ab
BIN_OP_EQ_uxn_device_h_l448_c6_58ab : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l448_c6_58ab_left,
BIN_OP_EQ_uxn_device_h_l448_c6_58ab_right,
BIN_OP_EQ_uxn_device_h_l448_c6_58ab_return_output);

-- result_MUX_uxn_device_h_l448_c2_5e1c
result_MUX_uxn_device_h_l448_c2_5e1c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l448_c2_5e1c_cond,
result_MUX_uxn_device_h_l448_c2_5e1c_iftrue,
result_MUX_uxn_device_h_l448_c2_5e1c_iffalse,
result_MUX_uxn_device_h_l448_c2_5e1c_return_output);

-- BIN_OP_EQ_uxn_device_h_l453_c11_fe39
BIN_OP_EQ_uxn_device_h_l453_c11_fe39 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l453_c11_fe39_left,
BIN_OP_EQ_uxn_device_h_l453_c11_fe39_right,
BIN_OP_EQ_uxn_device_h_l453_c11_fe39_return_output);

-- result_MUX_uxn_device_h_l453_c7_95aa
result_MUX_uxn_device_h_l453_c7_95aa : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l453_c7_95aa_cond,
result_MUX_uxn_device_h_l453_c7_95aa_iftrue,
result_MUX_uxn_device_h_l453_c7_95aa_iffalse,
result_MUX_uxn_device_h_l453_c7_95aa_return_output);

-- BIN_OP_EQ_uxn_device_h_l458_c11_b563
BIN_OP_EQ_uxn_device_h_l458_c11_b563 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l458_c11_b563_left,
BIN_OP_EQ_uxn_device_h_l458_c11_b563_right,
BIN_OP_EQ_uxn_device_h_l458_c11_b563_return_output);

-- result_MUX_uxn_device_h_l458_c7_5ba7
result_MUX_uxn_device_h_l458_c7_5ba7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l458_c7_5ba7_cond,
result_MUX_uxn_device_h_l458_c7_5ba7_iftrue,
result_MUX_uxn_device_h_l458_c7_5ba7_iffalse,
result_MUX_uxn_device_h_l458_c7_5ba7_return_output);



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
 BIN_OP_EQ_uxn_device_h_l448_c6_58ab_return_output,
 result_MUX_uxn_device_h_l448_c2_5e1c_return_output,
 BIN_OP_EQ_uxn_device_h_l453_c11_fe39_return_output,
 result_MUX_uxn_device_h_l453_c7_95aa_return_output,
 BIN_OP_EQ_uxn_device_h_l458_c11_b563_return_output,
 result_MUX_uxn_device_h_l458_c7_5ba7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l448_c6_58ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l448_c6_58ab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l448_c6_58ab_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l448_c2_5e1c_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l448_c2_5e1c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l448_c2_5e1c_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l453_c7_95aa_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l448_c2_5e1c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l448_c2_5e1c_cond : unsigned(0 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l450_c3_1363 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l453_c11_fe39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l453_c11_fe39_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l453_c11_fe39_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l453_c7_95aa_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l453_c7_95aa_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l453_c7_95aa_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l458_c7_5ba7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l453_c7_95aa_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l454_c3_952a : unsigned(7 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l455_c3_5df0 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l458_c11_b563_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l458_c11_b563_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l458_c11_b563_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l458_c7_5ba7_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l458_c7_5ba7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l458_c7_5ba7_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l458_c7_5ba7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l459_c3_0e8f : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_device_ram_address_uxn_device_h_l454_c3_952a := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l459_c3_0e8f := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l458_c11_b563_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l453_c11_fe39_right := to_unsigned(1, 1);
     VAR_result_dei_value_uxn_device_h_l455_c3_5df0 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l448_c6_58ab_right := to_unsigned(0, 1);
     VAR_result_dei_value_uxn_device_h_l450_c3_1363 := resize(to_unsigned(0, 1), 8);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l453_c7_95aa] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l453_c7_95aa_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l454_c3_952a,
     VAR_result_dei_value_uxn_device_h_l455_c3_5df0,
     to_unsigned(0, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l453_c7_95aa_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l453_c7_95aa_return_output;

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
     VAR_BIN_OP_EQ_uxn_device_h_l448_c6_58ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l453_c11_fe39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l458_c11_b563_left := VAR_phase;
     VAR_result_MUX_uxn_device_h_l458_c7_5ba7_iffalse := result;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l448_c2_5e1c] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l448_c2_5e1c_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_device_address,
     VAR_result_dei_value_uxn_device_h_l450_c3_1363,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_device_h_l458_c11_b563] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l458_c11_b563_left <= VAR_BIN_OP_EQ_uxn_device_h_l458_c11_b563_left;
     BIN_OP_EQ_uxn_device_h_l458_c11_b563_right <= VAR_BIN_OP_EQ_uxn_device_h_l458_c11_b563_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l458_c11_b563_return_output := BIN_OP_EQ_uxn_device_h_l458_c11_b563_return_output;

     -- BIN_OP_EQ[uxn_device_h_l448_c6_58ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l448_c6_58ab_left <= VAR_BIN_OP_EQ_uxn_device_h_l448_c6_58ab_left;
     BIN_OP_EQ_uxn_device_h_l448_c6_58ab_right <= VAR_BIN_OP_EQ_uxn_device_h_l448_c6_58ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l448_c6_58ab_return_output := BIN_OP_EQ_uxn_device_h_l448_c6_58ab_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l458_c7_5ba7] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l458_c7_5ba7_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l459_c3_0e8f,
     VAR_previous_device_ram_read,
     to_unsigned(1, 1));

     -- BIN_OP_EQ[uxn_device_h_l453_c11_fe39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l453_c11_fe39_left <= VAR_BIN_OP_EQ_uxn_device_h_l453_c11_fe39_left;
     BIN_OP_EQ_uxn_device_h_l453_c11_fe39_right <= VAR_BIN_OP_EQ_uxn_device_h_l453_c11_fe39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l453_c11_fe39_return_output := BIN_OP_EQ_uxn_device_h_l453_c11_fe39_return_output;

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l448_c2_5e1c_cond := VAR_BIN_OP_EQ_uxn_device_h_l448_c6_58ab_return_output;
     VAR_result_MUX_uxn_device_h_l453_c7_95aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l453_c11_fe39_return_output;
     VAR_result_MUX_uxn_device_h_l458_c7_5ba7_cond := VAR_BIN_OP_EQ_uxn_device_h_l458_c11_b563_return_output;
     VAR_result_MUX_uxn_device_h_l448_c2_5e1c_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l448_c2_5e1c_return_output;
     VAR_result_MUX_uxn_device_h_l458_c7_5ba7_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l458_c7_5ba7_return_output;
     -- result_MUX[uxn_device_h_l458_c7_5ba7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l458_c7_5ba7_cond <= VAR_result_MUX_uxn_device_h_l458_c7_5ba7_cond;
     result_MUX_uxn_device_h_l458_c7_5ba7_iftrue <= VAR_result_MUX_uxn_device_h_l458_c7_5ba7_iftrue;
     result_MUX_uxn_device_h_l458_c7_5ba7_iffalse <= VAR_result_MUX_uxn_device_h_l458_c7_5ba7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l458_c7_5ba7_return_output := result_MUX_uxn_device_h_l458_c7_5ba7_return_output;

     -- Submodule level 2
     VAR_result_MUX_uxn_device_h_l453_c7_95aa_iffalse := VAR_result_MUX_uxn_device_h_l458_c7_5ba7_return_output;
     -- result_MUX[uxn_device_h_l453_c7_95aa] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l453_c7_95aa_cond <= VAR_result_MUX_uxn_device_h_l453_c7_95aa_cond;
     result_MUX_uxn_device_h_l453_c7_95aa_iftrue <= VAR_result_MUX_uxn_device_h_l453_c7_95aa_iftrue;
     result_MUX_uxn_device_h_l453_c7_95aa_iffalse <= VAR_result_MUX_uxn_device_h_l453_c7_95aa_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l453_c7_95aa_return_output := result_MUX_uxn_device_h_l453_c7_95aa_return_output;

     -- Submodule level 3
     VAR_result_MUX_uxn_device_h_l448_c2_5e1c_iffalse := VAR_result_MUX_uxn_device_h_l453_c7_95aa_return_output;
     -- result_MUX[uxn_device_h_l448_c2_5e1c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l448_c2_5e1c_cond <= VAR_result_MUX_uxn_device_h_l448_c2_5e1c_cond;
     result_MUX_uxn_device_h_l448_c2_5e1c_iftrue <= VAR_result_MUX_uxn_device_h_l448_c2_5e1c_iftrue;
     result_MUX_uxn_device_h_l448_c2_5e1c_iffalse <= VAR_result_MUX_uxn_device_h_l448_c2_5e1c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l448_c2_5e1c_return_output := result_MUX_uxn_device_h_l448_c2_5e1c_return_output;

     -- Submodule level 4
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l448_c2_5e1c_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l448_c2_5e1c_return_output;
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
