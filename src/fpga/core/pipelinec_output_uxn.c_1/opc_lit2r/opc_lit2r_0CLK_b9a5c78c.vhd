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
-- Submodules: 7
entity opc_lit2r_0CLK_b9a5c78c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_lit2r_0CLK_b9a5c78c;
architecture arch of opc_lit2r_0CLK_b9a5c78c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- pc_get[uxn_opcodes_h_l78_c20_5672]
signal pc_get_uxn_opcodes_h_l78_c20_5672_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l78_c20_5672_return_output : unsigned(15 downto 0);

-- peek2_ram[uxn_opcodes_h_l78_c10_8a8b]
signal peek2_ram_uxn_opcodes_h_l78_c10_8a8b_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_h_l78_c10_8a8b_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_h_l78_c10_8a8b_return_output : unsigned(15 downto 0);

-- push2_stack[uxn_opcodes_h_l79_c9_d37a]
signal push2_stack_uxn_opcodes_h_l79_c9_d37a_CLOCK_ENABLE : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l79_c9_d37a_stack_index : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l79_c9_d37a_ins : unsigned(7 downto 0);
signal push2_stack_uxn_opcodes_h_l79_c9_d37a_value : unsigned(15 downto 0);
signal push2_stack_uxn_opcodes_h_l79_c9_d37a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l80_c6_4fc2]
signal BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l81_c1_578a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l80_c2_c0cf]
signal result_MUX_uxn_opcodes_h_l80_c2_c0cf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l80_c2_c0cf_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l80_c2_c0cf_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l80_c2_c0cf_return_output : unsigned(0 downto 0);

-- pc_add[uxn_opcodes_h_l81_c9_f60a]
signal pc_add_uxn_opcodes_h_l81_c9_f60a_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_opcodes_h_l81_c9_f60a_adjustment : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_opcodes_h_l78_c20_5672
pc_get_uxn_opcodes_h_l78_c20_5672 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l78_c20_5672_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l78_c20_5672_return_output);

-- peek2_ram_uxn_opcodes_h_l78_c10_8a8b
peek2_ram_uxn_opcodes_h_l78_c10_8a8b : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_h_l78_c10_8a8b_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_h_l78_c10_8a8b_address,
peek2_ram_uxn_opcodes_h_l78_c10_8a8b_return_output);

-- push2_stack_uxn_opcodes_h_l79_c9_d37a
push2_stack_uxn_opcodes_h_l79_c9_d37a : entity work.push2_stack_0CLK_415a9aa2 port map (
clk,
push2_stack_uxn_opcodes_h_l79_c9_d37a_CLOCK_ENABLE,
push2_stack_uxn_opcodes_h_l79_c9_d37a_stack_index,
push2_stack_uxn_opcodes_h_l79_c9_d37a_ins,
push2_stack_uxn_opcodes_h_l79_c9_d37a_value,
push2_stack_uxn_opcodes_h_l79_c9_d37a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2
BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_left,
BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_right,
BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_return_output);

-- result_MUX_uxn_opcodes_h_l80_c2_c0cf
result_MUX_uxn_opcodes_h_l80_c2_c0cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l80_c2_c0cf_cond,
result_MUX_uxn_opcodes_h_l80_c2_c0cf_iftrue,
result_MUX_uxn_opcodes_h_l80_c2_c0cf_iffalse,
result_MUX_uxn_opcodes_h_l80_c2_c0cf_return_output);

