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
-- Submodules: 8
entity opc_swp_0CLK_670da08e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_swp_0CLK_670da08e;
architecture arch of opc_swp_0CLK_670da08e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l148_c7_debc]
signal t_register_uxn_opcodes_h_l148_c7_debc_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l148_c7_debc_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l148_c7_debc_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l149_c7_c939]
signal n_register_uxn_opcodes_h_l149_c7_c939_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l149_c7_c939_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l149_c7_c939_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l150_c9_9991]
signal set_uxn_opcodes_h_l150_c9_9991_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l150_c9_9991_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l150_c9_9991_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l150_c9_9991_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l150_c9_9991_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l150_c9_9991_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l150_c9_9991_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l151_c6_7d4e]
signal BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l152_c1_48af]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l151_c2_eea5]
signal result_MUX_uxn_opcodes_h_l151_c2_eea5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l151_c2_eea5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l151_c2_eea5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l151_c2_eea5_return_output : unsigned(0 downto 0);

-- put_stack[uxn_opcodes_h_l153_c3_0f02]
signal put_stack_uxn_opcodes_h_l153_c3_0f02_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l153_c3_0f02_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l153_c3_0f02_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l153_c3_0f02_value : unsigned(7 downto 0);

-- put_stack[uxn_opcodes_h_l154_c3_f7c2]
signal put_stack_uxn_opcodes_h_l154_c3_f7c2_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l154_c3_f7c2_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l154_c3_f7c2_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l154_c3_f7c2_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l148_c7_debc
t_register_uxn_opcodes_h_l148_c7_debc : entity work.t_register_0CLK_0e5af5c0 port map (
clk,
t_register_uxn_opcodes_h_l148_c7_debc_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l148_c7_debc_stack_index,
t_register_uxn_opcodes_h_l148_c7_debc_return_output);

-- n_register_uxn_opcodes_h_l149_c7_c939
n_register_uxn_opcodes_h_l149_c7_c939 : entity work.n_register_0CLK_0e5af5c0 port map (
clk,
n_register_uxn_opcodes_h_l149_c7_c939_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l149_c7_c939_stack_index,
n_register_uxn_opcodes_h_l149_c7_c939_return_output);

-- set_uxn_opcodes_h_l150_c9_9991
set_uxn_opcodes_h_l150_c9_9991 : entity work.set_0CLK_e105ce74 port map (
clk,
set_uxn_opcodes_h_l150_c9_9991_CLOCK_ENABLE,
set_uxn_opcodes_h_l150_c9_9991_stack_index,
set_uxn_opcodes_h_l150_c9_9991_ins,
set_uxn_opcodes_h_l150_c9_9991_k,
set_uxn_opcodes_h_l150_c9_9991_mul,
set_uxn_opcodes_h_l150_c9_9991_add,
set_uxn_opcodes_h_l150_c9_9991_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e
BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_left,
BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_right,
BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_return_output);

-- result_MUX_uxn_opcodes_h_l151_c2_eea5
result_MUX_uxn_opcodes_h_l151_c2_eea5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l151_c2_eea5_cond,
result_MUX_uxn_opcodes_h_l151_c2_eea5_iftrue,
result_MUX_uxn_opcodes_h_l151_c2_eea5_iffalse,
result_MUX_uxn_opcodes_h_l151_c2_eea5_return_output);

-- put_stack_uxn_opcodes_h_l153_c3_0f02
put_stack_uxn_opcodes_h_l153_c3_0f02 : entity work.put_stack_0CLK_e3ba3c7d port map (
clk,
put_stack_uxn_opcodes_h_l153_c3_0f02_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l153_c3_0f02_stack_index,
put_stack_uxn_opcodes_h_l153_c3_0f02_offset,
put_stack_uxn_opcodes_h_l153_c3_0f02_value);

