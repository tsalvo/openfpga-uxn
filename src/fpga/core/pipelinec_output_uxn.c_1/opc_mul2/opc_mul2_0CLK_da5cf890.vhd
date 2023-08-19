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
entity opc_mul2_0CLK_da5cf890 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_mul2_0CLK_da5cf890;
architecture arch of opc_mul2_0CLK_da5cf890 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t2_register[uxn_opcodes_h_l824_c8_c4c3]
signal t2_register_uxn_opcodes_h_l824_c8_c4c3_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l824_c8_c4c3_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l824_c8_c4c3_return_output : unsigned(15 downto 0);

-- n2_register[uxn_opcodes_h_l825_c8_256b]
signal n2_register_uxn_opcodes_h_l825_c8_256b_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l825_c8_256b_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l825_c8_256b_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l826_c9_98b5]
signal set_uxn_opcodes_h_l826_c9_98b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l826_c9_98b5_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l826_c9_98b5_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l826_c9_98b5_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l826_c9_98b5_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l826_c9_98b5_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l826_c9_98b5_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l827_c6_46cd]
signal BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l828_c1_efa2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l827_c2_0c20]
signal result_MUX_uxn_opcodes_h_l827_c2_0c20_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l827_c2_0c20_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l827_c2_0c20_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l827_c2_0c20_return_output : unsigned(0 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l829_c30_d14f]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_return_output : unsigned(31 downto 0);

-- put2_stack[uxn_opcodes_h_l829_c3_a730]
signal put2_stack_uxn_opcodes_h_l829_c3_a730_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l829_c3_a730_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l829_c3_a730_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l829_c3_a730_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l824_c8_c4c3
t2_register_uxn_opcodes_h_l824_c8_c4c3 : entity work.t2_register_0CLK_efc3e079 port map (
clk,
t2_register_uxn_opcodes_h_l824_c8_c4c3_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l824_c8_c4c3_stack_index,
t2_register_uxn_opcodes_h_l824_c8_c4c3_return_output);

-- n2_register_uxn_opcodes_h_l825_c8_256b
n2_register_uxn_opcodes_h_l825_c8_256b : entity work.n2_register_0CLK_efc3e079 port map (
clk,
n2_register_uxn_opcodes_h_l825_c8_256b_CLOCK_ENABLE,
n2_register_uxn_opcodes_h_l825_c8_256b_stack_index,
n2_register_uxn_opcodes_h_l825_c8_256b_return_output);

-- set_uxn_opcodes_h_l826_c9_98b5
set_uxn_opcodes_h_l826_c9_98b5 : entity work.set_0CLK_e105ce74 port map (
clk,
set_uxn_opcodes_h_l826_c9_98b5_CLOCK_ENABLE,
set_uxn_opcodes_h_l826_c9_98b5_stack_index,
set_uxn_opcodes_h_l826_c9_98b5_ins,
set_uxn_opcodes_h_l826_c9_98b5_k,
set_uxn_opcodes_h_l826_c9_98b5_mul,
set_uxn_opcodes_h_l826_c9_98b5_add,
set_uxn_opcodes_h_l826_c9_98b5_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd
BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_left,
BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_right,
BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_return_output);

-- result_MUX_uxn_opcodes_h_l827_c2_0c20
result_MUX_uxn_opcodes_h_l827_c2_0c20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l827_c2_0c20_cond,
result_MUX_uxn_opcodes_h_l827_c2_0c20_iftrue,
result_MUX_uxn_opcodes_h_l827_c2_0c20_iffalse,
result_MUX_uxn_opcodes_h_l827_c2_0c20_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_return_output);

