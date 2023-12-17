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
-- BIN_OP_AND[uxn_opcodes_h_l63_c12_218a]
signal BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l63_c12_118f]
signal BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l63_c32_7025]
signal BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_left : signed(3 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_right : signed(3 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_return_output : signed(4 downto 0);

-- MUX[uxn_opcodes_h_l63_c12_8a04]
signal MUX_uxn_opcodes_h_l63_c12_8a04_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l63_c12_8a04_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l63_c12_8a04_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l63_c12_8a04_return_output : signed(3 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_opcodes_h_l63_c12_218a
BIN_OP_AND_uxn_opcodes_h_l63_c12_218a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_left,
BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_right,
BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f
BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_left,
BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_right,
BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025
BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025 : entity work.BIN_OP_PLUS_int4_t_int4_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_left,
BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_right,
BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_return_output);

-- MUX_uxn_opcodes_h_l63_c12_8a04
MUX_uxn_opcodes_h_l63_c12_8a04 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l63_c12_8a04_cond,
MUX_uxn_opcodes_h_l63_c12_8a04_iftrue,
MUX_uxn_opcodes_h_l63_c12_8a04_iffalse,
MUX_uxn_opcodes_h_l63_c12_8a04_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 ins,
 x,
 y,
 -- All submodule outputs
 BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_return_output,
 MUX_uxn_opcodes_h_l63_c12_8a04_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : signed(3 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_x : signed(3 downto 0);
 variable VAR_y : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l63_c12_8a04_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l63_c12_8a04_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l63_c12_8a04_iffalse : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_left : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_right : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_return_output : signed(4 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l63_c12_8a04_return_output : signed(3 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_right := to_unsigned(128, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_ins := ins;
     VAR_x := x;
     VAR_y := y;

     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_left := VAR_x;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_right := VAR_y;
     VAR_MUX_uxn_opcodes_h_l63_c12_8a04_iffalse := VAR_y;
     -- BIN_OP_PLUS[uxn_opcodes_h_l63_c32_7025] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_left;
     BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_return_output := BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l63_c12_218a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_left;
     BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_return_output := BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_218a_return_output;
     VAR_MUX_uxn_opcodes_h_l63_c12_8a04_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_7025_return_output, 4);
     -- BIN_OP_NEQ[uxn_opcodes_h_l63_c12_118f] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_left;
     BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_return_output := BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l63_c12_8a04_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_118f_return_output;
     -- MUX[uxn_opcodes_h_l63_c12_8a04] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l63_c12_8a04_cond <= VAR_MUX_uxn_opcodes_h_l63_c12_8a04_cond;
     MUX_uxn_opcodes_h_l63_c12_8a04_iftrue <= VAR_MUX_uxn_opcodes_h_l63_c12_8a04_iftrue;
     MUX_uxn_opcodes_h_l63_c12_8a04_iffalse <= VAR_MUX_uxn_opcodes_h_l63_c12_8a04_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l63_c12_8a04_return_output := MUX_uxn_opcodes_h_l63_c12_8a04_return_output;

     -- Submodule level 3
     VAR_return_output := VAR_MUX_uxn_opcodes_h_l63_c12_8a04_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
