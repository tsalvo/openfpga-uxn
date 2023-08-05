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
-- Submodules: 11
entity opc_str2_0CLK_9c90a87c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_str2_0CLK_9c90a87c;
architecture arch of opc_str2_0CLK_9c90a87c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l621_c7_1dd5]
signal t_register_uxn_opcodes_h_l621_c7_1dd5_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l621_c7_1dd5_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l621_c7_1dd5_return_output : unsigned(7 downto 0);

-- h2_register[uxn_opcodes_h_l622_c8_0e96]
signal h2_register_uxn_opcodes_h_l622_c8_0e96_CLOCK_ENABLE : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_h_l622_c8_0e96_stack_index : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_h_l622_c8_0e96_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l623_c9_7325]
signal set_uxn_opcodes_h_l623_c9_7325_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l623_c9_7325_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l623_c9_7325_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l623_c9_7325_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l623_c9_7325_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l623_c9_7325_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l623_c9_7325_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l624_c6_f0e3]
signal BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l625_c1_7ba2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l624_c2_dc56]
signal t16_MUX_uxn_opcodes_h_l624_c2_dc56_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c2_dc56_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c2_dc56_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c2_dc56_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_h_l624_c2_dc56]
signal result_MUX_uxn_opcodes_h_l624_c2_dc56_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l624_c2_dc56_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l624_c2_dc56_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l624_c2_dc56_return_output : unsigned(0 downto 0);

-- pc_get[uxn_opcodes_h_l626_c9_f86a]
signal pc_get_uxn_opcodes_h_l626_c9_f86a_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l626_c9_f86a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l626_c9_4f45]
signal BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_return_output : signed(17 downto 0);

-- poke2_ram[uxn_opcodes_h_l627_c3_85f1]
signal poke2_ram_uxn_opcodes_h_l627_c3_85f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal poke2_ram_uxn_opcodes_h_l627_c3_85f1_address : unsigned(15 downto 0);
signal poke2_ram_uxn_opcodes_h_l627_c3_85f1_value : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l621_c7_1dd5
t_register_uxn_opcodes_h_l621_c7_1dd5 : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l621_c7_1dd5_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l621_c7_1dd5_stack_index,
t_register_uxn_opcodes_h_l621_c7_1dd5_return_output);

-- h2_register_uxn_opcodes_h_l622_c8_0e96
h2_register_uxn_opcodes_h_l622_c8_0e96 : entity work.h2_register_0CLK_d6ba51db port map (
clk,
h2_register_uxn_opcodes_h_l622_c8_0e96_CLOCK_ENABLE,
h2_register_uxn_opcodes_h_l622_c8_0e96_stack_index,
h2_register_uxn_opcodes_h_l622_c8_0e96_return_output);

-- set_uxn_opcodes_h_l623_c9_7325
set_uxn_opcodes_h_l623_c9_7325 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l623_c9_7325_CLOCK_ENABLE,
set_uxn_opcodes_h_l623_c9_7325_stack_index,
set_uxn_opcodes_h_l623_c9_7325_ins,
set_uxn_opcodes_h_l623_c9_7325_k,
set_uxn_opcodes_h_l623_c9_7325_mul,
set_uxn_opcodes_h_l623_c9_7325_add,
set_uxn_opcodes_h_l623_c9_7325_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3
BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_left,
BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_right,
BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_return_output);

-- t16_MUX_uxn_opcodes_h_l624_c2_dc56
t16_MUX_uxn_opcodes_h_l624_c2_dc56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l624_c2_dc56_cond,
t16_MUX_uxn_opcodes_h_l624_c2_dc56_iftrue,
t16_MUX_uxn_opcodes_h_l624_c2_dc56_iffalse,
t16_MUX_uxn_opcodes_h_l624_c2_dc56_return_output);

-- result_MUX_uxn_opcodes_h_l624_c2_dc56
result_MUX_uxn_opcodes_h_l624_c2_dc56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l624_c2_dc56_cond,
result_MUX_uxn_opcodes_h_l624_c2_dc56_iftrue,
result_MUX_uxn_opcodes_h_l624_c2_dc56_iffalse,
result_MUX_uxn_opcodes_h_l624_c2_dc56_return_output);

-- pc_get_uxn_opcodes_h_l626_c9_f86a
pc_get_uxn_opcodes_h_l626_c9_f86a : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l626_c9_f86a_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l626_c9_f86a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45
BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_left,
BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_right,
BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_return_output);

