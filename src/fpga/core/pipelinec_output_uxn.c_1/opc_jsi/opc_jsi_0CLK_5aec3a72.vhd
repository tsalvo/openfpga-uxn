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
entity opc_jsi_0CLK_5aec3a72 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jsi_0CLK_5aec3a72;
architecture arch of opc_jsi_0CLK_5aec3a72 is
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
-- pc_get[uxn_opcodes_h_l39_c29_7103]
signal pc_get_uxn_opcodes_h_l39_c29_7103_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l39_c29_7103_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l39_c29_a4a5]
signal BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_return_output : unsigned(16 downto 0);

-- push2_stack[uxn_opcodes_h_l39_c9_e345]
signal push2_stack_uxn_opcodes_h_l39_c9_e345_CLOCK_ENABLE : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l39_c9_e345_stack_index : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l39_c9_e345_ins : unsigned(7 downto 0);
signal push2_stack_uxn_opcodes_h_l39_c9_e345_value : unsigned(15 downto 0);
signal push2_stack_uxn_opcodes_h_l39_c9_e345_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l40_c6_f4d9]
signal BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l41_c1_e69d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l40_c2_8e85]
signal result_MUX_uxn_opcodes_h_l40_c2_8e85_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l40_c2_8e85_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l40_c2_8e85_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l40_c2_8e85_return_output : unsigned(0 downto 0);

-- pc_get[uxn_opcodes_h_l41_c26_ba1c]
signal pc_get_uxn_opcodes_h_l41_c26_ba1c_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l41_c26_ba1c_return_output : unsigned(15 downto 0);

-- peek2_ram[uxn_opcodes_h_l41_c16_6060]
signal peek2_ram_uxn_opcodes_h_l41_c16_6060_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_h_l41_c16_6060_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_h_l41_c16_6060_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l41_c16_6758]
signal BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_return_output : unsigned(16 downto 0);

-- pc_add[uxn_opcodes_h_l41_c9_6502]
signal pc_add_uxn_opcodes_h_l41_c9_6502_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_opcodes_h_l41_c9_6502_adjustment : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_opcodes_h_l39_c29_7103
pc_get_uxn_opcodes_h_l39_c29_7103 : entity work.pc_get_0CLK_9859a581 port map (
clk,
pc_get_uxn_opcodes_h_l39_c29_7103_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l39_c29_7103_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5
BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_left,
BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_right,
BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_return_output);

-- push2_stack_uxn_opcodes_h_l39_c9_e345
push2_stack_uxn_opcodes_h_l39_c9_e345 : entity work.push2_stack_0CLK_e79cfe61 port map (
clk,
push2_stack_uxn_opcodes_h_l39_c9_e345_CLOCK_ENABLE,
push2_stack_uxn_opcodes_h_l39_c9_e345_stack_index,
push2_stack_uxn_opcodes_h_l39_c9_e345_ins,
push2_stack_uxn_opcodes_h_l39_c9_e345_value,
push2_stack_uxn_opcodes_h_l39_c9_e345_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9
BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_left,
BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_right,
BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_return_output);

-- result_MUX_uxn_opcodes_h_l40_c2_8e85
result_MUX_uxn_opcodes_h_l40_c2_8e85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l40_c2_8e85_cond,
result_MUX_uxn_opcodes_h_l40_c2_8e85_iftrue,
result_MUX_uxn_opcodes_h_l40_c2_8e85_iffalse,
result_MUX_uxn_opcodes_h_l40_c2_8e85_return_output);

-- pc_get_uxn_opcodes_h_l41_c26_ba1c
pc_get_uxn_opcodes_h_l41_c26_ba1c : entity work.pc_get_0CLK_9859a581 port map (
clk,
pc_get_uxn_opcodes_h_l41_c26_ba1c_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l41_c26_ba1c_return_output);

-- peek2_ram_uxn_opcodes_h_l41_c16_6060
peek2_ram_uxn_opcodes_h_l41_c16_6060 : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_h_l41_c16_6060_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_h_l41_c16_6060_address,
peek2_ram_uxn_opcodes_h_l41_c16_6060_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758
BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_left,
BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_right,
BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_return_output);

