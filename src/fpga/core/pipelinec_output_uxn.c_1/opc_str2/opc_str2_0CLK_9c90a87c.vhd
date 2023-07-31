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
-- t_register[uxn_opcodes_h_l621_c7_b856]
signal t_register_uxn_opcodes_h_l621_c7_b856_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l621_c7_b856_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l621_c7_b856_return_output : unsigned(7 downto 0);

-- h2_register[uxn_opcodes_h_l622_c8_d7cb]
signal h2_register_uxn_opcodes_h_l622_c8_d7cb_CLOCK_ENABLE : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_h_l622_c8_d7cb_stack_index : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_h_l622_c8_d7cb_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l623_c9_1bcb]
signal set_uxn_opcodes_h_l623_c9_1bcb_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l623_c9_1bcb_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l623_c9_1bcb_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l623_c9_1bcb_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l623_c9_1bcb_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l623_c9_1bcb_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l623_c9_1bcb_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l624_c6_4d58]
signal BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l625_c1_8546]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l624_c2_a88d]
signal t16_MUX_uxn_opcodes_h_l624_c2_a88d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c2_a88d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c2_a88d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c2_a88d_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_h_l624_c2_a88d]
signal result_MUX_uxn_opcodes_h_l624_c2_a88d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l624_c2_a88d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l624_c2_a88d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l624_c2_a88d_return_output : unsigned(0 downto 0);

-- pc_get[uxn_opcodes_h_l626_c9_4f1c]
signal pc_get_uxn_opcodes_h_l626_c9_4f1c_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l626_c9_4f1c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l626_c9_a125]
signal BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_return_output : signed(17 downto 0);

-- poke2_ram[uxn_opcodes_h_l627_c3_e99c]
signal poke2_ram_uxn_opcodes_h_l627_c3_e99c_CLOCK_ENABLE : unsigned(0 downto 0);
signal poke2_ram_uxn_opcodes_h_l627_c3_e99c_address : unsigned(15 downto 0);
signal poke2_ram_uxn_opcodes_h_l627_c3_e99c_value : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l621_c7_b856
t_register_uxn_opcodes_h_l621_c7_b856 : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l621_c7_b856_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l621_c7_b856_stack_index,
t_register_uxn_opcodes_h_l621_c7_b856_return_output);

-- h2_register_uxn_opcodes_h_l622_c8_d7cb
h2_register_uxn_opcodes_h_l622_c8_d7cb : entity work.h2_register_0CLK_d6ba51db port map (
clk,
h2_register_uxn_opcodes_h_l622_c8_d7cb_CLOCK_ENABLE,
h2_register_uxn_opcodes_h_l622_c8_d7cb_stack_index,
h2_register_uxn_opcodes_h_l622_c8_d7cb_return_output);

-- set_uxn_opcodes_h_l623_c9_1bcb
set_uxn_opcodes_h_l623_c9_1bcb : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l623_c9_1bcb_CLOCK_ENABLE,
set_uxn_opcodes_h_l623_c9_1bcb_stack_index,
set_uxn_opcodes_h_l623_c9_1bcb_ins,
set_uxn_opcodes_h_l623_c9_1bcb_k,
set_uxn_opcodes_h_l623_c9_1bcb_mul,
set_uxn_opcodes_h_l623_c9_1bcb_add,
set_uxn_opcodes_h_l623_c9_1bcb_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58
BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_left,
BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_right,
BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_return_output);

-- t16_MUX_uxn_opcodes_h_l624_c2_a88d
t16_MUX_uxn_opcodes_h_l624_c2_a88d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l624_c2_a88d_cond,
t16_MUX_uxn_opcodes_h_l624_c2_a88d_iftrue,
t16_MUX_uxn_opcodes_h_l624_c2_a88d_iffalse,
t16_MUX_uxn_opcodes_h_l624_c2_a88d_return_output);

-- result_MUX_uxn_opcodes_h_l624_c2_a88d
result_MUX_uxn_opcodes_h_l624_c2_a88d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l624_c2_a88d_cond,
result_MUX_uxn_opcodes_h_l624_c2_a88d_iftrue,
result_MUX_uxn_opcodes_h_l624_c2_a88d_iffalse,
result_MUX_uxn_opcodes_h_l624_c2_a88d_return_output);

