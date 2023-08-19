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
entity opc_ldz_0CLK_03fba68a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_ldz_0CLK_03fba68a;
architecture arch of opc_ldz_0CLK_03fba68a is
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
-- t_register[uxn_opcodes_h_l513_c7_0e76]
signal t_register_uxn_opcodes_h_l513_c7_0e76_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l513_c7_0e76_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l513_c7_0e76_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l515_c9_27cc]
signal set_uxn_opcodes_h_l515_c9_27cc_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l515_c9_27cc_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l515_c9_27cc_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l515_c9_27cc_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l515_c9_27cc_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l515_c9_27cc_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l515_c9_27cc_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l516_c6_d92f]
signal BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_27ba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l516_c2_447f]
signal result_MUX_uxn_opcodes_h_l516_c2_447f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l516_c2_447f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l516_c2_447f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l516_c2_447f_return_output : unsigned(0 downto 0);

-- peek_ram[uxn_opcodes_h_l518_c29_422f]
signal peek_ram_uxn_opcodes_h_l518_c29_422f_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_opcodes_h_l518_c29_422f_address : unsigned(15 downto 0);
signal peek_ram_uxn_opcodes_h_l518_c29_422f_return_output : unsigned(7 downto 0);

-- put_stack[uxn_opcodes_h_l518_c3_9144]
signal put_stack_uxn_opcodes_h_l518_c3_9144_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l518_c3_9144_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l518_c3_9144_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l518_c3_9144_value : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l513_c7_0e76
t_register_uxn_opcodes_h_l513_c7_0e76 : entity work.t_register_0CLK_0e5af5c0 port map (
clk,
t_register_uxn_opcodes_h_l513_c7_0e76_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l513_c7_0e76_stack_index,
t_register_uxn_opcodes_h_l513_c7_0e76_return_output);

-- set_uxn_opcodes_h_l515_c9_27cc
set_uxn_opcodes_h_l515_c9_27cc : entity work.set_0CLK_e105ce74 port map (
clk,
set_uxn_opcodes_h_l515_c9_27cc_CLOCK_ENABLE,
set_uxn_opcodes_h_l515_c9_27cc_stack_index,
set_uxn_opcodes_h_l515_c9_27cc_ins,
set_uxn_opcodes_h_l515_c9_27cc_k,
set_uxn_opcodes_h_l515_c9_27cc_mul,
set_uxn_opcodes_h_l515_c9_27cc_add,
set_uxn_opcodes_h_l515_c9_27cc_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f
BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_left,
BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_right,
BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_return_output);

-- result_MUX_uxn_opcodes_h_l516_c2_447f
result_MUX_uxn_opcodes_h_l516_c2_447f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l516_c2_447f_cond,
result_MUX_uxn_opcodes_h_l516_c2_447f_iftrue,
result_MUX_uxn_opcodes_h_l516_c2_447f_iffalse,
result_MUX_uxn_opcodes_h_l516_c2_447f_return_output);

-- peek_ram_uxn_opcodes_h_l518_c29_422f
peek_ram_uxn_opcodes_h_l518_c29_422f : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_opcodes_h_l518_c29_422f_CLOCK_ENABLE,
peek_ram_uxn_opcodes_h_l518_c29_422f_address,
peek_ram_uxn_opcodes_h_l518_c29_422f_return_output);

