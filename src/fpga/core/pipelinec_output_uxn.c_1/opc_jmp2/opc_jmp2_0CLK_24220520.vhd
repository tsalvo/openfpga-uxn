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
entity opc_jmp2_0CLK_24220520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jmp2_0CLK_24220520;
architecture arch of opc_jmp2_0CLK_24220520 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t2_register[uxn_opcodes_h_l406_c8_a157]
signal t2_register_uxn_opcodes_h_l406_c8_a157_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l406_c8_a157_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l406_c8_a157_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l407_c9_0cbd]
signal set_uxn_opcodes_h_l407_c9_0cbd_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l407_c9_0cbd_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l407_c9_0cbd_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l407_c9_0cbd_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l407_c9_0cbd_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l407_c9_0cbd_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l407_c9_0cbd_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l408_c6_2d3d]
signal BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l409_c1_33e7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l408_c2_107a]
signal result_MUX_uxn_opcodes_h_l408_c2_107a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l408_c2_107a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l408_c2_107a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l408_c2_107a_return_output : unsigned(0 downto 0);

-- pc_set[uxn_opcodes_h_l410_c3_9d3c]
signal pc_set_uxn_opcodes_h_l410_c3_9d3c_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_set_uxn_opcodes_h_l410_c3_9d3c_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l406_c8_a157
t2_register_uxn_opcodes_h_l406_c8_a157 : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l406_c8_a157_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l406_c8_a157_stack_index,
t2_register_uxn_opcodes_h_l406_c8_a157_return_output);

-- set_uxn_opcodes_h_l407_c9_0cbd
set_uxn_opcodes_h_l407_c9_0cbd : entity work.set_0CLK_5678f3b8 port map (
clk,
set_uxn_opcodes_h_l407_c9_0cbd_CLOCK_ENABLE,
set_uxn_opcodes_h_l407_c9_0cbd_stack_index,
set_uxn_opcodes_h_l407_c9_0cbd_ins,
set_uxn_opcodes_h_l407_c9_0cbd_k,
set_uxn_opcodes_h_l407_c9_0cbd_mul,
set_uxn_opcodes_h_l407_c9_0cbd_add,
set_uxn_opcodes_h_l407_c9_0cbd_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d
BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_left,
BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_right,
BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_return_output);

-- result_MUX_uxn_opcodes_h_l408_c2_107a
result_MUX_uxn_opcodes_h_l408_c2_107a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l408_c2_107a_cond,
result_MUX_uxn_opcodes_h_l408_c2_107a_iftrue,
result_MUX_uxn_opcodes_h_l408_c2_107a_iffalse,
result_MUX_uxn_opcodes_h_l408_c2_107a_return_output);

-- pc_set_uxn_opcodes_h_l410_c3_9d3c
pc_set_uxn_opcodes_h_l410_c3_9d3c : entity work.pc_set_0CLK_b45f1687 port map (
clk,
pc_set_uxn_opcodes_h_l410_c3_9d3c_CLOCK_ENABLE,
pc_set_uxn_opcodes_h_l410_c3_9d3c_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 t2_register_uxn_opcodes_h_l406_c8_a157_return_output,
 set_uxn_opcodes_h_l407_c9_0cbd_return_output,
 BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_return_output,
 result_MUX_uxn_opcodes_h_l408_c2_107a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l406_c8_a157_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l406_c8_a157_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l406_c8_a157_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l407_c9_0cbd_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l407_c9_0cbd_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l407_c9_0cbd_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l407_c9_0cbd_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l407_c9_0cbd_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l407_c9_0cbd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l407_c9_0cbd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l408_c2_107a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l408_c2_107a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l408_c2_107a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l408_c2_107a_cond : unsigned(0 downto 0);
 variable VAR_pc_set_uxn_opcodes_h_l410_c3_9d3c_value : unsigned(15 downto 0);
 variable VAR_pc_set_uxn_opcodes_h_l410_c3_9d3c_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_MUX_uxn_opcodes_h_l408_c2_107a_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l407_c9_0cbd_mul := resize(to_unsigned(2, 2), 8);
     VAR_set_uxn_opcodes_h_l407_c9_0cbd_add := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l408_c2_107a_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_k := k;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l407_c9_0cbd_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l406_c8_a157_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l407_c9_0cbd_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l407_c9_0cbd_k := VAR_k;
     VAR_set_uxn_opcodes_h_l407_c9_0cbd_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l406_c8_a157_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l407_c9_0cbd] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l407_c9_0cbd_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l407_c9_0cbd_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l407_c9_0cbd_stack_index <= VAR_set_uxn_opcodes_h_l407_c9_0cbd_stack_index;
     set_uxn_opcodes_h_l407_c9_0cbd_ins <= VAR_set_uxn_opcodes_h_l407_c9_0cbd_ins;
     set_uxn_opcodes_h_l407_c9_0cbd_k <= VAR_set_uxn_opcodes_h_l407_c9_0cbd_k;
     set_uxn_opcodes_h_l407_c9_0cbd_mul <= VAR_set_uxn_opcodes_h_l407_c9_0cbd_mul;
     set_uxn_opcodes_h_l407_c9_0cbd_add <= VAR_set_uxn_opcodes_h_l407_c9_0cbd_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l407_c9_0cbd_return_output := set_uxn_opcodes_h_l407_c9_0cbd_return_output;

     -- t2_register[uxn_opcodes_h_l406_c8_a157] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l406_c8_a157_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l406_c8_a157_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l406_c8_a157_stack_index <= VAR_t2_register_uxn_opcodes_h_l406_c8_a157_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l406_c8_a157_return_output := t2_register_uxn_opcodes_h_l406_c8_a157_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_left := VAR_set_uxn_opcodes_h_l407_c9_0cbd_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l407_c9_0cbd_return_output;
     VAR_pc_set_uxn_opcodes_h_l410_c3_9d3c_value := VAR_t2_register_uxn_opcodes_h_l406_c8_a157_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l406_c8_a157_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l408_c6_2d3d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_left;
     BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_return_output := BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l408_c2_107a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l408_c6_2d3d_return_output;
     -- result_MUX[uxn_opcodes_h_l408_c2_107a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l408_c2_107a_cond <= VAR_result_MUX_uxn_opcodes_h_l408_c2_107a_cond;
     result_MUX_uxn_opcodes_h_l408_c2_107a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l408_c2_107a_iftrue;
     result_MUX_uxn_opcodes_h_l408_c2_107a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l408_c2_107a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l408_c2_107a_return_output := result_MUX_uxn_opcodes_h_l408_c2_107a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l409_c1_33e7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_return_output;

     -- Submodule level 3
     VAR_pc_set_uxn_opcodes_h_l410_c3_9d3c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l409_c1_33e7_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l408_c2_107a_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l408_c2_107a_return_output;
     -- pc_set[uxn_opcodes_h_l410_c3_9d3c] LATENCY=0
     -- Clock enable
     pc_set_uxn_opcodes_h_l410_c3_9d3c_CLOCK_ENABLE <= VAR_pc_set_uxn_opcodes_h_l410_c3_9d3c_CLOCK_ENABLE;
     -- Inputs
     pc_set_uxn_opcodes_h_l410_c3_9d3c_value <= VAR_pc_set_uxn_opcodes_h_l410_c3_9d3c_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
