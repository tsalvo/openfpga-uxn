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
entity opc_lit2_0CLK_6bd75774 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_lit2_0CLK_6bd75774;
architecture arch of opc_lit2_0CLK_6bd75774 is
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
-- pc_get[uxn_opcodes_h_l58_c20_f558]
signal pc_get_uxn_opcodes_h_l58_c20_f558_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l58_c20_f558_return_output : unsigned(15 downto 0);

-- peek2_ram[uxn_opcodes_h_l58_c10_9c98]
signal peek2_ram_uxn_opcodes_h_l58_c10_9c98_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_h_l58_c10_9c98_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_h_l58_c10_9c98_return_output : unsigned(15 downto 0);

-- push2_stack[uxn_opcodes_h_l59_c9_b96f]
signal push2_stack_uxn_opcodes_h_l59_c9_b96f_CLOCK_ENABLE : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l59_c9_b96f_stack_index : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l59_c9_b96f_ins : unsigned(7 downto 0);
signal push2_stack_uxn_opcodes_h_l59_c9_b96f_value : unsigned(15 downto 0);
signal push2_stack_uxn_opcodes_h_l59_c9_b96f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l60_c6_4f5a]
signal BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l61_c1_1bb0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l60_c2_2693]
signal result_MUX_uxn_opcodes_h_l60_c2_2693_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l60_c2_2693_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l60_c2_2693_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l60_c2_2693_return_output : unsigned(0 downto 0);

-- pc_add[uxn_opcodes_h_l61_c9_b17b]
signal pc_add_uxn_opcodes_h_l61_c9_b17b_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_opcodes_h_l61_c9_b17b_adjustment : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_opcodes_h_l58_c20_f558
pc_get_uxn_opcodes_h_l58_c20_f558 : entity work.pc_get_0CLK_9859a581 port map (
clk,
pc_get_uxn_opcodes_h_l58_c20_f558_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l58_c20_f558_return_output);

-- peek2_ram_uxn_opcodes_h_l58_c10_9c98
peek2_ram_uxn_opcodes_h_l58_c10_9c98 : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_h_l58_c10_9c98_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_h_l58_c10_9c98_address,
peek2_ram_uxn_opcodes_h_l58_c10_9c98_return_output);

-- push2_stack_uxn_opcodes_h_l59_c9_b96f
push2_stack_uxn_opcodes_h_l59_c9_b96f : entity work.push2_stack_0CLK_e79cfe61 port map (
clk,
push2_stack_uxn_opcodes_h_l59_c9_b96f_CLOCK_ENABLE,
push2_stack_uxn_opcodes_h_l59_c9_b96f_stack_index,
push2_stack_uxn_opcodes_h_l59_c9_b96f_ins,
push2_stack_uxn_opcodes_h_l59_c9_b96f_value,
push2_stack_uxn_opcodes_h_l59_c9_b96f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a
BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_left,
BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_right,
BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_return_output);

-- result_MUX_uxn_opcodes_h_l60_c2_2693
result_MUX_uxn_opcodes_h_l60_c2_2693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l60_c2_2693_cond,
result_MUX_uxn_opcodes_h_l60_c2_2693_iftrue,
result_MUX_uxn_opcodes_h_l60_c2_2693_iffalse,
result_MUX_uxn_opcodes_h_l60_c2_2693_return_output);