-- pc_get_uxn_opcodes_h_l626_c9_4f1c
pc_get_uxn_opcodes_h_l626_c9_4f1c : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l626_c9_4f1c_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l626_c9_4f1c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125
BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_left,
BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_right,
BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_return_output);

-- poke2_ram_uxn_opcodes_h_l627_c3_e99c
poke2_ram_uxn_opcodes_h_l627_c3_e99c : entity work.poke2_ram_0CLK_cf9aa9fa port map (
clk,
poke2_ram_uxn_opcodes_h_l627_c3_e99c_CLOCK_ENABLE,
poke2_ram_uxn_opcodes_h_l627_c3_e99c_address,
poke2_ram_uxn_opcodes_h_l627_c3_e99c_value);



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
 t_register_uxn_opcodes_h_l621_c7_b856_return_output,
 h2_register_uxn_opcodes_h_l622_c8_d7cb_return_output,
 set_uxn_opcodes_h_l623_c9_1bcb_return_output,
 BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_return_output,
 t16_MUX_uxn_opcodes_h_l624_c2_a88d_return_output,
 result_MUX_uxn_opcodes_h_l624_c2_a88d_return_output,
 pc_get_uxn_opcodes_h_l626_c9_4f1c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l621_c7_b856_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l621_c7_b856_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l621_c7_b856_return_output : unsigned(7 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l622_c8_d7cb_stack_index : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l622_c8_d7cb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l622_c8_d7cb_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_1bcb_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_1bcb_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_1bcb_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_1bcb_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_1bcb_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_1bcb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_1bcb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_a88d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_a88d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_uxn_opcodes_h_l626_c3_3e57 : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_a88d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_a88d_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l624_c2_a88d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l624_c2_a88d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l624_c2_a88d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l624_c2_a88d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_left : signed(16 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l626_c9_4f1c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l626_c9_4f1c_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l626_c21_6f10_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_return_output : signed(17 downto 0);
 variable VAR_poke2_ram_uxn_opcodes_h_l627_c3_e99c_address : unsigned(15 downto 0);
 variable VAR_poke2_ram_uxn_opcodes_h_l627_c3_e99c_value : unsigned(15 downto 0);
 variable VAR_poke2_ram_uxn_opcodes_h_l627_c3_e99c_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_h_l624_c2_a88d_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l623_c9_1bcb_mul := resize(to_unsigned(3, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l624_c2_a88d_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l623_c9_1bcb_add := resize(to_signed(-3, 3), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_iffalse := VAR_CLOCK_ENABLE;
     VAR_h2_register_uxn_opcodes_h_l622_c8_d7cb_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l623_c9_1bcb_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l621_c7_b856_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l623_c9_1bcb_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l623_c9_1bcb_k := VAR_k;
     VAR_h2_register_uxn_opcodes_h_l622_c8_d7cb_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l623_c9_1bcb_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l621_c7_b856_stack_index := VAR_stack_index;
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_a88d_iftrue := t16;
     -- h2_register[uxn_opcodes_h_l622_c8_d7cb] LATENCY=0
     -- Clock enable
     h2_register_uxn_opcodes_h_l622_c8_d7cb_CLOCK_ENABLE <= VAR_h2_register_uxn_opcodes_h_l622_c8_d7cb_CLOCK_ENABLE;
     -- Inputs
     h2_register_uxn_opcodes_h_l622_c8_d7cb_stack_index <= VAR_h2_register_uxn_opcodes_h_l622_c8_d7cb_stack_index;
     -- Outputs
     VAR_h2_register_uxn_opcodes_h_l622_c8_d7cb_return_output := h2_register_uxn_opcodes_h_l622_c8_d7cb_return_output;

     -- set[uxn_opcodes_h_l623_c9_1bcb] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l623_c9_1bcb_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l623_c9_1bcb_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l623_c9_1bcb_stack_index <= VAR_set_uxn_opcodes_h_l623_c9_1bcb_stack_index;
     set_uxn_opcodes_h_l623_c9_1bcb_ins <= VAR_set_uxn_opcodes_h_l623_c9_1bcb_ins;
     set_uxn_opcodes_h_l623_c9_1bcb_k <= VAR_set_uxn_opcodes_h_l623_c9_1bcb_k;
     set_uxn_opcodes_h_l623_c9_1bcb_mul <= VAR_set_uxn_opcodes_h_l623_c9_1bcb_mul;
     set_uxn_opcodes_h_l623_c9_1bcb_add <= VAR_set_uxn_opcodes_h_l623_c9_1bcb_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l623_c9_1bcb_return_output := set_uxn_opcodes_h_l623_c9_1bcb_return_output;

     -- t_register[uxn_opcodes_h_l621_c7_b856] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l621_c7_b856_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l621_c7_b856_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l621_c7_b856_stack_index <= VAR_t_register_uxn_opcodes_h_l621_c7_b856_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l621_c7_b856_return_output := t_register_uxn_opcodes_h_l621_c7_b856_return_output;

     -- Submodule level 1
     REG_VAR_n16 := VAR_h2_register_uxn_opcodes_h_l622_c8_d7cb_return_output;
     VAR_poke2_ram_uxn_opcodes_h_l627_c3_e99c_value := VAR_h2_register_uxn_opcodes_h_l622_c8_d7cb_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_left := VAR_set_uxn_opcodes_h_l623_c9_1bcb_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l623_c9_1bcb_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l621_c7_b856_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l624_c6_4d58] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_left;
     BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_return_output := BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l626_c21_6f10] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l626_c21_6f10_return_output := CAST_TO_int8_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l621_c7_b856_return_output);

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_return_output;
     VAR_result_MUX_uxn_opcodes_h_l624_c2_a88d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_a88d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4d58_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l626_c21_6f10_return_output;
     -- result_MUX[uxn_opcodes_h_l624_c2_a88d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l624_c2_a88d_cond <= VAR_result_MUX_uxn_opcodes_h_l624_c2_a88d_cond;
     result_MUX_uxn_opcodes_h_l624_c2_a88d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l624_c2_a88d_iftrue;
     result_MUX_uxn_opcodes_h_l624_c2_a88d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l624_c2_a88d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l624_c2_a88d_return_output := result_MUX_uxn_opcodes_h_l624_c2_a88d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l625_c1_8546] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_return_output;

     -- Submodule level 3
     VAR_pc_get_uxn_opcodes_h_l626_c9_4f1c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_return_output;
     VAR_poke2_ram_uxn_opcodes_h_l627_c3_e99c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_8546_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l624_c2_a88d_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l624_c2_a88d_return_output;
     -- pc_get[uxn_opcodes_h_l626_c9_4f1c] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l626_c9_4f1c_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l626_c9_4f1c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l626_c9_4f1c_return_output := pc_get_uxn_opcodes_h_l626_c9_4f1c_return_output;

     -- Submodule level 4
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_left := signed(std_logic_vector(resize(VAR_pc_get_uxn_opcodes_h_l626_c9_4f1c_return_output, 17)));
     -- BIN_OP_PLUS[uxn_opcodes_h_l626_c9_a125] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_left;
     BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_return_output := BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_return_output;

     -- Submodule level 5
     VAR_t16_uxn_opcodes_h_l626_c3_3e57 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_a125_return_output)),16);
     VAR_poke2_ram_uxn_opcodes_h_l627_c3_e99c_address := VAR_t16_uxn_opcodes_h_l626_c3_3e57;
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_a88d_iffalse := VAR_t16_uxn_opcodes_h_l626_c3_3e57;
     -- t16_MUX[uxn_opcodes_h_l624_c2_a88d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l624_c2_a88d_cond <= VAR_t16_MUX_uxn_opcodes_h_l624_c2_a88d_cond;
     t16_MUX_uxn_opcodes_h_l624_c2_a88d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l624_c2_a88d_iftrue;
     t16_MUX_uxn_opcodes_h_l624_c2_a88d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l624_c2_a88d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_a88d_return_output := t16_MUX_uxn_opcodes_h_l624_c2_a88d_return_output;

     -- poke2_ram[uxn_opcodes_h_l627_c3_e99c] LATENCY=0
     -- Clock enable
     poke2_ram_uxn_opcodes_h_l627_c3_e99c_CLOCK_ENABLE <= VAR_poke2_ram_uxn_opcodes_h_l627_c3_e99c_CLOCK_ENABLE;
     -- Inputs
     poke2_ram_uxn_opcodes_h_l627_c3_e99c_address <= VAR_poke2_ram_uxn_opcodes_h_l627_c3_e99c_address;
     poke2_ram_uxn_opcodes_h_l627_c3_e99c_value <= VAR_poke2_ram_uxn_opcodes_h_l627_c3_e99c_value;
     -- Outputs

     -- Submodule level 6
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l624_c2_a88d_return_output;
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
