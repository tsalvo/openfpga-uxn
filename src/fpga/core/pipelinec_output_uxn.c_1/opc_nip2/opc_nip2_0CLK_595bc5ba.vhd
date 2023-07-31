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
entity opc_nip2_0CLK_595bc5ba is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_nip2_0CLK_595bc5ba;
architecture arch of opc_nip2_0CLK_595bc5ba is
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
-- t2_register[uxn_opcodes_h_l138_c8_6d63]
signal t2_register_uxn_opcodes_h_l138_c8_6d63_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l138_c8_6d63_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l138_c8_6d63_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l139_c9_47c9]
signal set_uxn_opcodes_h_l139_c9_47c9_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l139_c9_47c9_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l139_c9_47c9_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l139_c9_47c9_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l139_c9_47c9_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l139_c9_47c9_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l139_c9_47c9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l140_c6_a1eb]
signal BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l141_c1_9039]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l140_c2_6d5c]
signal result_MUX_uxn_opcodes_h_l140_c2_6d5c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l140_c2_6d5c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l140_c2_6d5c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l140_c2_6d5c_return_output : unsigned(0 downto 0);

-- put2_stack[uxn_opcodes_h_l141_c9_47cd]
signal put2_stack_uxn_opcodes_h_l141_c9_47cd_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l141_c9_47cd_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l141_c9_47cd_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l141_c9_47cd_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l138_c8_6d63
t2_register_uxn_opcodes_h_l138_c8_6d63 : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l138_c8_6d63_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l138_c8_6d63_stack_index,
t2_register_uxn_opcodes_h_l138_c8_6d63_return_output);

-- set_uxn_opcodes_h_l139_c9_47c9
set_uxn_opcodes_h_l139_c9_47c9 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l139_c9_47c9_CLOCK_ENABLE,
set_uxn_opcodes_h_l139_c9_47c9_stack_index,
set_uxn_opcodes_h_l139_c9_47c9_ins,
set_uxn_opcodes_h_l139_c9_47c9_k,
set_uxn_opcodes_h_l139_c9_47c9_mul,
set_uxn_opcodes_h_l139_c9_47c9_add,
set_uxn_opcodes_h_l139_c9_47c9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb
BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_left,
BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_right,
BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_return_output);

-- result_MUX_uxn_opcodes_h_l140_c2_6d5c
result_MUX_uxn_opcodes_h_l140_c2_6d5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l140_c2_6d5c_cond,
result_MUX_uxn_opcodes_h_l140_c2_6d5c_iftrue,
result_MUX_uxn_opcodes_h_l140_c2_6d5c_iffalse,
result_MUX_uxn_opcodes_h_l140_c2_6d5c_return_output);

-- put2_stack_uxn_opcodes_h_l141_c9_47cd
put2_stack_uxn_opcodes_h_l141_c9_47cd : entity work.put2_stack_0CLK_52228af0 port map (
clk,
put2_stack_uxn_opcodes_h_l141_c9_47cd_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l141_c9_47cd_stack_index,
put2_stack_uxn_opcodes_h_l141_c9_47cd_offset,
put2_stack_uxn_opcodes_h_l141_c9_47cd_value);



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
 t2_register_uxn_opcodes_h_l138_c8_6d63_return_output,
 set_uxn_opcodes_h_l139_c9_47c9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_return_output,
 result_MUX_uxn_opcodes_h_l140_c2_6d5c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l138_c8_6d63_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l138_c8_6d63_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l138_c8_6d63_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l139_c9_47c9_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l139_c9_47c9_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l139_c9_47c9_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l139_c9_47c9_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l139_c9_47c9_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l139_c9_47c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l139_c9_47c9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l140_c2_6d5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l140_c2_6d5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l140_c2_6d5c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l140_c2_6d5c_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l141_c9_47cd_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l141_c9_47cd_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l141_c9_47cd_value : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l141_c9_47cd_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_h_l140_c2_6d5c_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l139_c9_47c9_mul := resize(to_unsigned(4, 3), 8);
     VAR_set_uxn_opcodes_h_l139_c9_47c9_add := resize(to_signed(-2, 3), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l140_c2_6d5c_iftrue := to_unsigned(1, 1);
     VAR_put2_stack_uxn_opcodes_h_l141_c9_47cd_offset := resize(to_unsigned(0, 1), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l139_c9_47c9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l138_c8_6d63_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l139_c9_47c9_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l139_c9_47c9_k := VAR_k;
     VAR_put2_stack_uxn_opcodes_h_l141_c9_47cd_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l139_c9_47c9_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l138_c8_6d63_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l139_c9_47c9] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l139_c9_47c9_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l139_c9_47c9_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l139_c9_47c9_stack_index <= VAR_set_uxn_opcodes_h_l139_c9_47c9_stack_index;
     set_uxn_opcodes_h_l139_c9_47c9_ins <= VAR_set_uxn_opcodes_h_l139_c9_47c9_ins;
     set_uxn_opcodes_h_l139_c9_47c9_k <= VAR_set_uxn_opcodes_h_l139_c9_47c9_k;
     set_uxn_opcodes_h_l139_c9_47c9_mul <= VAR_set_uxn_opcodes_h_l139_c9_47c9_mul;
     set_uxn_opcodes_h_l139_c9_47c9_add <= VAR_set_uxn_opcodes_h_l139_c9_47c9_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l139_c9_47c9_return_output := set_uxn_opcodes_h_l139_c9_47c9_return_output;

     -- t2_register[uxn_opcodes_h_l138_c8_6d63] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l138_c8_6d63_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l138_c8_6d63_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l138_c8_6d63_stack_index <= VAR_t2_register_uxn_opcodes_h_l138_c8_6d63_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l138_c8_6d63_return_output := t2_register_uxn_opcodes_h_l138_c8_6d63_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_left := VAR_set_uxn_opcodes_h_l139_c9_47c9_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l139_c9_47c9_return_output;
     VAR_put2_stack_uxn_opcodes_h_l141_c9_47cd_value := VAR_t2_register_uxn_opcodes_h_l138_c8_6d63_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l138_c8_6d63_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l140_c6_a1eb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_left;
     BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_return_output := BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l140_c2_6d5c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l140_c6_a1eb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l141_c1_9039] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_return_output;

     -- result_MUX[uxn_opcodes_h_l140_c2_6d5c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l140_c2_6d5c_cond <= VAR_result_MUX_uxn_opcodes_h_l140_c2_6d5c_cond;
     result_MUX_uxn_opcodes_h_l140_c2_6d5c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l140_c2_6d5c_iftrue;
     result_MUX_uxn_opcodes_h_l140_c2_6d5c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l140_c2_6d5c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l140_c2_6d5c_return_output := result_MUX_uxn_opcodes_h_l140_c2_6d5c_return_output;

     -- Submodule level 3
     VAR_put2_stack_uxn_opcodes_h_l141_c9_47cd_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l141_c1_9039_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l140_c2_6d5c_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l140_c2_6d5c_return_output;
     -- put2_stack[uxn_opcodes_h_l141_c9_47cd] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l141_c9_47cd_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l141_c9_47cd_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l141_c9_47cd_stack_index <= VAR_put2_stack_uxn_opcodes_h_l141_c9_47cd_stack_index;
     put2_stack_uxn_opcodes_h_l141_c9_47cd_offset <= VAR_put2_stack_uxn_opcodes_h_l141_c9_47cd_offset;
     put2_stack_uxn_opcodes_h_l141_c9_47cd_value <= VAR_put2_stack_uxn_opcodes_h_l141_c9_47cd_value;
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