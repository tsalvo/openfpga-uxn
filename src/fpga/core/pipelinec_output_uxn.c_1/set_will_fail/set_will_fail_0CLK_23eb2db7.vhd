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
-- Submodules: 8
entity set_will_fail_0CLK_23eb2db7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 sp : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 mul : in unsigned(7 downto 0);
 add : in signed(7 downto 0);
 return_output : out unsigned(0 downto 0));
end set_will_fail_0CLK_23eb2db7;
architecture arch of set_will_fail_0CLK_23eb2db7 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal condition0 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal condition1 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_condition0 : unsigned(0 downto 0);
signal REG_COMB_condition1 : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_GT[uxn_stack_h_l341_c15_2500]
signal BIN_OP_GT_uxn_stack_h_l341_c15_2500_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l341_c15_2500_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l341_c15_2500_return_output : unsigned(0 downto 0);

-- MUX[uxn_stack_h_l341_c15_fd91]
signal MUX_uxn_stack_h_l341_c15_fd91_cond : unsigned(0 downto 0);
signal MUX_uxn_stack_h_l341_c15_fd91_iftrue : unsigned(0 downto 0);
signal MUX_uxn_stack_h_l341_c15_fd91_iffalse : unsigned(0 downto 0);
signal MUX_uxn_stack_h_l341_c15_fd91_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_stack_h_l342_c16_18f7]
signal BIN_OP_AND_uxn_stack_h_l342_c16_18f7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l342_c16_18f7_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l342_c16_18f7_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l342_c16_c878]
signal BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l342_c16_4705]
signal BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_left : signed(9 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_right : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_return_output : signed(10 downto 0);

-- BIN_OP_GT[uxn_stack_h_l342_c16_80ee]
signal BIN_OP_GT_uxn_stack_h_l342_c16_80ee_left : signed(10 downto 0);
signal BIN_OP_GT_uxn_stack_h_l342_c16_80ee_right : signed(8 downto 0);
signal BIN_OP_GT_uxn_stack_h_l342_c16_80ee_return_output : unsigned(0 downto 0);

-- MUX[uxn_stack_h_l342_c16_bb8a]
signal MUX_uxn_stack_h_l342_c16_bb8a_cond : unsigned(0 downto 0);
signal MUX_uxn_stack_h_l342_c16_bb8a_iftrue : unsigned(0 downto 0);
signal MUX_uxn_stack_h_l342_c16_bb8a_iffalse : unsigned(0 downto 0);
signal MUX_uxn_stack_h_l342_c16_bb8a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_stack_h_l343_c9_b1c5]
signal BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GT_uxn_stack_h_l341_c15_2500
BIN_OP_GT_uxn_stack_h_l341_c15_2500 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l341_c15_2500_left,
BIN_OP_GT_uxn_stack_h_l341_c15_2500_right,
BIN_OP_GT_uxn_stack_h_l341_c15_2500_return_output);

-- MUX_uxn_stack_h_l341_c15_fd91
MUX_uxn_stack_h_l341_c15_fd91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_stack_h_l341_c15_fd91_cond,
MUX_uxn_stack_h_l341_c15_fd91_iftrue,
MUX_uxn_stack_h_l341_c15_fd91_iffalse,
MUX_uxn_stack_h_l341_c15_fd91_return_output);

-- BIN_OP_AND_uxn_stack_h_l342_c16_18f7
BIN_OP_AND_uxn_stack_h_l342_c16_18f7 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l342_c16_18f7_left,
BIN_OP_AND_uxn_stack_h_l342_c16_18f7_right,
BIN_OP_AND_uxn_stack_h_l342_c16_18f7_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l342_c16_c878
BIN_OP_PLUS_uxn_stack_h_l342_c16_c878 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_left,
BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_right,
BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l342_c16_4705
BIN_OP_PLUS_uxn_stack_h_l342_c16_4705 : entity work.BIN_OP_PLUS_int10_t_int9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_left,
BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_right,
BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_return_output);

