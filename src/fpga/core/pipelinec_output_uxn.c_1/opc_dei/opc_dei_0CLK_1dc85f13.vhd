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
entity opc_dei_0CLK_1dc85f13 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_dei_0CLK_1dc85f13;
architecture arch of opc_dei_0CLK_1dc85f13 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l694_c7_9e6c]
signal t_register_uxn_opcodes_h_l694_c7_9e6c_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l694_c7_9e6c_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l694_c7_9e6c_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l695_c9_033c]
signal set_uxn_opcodes_h_l695_c9_033c_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l695_c9_033c_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l695_c9_033c_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l695_c9_033c_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l695_c9_033c_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l695_c9_033c_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l695_c9_033c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l696_c6_6521]
signal BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l697_c1_12b3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l696_c2_ad90]
signal result_MUX_uxn_opcodes_h_l696_c2_ad90_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l696_c2_ad90_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l696_c2_ad90_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l696_c2_ad90_return_output : unsigned(0 downto 0);

-- dei[uxn_opcodes_h_l698_c3_7afe]
signal dei_uxn_opcodes_h_l698_c3_7afe_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l698_c3_7afe_stack_index : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l698_c3_7afe_stack_offset : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l698_c3_7afe_addr : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l694_c7_9e6c
t_register_uxn_opcodes_h_l694_c7_9e6c : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l694_c7_9e6c_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l694_c7_9e6c_stack_index,
t_register_uxn_opcodes_h_l694_c7_9e6c_return_output);

-- set_uxn_opcodes_h_l695_c9_033c
set_uxn_opcodes_h_l695_c9_033c : entity work.set_0CLK_5678f3b8 port map (
clk,
set_uxn_opcodes_h_l695_c9_033c_CLOCK_ENABLE,
set_uxn_opcodes_h_l695_c9_033c_stack_index,
set_uxn_opcodes_h_l695_c9_033c_ins,
set_uxn_opcodes_h_l695_c9_033c_k,
set_uxn_opcodes_h_l695_c9_033c_mul,
set_uxn_opcodes_h_l695_c9_033c_add,
set_uxn_opcodes_h_l695_c9_033c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l696_c6_6521
BIN_OP_GT_uxn_opcodes_h_l696_c6_6521 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_left,
BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_right,
BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_return_output);

-- result_MUX_uxn_opcodes_h_l696_c2_ad90
result_MUX_uxn_opcodes_h_l696_c2_ad90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l696_c2_ad90_cond,
result_MUX_uxn_opcodes_h_l696_c2_ad90_iftrue,
result_MUX_uxn_opcodes_h_l696_c2_ad90_iffalse,
result_MUX_uxn_opcodes_h_l696_c2_ad90_return_output);