-- put2_stack_uxn_opcodes_h_l829_c3_a730
put2_stack_uxn_opcodes_h_l829_c3_a730 : entity work.put2_stack_0CLK_13efd604 port map (
clk,
put2_stack_uxn_opcodes_h_l829_c3_a730_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l829_c3_a730_stack_index,
put2_stack_uxn_opcodes_h_l829_c3_a730_offset,
put2_stack_uxn_opcodes_h_l829_c3_a730_value);



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
 tmp8,
 result,
 -- All submodule outputs
 t2_register_uxn_opcodes_h_l824_c8_c4c3_return_output,
 n2_register_uxn_opcodes_h_l825_c8_256b_return_output,
 set_uxn_opcodes_h_l826_c9_98b5_return_output,
 BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_return_output,
 result_MUX_uxn_opcodes_h_l827_c2_0c20_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l824_c8_c4c3_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l824_c8_c4c3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l824_c8_c4c3_return_output : unsigned(15 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l825_c8_256b_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l825_c8_256b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l825_c8_256b_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l826_c9_98b5_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l826_c9_98b5_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l826_c9_98b5_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l826_c9_98b5_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l826_c9_98b5_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l826_c9_98b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l826_c9_98b5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l827_c2_0c20_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l827_c2_0c20_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l827_c2_0c20_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l827_c2_0c20_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l829_c3_a730_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l829_c3_a730_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l829_c3_a730_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_return_output : unsigned(31 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l829_c3_a730_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n16 := n16;
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l826_c9_98b5_mul := resize(to_unsigned(4, 3), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_iftrue := to_unsigned(0, 1);
     VAR_put2_stack_uxn_opcodes_h_l829_c3_a730_offset := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l827_c2_0c20_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l826_c9_98b5_add := resize(to_signed(-2, 3), 8);
     VAR_result_MUX_uxn_opcodes_h_l827_c2_0c20_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_iffalse := VAR_CLOCK_ENABLE;
     VAR_n2_register_uxn_opcodes_h_l825_c8_256b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l826_c9_98b5_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l824_c8_c4c3_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l826_c9_98b5_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l826_c9_98b5_k := VAR_k;
     VAR_n2_register_uxn_opcodes_h_l825_c8_256b_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l829_c3_a730_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l826_c9_98b5_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l824_c8_c4c3_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l826_c9_98b5] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l826_c9_98b5_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l826_c9_98b5_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l826_c9_98b5_stack_index <= VAR_set_uxn_opcodes_h_l826_c9_98b5_stack_index;
     set_uxn_opcodes_h_l826_c9_98b5_ins <= VAR_set_uxn_opcodes_h_l826_c9_98b5_ins;
     set_uxn_opcodes_h_l826_c9_98b5_k <= VAR_set_uxn_opcodes_h_l826_c9_98b5_k;
     set_uxn_opcodes_h_l826_c9_98b5_mul <= VAR_set_uxn_opcodes_h_l826_c9_98b5_mul;
     set_uxn_opcodes_h_l826_c9_98b5_add <= VAR_set_uxn_opcodes_h_l826_c9_98b5_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l826_c9_98b5_return_output := set_uxn_opcodes_h_l826_c9_98b5_return_output;

     -- t2_register[uxn_opcodes_h_l824_c8_c4c3] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l824_c8_c4c3_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l824_c8_c4c3_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l824_c8_c4c3_stack_index <= VAR_t2_register_uxn_opcodes_h_l824_c8_c4c3_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l824_c8_c4c3_return_output := t2_register_uxn_opcodes_h_l824_c8_c4c3_return_output;

     -- n2_register[uxn_opcodes_h_l825_c8_256b] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_h_l825_c8_256b_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_h_l825_c8_256b_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_h_l825_c8_256b_stack_index <= VAR_n2_register_uxn_opcodes_h_l825_c8_256b_stack_index;
     -- Outputs
     VAR_n2_register_uxn_opcodes_h_l825_c8_256b_return_output := n2_register_uxn_opcodes_h_l825_c8_256b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_left := VAR_n2_register_uxn_opcodes_h_l825_c8_256b_return_output;
     REG_VAR_n16 := VAR_n2_register_uxn_opcodes_h_l825_c8_256b_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_left := VAR_set_uxn_opcodes_h_l826_c9_98b5_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l826_c9_98b5_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_right := VAR_t2_register_uxn_opcodes_h_l824_c8_c4c3_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l824_c8_c4c3_return_output;
     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l829_c30_d14f] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l827_c6_46cd] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_left;
     BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_return_output := BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l827_c2_0c20_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l827_c6_46cd_return_output;
     VAR_put2_stack_uxn_opcodes_h_l829_c3_a730_value := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l829_c30_d14f_return_output, 16);
     -- result_MUX[uxn_opcodes_h_l827_c2_0c20] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l827_c2_0c20_cond <= VAR_result_MUX_uxn_opcodes_h_l827_c2_0c20_cond;
     result_MUX_uxn_opcodes_h_l827_c2_0c20_iftrue <= VAR_result_MUX_uxn_opcodes_h_l827_c2_0c20_iftrue;
     result_MUX_uxn_opcodes_h_l827_c2_0c20_iffalse <= VAR_result_MUX_uxn_opcodes_h_l827_c2_0c20_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l827_c2_0c20_return_output := result_MUX_uxn_opcodes_h_l827_c2_0c20_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l828_c1_efa2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_return_output;

     -- Submodule level 3
     VAR_put2_stack_uxn_opcodes_h_l829_c3_a730_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l828_c1_efa2_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l827_c2_0c20_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l827_c2_0c20_return_output;
     -- put2_stack[uxn_opcodes_h_l829_c3_a730] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l829_c3_a730_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l829_c3_a730_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l829_c3_a730_stack_index <= VAR_put2_stack_uxn_opcodes_h_l829_c3_a730_stack_index;
     put2_stack_uxn_opcodes_h_l829_c3_a730_offset <= VAR_put2_stack_uxn_opcodes_h_l829_c3_a730_offset;
     put2_stack_uxn_opcodes_h_l829_c3_a730_value <= VAR_put2_stack_uxn_opcodes_h_l829_c3_a730_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_t16 <= REG_VAR_t16;
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
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
