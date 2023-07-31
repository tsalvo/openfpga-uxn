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
entity opc_dup_0CLK_dd62d56e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_dup_0CLK_dd62d56e;
architecture arch of opc_dup_0CLK_dd62d56e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l214_c7_ff04]
signal t_register_uxn_opcodes_h_l214_c7_ff04_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l214_c7_ff04_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l214_c7_ff04_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l215_c9_207d]
signal set_uxn_opcodes_h_l215_c9_207d_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l215_c9_207d_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l215_c9_207d_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l215_c9_207d_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l215_c9_207d_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l215_c9_207d_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l215_c9_207d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l216_c6_31b8]
signal BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l217_c1_7c6b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l216_c2_8412]
signal result_MUX_uxn_opcodes_h_l216_c2_8412_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l216_c2_8412_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l216_c2_8412_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l216_c2_8412_return_output : unsigned(0 downto 0);

-- put_stack[uxn_opcodes_h_l218_c3_523d]
signal put_stack_uxn_opcodes_h_l218_c3_523d_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l218_c3_523d_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l218_c3_523d_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l218_c3_523d_value : unsigned(7 downto 0);

-- put_stack[uxn_opcodes_h_l219_c3_92f5]
signal put_stack_uxn_opcodes_h_l219_c3_92f5_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l219_c3_92f5_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l219_c3_92f5_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l219_c3_92f5_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l214_c7_ff04
t_register_uxn_opcodes_h_l214_c7_ff04 : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l214_c7_ff04_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l214_c7_ff04_stack_index,
t_register_uxn_opcodes_h_l214_c7_ff04_return_output);

-- set_uxn_opcodes_h_l215_c9_207d
set_uxn_opcodes_h_l215_c9_207d : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l215_c9_207d_CLOCK_ENABLE,
set_uxn_opcodes_h_l215_c9_207d_stack_index,
set_uxn_opcodes_h_l215_c9_207d_ins,
set_uxn_opcodes_h_l215_c9_207d_k,
set_uxn_opcodes_h_l215_c9_207d_mul,
set_uxn_opcodes_h_l215_c9_207d_add,
set_uxn_opcodes_h_l215_c9_207d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8
BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_left,
BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_right,
BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_return_output);

-- result_MUX_uxn_opcodes_h_l216_c2_8412
result_MUX_uxn_opcodes_h_l216_c2_8412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l216_c2_8412_cond,
result_MUX_uxn_opcodes_h_l216_c2_8412_iftrue,
result_MUX_uxn_opcodes_h_l216_c2_8412_iffalse,
result_MUX_uxn_opcodes_h_l216_c2_8412_return_output);

-- put_stack_uxn_opcodes_h_l218_c3_523d
put_stack_uxn_opcodes_h_l218_c3_523d : entity work.put_stack_0CLK_5f39ecad port map (
clk,
put_stack_uxn_opcodes_h_l218_c3_523d_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l218_c3_523d_stack_index,
put_stack_uxn_opcodes_h_l218_c3_523d_offset,
put_stack_uxn_opcodes_h_l218_c3_523d_value);