-- put_stack_uxn_opcodes_h_l518_c3_9144
put_stack_uxn_opcodes_h_l518_c3_9144 : entity work.put_stack_0CLK_e3ba3c7d port map (
clk,
put_stack_uxn_opcodes_h_l518_c3_9144_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l518_c3_9144_stack_index,
put_stack_uxn_opcodes_h_l518_c3_9144_offset,
put_stack_uxn_opcodes_h_l518_c3_9144_value);



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
 t_register_uxn_opcodes_h_l513_c7_0e76_return_output,
 set_uxn_opcodes_h_l515_c9_27cc_return_output,
 BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_return_output,
 result_MUX_uxn_opcodes_h_l516_c2_447f_return_output,
 peek_ram_uxn_opcodes_h_l518_c29_422f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l513_c7_0e76_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l513_c7_0e76_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l513_c7_0e76_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l514_c8_fac3_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l515_c9_27cc_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l515_c9_27cc_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l515_c9_27cc_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l515_c9_27cc_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l515_c9_27cc_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l515_c9_27cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l515_c9_27cc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l516_c2_447f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l516_c2_447f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l516_c2_447f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l516_c2_447f_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l518_c3_9144_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l518_c3_9144_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l518_c3_9144_value : unsigned(7 downto 0);
 variable VAR_peek_ram_uxn_opcodes_h_l518_c29_422f_address : unsigned(15 downto 0);
 variable VAR_peek_ram_uxn_opcodes_h_l518_c29_422f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_opcodes_h_l518_c29_422f_return_output : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l518_c3_9144_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_h_l516_c2_447f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l515_c9_27cc_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_put_stack_uxn_opcodes_h_l518_c3_9144_offset := resize(to_unsigned(0, 1), 8);
     VAR_set_uxn_opcodes_h_l515_c9_27cc_mul := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l516_c2_447f_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l515_c9_27cc_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l513_c7_0e76_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l515_c9_27cc_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l515_c9_27cc_k := VAR_k;
     VAR_put_stack_uxn_opcodes_h_l518_c3_9144_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l515_c9_27cc_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l513_c7_0e76_stack_index := VAR_stack_index;
     -- t_register[uxn_opcodes_h_l513_c7_0e76] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l513_c7_0e76_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l513_c7_0e76_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l513_c7_0e76_stack_index <= VAR_t_register_uxn_opcodes_h_l513_c7_0e76_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l513_c7_0e76_return_output := t_register_uxn_opcodes_h_l513_c7_0e76_return_output;

     -- set[uxn_opcodes_h_l515_c9_27cc] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l515_c9_27cc_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l515_c9_27cc_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l515_c9_27cc_stack_index <= VAR_set_uxn_opcodes_h_l515_c9_27cc_stack_index;
     set_uxn_opcodes_h_l515_c9_27cc_ins <= VAR_set_uxn_opcodes_h_l515_c9_27cc_ins;
     set_uxn_opcodes_h_l515_c9_27cc_k <= VAR_set_uxn_opcodes_h_l515_c9_27cc_k;
     set_uxn_opcodes_h_l515_c9_27cc_mul <= VAR_set_uxn_opcodes_h_l515_c9_27cc_mul;
     set_uxn_opcodes_h_l515_c9_27cc_add <= VAR_set_uxn_opcodes_h_l515_c9_27cc_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l515_c9_27cc_return_output := set_uxn_opcodes_h_l515_c9_27cc_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_left := VAR_set_uxn_opcodes_h_l515_c9_27cc_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l515_c9_27cc_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l513_c7_0e76_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l516_c6_d92f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_left;
     BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_return_output := BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l514_c8_fac3] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l514_c8_fac3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l513_c7_0e76_return_output);

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l516_c2_447f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_d92f_return_output;
     VAR_peek_ram_uxn_opcodes_h_l518_c29_422f_address := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l514_c8_fac3_return_output;
     REG_VAR_t16 := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l514_c8_fac3_return_output;
     -- result_MUX[uxn_opcodes_h_l516_c2_447f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l516_c2_447f_cond <= VAR_result_MUX_uxn_opcodes_h_l516_c2_447f_cond;
     result_MUX_uxn_opcodes_h_l516_c2_447f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l516_c2_447f_iftrue;
     result_MUX_uxn_opcodes_h_l516_c2_447f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l516_c2_447f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l516_c2_447f_return_output := result_MUX_uxn_opcodes_h_l516_c2_447f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_27ba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_return_output;

     -- Submodule level 3
     VAR_peek_ram_uxn_opcodes_h_l518_c29_422f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_return_output;
     VAR_put_stack_uxn_opcodes_h_l518_c3_9144_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_27ba_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l516_c2_447f_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l516_c2_447f_return_output;
     -- peek_ram[uxn_opcodes_h_l518_c29_422f] LATENCY=0
     -- Clock enable
     peek_ram_uxn_opcodes_h_l518_c29_422f_CLOCK_ENABLE <= VAR_peek_ram_uxn_opcodes_h_l518_c29_422f_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_opcodes_h_l518_c29_422f_address <= VAR_peek_ram_uxn_opcodes_h_l518_c29_422f_address;
     -- Outputs
     VAR_peek_ram_uxn_opcodes_h_l518_c29_422f_return_output := peek_ram_uxn_opcodes_h_l518_c29_422f_return_output;

     -- Submodule level 4
     VAR_put_stack_uxn_opcodes_h_l518_c3_9144_value := VAR_peek_ram_uxn_opcodes_h_l518_c29_422f_return_output;
     -- put_stack[uxn_opcodes_h_l518_c3_9144] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l518_c3_9144_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l518_c3_9144_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l518_c3_9144_stack_index <= VAR_put_stack_uxn_opcodes_h_l518_c3_9144_stack_index;
     put_stack_uxn_opcodes_h_l518_c3_9144_offset <= VAR_put_stack_uxn_opcodes_h_l518_c3_9144_offset;
     put_stack_uxn_opcodes_h_l518_c3_9144_value <= VAR_put_stack_uxn_opcodes_h_l518_c3_9144_value;
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
