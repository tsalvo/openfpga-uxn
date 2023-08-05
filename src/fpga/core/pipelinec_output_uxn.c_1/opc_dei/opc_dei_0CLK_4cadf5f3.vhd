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
entity opc_dei_0CLK_4cadf5f3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_dei_0CLK_4cadf5f3;
architecture arch of opc_dei_0CLK_4cadf5f3 is
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
-- t_register[uxn_opcodes_h_l694_c7_d496]
signal t_register_uxn_opcodes_h_l694_c7_d496_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l694_c7_d496_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l694_c7_d496_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l695_c9_b9e0]
signal set_uxn_opcodes_h_l695_c9_b9e0_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l695_c9_b9e0_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l695_c9_b9e0_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l695_c9_b9e0_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l695_c9_b9e0_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l695_c9_b9e0_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l695_c9_b9e0_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l696_c6_d948]
signal BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l697_c1_b945]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l696_c2_75ef]
signal result_MUX_uxn_opcodes_h_l696_c2_75ef_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l696_c2_75ef_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l696_c2_75ef_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l696_c2_75ef_return_output : unsigned(0 downto 0);

-- dei[uxn_opcodes_h_l698_c3_08ad]
signal dei_uxn_opcodes_h_l698_c3_08ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l698_c3_08ad_stack_index : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l698_c3_08ad_stack_offset : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l698_c3_08ad_addr : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l694_c7_d496
t_register_uxn_opcodes_h_l694_c7_d496 : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l694_c7_d496_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l694_c7_d496_stack_index,
t_register_uxn_opcodes_h_l694_c7_d496_return_output);

-- set_uxn_opcodes_h_l695_c9_b9e0
set_uxn_opcodes_h_l695_c9_b9e0 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l695_c9_b9e0_CLOCK_ENABLE,
set_uxn_opcodes_h_l695_c9_b9e0_stack_index,
set_uxn_opcodes_h_l695_c9_b9e0_ins,
set_uxn_opcodes_h_l695_c9_b9e0_k,
set_uxn_opcodes_h_l695_c9_b9e0_mul,
set_uxn_opcodes_h_l695_c9_b9e0_add,
set_uxn_opcodes_h_l695_c9_b9e0_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l696_c6_d948
BIN_OP_GT_uxn_opcodes_h_l696_c6_d948 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_left,
BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_right,
BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_return_output);

-- result_MUX_uxn_opcodes_h_l696_c2_75ef
result_MUX_uxn_opcodes_h_l696_c2_75ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l696_c2_75ef_cond,
result_MUX_uxn_opcodes_h_l696_c2_75ef_iftrue,
result_MUX_uxn_opcodes_h_l696_c2_75ef_iffalse,
result_MUX_uxn_opcodes_h_l696_c2_75ef_return_output);

