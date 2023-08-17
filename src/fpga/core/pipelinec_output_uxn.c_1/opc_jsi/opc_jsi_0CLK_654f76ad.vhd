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
-- Submodules: 10
entity opc_jsi_0CLK_654f76ad is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jsi_0CLK_654f76ad;
architecture arch of opc_jsi_0CLK_654f76ad is
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
-- pc_get[uxn_opcodes_h_l39_c29_2b41]
signal pc_get_uxn_opcodes_h_l39_c29_2b41_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l39_c29_2b41_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l39_c29_be41]
signal BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_return_output : unsigned(16 downto 0);

-- push2_stack[uxn_opcodes_h_l39_c9_15c5]
signal push2_stack_uxn_opcodes_h_l39_c9_15c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l39_c9_15c5_stack_index : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l39_c9_15c5_ins : unsigned(7 downto 0);
signal push2_stack_uxn_opcodes_h_l39_c9_15c5_value : unsigned(15 downto 0);
signal push2_stack_uxn_opcodes_h_l39_c9_15c5_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l40_c6_ef3a]
signal BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l41_c1_a216]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l40_c2_b602]
signal result_MUX_uxn_opcodes_h_l40_c2_b602_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l40_c2_b602_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l40_c2_b602_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l40_c2_b602_return_output : unsigned(0 downto 0);

-- pc_get[uxn_opcodes_h_l41_c26_d4a2]
signal pc_get_uxn_opcodes_h_l41_c26_d4a2_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l41_c26_d4a2_return_output : unsigned(15 downto 0);

-- peek2_ram[uxn_opcodes_h_l41_c16_6b61]
signal peek2_ram_uxn_opcodes_h_l41_c16_6b61_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_h_l41_c16_6b61_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_h_l41_c16_6b61_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l41_c16_4845]
signal BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_return_output : unsigned(16 downto 0);

-- pc_add[uxn_opcodes_h_l41_c9_d5c8]
signal pc_add_uxn_opcodes_h_l41_c9_d5c8_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_opcodes_h_l41_c9_d5c8_adjustment : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_opcodes_h_l39_c29_2b41
pc_get_uxn_opcodes_h_l39_c29_2b41 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l39_c29_2b41_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l39_c29_2b41_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41
BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_left,
BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_right,
BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_return_output);

-- push2_stack_uxn_opcodes_h_l39_c9_15c5
push2_stack_uxn_opcodes_h_l39_c9_15c5 : entity work.push2_stack_0CLK_1c59b4dc port map (
clk,
push2_stack_uxn_opcodes_h_l39_c9_15c5_CLOCK_ENABLE,
push2_stack_uxn_opcodes_h_l39_c9_15c5_stack_index,
push2_stack_uxn_opcodes_h_l39_c9_15c5_ins,
push2_stack_uxn_opcodes_h_l39_c9_15c5_value,
push2_stack_uxn_opcodes_h_l39_c9_15c5_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a
BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_left,
BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_right,
BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_return_output);

-- result_MUX_uxn_opcodes_h_l40_c2_b602
result_MUX_uxn_opcodes_h_l40_c2_b602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l40_c2_b602_cond,
result_MUX_uxn_opcodes_h_l40_c2_b602_iftrue,
result_MUX_uxn_opcodes_h_l40_c2_b602_iffalse,
result_MUX_uxn_opcodes_h_l40_c2_b602_return_output);

-- pc_get_uxn_opcodes_h_l41_c26_d4a2
pc_get_uxn_opcodes_h_l41_c26_d4a2 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l41_c26_d4a2_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l41_c26_d4a2_return_output);

-- peek2_ram_uxn_opcodes_h_l41_c16_6b61
peek2_ram_uxn_opcodes_h_l41_c16_6b61 : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_h_l41_c16_6b61_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_h_l41_c16_6b61_address,
peek2_ram_uxn_opcodes_h_l41_c16_6b61_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845
BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_left,
BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_right,
BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_return_output);

