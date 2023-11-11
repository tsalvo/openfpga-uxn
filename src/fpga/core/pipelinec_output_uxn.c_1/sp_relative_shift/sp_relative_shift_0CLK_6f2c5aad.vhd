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
-- Submodules: 4
entity sp_relative_shift_0CLK_6f2c5aad is
port(
 ins : in unsigned(7 downto 0);
 x : in signed(3 downto 0);
 y : in signed(3 downto 0);
 return_output : out signed(3 downto 0));
end sp_relative_shift_0CLK_6f2c5aad;
architecture arch of sp_relative_shift_0CLK_6f2c5aad is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_AND[uxn_opcodes_h_l64_c12_fed0]
signal BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l64_c12_4a80]
signal BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l64_c31_14b7]
signal BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_left : signed(3 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_right : signed(3 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_return_output : signed(4 downto 0);

-- MUX[uxn_opcodes_h_l64_c12_e079]
signal MUX_uxn_opcodes_h_l64_c12_e079_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l64_c12_e079_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l64_c12_e079_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l64_c12_e079_return_output : signed(3 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0
BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_left,
BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_right,
BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80
BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_left,
BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_right,
BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7
BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7 : entity work.BIN_OP_PLUS_int4_t_int4_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_left,
BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_right,
BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_return_output);

-- MUX_uxn_opcodes_h_l64_c12_e079
MUX_uxn_opcodes_h_l64_c12_e079 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l64_c12_e079_cond,
MUX_uxn_opcodes_h_l64_c12_e079_iftrue,
MUX_uxn_opcodes_h_l64_c12_e079_iffalse,
MUX_uxn_opcodes_h_l64_c12_e079_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 ins,
 x,
 y,
 -- All submodule outputs
 BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_return_output,
 BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_return_output,
 MUX_uxn_opcodes_h_l64_c12_e079_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : signed(3 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_x : signed(3 downto 0);
 variable VAR_y : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l64_c12_e079_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l64_c12_e079_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l64_c12_e079_iffalse : signed(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_left : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_right : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_return_output : signed(4 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l64_c12_e079_return_output : signed(3 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_right := to_unsigned(128, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_ins := ins;
     VAR_x := x;
     VAR_y := y;

     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_left := VAR_x;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_right := VAR_y;
     VAR_MUX_uxn_opcodes_h_l64_c12_e079_iffalse := VAR_y;
     -- BIN_OP_PLUS[uxn_opcodes_h_l64_c31_14b7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l64_c12_fed0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_left;
     BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_return_output := BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_left := VAR_BIN_OP_AND_uxn_opcodes_h_l64_c12_fed0_return_output;
     VAR_MUX_uxn_opcodes_h_l64_c12_e079_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c31_14b7_return_output, 4);
     -- BIN_OP_GT[uxn_opcodes_h_l64_c12_4a80] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_left;
     BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_return_output := BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l64_c12_e079_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l64_c12_4a80_return_output;
     -- MUX[uxn_opcodes_h_l64_c12_e079] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l64_c12_e079_cond <= VAR_MUX_uxn_opcodes_h_l64_c12_e079_cond;
     MUX_uxn_opcodes_h_l64_c12_e079_iftrue <= VAR_MUX_uxn_opcodes_h_l64_c12_e079_iftrue;
     MUX_uxn_opcodes_h_l64_c12_e079_iffalse <= VAR_MUX_uxn_opcodes_h_l64_c12_e079_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l64_c12_e079_return_output := MUX_uxn_opcodes_h_l64_c12_e079_return_output;

     -- Submodule level 3
     VAR_return_output := VAR_MUX_uxn_opcodes_h_l64_c12_e079_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