-- put_stack_uxn_opcodes_h_l219_c3_92f5
put_stack_uxn_opcodes_h_l219_c3_92f5 : entity work.put_stack_0CLK_5f39ecad port map (
clk,
put_stack_uxn_opcodes_h_l219_c3_92f5_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l219_c3_92f5_stack_index,
put_stack_uxn_opcodes_h_l219_c3_92f5_offset,
put_stack_uxn_opcodes_h_l219_c3_92f5_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l214_c7_ff04_return_output,
 set_uxn_opcodes_h_l215_c9_207d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_return_output,
 result_MUX_uxn_opcodes_h_l216_c2_8412_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l214_c7_ff04_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l214_c7_ff04_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l214_c7_ff04_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l215_c9_207d_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l215_c9_207d_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l215_c9_207d_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l215_c9_207d_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l215_c9_207d_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l215_c9_207d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l215_c9_207d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l216_c2_8412_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l216_c2_8412_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l216_c2_8412_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l216_c2_8412_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l218_c3_523d_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l218_c3_523d_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l218_c3_523d_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l218_c3_523d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l219_c3_92f5_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l219_c3_92f5_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l219_c3_92f5_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l219_c3_92f5_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_put_stack_uxn_opcodes_h_l219_c3_92f5_offset := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l215_c9_207d_add := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_MUX_uxn_opcodes_h_l216_c2_8412_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l216_c2_8412_iffalse := to_unsigned(0, 1);
     VAR_put_stack_uxn_opcodes_h_l218_c3_523d_offset := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l215_c9_207d_mul := resize(to_unsigned(1, 1), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l215_c9_207d_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l214_c7_ff04_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l215_c9_207d_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l215_c9_207d_k := VAR_k;
     VAR_put_stack_uxn_opcodes_h_l218_c3_523d_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_h_l219_c3_92f5_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l215_c9_207d_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l214_c7_ff04_stack_index := VAR_stack_index;
     -- t_register[uxn_opcodes_h_l214_c7_ff04] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l214_c7_ff04_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l214_c7_ff04_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l214_c7_ff04_stack_index <= VAR_t_register_uxn_opcodes_h_l214_c7_ff04_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l214_c7_ff04_return_output := t_register_uxn_opcodes_h_l214_c7_ff04_return_output;

     -- set[uxn_opcodes_h_l215_c9_207d] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l215_c9_207d_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l215_c9_207d_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l215_c9_207d_stack_index <= VAR_set_uxn_opcodes_h_l215_c9_207d_stack_index;
     set_uxn_opcodes_h_l215_c9_207d_ins <= VAR_set_uxn_opcodes_h_l215_c9_207d_ins;
     set_uxn_opcodes_h_l215_c9_207d_k <= VAR_set_uxn_opcodes_h_l215_c9_207d_k;
     set_uxn_opcodes_h_l215_c9_207d_mul <= VAR_set_uxn_opcodes_h_l215_c9_207d_mul;
     set_uxn_opcodes_h_l215_c9_207d_add <= VAR_set_uxn_opcodes_h_l215_c9_207d_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l215_c9_207d_return_output := set_uxn_opcodes_h_l215_c9_207d_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_left := VAR_set_uxn_opcodes_h_l215_c9_207d_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l215_c9_207d_return_output;
     VAR_put_stack_uxn_opcodes_h_l218_c3_523d_value := VAR_t_register_uxn_opcodes_h_l214_c7_ff04_return_output;
     VAR_put_stack_uxn_opcodes_h_l219_c3_92f5_value := VAR_t_register_uxn_opcodes_h_l214_c7_ff04_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l214_c7_ff04_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l216_c6_31b8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_left;
     BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_return_output := BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l216_c2_8412_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_31b8_return_output;
     -- result_MUX[uxn_opcodes_h_l216_c2_8412] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l216_c2_8412_cond <= VAR_result_MUX_uxn_opcodes_h_l216_c2_8412_cond;
     result_MUX_uxn_opcodes_h_l216_c2_8412_iftrue <= VAR_result_MUX_uxn_opcodes_h_l216_c2_8412_iftrue;
     result_MUX_uxn_opcodes_h_l216_c2_8412_iffalse <= VAR_result_MUX_uxn_opcodes_h_l216_c2_8412_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l216_c2_8412_return_output := result_MUX_uxn_opcodes_h_l216_c2_8412_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l217_c1_7c6b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_return_output;

     -- Submodule level 3
     VAR_put_stack_uxn_opcodes_h_l218_c3_523d_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_return_output;
     VAR_put_stack_uxn_opcodes_h_l219_c3_92f5_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_7c6b_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l216_c2_8412_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l216_c2_8412_return_output;
     -- put_stack[uxn_opcodes_h_l219_c3_92f5] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l219_c3_92f5_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l219_c3_92f5_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l219_c3_92f5_stack_index <= VAR_put_stack_uxn_opcodes_h_l219_c3_92f5_stack_index;
     put_stack_uxn_opcodes_h_l219_c3_92f5_offset <= VAR_put_stack_uxn_opcodes_h_l219_c3_92f5_offset;
     put_stack_uxn_opcodes_h_l219_c3_92f5_value <= VAR_put_stack_uxn_opcodes_h_l219_c3_92f5_value;
     -- Outputs

     -- put_stack[uxn_opcodes_h_l218_c3_523d] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l218_c3_523d_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l218_c3_523d_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l218_c3_523d_stack_index <= VAR_put_stack_uxn_opcodes_h_l218_c3_523d_stack_index;
     put_stack_uxn_opcodes_h_l218_c3_523d_offset <= VAR_put_stack_uxn_opcodes_h_l218_c3_523d_offset;
     put_stack_uxn_opcodes_h_l218_c3_523d_value <= VAR_put_stack_uxn_opcodes_h_l218_c3_523d_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;