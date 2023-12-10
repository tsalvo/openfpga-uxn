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
-- Submodules: 6
entity BIN_OP_SL_uint16_t_uint2_t_0CLK_5af1a430 is
port(
 left : in unsigned(15 downto 0);
 right : in unsigned(1 downto 0);
 return_output : out unsigned(15 downto 0));
end BIN_OP_SL_uint16_t_uint2_t_0CLK_5af1a430;
architecture arch of BIN_OP_SL_uint16_t_uint2_t_0CLK_5af1a430 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- CONST_SL_1[BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57]
signal CONST_SL_1_BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57_x : unsigned(15 downto 0);
signal CONST_SL_1_BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc]
signal MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_return_output : unsigned(15 downto 0);

-- CONST_SL_2[BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf]
signal CONST_SL_2_BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf_x : unsigned(15 downto 0);
signal CONST_SL_2_BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75]
signal MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_return_output : unsigned(15 downto 0);

function uint16_0_0( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint16_1_1( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SL_1_BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57
CONST_SL_1_BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57 : entity work.CONST_SL_1_uint16_t_0CLK_de264c78 port map (
CONST_SL_1_BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57_x,
CONST_SL_1_BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc
MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_cond,
MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_iftrue,
MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_iffalse,
MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_return_output);

-- CONST_SL_2_BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf
CONST_SL_2_BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf : entity work.CONST_SL_2_uint16_t_0CLK_de264c78 port map (
CONST_SL_2_BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf_x,
CONST_SL_2_BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75
MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_cond,
MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_iftrue,
MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_iffalse,
MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 CONST_SL_1_BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57_return_output,
 MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_return_output,
 CONST_SL_2_BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf_return_output,
 MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(1 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_resized_shift_amount : unsigned(1 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint2_t_c_l11_c3_7e31 : unsigned(1 downto 0);
 variable VAR_rv : unsigned(15 downto 0);
 variable VAR_v0 : unsigned(15 downto 0);
 variable VAR_v1 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_cond : unsigned(0 downto 0);
 variable VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_e762_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_return_output : unsigned(15 downto 0);
 variable VAR_v2 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_cond : unsigned(0 downto 0);
 variable VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_c078_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_return_output : unsigned(15 downto 0);
begin

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57_x := VAR_left;
     VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_iffalse := VAR_left;
     VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint2_t_c_l11_c3_7e31 := VAR_right;
     -- CONST_SL_1[BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57] LATENCY=0
     -- Inputs
     CONST_SL_1_BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57_x <= VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57_x;
     -- Outputs
     VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57_return_output := CONST_SL_1_BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57_return_output;

     -- uint16_0_0[BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_e762] LATENCY=0
     VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_e762_return_output := uint16_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint2_t_c_l11_c3_7e31, 16));

     -- uint16_1_1[BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_c078] LATENCY=0
     VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_c078_return_output := uint16_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint2_t_c_l11_c3_7e31, 16));

     -- Submodule level 1
     VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_iftrue := VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint2_t_c_l18_c55_1e57_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_cond := VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_e762_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_cond := VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_c078_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_cond;
     MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_return_output := MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_return_output;

     -- Submodule level 2
     VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf_x := VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l18_c19_f9dc_return_output;
     -- CONST_SL_2[BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf] LATENCY=0
     -- Inputs
     CONST_SL_2_BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf_x <= VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf_x;
     -- Outputs
     VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf_return_output := CONST_SL_2_BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_iftrue := VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint2_t_c_l19_c55_22bf_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_cond;
     MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_return_output := MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_MUX_BIN_OP_SL_uint16_t_uint2_t_c_l19_c19_fd75_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
