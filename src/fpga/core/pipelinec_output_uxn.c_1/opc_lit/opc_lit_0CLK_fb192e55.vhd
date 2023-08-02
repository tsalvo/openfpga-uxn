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
entity opc_lit_0CLK_fb192e55 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_lit_0CLK_fb192e55;
architecture arch of opc_lit_0CLK_fb192e55 is
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
-- pc_get[uxn_opcodes_h_l48_c52_a466]
signal pc_get_uxn_opcodes_h_l48_c52_a466_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l48_c52_a466_return_output : unsigned(15 downto 0);

-- main_ram_read[uxn_opcodes_h_l48_c38_a9a4]
signal main_ram_read_uxn_opcodes_h_l48_c38_a9a4_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_read_uxn_opcodes_h_l48_c38_a9a4_address : unsigned(15 downto 0);
signal main_ram_read_uxn_opcodes_h_l48_c38_a9a4_return_output : unsigned(7 downto 0);

-- push_stack[uxn_opcodes_h_l48_c9_3555]
signal push_stack_uxn_opcodes_h_l48_c9_3555_CLOCK_ENABLE : unsigned(0 downto 0);
signal push_stack_uxn_opcodes_h_l48_c9_3555_stack_index : unsigned(0 downto 0);
signal push_stack_uxn_opcodes_h_l48_c9_3555_ins : unsigned(7 downto 0);
signal push_stack_uxn_opcodes_h_l48_c9_3555_value : unsigned(7 downto 0);
signal push_stack_uxn_opcodes_h_l48_c9_3555_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l49_c6_3414]
signal BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l50_c1_33b4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l49_c2_f255]
signal result_MUX_uxn_opcodes_h_l49_c2_f255_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l49_c2_f255_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l49_c2_f255_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l49_c2_f255_return_output : unsigned(0 downto 0);

-- pc_add[uxn_opcodes_h_l50_c9_d64b]
signal pc_add_uxn_opcodes_h_l50_c9_d64b_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_opcodes_h_l50_c9_d64b_adjustment : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_opcodes_h_l48_c52_a466
pc_get_uxn_opcodes_h_l48_c52_a466 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l48_c52_a466_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l48_c52_a466_return_output);

-- main_ram_read_uxn_opcodes_h_l48_c38_a9a4
main_ram_read_uxn_opcodes_h_l48_c38_a9a4 : entity work.main_ram_read_0CLK_8ab28aec port map (
clk,
main_ram_read_uxn_opcodes_h_l48_c38_a9a4_CLOCK_ENABLE,
main_ram_read_uxn_opcodes_h_l48_c38_a9a4_address,
main_ram_read_uxn_opcodes_h_l48_c38_a9a4_return_output);

-- push_stack_uxn_opcodes_h_l48_c9_3555
push_stack_uxn_opcodes_h_l48_c9_3555 : entity work.push_stack_0CLK_81ac7b63 port map (
clk,
push_stack_uxn_opcodes_h_l48_c9_3555_CLOCK_ENABLE,
push_stack_uxn_opcodes_h_l48_c9_3555_stack_index,
push_stack_uxn_opcodes_h_l48_c9_3555_ins,
push_stack_uxn_opcodes_h_l48_c9_3555_value,
push_stack_uxn_opcodes_h_l48_c9_3555_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l49_c6_3414
BIN_OP_GT_uxn_opcodes_h_l49_c6_3414 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_left,
BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_right,
BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_return_output);

-- result_MUX_uxn_opcodes_h_l49_c2_f255
result_MUX_uxn_opcodes_h_l49_c2_f255 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l49_c2_f255_cond,
result_MUX_uxn_opcodes_h_l49_c2_f255_iftrue,
result_MUX_uxn_opcodes_h_l49_c2_f255_iffalse,
result_MUX_uxn_opcodes_h_l49_c2_f255_return_output);