-- pc_add_uxn_opcodes_h_l61_c9_b17b
pc_add_uxn_opcodes_h_l61_c9_b17b : entity work.pc_add_0CLK_925e4dd0 port map (
clk,
pc_add_uxn_opcodes_h_l61_c9_b17b_CLOCK_ENABLE,
pc_add_uxn_opcodes_h_l61_c9_b17b_adjustment);



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
 pc_get_uxn_opcodes_h_l58_c20_f558_return_output,
 peek2_ram_uxn_opcodes_h_l58_c10_9c98_return_output,
 push2_stack_uxn_opcodes_h_l59_c9_b96f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_return_output,
 result_MUX_uxn_opcodes_h_l60_c2_2693_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l58_c10_9c98_address : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l58_c20_f558_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l58_c20_f558_return_output : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l58_c10_9c98_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l58_c10_9c98_return_output : unsigned(15 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_stack_index : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_ins : unsigned(7 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_value : unsigned(15 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l60_c2_2693_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l60_c2_2693_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l60_c2_2693_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l60_c2_2693_cond : unsigned(0 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l61_c9_b17b_adjustment : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l61_c9_b17b_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_h_l60_c2_2693_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l60_c2_2693_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_iftrue := to_unsigned(0, 1);
     VAR_pc_add_uxn_opcodes_h_l61_c9_b17b_adjustment := resize(to_unsigned(2, 2), 16);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_iffalse := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_opcodes_h_l58_c20_f558_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_peek2_ram_uxn_opcodes_h_l58_c10_9c98_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_ins := VAR_ins;
     VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_stack_index := VAR_stack_index;
     -- pc_get[uxn_opcodes_h_l58_c20_f558] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l58_c20_f558_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l58_c20_f558_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l58_c20_f558_return_output := pc_get_uxn_opcodes_h_l58_c20_f558_return_output;

     -- Submodule level 1
     VAR_peek2_ram_uxn_opcodes_h_l58_c10_9c98_address := VAR_pc_get_uxn_opcodes_h_l58_c20_f558_return_output;
     -- peek2_ram[uxn_opcodes_h_l58_c10_9c98] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_h_l58_c10_9c98_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_h_l58_c10_9c98_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_h_l58_c10_9c98_address <= VAR_peek2_ram_uxn_opcodes_h_l58_c10_9c98_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_h_l58_c10_9c98_return_output := peek2_ram_uxn_opcodes_h_l58_c10_9c98_return_output;

     -- Submodule level 2
     VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_value := VAR_peek2_ram_uxn_opcodes_h_l58_c10_9c98_return_output;
     REG_VAR_tmp16 := VAR_peek2_ram_uxn_opcodes_h_l58_c10_9c98_return_output;
     -- push2_stack[uxn_opcodes_h_l59_c9_b96f] LATENCY=0
     -- Clock enable
     push2_stack_uxn_opcodes_h_l59_c9_b96f_CLOCK_ENABLE <= VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_CLOCK_ENABLE;
     -- Inputs
     push2_stack_uxn_opcodes_h_l59_c9_b96f_stack_index <= VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_stack_index;
     push2_stack_uxn_opcodes_h_l59_c9_b96f_ins <= VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_ins;
     push2_stack_uxn_opcodes_h_l59_c9_b96f_value <= VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_value;
     -- Outputs
     VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_return_output := push2_stack_uxn_opcodes_h_l59_c9_b96f_return_output;

     -- Submodule level 3
     VAR_BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_left := VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_return_output;
     REG_VAR_tmp8 := VAR_push2_stack_uxn_opcodes_h_l59_c9_b96f_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l60_c6_4f5a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_left;
     BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_return_output := BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l60_c2_2693_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l60_c6_4f5a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l61_c1_1bb0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_return_output;

     -- result_MUX[uxn_opcodes_h_l60_c2_2693] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l60_c2_2693_cond <= VAR_result_MUX_uxn_opcodes_h_l60_c2_2693_cond;
     result_MUX_uxn_opcodes_h_l60_c2_2693_iftrue <= VAR_result_MUX_uxn_opcodes_h_l60_c2_2693_iftrue;
     result_MUX_uxn_opcodes_h_l60_c2_2693_iffalse <= VAR_result_MUX_uxn_opcodes_h_l60_c2_2693_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l60_c2_2693_return_output := result_MUX_uxn_opcodes_h_l60_c2_2693_return_output;

     -- Submodule level 5
     VAR_pc_add_uxn_opcodes_h_l61_c9_b17b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l61_c1_1bb0_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l60_c2_2693_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l60_c2_2693_return_output;
     -- pc_add[uxn_opcodes_h_l61_c9_b17b] LATENCY=0
     -- Clock enable
     pc_add_uxn_opcodes_h_l61_c9_b17b_CLOCK_ENABLE <= VAR_pc_add_uxn_opcodes_h_l61_c9_b17b_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_opcodes_h_l61_c9_b17b_adjustment <= VAR_pc_add_uxn_opcodes_h_l61_c9_b17b_adjustment;
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