-- pc_add_uxn_opcodes_h_l81_c9_f60a
pc_add_uxn_opcodes_h_l81_c9_f60a : entity work.pc_add_0CLK_8573165f port map (
clk,
pc_add_uxn_opcodes_h_l81_c9_f60a_CLOCK_ENABLE,
pc_add_uxn_opcodes_h_l81_c9_f60a_adjustment);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 -- Registers
 tmp8,
 tmp16,
 result,
 -- All submodule outputs
 pc_get_uxn_opcodes_h_l78_c20_5672_return_output,
 peek2_ram_uxn_opcodes_h_l78_c10_8a8b_return_output,
 push2_stack_uxn_opcodes_h_l79_c9_d37a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_return_output,
 result_MUX_uxn_opcodes_h_l80_c2_c0cf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l78_c10_8a8b_address : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l78_c20_5672_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l78_c20_5672_return_output : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l78_c10_8a8b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l78_c10_8a8b_return_output : unsigned(15 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_stack_index : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_ins : unsigned(7 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_value : unsigned(15 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l80_c2_c0cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l80_c2_c0cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l80_c2_c0cf_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l80_c2_c0cf_cond : unsigned(0 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l81_c9_f60a_adjustment : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l81_c9_f60a_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp8 := tmp8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_MUX_uxn_opcodes_h_l80_c2_c0cf_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l80_c2_c0cf_iffalse := to_unsigned(0, 1);
     VAR_pc_add_uxn_opcodes_h_l81_c9_f60a_adjustment := resize(to_unsigned(2, 2), 16);
     VAR_BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_ins := ins;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_iffalse := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_opcodes_h_l78_c20_5672_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_peek2_ram_uxn_opcodes_h_l78_c10_8a8b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_ins := VAR_ins;
     VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_stack_index := VAR_stack_index;
     -- pc_get[uxn_opcodes_h_l78_c20_5672] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l78_c20_5672_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l78_c20_5672_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l78_c20_5672_return_output := pc_get_uxn_opcodes_h_l78_c20_5672_return_output;

     -- Submodule level 1
     VAR_peek2_ram_uxn_opcodes_h_l78_c10_8a8b_address := VAR_pc_get_uxn_opcodes_h_l78_c20_5672_return_output;
     -- peek2_ram[uxn_opcodes_h_l78_c10_8a8b] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_h_l78_c10_8a8b_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_h_l78_c10_8a8b_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_h_l78_c10_8a8b_address <= VAR_peek2_ram_uxn_opcodes_h_l78_c10_8a8b_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_h_l78_c10_8a8b_return_output := peek2_ram_uxn_opcodes_h_l78_c10_8a8b_return_output;

     -- Submodule level 2
     VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_value := VAR_peek2_ram_uxn_opcodes_h_l78_c10_8a8b_return_output;
     REG_VAR_tmp16 := VAR_peek2_ram_uxn_opcodes_h_l78_c10_8a8b_return_output;
     -- push2_stack[uxn_opcodes_h_l79_c9_d37a] LATENCY=0
     -- Clock enable
     push2_stack_uxn_opcodes_h_l79_c9_d37a_CLOCK_ENABLE <= VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_CLOCK_ENABLE;
     -- Inputs
     push2_stack_uxn_opcodes_h_l79_c9_d37a_stack_index <= VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_stack_index;
     push2_stack_uxn_opcodes_h_l79_c9_d37a_ins <= VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_ins;
     push2_stack_uxn_opcodes_h_l79_c9_d37a_value <= VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_value;
     -- Outputs
     VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_return_output := push2_stack_uxn_opcodes_h_l79_c9_d37a_return_output;

     -- Submodule level 3
     VAR_BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_left := VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_return_output;
     REG_VAR_tmp8 := VAR_push2_stack_uxn_opcodes_h_l79_c9_d37a_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l80_c6_4fc2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_left;
     BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_return_output := BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l80_c2_c0cf_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l80_c6_4fc2_return_output;
     -- result_MUX[uxn_opcodes_h_l80_c2_c0cf] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l80_c2_c0cf_cond <= VAR_result_MUX_uxn_opcodes_h_l80_c2_c0cf_cond;
     result_MUX_uxn_opcodes_h_l80_c2_c0cf_iftrue <= VAR_result_MUX_uxn_opcodes_h_l80_c2_c0cf_iftrue;
     result_MUX_uxn_opcodes_h_l80_c2_c0cf_iffalse <= VAR_result_MUX_uxn_opcodes_h_l80_c2_c0cf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l80_c2_c0cf_return_output := result_MUX_uxn_opcodes_h_l80_c2_c0cf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l81_c1_578a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_return_output;

     -- Submodule level 5
     VAR_pc_add_uxn_opcodes_h_l81_c9_f60a_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l81_c1_578a_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l80_c2_c0cf_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l80_c2_c0cf_return_output;
     -- pc_add[uxn_opcodes_h_l81_c9_f60a] LATENCY=0
     -- Clock enable
     pc_add_uxn_opcodes_h_l81_c9_f60a_CLOCK_ENABLE <= VAR_pc_add_uxn_opcodes_h_l81_c9_f60a_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_opcodes_h_l81_c9_f60a_adjustment <= VAR_pc_add_uxn_opcodes_h_l81_c9_f60a_adjustment;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp8 <= REG_COMB_tmp8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