-- dei_uxn_opcodes_h_l698_c3_08ad
dei_uxn_opcodes_h_l698_c3_08ad : entity work.dei_0CLK_8eeaad6f port map (
clk,
dei_uxn_opcodes_h_l698_c3_08ad_CLOCK_ENABLE,
dei_uxn_opcodes_h_l698_c3_08ad_stack_index,
dei_uxn_opcodes_h_l698_c3_08ad_stack_offset,
dei_uxn_opcodes_h_l698_c3_08ad_addr);



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
 t_register_uxn_opcodes_h_l694_c7_d496_return_output,
 set_uxn_opcodes_h_l695_c9_b9e0_return_output,
 BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_return_output,
 result_MUX_uxn_opcodes_h_l696_c2_75ef_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l694_c7_d496_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l694_c7_d496_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l694_c7_d496_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l695_c9_b9e0_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l695_c9_b9e0_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l695_c9_b9e0_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l695_c9_b9e0_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l695_c9_b9e0_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l695_c9_b9e0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l695_c9_b9e0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l696_c2_75ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l696_c2_75ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l696_c2_75ef_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l696_c2_75ef_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l698_c3_08ad_stack_index : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l698_c3_08ad_stack_offset : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l698_c3_08ad_addr : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l698_c3_08ad_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l696_c2_75ef_iftrue := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_h_l695_c9_b9e0_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_set_uxn_opcodes_h_l695_c9_b9e0_mul := resize(to_unsigned(1, 1), 8);
     VAR_dei_uxn_opcodes_h_l698_c3_08ad_stack_offset := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l696_c2_75ef_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l695_c9_b9e0_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l694_c7_d496_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l695_c9_b9e0_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l695_c9_b9e0_k := VAR_k;
     VAR_dei_uxn_opcodes_h_l698_c3_08ad_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l695_c9_b9e0_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l694_c7_d496_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l695_c9_b9e0] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l695_c9_b9e0_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l695_c9_b9e0_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l695_c9_b9e0_stack_index <= VAR_set_uxn_opcodes_h_l695_c9_b9e0_stack_index;
     set_uxn_opcodes_h_l695_c9_b9e0_ins <= VAR_set_uxn_opcodes_h_l695_c9_b9e0_ins;
     set_uxn_opcodes_h_l695_c9_b9e0_k <= VAR_set_uxn_opcodes_h_l695_c9_b9e0_k;
     set_uxn_opcodes_h_l695_c9_b9e0_mul <= VAR_set_uxn_opcodes_h_l695_c9_b9e0_mul;
     set_uxn_opcodes_h_l695_c9_b9e0_add <= VAR_set_uxn_opcodes_h_l695_c9_b9e0_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l695_c9_b9e0_return_output := set_uxn_opcodes_h_l695_c9_b9e0_return_output;

     -- t_register[uxn_opcodes_h_l694_c7_d496] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l694_c7_d496_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l694_c7_d496_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l694_c7_d496_stack_index <= VAR_t_register_uxn_opcodes_h_l694_c7_d496_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l694_c7_d496_return_output := t_register_uxn_opcodes_h_l694_c7_d496_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_left := VAR_set_uxn_opcodes_h_l695_c9_b9e0_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l695_c9_b9e0_return_output;
     VAR_dei_uxn_opcodes_h_l698_c3_08ad_addr := VAR_t_register_uxn_opcodes_h_l694_c7_d496_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l694_c7_d496_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l696_c6_d948] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_left;
     BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_return_output := BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_return_output;
     VAR_result_MUX_uxn_opcodes_h_l696_c2_75ef_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l696_c6_d948_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l697_c1_b945] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_return_output;

     -- result_MUX[uxn_opcodes_h_l696_c2_75ef] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l696_c2_75ef_cond <= VAR_result_MUX_uxn_opcodes_h_l696_c2_75ef_cond;
     result_MUX_uxn_opcodes_h_l696_c2_75ef_iftrue <= VAR_result_MUX_uxn_opcodes_h_l696_c2_75ef_iftrue;
     result_MUX_uxn_opcodes_h_l696_c2_75ef_iffalse <= VAR_result_MUX_uxn_opcodes_h_l696_c2_75ef_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l696_c2_75ef_return_output := result_MUX_uxn_opcodes_h_l696_c2_75ef_return_output;

     -- Submodule level 3
     VAR_dei_uxn_opcodes_h_l698_c3_08ad_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l697_c1_b945_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l696_c2_75ef_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l696_c2_75ef_return_output;
     -- dei[uxn_opcodes_h_l698_c3_08ad] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l698_c3_08ad_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l698_c3_08ad_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l698_c3_08ad_stack_index <= VAR_dei_uxn_opcodes_h_l698_c3_08ad_stack_index;
     dei_uxn_opcodes_h_l698_c3_08ad_stack_offset <= VAR_dei_uxn_opcodes_h_l698_c3_08ad_stack_offset;
     dei_uxn_opcodes_h_l698_c3_08ad_addr <= VAR_dei_uxn_opcodes_h_l698_c3_08ad_addr;
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