-- pc_add_uxn_opcodes_h_l41_c9_d5c8
pc_add_uxn_opcodes_h_l41_c9_d5c8 : entity work.pc_add_0CLK_8573165f port map (
clk,
pc_add_uxn_opcodes_h_l41_c9_d5c8_CLOCK_ENABLE,
pc_add_uxn_opcodes_h_l41_c9_d5c8_adjustment);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 ins,
 -- Registers
 tmp8,
 result,
 -- All submodule outputs
 pc_get_uxn_opcodes_h_l39_c29_2b41_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_return_output,
 push2_stack_uxn_opcodes_h_l39_c9_15c5_return_output,
 BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_return_output,
 result_MUX_uxn_opcodes_h_l40_c2_b602_return_output,
 pc_get_uxn_opcodes_h_l41_c26_d4a2_return_output,
 peek2_ram_uxn_opcodes_h_l41_c16_6b61_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_stack_index : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_ins : unsigned(7 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_left : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l39_c29_2b41_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l39_c29_2b41_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_return_output : unsigned(16 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l40_c2_b602_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l40_c2_b602_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l40_c2_b602_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l40_c2_b602_cond : unsigned(0 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l41_c9_d5c8_adjustment : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l41_c16_6b61_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_left : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l41_c26_d4a2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l41_c26_d4a2_return_output : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l41_c16_6b61_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l41_c16_6b61_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_return_output : unsigned(16 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l41_c9_d5c8_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_right := to_unsigned(2, 2);
     VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_stack_index := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l40_c2_b602_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_right := to_unsigned(2, 2);
     VAR_result_MUX_uxn_opcodes_h_l40_c2_b602_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ins := ins;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_iffalse := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_opcodes_h_l39_c29_2b41_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_ins := VAR_ins;
     -- pc_get[uxn_opcodes_h_l39_c29_2b41] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l39_c29_2b41_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l39_c29_2b41_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l39_c29_2b41_return_output := pc_get_uxn_opcodes_h_l39_c29_2b41_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_left := VAR_pc_get_uxn_opcodes_h_l39_c29_2b41_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l39_c29_be41] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_left;
     BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_return_output := BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_return_output;

     -- Submodule level 2
     VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_value := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_be41_return_output, 16);
     -- push2_stack[uxn_opcodes_h_l39_c9_15c5] LATENCY=0
     -- Clock enable
     push2_stack_uxn_opcodes_h_l39_c9_15c5_CLOCK_ENABLE <= VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_CLOCK_ENABLE;
     -- Inputs
     push2_stack_uxn_opcodes_h_l39_c9_15c5_stack_index <= VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_stack_index;
     push2_stack_uxn_opcodes_h_l39_c9_15c5_ins <= VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_ins;
     push2_stack_uxn_opcodes_h_l39_c9_15c5_value <= VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_value;
     -- Outputs
     VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_return_output := push2_stack_uxn_opcodes_h_l39_c9_15c5_return_output;

     -- Submodule level 3
     VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_left := VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_return_output;
     REG_VAR_tmp8 := VAR_push2_stack_uxn_opcodes_h_l39_c9_15c5_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l40_c6_ef3a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_left;
     BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_return_output := BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l40_c2_b602_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ef3a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l41_c1_a216] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_return_output;

     -- result_MUX[uxn_opcodes_h_l40_c2_b602] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l40_c2_b602_cond <= VAR_result_MUX_uxn_opcodes_h_l40_c2_b602_cond;
     result_MUX_uxn_opcodes_h_l40_c2_b602_iftrue <= VAR_result_MUX_uxn_opcodes_h_l40_c2_b602_iftrue;
     result_MUX_uxn_opcodes_h_l40_c2_b602_iffalse <= VAR_result_MUX_uxn_opcodes_h_l40_c2_b602_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l40_c2_b602_return_output := result_MUX_uxn_opcodes_h_l40_c2_b602_return_output;

     -- Submodule level 5
     VAR_pc_add_uxn_opcodes_h_l41_c9_d5c8_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_return_output;
     VAR_pc_get_uxn_opcodes_h_l41_c26_d4a2_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_return_output;
     VAR_peek2_ram_uxn_opcodes_h_l41_c16_6b61_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a216_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l40_c2_b602_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l40_c2_b602_return_output;
     -- pc_get[uxn_opcodes_h_l41_c26_d4a2] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l41_c26_d4a2_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l41_c26_d4a2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l41_c26_d4a2_return_output := pc_get_uxn_opcodes_h_l41_c26_d4a2_return_output;

     -- Submodule level 6
     VAR_peek2_ram_uxn_opcodes_h_l41_c16_6b61_address := VAR_pc_get_uxn_opcodes_h_l41_c26_d4a2_return_output;
     -- peek2_ram[uxn_opcodes_h_l41_c16_6b61] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_h_l41_c16_6b61_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_h_l41_c16_6b61_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_h_l41_c16_6b61_address <= VAR_peek2_ram_uxn_opcodes_h_l41_c16_6b61_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_h_l41_c16_6b61_return_output := peek2_ram_uxn_opcodes_h_l41_c16_6b61_return_output;

     -- Submodule level 7
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_left := VAR_peek2_ram_uxn_opcodes_h_l41_c16_6b61_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l41_c16_4845] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_left;
     BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_return_output := BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_return_output;

     -- Submodule level 8
     VAR_pc_add_uxn_opcodes_h_l41_c9_d5c8_adjustment := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_4845_return_output, 16);
     -- pc_add[uxn_opcodes_h_l41_c9_d5c8] LATENCY=0
     -- Clock enable
     pc_add_uxn_opcodes_h_l41_c9_d5c8_CLOCK_ENABLE <= VAR_pc_add_uxn_opcodes_h_l41_c9_d5c8_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_opcodes_h_l41_c9_d5c8_adjustment <= VAR_pc_add_uxn_opcodes_h_l41_c9_d5c8_adjustment;
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
