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
entity opc_jsi_0CLK_f07dff9f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jsi_0CLK_f07dff9f;
architecture arch of opc_jsi_0CLK_f07dff9f is
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
-- pc_get[uxn_opcodes_h_l39_c29_f7ca]
signal pc_get_uxn_opcodes_h_l39_c29_f7ca_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l39_c29_f7ca_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l39_c29_6b71]
signal BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_return_output : unsigned(16 downto 0);

-- push2_stack[uxn_opcodes_h_l39_c9_f736]
signal push2_stack_uxn_opcodes_h_l39_c9_f736_CLOCK_ENABLE : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l39_c9_f736_stack_index : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l39_c9_f736_ins : unsigned(7 downto 0);
signal push2_stack_uxn_opcodes_h_l39_c9_f736_value : unsigned(15 downto 0);
signal push2_stack_uxn_opcodes_h_l39_c9_f736_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l40_c6_ca8d]
signal BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l41_c1_a4da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l40_c2_0992]
signal result_MUX_uxn_opcodes_h_l40_c2_0992_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l40_c2_0992_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l40_c2_0992_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l40_c2_0992_return_output : unsigned(0 downto 0);

-- pc_get[uxn_opcodes_h_l41_c26_8c6c]
signal pc_get_uxn_opcodes_h_l41_c26_8c6c_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l41_c26_8c6c_return_output : unsigned(15 downto 0);

-- peek2_ram[uxn_opcodes_h_l41_c16_67f2]
signal peek2_ram_uxn_opcodes_h_l41_c16_67f2_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_h_l41_c16_67f2_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_h_l41_c16_67f2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l41_c16_172c]
signal BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_return_output : unsigned(16 downto 0);

-- pc_add[uxn_opcodes_h_l41_c9_33ab]
signal pc_add_uxn_opcodes_h_l41_c9_33ab_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_opcodes_h_l41_c9_33ab_adjustment : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_opcodes_h_l39_c29_f7ca
pc_get_uxn_opcodes_h_l39_c29_f7ca : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l39_c29_f7ca_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l39_c29_f7ca_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71
BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_left,
BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_right,
BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_return_output);

-- push2_stack_uxn_opcodes_h_l39_c9_f736
push2_stack_uxn_opcodes_h_l39_c9_f736 : entity work.push2_stack_0CLK_415a9aa2 port map (
clk,
push2_stack_uxn_opcodes_h_l39_c9_f736_CLOCK_ENABLE,
push2_stack_uxn_opcodes_h_l39_c9_f736_stack_index,
push2_stack_uxn_opcodes_h_l39_c9_f736_ins,
push2_stack_uxn_opcodes_h_l39_c9_f736_value,
push2_stack_uxn_opcodes_h_l39_c9_f736_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d
BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_left,
BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_right,
BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_return_output);

-- result_MUX_uxn_opcodes_h_l40_c2_0992
result_MUX_uxn_opcodes_h_l40_c2_0992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l40_c2_0992_cond,
result_MUX_uxn_opcodes_h_l40_c2_0992_iftrue,
result_MUX_uxn_opcodes_h_l40_c2_0992_iffalse,
result_MUX_uxn_opcodes_h_l40_c2_0992_return_output);

-- pc_get_uxn_opcodes_h_l41_c26_8c6c
pc_get_uxn_opcodes_h_l41_c26_8c6c : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l41_c26_8c6c_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l41_c26_8c6c_return_output);

-- peek2_ram_uxn_opcodes_h_l41_c16_67f2
peek2_ram_uxn_opcodes_h_l41_c16_67f2 : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_h_l41_c16_67f2_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_h_l41_c16_67f2_address,
peek2_ram_uxn_opcodes_h_l41_c16_67f2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c
BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_left,
BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_right,
BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_return_output);

