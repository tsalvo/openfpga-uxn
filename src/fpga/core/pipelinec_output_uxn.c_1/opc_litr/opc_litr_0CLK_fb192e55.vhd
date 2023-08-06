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
entity opc_litr_0CLK_fb192e55 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_litr_0CLK_fb192e55;
architecture arch of opc_litr_0CLK_fb192e55 is
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
-- pc_get[uxn_opcodes_h_l68_c52_5d94]
signal pc_get_uxn_opcodes_h_l68_c52_5d94_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l68_c52_5d94_return_output : unsigned(15 downto 0);

-- main_ram_read[uxn_opcodes_h_l68_c38_be3c]
signal main_ram_read_uxn_opcodes_h_l68_c38_be3c_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_read_uxn_opcodes_h_l68_c38_be3c_address : unsigned(15 downto 0);
signal main_ram_read_uxn_opcodes_h_l68_c38_be3c_return_output : unsigned(7 downto 0);

-- push_stack[uxn_opcodes_h_l68_c9_11f1]
signal push_stack_uxn_opcodes_h_l68_c9_11f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal push_stack_uxn_opcodes_h_l68_c9_11f1_stack_index : unsigned(0 downto 0);
signal push_stack_uxn_opcodes_h_l68_c9_11f1_ins : unsigned(7 downto 0);
signal push_stack_uxn_opcodes_h_l68_c9_11f1_value : unsigned(7 downto 0);
signal push_stack_uxn_opcodes_h_l68_c9_11f1_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l69_c6_404e]
signal BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_ad52]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l69_c2_5851]
signal result_MUX_uxn_opcodes_h_l69_c2_5851_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l69_c2_5851_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l69_c2_5851_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l69_c2_5851_return_output : unsigned(0 downto 0);

-- pc_add[uxn_opcodes_h_l70_c9_7e0f]
signal pc_add_uxn_opcodes_h_l70_c9_7e0f_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_opcodes_h_l70_c9_7e0f_adjustment : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_opcodes_h_l68_c52_5d94
pc_get_uxn_opcodes_h_l68_c52_5d94 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l68_c52_5d94_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l68_c52_5d94_return_output);

-- main_ram_read_uxn_opcodes_h_l68_c38_be3c
main_ram_read_uxn_opcodes_h_l68_c38_be3c : entity work.main_ram_read_0CLK_8ab28aec port map (
clk,
main_ram_read_uxn_opcodes_h_l68_c38_be3c_CLOCK_ENABLE,
main_ram_read_uxn_opcodes_h_l68_c38_be3c_address,
main_ram_read_uxn_opcodes_h_l68_c38_be3c_return_output);

-- push_stack_uxn_opcodes_h_l68_c9_11f1
push_stack_uxn_opcodes_h_l68_c9_11f1 : entity work.push_stack_0CLK_81ac7b63 port map (
clk,
push_stack_uxn_opcodes_h_l68_c9_11f1_CLOCK_ENABLE,
push_stack_uxn_opcodes_h_l68_c9_11f1_stack_index,
push_stack_uxn_opcodes_h_l68_c9_11f1_ins,
push_stack_uxn_opcodes_h_l68_c9_11f1_value,
push_stack_uxn_opcodes_h_l68_c9_11f1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l69_c6_404e
BIN_OP_GT_uxn_opcodes_h_l69_c6_404e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_left,
BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_right,
BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_return_output);

-- result_MUX_uxn_opcodes_h_l69_c2_5851
result_MUX_uxn_opcodes_h_l69_c2_5851 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l69_c2_5851_cond,
result_MUX_uxn_opcodes_h_l69_c2_5851_iftrue,
result_MUX_uxn_opcodes_h_l69_c2_5851_iffalse,
result_MUX_uxn_opcodes_h_l69_c2_5851_return_output);

