-- Timing params:
--   Fixed?: False
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
-- Submodules: 5
entity stack_data_set_0CLK_a5a1cd4e is
port(
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 address : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0));
end stack_data_set_0CLK_a5a1cd4e;
architecture arch of stack_data_set_0CLK_a5a1cd4e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_EQ[uxn_stack_h_l182_c6_6502]
signal BIN_OP_EQ_uxn_stack_h_l182_c6_6502_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l182_c6_6502_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l182_c6_6502_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l182_c1_dc45]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l184_c1_4d1f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_return_output : unsigned(0 downto 0);

-- poke_stack_w[uxn_stack_h_l183_c3_471a]
signal poke_stack_w_uxn_stack_h_l183_c3_471a_CLOCK_ENABLE : unsigned(0 downto 0);
signal poke_stack_w_uxn_stack_h_l183_c3_471a_address : unsigned(7 downto 0);
signal poke_stack_w_uxn_stack_h_l183_c3_471a_value : unsigned(7 downto 0);

-- poke_stack_r[uxn_stack_h_l185_c3_749a]
signal poke_stack_r_uxn_stack_h_l185_c3_749a_CLOCK_ENABLE : unsigned(0 downto 0);
signal poke_stack_r_uxn_stack_h_l185_c3_749a_address : unsigned(7 downto 0);
signal poke_stack_r_uxn_stack_h_l185_c3_749a_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_stack_h_l182_c6_6502
BIN_OP_EQ_uxn_stack_h_l182_c6_6502 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l182_c6_6502_left,
BIN_OP_EQ_uxn_stack_h_l182_c6_6502_right,
BIN_OP_EQ_uxn_stack_h_l182_c6_6502_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_return_output);

-- poke_stack_w_uxn_stack_h_l183_c3_471a
poke_stack_w_uxn_stack_h_l183_c3_471a : entity work.poke_stack_w_0CLK_de264c78 port map (
poke_stack_w_uxn_stack_h_l183_c3_471a_CLOCK_ENABLE,
poke_stack_w_uxn_stack_h_l183_c3_471a_address,
poke_stack_w_uxn_stack_h_l183_c3_471a_value);

-- poke_stack_r_uxn_stack_h_l185_c3_749a
poke_stack_r_uxn_stack_h_l185_c3_749a : entity work.poke_stack_r_0CLK_de264c78 port map (
poke_stack_r_uxn_stack_h_l185_c3_749a_CLOCK_ENABLE,
poke_stack_r_uxn_stack_h_l185_c3_749a_address,
poke_stack_r_uxn_stack_h_l185_c3_749a_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 address,
 value,
 -- All submodule outputs
 BIN_OP_EQ_uxn_stack_h_l182_c6_6502_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_address : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l182_c6_6502_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l182_c6_6502_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l182_c6_6502_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_iffalse : unsigned(0 downto 0);
 variable VAR_poke_stack_w_uxn_stack_h_l183_c3_471a_address : unsigned(7 downto 0);
 variable VAR_poke_stack_w_uxn_stack_h_l183_c3_471a_value : unsigned(7 downto 0);
 variable VAR_poke_stack_w_uxn_stack_h_l183_c3_471a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_poke_stack_r_uxn_stack_h_l185_c3_749a_address : unsigned(7 downto 0);
 variable VAR_poke_stack_r_uxn_stack_h_l185_c3_749a_value : unsigned(7 downto 0);
 variable VAR_poke_stack_r_uxn_stack_h_l185_c3_749a_CLOCK_ENABLE : unsigned(0 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_stack_h_l182_c6_6502_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_address := address;
     VAR_value := value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_iftrue := VAR_CLOCK_ENABLE;
     VAR_poke_stack_r_uxn_stack_h_l185_c3_749a_address := VAR_address;
     VAR_poke_stack_w_uxn_stack_h_l183_c3_471a_address := VAR_address;
     VAR_BIN_OP_EQ_uxn_stack_h_l182_c6_6502_left := VAR_stack_index;
     VAR_poke_stack_r_uxn_stack_h_l185_c3_749a_value := VAR_value;
     VAR_poke_stack_w_uxn_stack_h_l183_c3_471a_value := VAR_value;
     -- BIN_OP_EQ[uxn_stack_h_l182_c6_6502] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l182_c6_6502_left <= VAR_BIN_OP_EQ_uxn_stack_h_l182_c6_6502_left;
     BIN_OP_EQ_uxn_stack_h_l182_c6_6502_right <= VAR_BIN_OP_EQ_uxn_stack_h_l182_c6_6502_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l182_c6_6502_return_output := BIN_OP_EQ_uxn_stack_h_l182_c6_6502_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_cond := VAR_BIN_OP_EQ_uxn_stack_h_l182_c6_6502_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_cond := VAR_BIN_OP_EQ_uxn_stack_h_l182_c6_6502_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l184_c1_4d1f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l182_c1_dc45] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_return_output;

     -- Submodule level 2
     VAR_poke_stack_r_uxn_stack_h_l185_c3_749a_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l184_c1_4d1f_return_output;
     VAR_poke_stack_w_uxn_stack_h_l183_c3_471a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l182_c1_dc45_return_output;
     -- poke_stack_w[uxn_stack_h_l183_c3_471a] LATENCY=0
     -- Clock enable
     poke_stack_w_uxn_stack_h_l183_c3_471a_CLOCK_ENABLE <= VAR_poke_stack_w_uxn_stack_h_l183_c3_471a_CLOCK_ENABLE;
     -- Inputs
     poke_stack_w_uxn_stack_h_l183_c3_471a_address <= VAR_poke_stack_w_uxn_stack_h_l183_c3_471a_address;
     poke_stack_w_uxn_stack_h_l183_c3_471a_value <= VAR_poke_stack_w_uxn_stack_h_l183_c3_471a_value;
     -- Outputs

     -- poke_stack_r[uxn_stack_h_l185_c3_749a] LATENCY=0
     -- Clock enable
     poke_stack_r_uxn_stack_h_l185_c3_749a_CLOCK_ENABLE <= VAR_poke_stack_r_uxn_stack_h_l185_c3_749a_CLOCK_ENABLE;
     -- Inputs
     poke_stack_r_uxn_stack_h_l185_c3_749a_address <= VAR_poke_stack_r_uxn_stack_h_l185_c3_749a_address;
     poke_stack_r_uxn_stack_h_l185_c3_749a_value <= VAR_poke_stack_r_uxn_stack_h_l185_c3_749a_value;
     -- Outputs

   end if;
 end loop;

end process;

end arch;