-- dei_uxn_opcodes_h_l698_c3_7afe
dei_uxn_opcodes_h_l698_c3_7afe : entity work.dei_0CLK_05174d79 port map (
clk,
dei_uxn_opcodes_h_l698_c3_7afe_CLOCK_ENABLE,
dei_uxn_opcodes_h_l698_c3_7afe_stack_index,
dei_uxn_opcodes_h_l698_c3_7afe_stack_offset,
dei_uxn_opcodes_h_l698_c3_7afe_addr);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l694_c7_9e6c_return_output,
 set_uxn_opcodes_h_l695_c9_033c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_return_output,
 result_MUX_uxn_opcodes_h_l696_c2_ad90_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l694_c7_9e6c_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l694_c7_9e6c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l694_c7_9e6c_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l695_c9_033c_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l695_c9_033c_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l695_c9_033c_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l695_c9_033c_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l695_c9_033c_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l695_c9_033c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l695_c9_033c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l696_c2_ad90_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l696_c2_ad90_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l696_c2_ad90_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l696_c2_ad90_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l698_c3_7afe_stack_index : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l698_c3_7afe_stack_offset : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l698_c3_7afe_addr : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l698_c3_7afe_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_MUX_uxn_opcodes_h_l696_c2_ad90_iffalse := to_unsigned(0, 1);
     VAR_dei_uxn_opcodes_h_l698_c3_7afe_stack_offset := resize(to_unsigned(0, 1), 8);
     VAR_set_uxn_opcodes_h_l695_c9_033c_mul := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l695_c9_033c_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_MUX_uxn_opcodes_h_l696_c2_ad90_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l695_c9_033c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l694_c7_9e6c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l695_c9_033c_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l695_c9_033c_k := VAR_k;
     VAR_dei_uxn_opcodes_h_l698_c3_7afe_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l695_c9_033c_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l694_c7_9e6c_stack_index := VAR_stack_index;
     -- t_register[uxn_opcodes_h_l694_c7_9e6c] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l694_c7_9e6c_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l694_c7_9e6c_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l694_c7_9e6c_stack_index <= VAR_t_register_uxn_opcodes_h_l694_c7_9e6c_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l694_c7_9e6c_return_output := t_register_uxn_opcodes_h_l694_c7_9e6c_return_output;

     -- set[uxn_opcodes_h_l695_c9_033c] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l695_c9_033c_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l695_c9_033c_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l695_c9_033c_stack_index <= VAR_set_uxn_opcodes_h_l695_c9_033c_stack_index;
     set_uxn_opcodes_h_l695_c9_033c_ins <= VAR_set_uxn_opcodes_h_l695_c9_033c_ins;
     set_uxn_opcodes_h_l695_c9_033c_k <= VAR_set_uxn_opcodes_h_l695_c9_033c_k;
     set_uxn_opcodes_h_l695_c9_033c_mul <= VAR_set_uxn_opcodes_h_l695_c9_033c_mul;
     set_uxn_opcodes_h_l695_c9_033c_add <= VAR_set_uxn_opcodes_h_l695_c9_033c_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l695_c9_033c_return_output := set_uxn_opcodes_h_l695_c9_033c_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_left := VAR_set_uxn_opcodes_h_l695_c9_033c_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l695_c9_033c_return_output;
     VAR_dei_uxn_opcodes_h_l698_c3_7afe_addr := VAR_t_register_uxn_opcodes_h_l694_c7_9e6c_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l694_c7_9e6c_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l696_c6_6521] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_left;
     BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_return_output := BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_return_output;
     VAR_result_MUX_uxn_opcodes_h_l696_c2_ad90_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_6521_return_output;
     -- result_MUX[uxn_opcodes_h_l696_c2_ad90] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l696_c2_ad90_cond <= VAR_result_MUX_uxn_opcodes_h_l696_c2_ad90_cond;
     result_MUX_uxn_opcodes_h_l696_c2_ad90_iftrue <= VAR_result_MUX_uxn_opcodes_h_l696_c2_ad90_iftrue;
     result_MUX_uxn_opcodes_h_l696_c2_ad90_iffalse <= VAR_result_MUX_uxn_opcodes_h_l696_c2_ad90_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l696_c2_ad90_return_output := result_MUX_uxn_opcodes_h_l696_c2_ad90_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l697_c1_12b3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_return_output;

     -- Submodule level 3
     VAR_dei_uxn_opcodes_h_l698_c3_7afe_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_12b3_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l696_c2_ad90_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l696_c2_ad90_return_output;
     -- dei[uxn_opcodes_h_l698_c3_7afe] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l698_c3_7afe_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l698_c3_7afe_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l698_c3_7afe_stack_index <= VAR_dei_uxn_opcodes_h_l698_c3_7afe_stack_index;
     dei_uxn_opcodes_h_l698_c3_7afe_stack_offset <= VAR_dei_uxn_opcodes_h_l698_c3_7afe_stack_offset;
     dei_uxn_opcodes_h_l698_c3_7afe_addr <= VAR_dei_uxn_opcodes_h_l698_c3_7afe_addr;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