-- pc_add_uxn_opcodes_h_l70_c9_7e0f
pc_add_uxn_opcodes_h_l70_c9_7e0f : entity work.pc_add_0CLK_8573165f port map (
clk,
pc_add_uxn_opcodes_h_l70_c9_7e0f_CLOCK_ENABLE,
pc_add_uxn_opcodes_h_l70_c9_7e0f_adjustment);



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
 pc_get_uxn_opcodes_h_l68_c52_5d94_return_output,
 main_ram_read_uxn_opcodes_h_l68_c38_be3c_return_output,
 push_stack_uxn_opcodes_h_l68_c9_11f1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_return_output,
 result_MUX_uxn_opcodes_h_l69_c2_5851_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_stack_index : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_ins : unsigned(7 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_value : unsigned(7 downto 0);
 variable VAR_main_ram_read_uxn_opcodes_h_l68_c38_be3c_address : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l68_c52_5d94_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l68_c52_5d94_return_output : unsigned(15 downto 0);
 variable VAR_main_ram_read_uxn_opcodes_h_l68_c38_be3c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_read_uxn_opcodes_h_l68_c38_be3c_return_output : unsigned(7 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l69_c2_5851_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l69_c2_5851_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l69_c2_5851_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l69_c2_5851_cond : unsigned(0 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l70_c9_7e0f_adjustment : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l70_c9_7e0f_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l69_c2_5851_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l69_c2_5851_iftrue := to_unsigned(1, 1);
     VAR_pc_add_uxn_opcodes_h_l70_c9_7e0f_adjustment := resize(to_unsigned(1, 1), 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_iffalse := VAR_CLOCK_ENABLE;
     VAR_main_ram_read_uxn_opcodes_h_l68_c38_be3c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_opcodes_h_l68_c52_5d94_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_ins := VAR_ins;
     VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_stack_index := VAR_stack_index;
     -- pc_get[uxn_opcodes_h_l68_c52_5d94] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l68_c52_5d94_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l68_c52_5d94_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l68_c52_5d94_return_output := pc_get_uxn_opcodes_h_l68_c52_5d94_return_output;

     -- Submodule level 1
     VAR_main_ram_read_uxn_opcodes_h_l68_c38_be3c_address := VAR_pc_get_uxn_opcodes_h_l68_c52_5d94_return_output;
     -- main_ram_read[uxn_opcodes_h_l68_c38_be3c] LATENCY=0
     -- Clock enable
     main_ram_read_uxn_opcodes_h_l68_c38_be3c_CLOCK_ENABLE <= VAR_main_ram_read_uxn_opcodes_h_l68_c38_be3c_CLOCK_ENABLE;
     -- Inputs
     main_ram_read_uxn_opcodes_h_l68_c38_be3c_address <= VAR_main_ram_read_uxn_opcodes_h_l68_c38_be3c_address;
     -- Outputs
     VAR_main_ram_read_uxn_opcodes_h_l68_c38_be3c_return_output := main_ram_read_uxn_opcodes_h_l68_c38_be3c_return_output;

     -- Submodule level 2
     VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_value := VAR_main_ram_read_uxn_opcodes_h_l68_c38_be3c_return_output;
     -- push_stack[uxn_opcodes_h_l68_c9_11f1] LATENCY=0
     -- Clock enable
     push_stack_uxn_opcodes_h_l68_c9_11f1_CLOCK_ENABLE <= VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_CLOCK_ENABLE;
     -- Inputs
     push_stack_uxn_opcodes_h_l68_c9_11f1_stack_index <= VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_stack_index;
     push_stack_uxn_opcodes_h_l68_c9_11f1_ins <= VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_ins;
     push_stack_uxn_opcodes_h_l68_c9_11f1_value <= VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_value;
     -- Outputs
     VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_return_output := push_stack_uxn_opcodes_h_l68_c9_11f1_return_output;

     -- Submodule level 3
     VAR_BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_left := VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_return_output;
     REG_VAR_tmp8 := VAR_push_stack_uxn_opcodes_h_l68_c9_11f1_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l69_c6_404e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_left;
     BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_return_output := BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l69_c2_5851_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l69_c6_404e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l70_c1_ad52] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_return_output;

     -- result_MUX[uxn_opcodes_h_l69_c2_5851] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l69_c2_5851_cond <= VAR_result_MUX_uxn_opcodes_h_l69_c2_5851_cond;
     result_MUX_uxn_opcodes_h_l69_c2_5851_iftrue <= VAR_result_MUX_uxn_opcodes_h_l69_c2_5851_iftrue;
     result_MUX_uxn_opcodes_h_l69_c2_5851_iffalse <= VAR_result_MUX_uxn_opcodes_h_l69_c2_5851_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l69_c2_5851_return_output := result_MUX_uxn_opcodes_h_l69_c2_5851_return_output;

     -- Submodule level 5
     VAR_pc_add_uxn_opcodes_h_l70_c9_7e0f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l70_c1_ad52_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l69_c2_5851_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l69_c2_5851_return_output;
     -- pc_add[uxn_opcodes_h_l70_c9_7e0f] LATENCY=0
     -- Clock enable
     pc_add_uxn_opcodes_h_l70_c9_7e0f_CLOCK_ENABLE <= VAR_pc_add_uxn_opcodes_h_l70_c9_7e0f_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_opcodes_h_l70_c9_7e0f_adjustment <= VAR_pc_add_uxn_opcodes_h_l70_c9_7e0f_adjustment;
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