-- pc_add_uxn_opcodes_h_l50_c9_d64b
pc_add_uxn_opcodes_h_l50_c9_d64b : entity work.pc_add_0CLK_8573165f port map (
clk,
pc_add_uxn_opcodes_h_l50_c9_d64b_CLOCK_ENABLE,
pc_add_uxn_opcodes_h_l50_c9_d64b_adjustment);



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
 pc_get_uxn_opcodes_h_l48_c52_a466_return_output,
 main_ram_read_uxn_opcodes_h_l48_c38_a9a4_return_output,
 push_stack_uxn_opcodes_h_l48_c9_3555_return_output,
 BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_return_output,
 result_MUX_uxn_opcodes_h_l49_c2_f255_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l48_c9_3555_stack_index : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l48_c9_3555_ins : unsigned(7 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l48_c9_3555_value : unsigned(7 downto 0);
 variable VAR_main_ram_read_uxn_opcodes_h_l48_c38_a9a4_address : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l48_c52_a466_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l48_c52_a466_return_output : unsigned(15 downto 0);
 variable VAR_main_ram_read_uxn_opcodes_h_l48_c38_a9a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_read_uxn_opcodes_h_l48_c38_a9a4_return_output : unsigned(7 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l48_c9_3555_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l48_c9_3555_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l49_c2_f255_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l49_c2_f255_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l49_c2_f255_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l49_c2_f255_cond : unsigned(0 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l50_c9_d64b_adjustment : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l50_c9_d64b_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_h_l49_c2_f255_iftrue := to_unsigned(1, 1);
     VAR_pc_add_uxn_opcodes_h_l50_c9_d64b_adjustment := resize(to_unsigned(1, 1), 16);
     VAR_result_MUX_uxn_opcodes_h_l49_c2_f255_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_iffalse := VAR_CLOCK_ENABLE;
     VAR_main_ram_read_uxn_opcodes_h_l48_c38_a9a4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_opcodes_h_l48_c52_a466_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push_stack_uxn_opcodes_h_l48_c9_3555_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push_stack_uxn_opcodes_h_l48_c9_3555_ins := VAR_ins;
     VAR_push_stack_uxn_opcodes_h_l48_c9_3555_stack_index := VAR_stack_index;
     -- pc_get[uxn_opcodes_h_l48_c52_a466] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l48_c52_a466_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l48_c52_a466_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l48_c52_a466_return_output := pc_get_uxn_opcodes_h_l48_c52_a466_return_output;

     -- Submodule level 1
     VAR_main_ram_read_uxn_opcodes_h_l48_c38_a9a4_address := VAR_pc_get_uxn_opcodes_h_l48_c52_a466_return_output;
     -- main_ram_read[uxn_opcodes_h_l48_c38_a9a4] LATENCY=0
     -- Clock enable
     main_ram_read_uxn_opcodes_h_l48_c38_a9a4_CLOCK_ENABLE <= VAR_main_ram_read_uxn_opcodes_h_l48_c38_a9a4_CLOCK_ENABLE;
     -- Inputs
     main_ram_read_uxn_opcodes_h_l48_c38_a9a4_address <= VAR_main_ram_read_uxn_opcodes_h_l48_c38_a9a4_address;
     -- Outputs
     VAR_main_ram_read_uxn_opcodes_h_l48_c38_a9a4_return_output := main_ram_read_uxn_opcodes_h_l48_c38_a9a4_return_output;

     -- Submodule level 2
     VAR_push_stack_uxn_opcodes_h_l48_c9_3555_value := VAR_main_ram_read_uxn_opcodes_h_l48_c38_a9a4_return_output;
     -- push_stack[uxn_opcodes_h_l48_c9_3555] LATENCY=0
     -- Clock enable
     push_stack_uxn_opcodes_h_l48_c9_3555_CLOCK_ENABLE <= VAR_push_stack_uxn_opcodes_h_l48_c9_3555_CLOCK_ENABLE;
     -- Inputs
     push_stack_uxn_opcodes_h_l48_c9_3555_stack_index <= VAR_push_stack_uxn_opcodes_h_l48_c9_3555_stack_index;
     push_stack_uxn_opcodes_h_l48_c9_3555_ins <= VAR_push_stack_uxn_opcodes_h_l48_c9_3555_ins;
     push_stack_uxn_opcodes_h_l48_c9_3555_value <= VAR_push_stack_uxn_opcodes_h_l48_c9_3555_value;
     -- Outputs
     VAR_push_stack_uxn_opcodes_h_l48_c9_3555_return_output := push_stack_uxn_opcodes_h_l48_c9_3555_return_output;

     -- Submodule level 3
     VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_left := VAR_push_stack_uxn_opcodes_h_l48_c9_3555_return_output;
     REG_VAR_tmp8 := VAR_push_stack_uxn_opcodes_h_l48_c9_3555_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l49_c6_3414] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_left;
     BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_return_output := BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_return_output;
     VAR_result_MUX_uxn_opcodes_h_l49_c2_f255_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l49_c6_3414_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l50_c1_33b4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_return_output;

     -- result_MUX[uxn_opcodes_h_l49_c2_f255] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l49_c2_f255_cond <= VAR_result_MUX_uxn_opcodes_h_l49_c2_f255_cond;
     result_MUX_uxn_opcodes_h_l49_c2_f255_iftrue <= VAR_result_MUX_uxn_opcodes_h_l49_c2_f255_iftrue;
     result_MUX_uxn_opcodes_h_l49_c2_f255_iffalse <= VAR_result_MUX_uxn_opcodes_h_l49_c2_f255_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l49_c2_f255_return_output := result_MUX_uxn_opcodes_h_l49_c2_f255_return_output;

     -- Submodule level 5
     VAR_pc_add_uxn_opcodes_h_l50_c9_d64b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l50_c1_33b4_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l49_c2_f255_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l49_c2_f255_return_output;
     -- pc_add[uxn_opcodes_h_l50_c9_d64b] LATENCY=0
     -- Clock enable
     pc_add_uxn_opcodes_h_l50_c9_d64b_CLOCK_ENABLE <= VAR_pc_add_uxn_opcodes_h_l50_c9_d64b_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_opcodes_h_l50_c9_d64b_adjustment <= VAR_pc_add_uxn_opcodes_h_l50_c9_d64b_adjustment;
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