-- pc_add_uxn_opcodes_h_l41_c9_33ab
pc_add_uxn_opcodes_h_l41_c9_33ab : entity work.pc_add_0CLK_8573165f port map (
clk,
pc_add_uxn_opcodes_h_l41_c9_33ab_CLOCK_ENABLE,
pc_add_uxn_opcodes_h_l41_c9_33ab_adjustment);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 ins,
 -- Registers
 tmp8,
 result,
 -- All submodule outputs
 pc_get_uxn_opcodes_h_l39_c29_f7ca_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_return_output,
 push2_stack_uxn_opcodes_h_l39_c9_f736_return_output,
 BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_return_output,
 result_MUX_uxn_opcodes_h_l40_c2_0992_return_output,
 pc_get_uxn_opcodes_h_l41_c26_8c6c_return_output,
 peek2_ram_uxn_opcodes_h_l41_c16_67f2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_stack_index : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_ins : unsigned(7 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_left : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l39_c29_f7ca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l39_c29_f7ca_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_return_output : unsigned(16 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l40_c2_0992_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l40_c2_0992_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l40_c2_0992_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l40_c2_0992_cond : unsigned(0 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l41_c9_33ab_adjustment : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l41_c16_67f2_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_left : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l41_c26_8c6c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l41_c26_8c6c_return_output : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l41_c16_67f2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l41_c16_67f2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_return_output : unsigned(16 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l41_c9_33ab_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_stack_index := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l40_c2_0992_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l40_c2_0992_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ins := ins;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_iffalse := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_opcodes_h_l39_c29_f7ca_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_ins := VAR_ins;
     -- pc_get[uxn_opcodes_h_l39_c29_f7ca] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l39_c29_f7ca_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l39_c29_f7ca_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l39_c29_f7ca_return_output := pc_get_uxn_opcodes_h_l39_c29_f7ca_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_left := VAR_pc_get_uxn_opcodes_h_l39_c29_f7ca_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l39_c29_6b71] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_left;
     BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_return_output := BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_return_output;

     -- Submodule level 2
     VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_value := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_6b71_return_output, 16);
     -- push2_stack[uxn_opcodes_h_l39_c9_f736] LATENCY=0
     -- Clock enable
     push2_stack_uxn_opcodes_h_l39_c9_f736_CLOCK_ENABLE <= VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_CLOCK_ENABLE;
     -- Inputs
     push2_stack_uxn_opcodes_h_l39_c9_f736_stack_index <= VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_stack_index;
     push2_stack_uxn_opcodes_h_l39_c9_f736_ins <= VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_ins;
     push2_stack_uxn_opcodes_h_l39_c9_f736_value <= VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_value;
     -- Outputs
     VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_return_output := push2_stack_uxn_opcodes_h_l39_c9_f736_return_output;

     -- Submodule level 3
     VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_left := VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_return_output;
     REG_VAR_tmp8 := VAR_push2_stack_uxn_opcodes_h_l39_c9_f736_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l40_c6_ca8d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_left;
     BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_return_output := BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l40_c2_0992_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_ca8d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l41_c1_a4da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_return_output;

     -- result_MUX[uxn_opcodes_h_l40_c2_0992] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l40_c2_0992_cond <= VAR_result_MUX_uxn_opcodes_h_l40_c2_0992_cond;
     result_MUX_uxn_opcodes_h_l40_c2_0992_iftrue <= VAR_result_MUX_uxn_opcodes_h_l40_c2_0992_iftrue;
     result_MUX_uxn_opcodes_h_l40_c2_0992_iffalse <= VAR_result_MUX_uxn_opcodes_h_l40_c2_0992_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l40_c2_0992_return_output := result_MUX_uxn_opcodes_h_l40_c2_0992_return_output;

     -- Submodule level 5
     VAR_pc_add_uxn_opcodes_h_l41_c9_33ab_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_return_output;
     VAR_pc_get_uxn_opcodes_h_l41_c26_8c6c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_return_output;
     VAR_peek2_ram_uxn_opcodes_h_l41_c16_67f2_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_a4da_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l40_c2_0992_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l40_c2_0992_return_output;
     -- pc_get[uxn_opcodes_h_l41_c26_8c6c] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l41_c26_8c6c_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l41_c26_8c6c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l41_c26_8c6c_return_output := pc_get_uxn_opcodes_h_l41_c26_8c6c_return_output;

     -- Submodule level 6
     VAR_peek2_ram_uxn_opcodes_h_l41_c16_67f2_address := VAR_pc_get_uxn_opcodes_h_l41_c26_8c6c_return_output;
     -- peek2_ram[uxn_opcodes_h_l41_c16_67f2] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_h_l41_c16_67f2_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_h_l41_c16_67f2_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_h_l41_c16_67f2_address <= VAR_peek2_ram_uxn_opcodes_h_l41_c16_67f2_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_h_l41_c16_67f2_return_output := peek2_ram_uxn_opcodes_h_l41_c16_67f2_return_output;

     -- Submodule level 7
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_left := VAR_peek2_ram_uxn_opcodes_h_l41_c16_67f2_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l41_c16_172c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_return_output;

     -- Submodule level 8
     VAR_pc_add_uxn_opcodes_h_l41_c9_33ab_adjustment := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_172c_return_output, 16);
     -- pc_add[uxn_opcodes_h_l41_c9_33ab] LATENCY=0
     -- Clock enable
     pc_add_uxn_opcodes_h_l41_c9_33ab_CLOCK_ENABLE <= VAR_pc_add_uxn_opcodes_h_l41_c9_33ab_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_opcodes_h_l41_c9_33ab_adjustment <= VAR_pc_add_uxn_opcodes_h_l41_c9_33ab_adjustment;
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