-- poke2_ram_uxn_opcodes_h_l627_c3_85f1
poke2_ram_uxn_opcodes_h_l627_c3_85f1 : entity work.poke2_ram_0CLK_cf9aa9fa port map (
clk,
poke2_ram_uxn_opcodes_h_l627_c3_85f1_CLOCK_ENABLE,
poke2_ram_uxn_opcodes_h_l627_c3_85f1_address,
poke2_ram_uxn_opcodes_h_l627_c3_85f1_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 n16,
 t16,
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l621_c7_1dd5_return_output,
 h2_register_uxn_opcodes_h_l622_c8_0e96_return_output,
 set_uxn_opcodes_h_l623_c9_7325_return_output,
 BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_return_output,
 t16_MUX_uxn_opcodes_h_l624_c2_dc56_return_output,
 result_MUX_uxn_opcodes_h_l624_c2_dc56_return_output,
 pc_get_uxn_opcodes_h_l626_c9_f86a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l621_c7_1dd5_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l621_c7_1dd5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l621_c7_1dd5_return_output : unsigned(7 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l622_c8_0e96_stack_index : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l622_c8_0e96_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l622_c8_0e96_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_7325_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_7325_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_7325_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_7325_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_7325_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_7325_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_7325_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_dc56_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_dc56_iffalse : unsigned(15 downto 0);
 variable VAR_t16_uxn_opcodes_h_l626_c3_7a10 : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_dc56_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_dc56_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l624_c2_dc56_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l624_c2_dc56_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l624_c2_dc56_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l624_c2_dc56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_left : signed(16 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l626_c9_f86a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l626_c9_f86a_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l626_c21_02f7_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_return_output : signed(17 downto 0);
 variable VAR_poke2_ram_uxn_opcodes_h_l627_c3_85f1_address : unsigned(15 downto 0);
 variable VAR_poke2_ram_uxn_opcodes_h_l627_c3_85f1_value : unsigned(15 downto 0);
 variable VAR_poke2_ram_uxn_opcodes_h_l627_c3_85f1_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n16 := n16;
  REG_VAR_t16 := t16;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_MUX_uxn_opcodes_h_l624_c2_dc56_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l623_c9_7325_mul := resize(to_unsigned(3, 2), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l623_c9_7325_add := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l624_c2_dc56_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_iffalse := VAR_CLOCK_ENABLE;
     VAR_h2_register_uxn_opcodes_h_l622_c8_0e96_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l623_c9_7325_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l621_c7_1dd5_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l623_c9_7325_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l623_c9_7325_k := VAR_k;
     VAR_h2_register_uxn_opcodes_h_l622_c8_0e96_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l623_c9_7325_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l621_c7_1dd5_stack_index := VAR_stack_index;
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_dc56_iftrue := t16;
     -- set[uxn_opcodes_h_l623_c9_7325] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l623_c9_7325_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l623_c9_7325_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l623_c9_7325_stack_index <= VAR_set_uxn_opcodes_h_l623_c9_7325_stack_index;
     set_uxn_opcodes_h_l623_c9_7325_ins <= VAR_set_uxn_opcodes_h_l623_c9_7325_ins;
     set_uxn_opcodes_h_l623_c9_7325_k <= VAR_set_uxn_opcodes_h_l623_c9_7325_k;
     set_uxn_opcodes_h_l623_c9_7325_mul <= VAR_set_uxn_opcodes_h_l623_c9_7325_mul;
     set_uxn_opcodes_h_l623_c9_7325_add <= VAR_set_uxn_opcodes_h_l623_c9_7325_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l623_c9_7325_return_output := set_uxn_opcodes_h_l623_c9_7325_return_output;

     -- t_register[uxn_opcodes_h_l621_c7_1dd5] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l621_c7_1dd5_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l621_c7_1dd5_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l621_c7_1dd5_stack_index <= VAR_t_register_uxn_opcodes_h_l621_c7_1dd5_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l621_c7_1dd5_return_output := t_register_uxn_opcodes_h_l621_c7_1dd5_return_output;

     -- h2_register[uxn_opcodes_h_l622_c8_0e96] LATENCY=0
     -- Clock enable
     h2_register_uxn_opcodes_h_l622_c8_0e96_CLOCK_ENABLE <= VAR_h2_register_uxn_opcodes_h_l622_c8_0e96_CLOCK_ENABLE;
     -- Inputs
     h2_register_uxn_opcodes_h_l622_c8_0e96_stack_index <= VAR_h2_register_uxn_opcodes_h_l622_c8_0e96_stack_index;
     -- Outputs
     VAR_h2_register_uxn_opcodes_h_l622_c8_0e96_return_output := h2_register_uxn_opcodes_h_l622_c8_0e96_return_output;

     -- Submodule level 1
     REG_VAR_n16 := VAR_h2_register_uxn_opcodes_h_l622_c8_0e96_return_output;
     VAR_poke2_ram_uxn_opcodes_h_l627_c3_85f1_value := VAR_h2_register_uxn_opcodes_h_l622_c8_0e96_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_left := VAR_set_uxn_opcodes_h_l623_c9_7325_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l623_c9_7325_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l621_c7_1dd5_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l624_c6_f0e3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_left;
     BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_return_output := BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l626_c21_02f7] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l626_c21_02f7_return_output := CAST_TO_int8_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l621_c7_1dd5_return_output);

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_return_output;
     VAR_result_MUX_uxn_opcodes_h_l624_c2_dc56_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_dc56_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_f0e3_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l626_c21_02f7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l625_c1_7ba2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_return_output;

     -- result_MUX[uxn_opcodes_h_l624_c2_dc56] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l624_c2_dc56_cond <= VAR_result_MUX_uxn_opcodes_h_l624_c2_dc56_cond;
     result_MUX_uxn_opcodes_h_l624_c2_dc56_iftrue <= VAR_result_MUX_uxn_opcodes_h_l624_c2_dc56_iftrue;
     result_MUX_uxn_opcodes_h_l624_c2_dc56_iffalse <= VAR_result_MUX_uxn_opcodes_h_l624_c2_dc56_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l624_c2_dc56_return_output := result_MUX_uxn_opcodes_h_l624_c2_dc56_return_output;

     -- Submodule level 3
     VAR_pc_get_uxn_opcodes_h_l626_c9_f86a_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_return_output;
     VAR_poke2_ram_uxn_opcodes_h_l627_c3_85f1_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_7ba2_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l624_c2_dc56_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l624_c2_dc56_return_output;
     -- pc_get[uxn_opcodes_h_l626_c9_f86a] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l626_c9_f86a_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l626_c9_f86a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l626_c9_f86a_return_output := pc_get_uxn_opcodes_h_l626_c9_f86a_return_output;

     -- Submodule level 4
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_left := signed(std_logic_vector(resize(VAR_pc_get_uxn_opcodes_h_l626_c9_f86a_return_output, 17)));
     -- BIN_OP_PLUS[uxn_opcodes_h_l626_c9_4f45] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_left;
     BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_return_output := BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_return_output;

     -- Submodule level 5
     VAR_t16_uxn_opcodes_h_l626_c3_7a10 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_4f45_return_output)),16);
     VAR_poke2_ram_uxn_opcodes_h_l627_c3_85f1_address := VAR_t16_uxn_opcodes_h_l626_c3_7a10;
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_dc56_iffalse := VAR_t16_uxn_opcodes_h_l626_c3_7a10;
     -- poke2_ram[uxn_opcodes_h_l627_c3_85f1] LATENCY=0
     -- Clock enable
     poke2_ram_uxn_opcodes_h_l627_c3_85f1_CLOCK_ENABLE <= VAR_poke2_ram_uxn_opcodes_h_l627_c3_85f1_CLOCK_ENABLE;
     -- Inputs
     poke2_ram_uxn_opcodes_h_l627_c3_85f1_address <= VAR_poke2_ram_uxn_opcodes_h_l627_c3_85f1_address;
     poke2_ram_uxn_opcodes_h_l627_c3_85f1_value <= VAR_poke2_ram_uxn_opcodes_h_l627_c3_85f1_value;
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l624_c2_dc56] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l624_c2_dc56_cond <= VAR_t16_MUX_uxn_opcodes_h_l624_c2_dc56_cond;
     t16_MUX_uxn_opcodes_h_l624_c2_dc56_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l624_c2_dc56_iftrue;
     t16_MUX_uxn_opcodes_h_l624_c2_dc56_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l624_c2_dc56_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_dc56_return_output := t16_MUX_uxn_opcodes_h_l624_c2_dc56_return_output;

     -- Submodule level 6
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l624_c2_dc56_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     n16 <= REG_COMB_n16;
     t16 <= REG_COMB_t16;
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