-- BIN_OP_GT_uxn_stack_h_l342_c16_80ee
BIN_OP_GT_uxn_stack_h_l342_c16_80ee : entity work.BIN_OP_GT_int11_t_int9_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l342_c16_80ee_left,
BIN_OP_GT_uxn_stack_h_l342_c16_80ee_right,
BIN_OP_GT_uxn_stack_h_l342_c16_80ee_return_output);

-- MUX_uxn_stack_h_l342_c16_bb8a
MUX_uxn_stack_h_l342_c16_bb8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_stack_h_l342_c16_bb8a_cond,
MUX_uxn_stack_h_l342_c16_bb8a_iftrue,
MUX_uxn_stack_h_l342_c16_bb8a_iffalse,
MUX_uxn_stack_h_l342_c16_bb8a_return_output);

-- BIN_OP_OR_uxn_stack_h_l343_c9_b1c5
BIN_OP_OR_uxn_stack_h_l343_c9_b1c5 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_left,
BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_right,
BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 sp,
 k,
 mul,
 add,
 -- Registers
 condition0,
 condition1,
 -- All submodule outputs
 BIN_OP_GT_uxn_stack_h_l341_c15_2500_return_output,
 MUX_uxn_stack_h_l341_c15_fd91_return_output,
 BIN_OP_AND_uxn_stack_h_l342_c16_18f7_return_output,
 BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_return_output,
 BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_return_output,
 BIN_OP_GT_uxn_stack_h_l342_c16_80ee_return_output,
 MUX_uxn_stack_h_l342_c16_bb8a_return_output,
 BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_mul : unsigned(7 downto 0);
 variable VAR_add : signed(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l341_c15_fd91_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_stack_h_l341_c15_fd91_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_stack_h_l341_c15_fd91_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l341_c15_2500_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l341_c15_2500_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l341_c15_2500_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_stack_h_l341_c15_fd91_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_stack_h_l342_c16_bb8a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_stack_h_l342_c16_bb8a_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_stack_h_l342_c16_bb8a_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l342_c16_18f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l342_c16_18f7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l342_c16_18f7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_left : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_right : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_return_output : signed(10 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l342_c16_80ee_left : signed(10 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l342_c16_80ee_right : signed(8 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l342_c16_80ee_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_stack_h_l342_c16_bb8a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_condition0 : unsigned(0 downto 0);
variable REG_VAR_condition1 : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_condition0 := condition0;
  REG_VAR_condition1 := condition1;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_stack_h_l341_c15_fd91_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l342_c16_80ee_right := signed(std_logic_vector(resize(to_unsigned(254, 8), 9)));
     VAR_MUX_uxn_stack_h_l342_c16_bb8a_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_stack_h_l342_c16_bb8a_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_stack_h_l341_c15_fd91_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_sp := sp;
     VAR_k := k;
     VAR_mul := mul;
     VAR_add := add;

     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_right := VAR_add;
     VAR_BIN_OP_AND_uxn_stack_h_l342_c16_18f7_right := VAR_k;
     VAR_BIN_OP_AND_uxn_stack_h_l342_c16_18f7_left := VAR_mul;
     VAR_BIN_OP_GT_uxn_stack_h_l341_c15_2500_left := VAR_mul;
     VAR_BIN_OP_GT_uxn_stack_h_l341_c15_2500_right := VAR_sp;
     VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_right := signed(std_logic_vector(resize(VAR_sp, 9)));
     -- BIN_OP_AND[uxn_stack_h_l342_c16_18f7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l342_c16_18f7_left <= VAR_BIN_OP_AND_uxn_stack_h_l342_c16_18f7_left;
     BIN_OP_AND_uxn_stack_h_l342_c16_18f7_right <= VAR_BIN_OP_AND_uxn_stack_h_l342_c16_18f7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l342_c16_18f7_return_output := BIN_OP_AND_uxn_stack_h_l342_c16_18f7_return_output;

     -- BIN_OP_GT[uxn_stack_h_l341_c15_2500] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l341_c15_2500_left <= VAR_BIN_OP_GT_uxn_stack_h_l341_c15_2500_left;
     BIN_OP_GT_uxn_stack_h_l341_c15_2500_right <= VAR_BIN_OP_GT_uxn_stack_h_l341_c15_2500_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l341_c15_2500_return_output := BIN_OP_GT_uxn_stack_h_l341_c15_2500_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_left := signed(std_logic_vector(resize(VAR_BIN_OP_AND_uxn_stack_h_l342_c16_18f7_return_output, 9)));
     VAR_MUX_uxn_stack_h_l341_c15_fd91_cond := VAR_BIN_OP_GT_uxn_stack_h_l341_c15_2500_return_output;
     -- BIN_OP_PLUS[uxn_stack_h_l342_c16_c878] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_left;
     BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_return_output := BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_return_output;

     -- MUX[uxn_stack_h_l341_c15_fd91] LATENCY=0
     -- Inputs
     MUX_uxn_stack_h_l341_c15_fd91_cond <= VAR_MUX_uxn_stack_h_l341_c15_fd91_cond;
     MUX_uxn_stack_h_l341_c15_fd91_iftrue <= VAR_MUX_uxn_stack_h_l341_c15_fd91_iftrue;
     MUX_uxn_stack_h_l341_c15_fd91_iffalse <= VAR_MUX_uxn_stack_h_l341_c15_fd91_iffalse;
     -- Outputs
     VAR_MUX_uxn_stack_h_l341_c15_fd91_return_output := MUX_uxn_stack_h_l341_c15_fd91_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_left := VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_c878_return_output;
     VAR_BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_left := VAR_MUX_uxn_stack_h_l341_c15_fd91_return_output;
     REG_VAR_condition0 := VAR_MUX_uxn_stack_h_l341_c15_fd91_return_output;
     -- BIN_OP_PLUS[uxn_stack_h_l342_c16_4705] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_left;
     BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_return_output := BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_return_output;

     -- Submodule level 3
     VAR_BIN_OP_GT_uxn_stack_h_l342_c16_80ee_left := VAR_BIN_OP_PLUS_uxn_stack_h_l342_c16_4705_return_output;
     -- BIN_OP_GT[uxn_stack_h_l342_c16_80ee] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l342_c16_80ee_left <= VAR_BIN_OP_GT_uxn_stack_h_l342_c16_80ee_left;
     BIN_OP_GT_uxn_stack_h_l342_c16_80ee_right <= VAR_BIN_OP_GT_uxn_stack_h_l342_c16_80ee_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l342_c16_80ee_return_output := BIN_OP_GT_uxn_stack_h_l342_c16_80ee_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_stack_h_l342_c16_bb8a_cond := VAR_BIN_OP_GT_uxn_stack_h_l342_c16_80ee_return_output;
     -- MUX[uxn_stack_h_l342_c16_bb8a] LATENCY=0
     -- Inputs
     MUX_uxn_stack_h_l342_c16_bb8a_cond <= VAR_MUX_uxn_stack_h_l342_c16_bb8a_cond;
     MUX_uxn_stack_h_l342_c16_bb8a_iftrue <= VAR_MUX_uxn_stack_h_l342_c16_bb8a_iftrue;
     MUX_uxn_stack_h_l342_c16_bb8a_iffalse <= VAR_MUX_uxn_stack_h_l342_c16_bb8a_iffalse;
     -- Outputs
     VAR_MUX_uxn_stack_h_l342_c16_bb8a_return_output := MUX_uxn_stack_h_l342_c16_bb8a_return_output;

     -- Submodule level 5
     VAR_BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_right := VAR_MUX_uxn_stack_h_l342_c16_bb8a_return_output;
     REG_VAR_condition1 := VAR_MUX_uxn_stack_h_l342_c16_bb8a_return_output;
     -- BIN_OP_OR[uxn_stack_h_l343_c9_b1c5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_left <= VAR_BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_left;
     BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_right <= VAR_BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_return_output := BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_return_output;

     -- Submodule level 6
     VAR_return_output := VAR_BIN_OP_OR_uxn_stack_h_l343_c9_b1c5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_condition0 <= REG_VAR_condition0;
REG_COMB_condition1 <= REG_VAR_condition1;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     condition0 <= REG_COMB_condition0;
     condition1 <= REG_COMB_condition1;
 end if;
 end if;
end process;

end arch;
