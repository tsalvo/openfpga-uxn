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
-- BIN_OP_AND[uxn_opcodes_h_l63_c12_cde3]
signal BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l63_c12_f0fe]
signal BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l63_c32_4b9f]
signal BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_left : signed(3 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_right : signed(3 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_return_output : signed(4 downto 0);

-- MUX[uxn_opcodes_h_l63_c12_8606]
signal MUX_uxn_opcodes_h_l63_c12_8606_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l63_c12_8606_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l63_c12_8606_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l63_c12_8606_return_output : signed(3 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3
BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_left,
BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_right,
BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe
BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_left,
BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_right,
BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f
BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f : entity work.BIN_OP_PLUS_int4_t_int4_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_left,
BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_right,
BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_return_output);

-- MUX_uxn_opcodes_h_l63_c12_8606
MUX_uxn_opcodes_h_l63_c12_8606 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l63_c12_8606_cond,
MUX_uxn_opcodes_h_l63_c12_8606_iftrue,
MUX_uxn_opcodes_h_l63_c12_8606_iffalse,
MUX_uxn_opcodes_h_l63_c12_8606_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 ins,
 x,
 y,
 -- All submodule outputs
 BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_return_output,
 MUX_uxn_opcodes_h_l63_c12_8606_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : signed(3 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_x : signed(3 downto 0);
 variable VAR_y : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l63_c12_8606_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l63_c12_8606_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l63_c12_8606_iffalse : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_left : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_right : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_return_output : signed(4 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l63_c12_8606_return_output : signed(3 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_right := to_unsigned(128, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_ins := ins;
     VAR_x := x;
     VAR_y := y;

     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_left := VAR_x;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_right := VAR_y;
     VAR_MUX_uxn_opcodes_h_l63_c12_8606_iffalse := VAR_y;
     -- BIN_OP_AND[uxn_opcodes_h_l63_c12_cde3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_left;
     BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_return_output := BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l63_c32_4b9f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_left := VAR_BIN_OP_AND_uxn_opcodes_h_l63_c12_cde3_return_output;
     VAR_MUX_uxn_opcodes_h_l63_c12_8606_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l63_c32_4b9f_return_output, 4);
     -- BIN_OP_NEQ[uxn_opcodes_h_l63_c12_f0fe] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_left;
     BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_return_output := BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l63_c12_8606_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l63_c12_f0fe_return_output;
     -- MUX[uxn_opcodes_h_l63_c12_8606] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l63_c12_8606_cond <= VAR_MUX_uxn_opcodes_h_l63_c12_8606_cond;
     MUX_uxn_opcodes_h_l63_c12_8606_iftrue <= VAR_MUX_uxn_opcodes_h_l63_c12_8606_iftrue;
     MUX_uxn_opcodes_h_l63_c12_8606_iffalse <= VAR_MUX_uxn_opcodes_h_l63_c12_8606_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l63_c12_8606_return_output := MUX_uxn_opcodes_h_l63_c12_8606_return_output;

     -- Submodule level 3
     VAR_return_output := VAR_MUX_uxn_opcodes_h_l63_c12_8606_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