-- put_stack_uxn_opcodes_h_l154_c3_f7c2
put_stack_uxn_opcodes_h_l154_c3_f7c2 : entity work.put_stack_0CLK_e3ba3c7d port map (
clk,
put_stack_uxn_opcodes_h_l154_c3_f7c2_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l154_c3_f7c2_stack_index,
put_stack_uxn_opcodes_h_l154_c3_f7c2_offset,
put_stack_uxn_opcodes_h_l154_c3_f7c2_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 n8,
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l148_c7_debc_return_output,
 n_register_uxn_opcodes_h_l149_c7_c939_return_output,
 set_uxn_opcodes_h_l150_c9_9991_return_output,
 BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_return_output,
 result_MUX_uxn_opcodes_h_l151_c2_eea5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l148_c7_debc_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l148_c7_debc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l148_c7_debc_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l149_c7_c939_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l149_c7_c939_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l149_c7_c939_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l150_c9_9991_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l150_c9_9991_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l150_c9_9991_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l150_c9_9991_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l150_c9_9991_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l150_c9_9991_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l150_c9_9991_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l151_c2_eea5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l151_c2_eea5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l151_c2_eea5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l151_c2_eea5_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l153_c3_0f02_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l153_c3_0f02_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l153_c3_0f02_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l153_c3_0f02_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l154_c3_f7c2_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l154_c3_f7c2_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l154_c3_f7c2_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l154_c3_f7c2_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n8 := n8;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l150_c9_9991_mul := resize(to_unsigned(2, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l150_c9_9991_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_MUX_uxn_opcodes_h_l151_c2_eea5_iftrue := to_unsigned(1, 1);
     VAR_put_stack_uxn_opcodes_h_l153_c3_0f02_offset := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l151_c2_eea5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_iftrue := to_unsigned(0, 1);
     VAR_put_stack_uxn_opcodes_h_l154_c3_f7c2_offset := resize(to_unsigned(1, 1), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_iffalse := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l149_c7_c939_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l150_c9_9991_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l148_c7_debc_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l150_c9_9991_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l150_c9_9991_k := VAR_k;
     VAR_n_register_uxn_opcodes_h_l149_c7_c939_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_h_l153_c3_0f02_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_h_l154_c3_f7c2_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l150_c9_9991_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l148_c7_debc_stack_index := VAR_stack_index;
     -- t_register[uxn_opcodes_h_l148_c7_debc] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l148_c7_debc_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l148_c7_debc_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l148_c7_debc_stack_index <= VAR_t_register_uxn_opcodes_h_l148_c7_debc_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l148_c7_debc_return_output := t_register_uxn_opcodes_h_l148_c7_debc_return_output;

     -- set[uxn_opcodes_h_l150_c9_9991] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l150_c9_9991_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l150_c9_9991_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l150_c9_9991_stack_index <= VAR_set_uxn_opcodes_h_l150_c9_9991_stack_index;
     set_uxn_opcodes_h_l150_c9_9991_ins <= VAR_set_uxn_opcodes_h_l150_c9_9991_ins;
     set_uxn_opcodes_h_l150_c9_9991_k <= VAR_set_uxn_opcodes_h_l150_c9_9991_k;
     set_uxn_opcodes_h_l150_c9_9991_mul <= VAR_set_uxn_opcodes_h_l150_c9_9991_mul;
     set_uxn_opcodes_h_l150_c9_9991_add <= VAR_set_uxn_opcodes_h_l150_c9_9991_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l150_c9_9991_return_output := set_uxn_opcodes_h_l150_c9_9991_return_output;

     -- n_register[uxn_opcodes_h_l149_c7_c939] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l149_c7_c939_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l149_c7_c939_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l149_c7_c939_stack_index <= VAR_n_register_uxn_opcodes_h_l149_c7_c939_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l149_c7_c939_return_output := n_register_uxn_opcodes_h_l149_c7_c939_return_output;

     -- Submodule level 1
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l149_c7_c939_return_output;
     VAR_put_stack_uxn_opcodes_h_l153_c3_0f02_value := VAR_n_register_uxn_opcodes_h_l149_c7_c939_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_left := VAR_set_uxn_opcodes_h_l150_c9_9991_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l150_c9_9991_return_output;
     VAR_put_stack_uxn_opcodes_h_l154_c3_f7c2_value := VAR_t_register_uxn_opcodes_h_l148_c7_debc_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l148_c7_debc_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l151_c6_7d4e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_left;
     BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_return_output := BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l151_c2_eea5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l151_c6_7d4e_return_output;
     -- result_MUX[uxn_opcodes_h_l151_c2_eea5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l151_c2_eea5_cond <= VAR_result_MUX_uxn_opcodes_h_l151_c2_eea5_cond;
     result_MUX_uxn_opcodes_h_l151_c2_eea5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l151_c2_eea5_iftrue;
     result_MUX_uxn_opcodes_h_l151_c2_eea5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l151_c2_eea5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l151_c2_eea5_return_output := result_MUX_uxn_opcodes_h_l151_c2_eea5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l152_c1_48af] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_return_output;

     -- Submodule level 3
     VAR_put_stack_uxn_opcodes_h_l153_c3_0f02_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_return_output;
     VAR_put_stack_uxn_opcodes_h_l154_c3_f7c2_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_48af_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l151_c2_eea5_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l151_c2_eea5_return_output;
     -- put_stack[uxn_opcodes_h_l153_c3_0f02] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l153_c3_0f02_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l153_c3_0f02_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l153_c3_0f02_stack_index <= VAR_put_stack_uxn_opcodes_h_l153_c3_0f02_stack_index;
     put_stack_uxn_opcodes_h_l153_c3_0f02_offset <= VAR_put_stack_uxn_opcodes_h_l153_c3_0f02_offset;
     put_stack_uxn_opcodes_h_l153_c3_0f02_value <= VAR_put_stack_uxn_opcodes_h_l153_c3_0f02_value;
     -- Outputs

     -- put_stack[uxn_opcodes_h_l154_c3_f7c2] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l154_c3_f7c2_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l154_c3_f7c2_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l154_c3_f7c2_stack_index <= VAR_put_stack_uxn_opcodes_h_l154_c3_f7c2_stack_index;
     put_stack_uxn_opcodes_h_l154_c3_f7c2_offset <= VAR_put_stack_uxn_opcodes_h_l154_c3_f7c2_offset;
     put_stack_uxn_opcodes_h_l154_c3_f7c2_value <= VAR_put_stack_uxn_opcodes_h_l154_c3_f7c2_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     n8 <= REG_COMB_n8;
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