-- pc_add_uxn_opcodes_h_l41_c9_6502
pc_add_uxn_opcodes_h_l41_c9_6502 : entity work.pc_add_0CLK_925e4dd0 port map (
clk,
pc_add_uxn_opcodes_h_l41_c9_6502_CLOCK_ENABLE,
pc_add_uxn_opcodes_h_l41_c9_6502_adjustment);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 ins,
 -- Registers
 tmp8,
 result,
 -- All submodule outputs
 pc_get_uxn_opcodes_h_l39_c29_7103_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_return_output,
 push2_stack_uxn_opcodes_h_l39_c9_e345_return_output,
 BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_return_output,
 result_MUX_uxn_opcodes_h_l40_c2_8e85_return_output,
 pc_get_uxn_opcodes_h_l41_c26_ba1c_return_output,
 peek2_ram_uxn_opcodes_h_l41_c16_6060_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_stack_index : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_ins : unsigned(7 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_left : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l39_c29_7103_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l39_c29_7103_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_return_output : unsigned(16 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l40_c2_8e85_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l40_c2_8e85_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l40_c2_8e85_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l40_c2_8e85_cond : unsigned(0 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l41_c9_6502_adjustment : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l41_c16_6060_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_left : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l41_c26_ba1c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l41_c26_ba1c_return_output : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l41_c16_6060_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l41_c16_6060_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_return_output : unsigned(16 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l41_c9_6502_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_stack_index := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_right := to_unsigned(2, 2);
     VAR_result_MUX_uxn_opcodes_h_l40_c2_8e85_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l40_c2_8e85_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ins := ins;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_iffalse := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_opcodes_h_l39_c29_7103_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_ins := VAR_ins;
     -- pc_get[uxn_opcodes_h_l39_c29_7103] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l39_c29_7103_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l39_c29_7103_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l39_c29_7103_return_output := pc_get_uxn_opcodes_h_l39_c29_7103_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_left := VAR_pc_get_uxn_opcodes_h_l39_c29_7103_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l39_c29_a4a5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_return_output;

     -- Submodule level 2
     VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_value := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l39_c29_a4a5_return_output, 16);
     -- push2_stack[uxn_opcodes_h_l39_c9_e345] LATENCY=0
     -- Clock enable
     push2_stack_uxn_opcodes_h_l39_c9_e345_CLOCK_ENABLE <= VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_CLOCK_ENABLE;
     -- Inputs
     push2_stack_uxn_opcodes_h_l39_c9_e345_stack_index <= VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_stack_index;
     push2_stack_uxn_opcodes_h_l39_c9_e345_ins <= VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_ins;
     push2_stack_uxn_opcodes_h_l39_c9_e345_value <= VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_value;
     -- Outputs
     VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_return_output := push2_stack_uxn_opcodes_h_l39_c9_e345_return_output;

     -- Submodule level 3
     VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_left := VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_return_output;
     REG_VAR_tmp8 := VAR_push2_stack_uxn_opcodes_h_l39_c9_e345_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l40_c6_f4d9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_left;
     BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_return_output := BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l40_c2_8e85_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l40_c6_f4d9_return_output;
     -- result_MUX[uxn_opcodes_h_l40_c2_8e85] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l40_c2_8e85_cond <= VAR_result_MUX_uxn_opcodes_h_l40_c2_8e85_cond;
     result_MUX_uxn_opcodes_h_l40_c2_8e85_iftrue <= VAR_result_MUX_uxn_opcodes_h_l40_c2_8e85_iftrue;
     result_MUX_uxn_opcodes_h_l40_c2_8e85_iffalse <= VAR_result_MUX_uxn_opcodes_h_l40_c2_8e85_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l40_c2_8e85_return_output := result_MUX_uxn_opcodes_h_l40_c2_8e85_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l41_c1_e69d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_return_output;

     -- Submodule level 5
     VAR_pc_add_uxn_opcodes_h_l41_c9_6502_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_return_output;
     VAR_pc_get_uxn_opcodes_h_l41_c26_ba1c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_return_output;
     VAR_peek2_ram_uxn_opcodes_h_l41_c16_6060_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l41_c1_e69d_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l40_c2_8e85_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l40_c2_8e85_return_output;
     -- pc_get[uxn_opcodes_h_l41_c26_ba1c] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l41_c26_ba1c_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l41_c26_ba1c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l41_c26_ba1c_return_output := pc_get_uxn_opcodes_h_l41_c26_ba1c_return_output;

     -- Submodule level 6
     VAR_peek2_ram_uxn_opcodes_h_l41_c16_6060_address := VAR_pc_get_uxn_opcodes_h_l41_c26_ba1c_return_output;
     -- peek2_ram[uxn_opcodes_h_l41_c16_6060] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_h_l41_c16_6060_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_h_l41_c16_6060_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_h_l41_c16_6060_address <= VAR_peek2_ram_uxn_opcodes_h_l41_c16_6060_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_h_l41_c16_6060_return_output := peek2_ram_uxn_opcodes_h_l41_c16_6060_return_output;

     -- Submodule level 7
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_left := VAR_peek2_ram_uxn_opcodes_h_l41_c16_6060_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l41_c16_6758] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_left;
     BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_return_output := BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_return_output;

     -- Submodule level 8
     VAR_pc_add_uxn_opcodes_h_l41_c9_6502_adjustment := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l41_c16_6758_return_output, 16);
     -- pc_add[uxn_opcodes_h_l41_c9_6502] LATENCY=0
     -- Clock enable
     pc_add_uxn_opcodes_h_l41_c9_6502_CLOCK_ENABLE <= VAR_pc_add_uxn_opcodes_h_l41_c9_6502_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_opcodes_h_l41_c9_6502_adjustment <= VAR_pc_add_uxn_opcodes_h_l41_c9_6502_adjustment;
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
