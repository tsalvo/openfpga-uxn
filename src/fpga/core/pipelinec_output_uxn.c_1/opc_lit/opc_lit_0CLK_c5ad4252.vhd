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
entity opc_lit_0CLK_c5ad4252 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_lit_0CLK_c5ad4252;
architecture arch of opc_lit_0CLK_c5ad4252 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- pc_get[uxn_opcodes_h_l48_c47_a309]
signal pc_get_uxn_opcodes_h_l48_c47_a309_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l48_c47_a309_return_output : unsigned(15 downto 0);

-- peek_ram[uxn_opcodes_h_l48_c38_9d11]
signal peek_ram_uxn_opcodes_h_l48_c38_9d11_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_opcodes_h_l48_c38_9d11_address : unsigned(15 downto 0);
signal peek_ram_uxn_opcodes_h_l48_c38_9d11_return_output : unsigned(7 downto 0);

-- push_stack[uxn_opcodes_h_l48_c9_321d]
signal push_stack_uxn_opcodes_h_l48_c9_321d_CLOCK_ENABLE : unsigned(0 downto 0);
signal push_stack_uxn_opcodes_h_l48_c9_321d_stack_index : unsigned(0 downto 0);
signal push_stack_uxn_opcodes_h_l48_c9_321d_ins : unsigned(7 downto 0);
signal push_stack_uxn_opcodes_h_l48_c9_321d_value : unsigned(7 downto 0);
signal push_stack_uxn_opcodes_h_l48_c9_321d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l49_c6_8e32]
signal BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l50_c1_40b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l49_c2_a9b4]
signal result_MUX_uxn_opcodes_h_l49_c2_a9b4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l49_c2_a9b4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l49_c2_a9b4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l49_c2_a9b4_return_output : unsigned(0 downto 0);

-- pc_add[uxn_opcodes_h_l50_c9_30b0]
signal pc_add_uxn_opcodes_h_l50_c9_30b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_opcodes_h_l50_c9_30b0_adjustment : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_opcodes_h_l48_c47_a309
pc_get_uxn_opcodes_h_l48_c47_a309 : entity work.pc_get_0CLK_9859a581 port map (
clk,
pc_get_uxn_opcodes_h_l48_c47_a309_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l48_c47_a309_return_output);

-- peek_ram_uxn_opcodes_h_l48_c38_9d11
peek_ram_uxn_opcodes_h_l48_c38_9d11 : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_opcodes_h_l48_c38_9d11_CLOCK_ENABLE,
peek_ram_uxn_opcodes_h_l48_c38_9d11_address,
peek_ram_uxn_opcodes_h_l48_c38_9d11_return_output);

-- push_stack_uxn_opcodes_h_l48_c9_321d
push_stack_uxn_opcodes_h_l48_c9_321d : entity work.push_stack_0CLK_35cd9fc6 port map (
clk,
push_stack_uxn_opcodes_h_l48_c9_321d_CLOCK_ENABLE,
push_stack_uxn_opcodes_h_l48_c9_321d_stack_index,
push_stack_uxn_opcodes_h_l48_c9_321d_ins,
push_stack_uxn_opcodes_h_l48_c9_321d_value,
push_stack_uxn_opcodes_h_l48_c9_321d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32
BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_left,
BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_right,
BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_return_output);

-- result_MUX_uxn_opcodes_h_l49_c2_a9b4
result_MUX_uxn_opcodes_h_l49_c2_a9b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l49_c2_a9b4_cond,
result_MUX_uxn_opcodes_h_l49_c2_a9b4_iftrue,
result_MUX_uxn_opcodes_h_l49_c2_a9b4_iffalse,
result_MUX_uxn_opcodes_h_l49_c2_a9b4_return_output);

