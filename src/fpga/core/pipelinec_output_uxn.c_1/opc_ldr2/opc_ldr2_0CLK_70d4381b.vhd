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
entity opc_ldr2_0CLK_70d4381b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_ldr2_0CLK_70d4381b;
architecture arch of opc_ldr2_0CLK_70d4381b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l590_c7_a932]
signal t_register_uxn_opcodes_h_l590_c7_a932_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l590_c7_a932_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l590_c7_a932_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l591_c9_9212]
signal set_uxn_opcodes_h_l591_c9_9212_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l591_c9_9212_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l591_c9_9212_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l591_c9_9212_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l591_c9_9212_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l591_c9_9212_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l591_c9_9212_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l592_c6_10d0]
signal BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l593_c1_2c16]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l592_c2_95c3]
signal result_MUX_uxn_opcodes_h_l592_c2_95c3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l592_c2_95c3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l592_c2_95c3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l592_c2_95c3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l592_c2_95c3]
signal t16_MUX_uxn_opcodes_h_l592_c2_95c3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l592_c2_95c3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l592_c2_95c3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l592_c2_95c3_return_output : unsigned(15 downto 0);

-- pc_get[uxn_opcodes_h_l594_c9_cb1d]
signal pc_get_uxn_opcodes_h_l594_c9_cb1d_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l594_c9_cb1d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l594_c9_7eb6]
signal BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_return_output : signed(17 downto 0);

-- peek2_ram[uxn_opcodes_h_l595_c30_7374]
signal peek2_ram_uxn_opcodes_h_l595_c30_7374_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_h_l595_c30_7374_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_h_l595_c30_7374_return_output : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l595_c3_2bce]
signal put2_stack_uxn_opcodes_h_l595_c3_2bce_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l595_c3_2bce_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l595_c3_2bce_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l595_c3_2bce_value : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l590_c7_a932
t_register_uxn_opcodes_h_l590_c7_a932 : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l590_c7_a932_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l590_c7_a932_stack_index,
t_register_uxn_opcodes_h_l590_c7_a932_return_output);

-- set_uxn_opcodes_h_l591_c9_9212
set_uxn_opcodes_h_l591_c9_9212 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l591_c9_9212_CLOCK_ENABLE,
set_uxn_opcodes_h_l591_c9_9212_stack_index,
set_uxn_opcodes_h_l591_c9_9212_ins,
set_uxn_opcodes_h_l591_c9_9212_k,
set_uxn_opcodes_h_l591_c9_9212_mul,
set_uxn_opcodes_h_l591_c9_9212_add,
set_uxn_opcodes_h_l591_c9_9212_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0
BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_left,
BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_right,
BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_return_output);

-- result_MUX_uxn_opcodes_h_l592_c2_95c3
result_MUX_uxn_opcodes_h_l592_c2_95c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l592_c2_95c3_cond,
result_MUX_uxn_opcodes_h_l592_c2_95c3_iftrue,
result_MUX_uxn_opcodes_h_l592_c2_95c3_iffalse,
result_MUX_uxn_opcodes_h_l592_c2_95c3_return_output);

-- t16_MUX_uxn_opcodes_h_l592_c2_95c3
t16_MUX_uxn_opcodes_h_l592_c2_95c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l592_c2_95c3_cond,
t16_MUX_uxn_opcodes_h_l592_c2_95c3_iftrue,
t16_MUX_uxn_opcodes_h_l592_c2_95c3_iffalse,
t16_MUX_uxn_opcodes_h_l592_c2_95c3_return_output);

-- pc_get_uxn_opcodes_h_l594_c9_cb1d
pc_get_uxn_opcodes_h_l594_c9_cb1d : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l594_c9_cb1d_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l594_c9_cb1d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6
BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_left,
BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_right,
BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_return_output);

-- peek2_ram_uxn_opcodes_h_l595_c30_7374
peek2_ram_uxn_opcodes_h_l595_c30_7374 : entity work.peek2_ram_0CLK_ad162598 port map (
clk,
peek2_ram_uxn_opcodes_h_l595_c30_7374_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_h_l595_c30_7374_address,
peek2_ram_uxn_opcodes_h_l595_c30_7374_return_output);