-- pc_add_uxn_opcodes_h_l50_c9_30b0
pc_add_uxn_opcodes_h_l50_c9_30b0 : entity work.pc_add_0CLK_925e4dd0 port map (
clk,
pc_add_uxn_opcodes_h_l50_c9_30b0_CLOCK_ENABLE,
pc_add_uxn_opcodes_h_l50_c9_30b0_adjustment);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 -- Registers
 tmp8,
 result,
 -- All submodule outputs
 pc_get_uxn_opcodes_h_l48_c47_a309_return_output,
 peek_ram_uxn_opcodes_h_l48_c38_9d11_return_output,
 push_stack_uxn_opcodes_h_l48_c9_321d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_return_output,
 result_MUX_uxn_opcodes_h_l49_c2_a9b4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l48_c9_321d_stack_index : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l48_c9_321d_ins : unsigned(7 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l48_c9_321d_value : unsigned(7 downto 0);
 variable VAR_peek_ram_uxn_opcodes_h_l48_c38_9d11_address : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l48_c47_a309_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l48_c47_a309_return_output : unsigned(15 downto 0);
 variable VAR_peek_ram_uxn_opcodes_h_l48_c38_9d11_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_opcodes_h_l48_c38_9d11_return_output : unsigned(7 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l48_c9_321d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l48_c9_321d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l49_c2_a9b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l49_c2_a9b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l49_c2_a9b4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l49_c2_a9b4_cond : unsigned(0 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l50_c9_30b0_adjustment : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l50_c9_30b0_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_pc_add_uxn_opcodes_h_l50_c9_30b0_adjustment := resize(to_unsigned(1, 1), 16);
     VAR_result_MUX_uxn_opcodes_h_l49_c2_a9b4_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l49_c2_a9b4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_iffalse := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_opcodes_h_l48_c47_a309_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_peek_ram_uxn_opcodes_h_l48_c38_9d11_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push_stack_uxn_opcodes_h_l48_c9_321d_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push_stack_uxn_opcodes_h_l48_c9_321d_ins := VAR_ins;
     VAR_push_stack_uxn_opcodes_h_l48_c9_321d_stack_index := VAR_stack_index;
     -- pc_get[uxn_opcodes_h_l48_c47_a309] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l48_c47_a309_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l48_c47_a309_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l48_c47_a309_return_output := pc_get_uxn_opcodes_h_l48_c47_a309_return_output;

     -- Submodule level 1
     VAR_peek_ram_uxn_opcodes_h_l48_c38_9d11_address := VAR_pc_get_uxn_opcodes_h_l48_c47_a309_return_output;
     -- peek_ram[uxn_opcodes_h_l48_c38_9d11] LATENCY=0
     -- Clock enable
     peek_ram_uxn_opcodes_h_l48_c38_9d11_CLOCK_ENABLE <= VAR_peek_ram_uxn_opcodes_h_l48_c38_9d11_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_opcodes_h_l48_c38_9d11_address <= VAR_peek_ram_uxn_opcodes_h_l48_c38_9d11_address;
     -- Outputs
     VAR_peek_ram_uxn_opcodes_h_l48_c38_9d11_return_output := peek_ram_uxn_opcodes_h_l48_c38_9d11_return_output;

     -- Submodule level 2
     VAR_push_stack_uxn_opcodes_h_l48_c9_321d_value := VAR_peek_ram_uxn_opcodes_h_l48_c38_9d11_return_output;
     -- push_stack[uxn_opcodes_h_l48_c9_321d] LATENCY=0
     -- Clock enable
     push_stack_uxn_opcodes_h_l48_c9_321d_CLOCK_ENABLE <= VAR_push_stack_uxn_opcodes_h_l48_c9_321d_CLOCK_ENABLE;
     -- Inputs
     push_stack_uxn_opcodes_h_l48_c9_321d_stack_index <= VAR_push_stack_uxn_opcodes_h_l48_c9_321d_stack_index;
     push_stack_uxn_opcodes_h_l48_c9_321d_ins <= VAR_push_stack_uxn_opcodes_h_l48_c9_321d_ins;
     push_stack_uxn_opcodes_h_l48_c9_321d_value <= VAR_push_stack_uxn_opcodes_h_l48_c9_321d_value;
     -- Outputs
     VAR_push_stack_uxn_opcodes_h_l48_c9_321d_return_output := push_stack_uxn_opcodes_h_l48_c9_321d_return_output;

     -- Submodule level 3
     VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_left := VAR_push_stack_uxn_opcodes_h_l48_c9_321d_return_output;
     REG_VAR_tmp8 := VAR_push_stack_uxn_opcodes_h_l48_c9_321d_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l49_c6_8e32] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_left;
     BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_return_output := BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_return_output;
     VAR_result_MUX_uxn_opcodes_h_l49_c2_a9b4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_8e32_return_output;
     -- result_MUX[uxn_opcodes_h_l49_c2_a9b4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l49_c2_a9b4_cond <= VAR_result_MUX_uxn_opcodes_h_l49_c2_a9b4_cond;
     result_MUX_uxn_opcodes_h_l49_c2_a9b4_iftrue <= VAR_result_MUX_uxn_opcodes_h_l49_c2_a9b4_iftrue;
     result_MUX_uxn_opcodes_h_l49_c2_a9b4_iffalse <= VAR_result_MUX_uxn_opcodes_h_l49_c2_a9b4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l49_c2_a9b4_return_output := result_MUX_uxn_opcodes_h_l49_c2_a9b4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l50_c1_40b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_return_output;

     -- Submodule level 5
     VAR_pc_add_uxn_opcodes_h_l50_c9_30b0_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_40b7_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l49_c2_a9b4_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l49_c2_a9b4_return_output;
     -- pc_add[uxn_opcodes_h_l50_c9_30b0] LATENCY=0
     -- Clock enable
     pc_add_uxn_opcodes_h_l50_c9_30b0_CLOCK_ENABLE <= VAR_pc_add_uxn_opcodes_h_l50_c9_30b0_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_opcodes_h_l50_c9_30b0_adjustment <= VAR_pc_add_uxn_opcodes_h_l50_c9_30b0_adjustment;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