-- put2_stack_uxn_opcodes_h_l595_c3_2bce
put2_stack_uxn_opcodes_h_l595_c3_2bce : entity work.put2_stack_0CLK_52228af0 port map (
clk,
put2_stack_uxn_opcodes_h_l595_c3_2bce_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l595_c3_2bce_stack_index,
put2_stack_uxn_opcodes_h_l595_c3_2bce_offset,
put2_stack_uxn_opcodes_h_l595_c3_2bce_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t16,
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l590_c7_a932_return_output,
 set_uxn_opcodes_h_l591_c9_9212_return_output,
 BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_return_output,
 result_MUX_uxn_opcodes_h_l592_c2_95c3_return_output,
 t16_MUX_uxn_opcodes_h_l592_c2_95c3_return_output,
 pc_get_uxn_opcodes_h_l594_c9_cb1d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_return_output,
 peek2_ram_uxn_opcodes_h_l595_c30_7374_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l590_c7_a932_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l590_c7_a932_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l590_c7_a932_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l591_c9_9212_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l591_c9_9212_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l591_c9_9212_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l591_c9_9212_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l591_c9_9212_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l591_c9_9212_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l591_c9_9212_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l592_c2_95c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l592_c2_95c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l592_c2_95c3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l592_c2_95c3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l592_c2_95c3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l592_c2_95c3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_uxn_opcodes_h_l594_c3_ab15 : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l592_c2_95c3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l592_c2_95c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_left : signed(16 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l594_c9_cb1d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l594_c9_cb1d_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l594_c21_ad1e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_return_output : signed(17 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l595_c3_2bce_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l595_c3_2bce_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l595_c3_2bce_value : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l595_c30_7374_address : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l595_c30_7374_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l595_c30_7374_return_output : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l595_c3_2bce_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l591_c9_9212_mul := resize(to_unsigned(1, 1), 8);
     VAR_put2_stack_uxn_opcodes_h_l595_c3_2bce_offset := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l591_c9_9212_add := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_MUX_uxn_opcodes_h_l592_c2_95c3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l592_c2_95c3_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l591_c9_9212_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l590_c7_a932_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l591_c9_9212_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l591_c9_9212_k := VAR_k;
     VAR_put2_stack_uxn_opcodes_h_l595_c3_2bce_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l591_c9_9212_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l590_c7_a932_stack_index := VAR_stack_index;
     VAR_t16_MUX_uxn_opcodes_h_l592_c2_95c3_iftrue := t16;
     -- set[uxn_opcodes_h_l591_c9_9212] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l591_c9_9212_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l591_c9_9212_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l591_c9_9212_stack_index <= VAR_set_uxn_opcodes_h_l591_c9_9212_stack_index;
     set_uxn_opcodes_h_l591_c9_9212_ins <= VAR_set_uxn_opcodes_h_l591_c9_9212_ins;
     set_uxn_opcodes_h_l591_c9_9212_k <= VAR_set_uxn_opcodes_h_l591_c9_9212_k;
     set_uxn_opcodes_h_l591_c9_9212_mul <= VAR_set_uxn_opcodes_h_l591_c9_9212_mul;
     set_uxn_opcodes_h_l591_c9_9212_add <= VAR_set_uxn_opcodes_h_l591_c9_9212_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l591_c9_9212_return_output := set_uxn_opcodes_h_l591_c9_9212_return_output;

     -- t_register[uxn_opcodes_h_l590_c7_a932] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l590_c7_a932_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l590_c7_a932_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l590_c7_a932_stack_index <= VAR_t_register_uxn_opcodes_h_l590_c7_a932_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l590_c7_a932_return_output := t_register_uxn_opcodes_h_l590_c7_a932_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_left := VAR_set_uxn_opcodes_h_l591_c9_9212_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l591_c9_9212_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l590_c7_a932_return_output;
     -- CAST_TO_int8_t[uxn_opcodes_h_l594_c21_ad1e] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l594_c21_ad1e_return_output := CAST_TO_int8_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l590_c7_a932_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l592_c6_10d0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_left;
     BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_return_output := BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l592_c2_95c3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l592_c2_95c3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l592_c6_10d0_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l594_c21_ad1e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l593_c1_2c16] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_return_output;

     -- result_MUX[uxn_opcodes_h_l592_c2_95c3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l592_c2_95c3_cond <= VAR_result_MUX_uxn_opcodes_h_l592_c2_95c3_cond;
     result_MUX_uxn_opcodes_h_l592_c2_95c3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l592_c2_95c3_iftrue;
     result_MUX_uxn_opcodes_h_l592_c2_95c3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l592_c2_95c3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l592_c2_95c3_return_output := result_MUX_uxn_opcodes_h_l592_c2_95c3_return_output;

     -- Submodule level 3
     VAR_pc_get_uxn_opcodes_h_l594_c9_cb1d_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_return_output;
     VAR_peek2_ram_uxn_opcodes_h_l595_c30_7374_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_return_output;
     VAR_put2_stack_uxn_opcodes_h_l595_c3_2bce_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_2c16_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l592_c2_95c3_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l592_c2_95c3_return_output;
     -- pc_get[uxn_opcodes_h_l594_c9_cb1d] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l594_c9_cb1d_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l594_c9_cb1d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l594_c9_cb1d_return_output := pc_get_uxn_opcodes_h_l594_c9_cb1d_return_output;

     -- Submodule level 4
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_left := signed(std_logic_vector(resize(VAR_pc_get_uxn_opcodes_h_l594_c9_cb1d_return_output, 17)));
     -- BIN_OP_PLUS[uxn_opcodes_h_l594_c9_7eb6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_return_output;

     -- Submodule level 5
     VAR_t16_uxn_opcodes_h_l594_c3_ab15 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l594_c9_7eb6_return_output)),16);
     VAR_peek2_ram_uxn_opcodes_h_l595_c30_7374_address := VAR_t16_uxn_opcodes_h_l594_c3_ab15;
     VAR_t16_MUX_uxn_opcodes_h_l592_c2_95c3_iffalse := VAR_t16_uxn_opcodes_h_l594_c3_ab15;
     -- peek2_ram[uxn_opcodes_h_l595_c30_7374] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_h_l595_c30_7374_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_h_l595_c30_7374_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_h_l595_c30_7374_address <= VAR_peek2_ram_uxn_opcodes_h_l595_c30_7374_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_h_l595_c30_7374_return_output := peek2_ram_uxn_opcodes_h_l595_c30_7374_return_output;

     -- t16_MUX[uxn_opcodes_h_l592_c2_95c3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l592_c2_95c3_cond <= VAR_t16_MUX_uxn_opcodes_h_l592_c2_95c3_cond;
     t16_MUX_uxn_opcodes_h_l592_c2_95c3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l592_c2_95c3_iftrue;
     t16_MUX_uxn_opcodes_h_l592_c2_95c3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l592_c2_95c3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l592_c2_95c3_return_output := t16_MUX_uxn_opcodes_h_l592_c2_95c3_return_output;

     -- Submodule level 6
     VAR_put2_stack_uxn_opcodes_h_l595_c3_2bce_value := VAR_peek2_ram_uxn_opcodes_h_l595_c30_7374_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l592_c2_95c3_return_output;
     -- put2_stack[uxn_opcodes_h_l595_c3_2bce] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l595_c3_2bce_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l595_c3_2bce_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l595_c3_2bce_stack_index <= VAR_put2_stack_uxn_opcodes_h_l595_c3_2bce_stack_index;
     put2_stack_uxn_opcodes_h_l595_c3_2bce_offset <= VAR_put2_stack_uxn_opcodes_h_l595_c3_2bce_offset;
     put2_stack_uxn_opcodes_h_l595_c3_2bce_value <= VAR_put2_stack_uxn_opcodes_h_l595_c3_2bce_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
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
     t16 <= REG_COMB_t16;
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
