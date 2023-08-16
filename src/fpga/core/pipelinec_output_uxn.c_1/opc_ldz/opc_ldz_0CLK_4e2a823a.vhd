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
entity opc_ldz_0CLK_4e2a823a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_ldz_0CLK_4e2a823a;
architecture arch of opc_ldz_0CLK_4e2a823a is
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
-- t_register[uxn_opcodes_h_l513_c7_c329]
signal t_register_uxn_opcodes_h_l513_c7_c329_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l513_c7_c329_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l513_c7_c329_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l515_c9_bd3c]
signal set_uxn_opcodes_h_l515_c9_bd3c_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l515_c9_bd3c_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l515_c9_bd3c_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l515_c9_bd3c_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l515_c9_bd3c_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l515_c9_bd3c_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l515_c9_bd3c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l516_c6_a89c]
signal BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_389a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l516_c2_dadf]
signal result_MUX_uxn_opcodes_h_l516_c2_dadf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l516_c2_dadf_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l516_c2_dadf_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l516_c2_dadf_return_output : unsigned(0 downto 0);

-- peek_ram[uxn_opcodes_h_l518_c29_de8d]
signal peek_ram_uxn_opcodes_h_l518_c29_de8d_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_opcodes_h_l518_c29_de8d_address : unsigned(15 downto 0);
signal peek_ram_uxn_opcodes_h_l518_c29_de8d_return_output : unsigned(7 downto 0);

-- put_stack[uxn_opcodes_h_l518_c3_608f]
signal put_stack_uxn_opcodes_h_l518_c3_608f_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l518_c3_608f_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l518_c3_608f_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l518_c3_608f_value : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l513_c7_c329
t_register_uxn_opcodes_h_l513_c7_c329 : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l513_c7_c329_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l513_c7_c329_stack_index,
t_register_uxn_opcodes_h_l513_c7_c329_return_output);

-- set_uxn_opcodes_h_l515_c9_bd3c
set_uxn_opcodes_h_l515_c9_bd3c : entity work.set_0CLK_5678f3b8 port map (
clk,
set_uxn_opcodes_h_l515_c9_bd3c_CLOCK_ENABLE,
set_uxn_opcodes_h_l515_c9_bd3c_stack_index,
set_uxn_opcodes_h_l515_c9_bd3c_ins,
set_uxn_opcodes_h_l515_c9_bd3c_k,
set_uxn_opcodes_h_l515_c9_bd3c_mul,
set_uxn_opcodes_h_l515_c9_bd3c_add,
set_uxn_opcodes_h_l515_c9_bd3c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c
BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_left,
BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_right,
BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_return_output);

-- result_MUX_uxn_opcodes_h_l516_c2_dadf
result_MUX_uxn_opcodes_h_l516_c2_dadf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l516_c2_dadf_cond,
result_MUX_uxn_opcodes_h_l516_c2_dadf_iftrue,
result_MUX_uxn_opcodes_h_l516_c2_dadf_iffalse,
result_MUX_uxn_opcodes_h_l516_c2_dadf_return_output);

-- peek_ram_uxn_opcodes_h_l518_c29_de8d
peek_ram_uxn_opcodes_h_l518_c29_de8d : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_opcodes_h_l518_c29_de8d_CLOCK_ENABLE,
peek_ram_uxn_opcodes_h_l518_c29_de8d_address,
peek_ram_uxn_opcodes_h_l518_c29_de8d_return_output);

-- put_stack_uxn_opcodes_h_l518_c3_608f
put_stack_uxn_opcodes_h_l518_c3_608f : entity work.put_stack_0CLK_5f39ecad port map (
clk,
put_stack_uxn_opcodes_h_l518_c3_608f_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l518_c3_608f_stack_index,
put_stack_uxn_opcodes_h_l518_c3_608f_offset,
put_stack_uxn_opcodes_h_l518_c3_608f_value);



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
 t_register_uxn_opcodes_h_l513_c7_c329_return_output,
 set_uxn_opcodes_h_l515_c9_bd3c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_return_output,
 result_MUX_uxn_opcodes_h_l516_c2_dadf_return_output,
 peek_ram_uxn_opcodes_h_l518_c29_de8d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l513_c7_c329_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l513_c7_c329_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l513_c7_c329_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l514_c8_fe54_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l515_c9_bd3c_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l515_c9_bd3c_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l515_c9_bd3c_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l515_c9_bd3c_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l515_c9_bd3c_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l515_c9_bd3c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l515_c9_bd3c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l516_c2_dadf_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l516_c2_dadf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l516_c2_dadf_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l516_c2_dadf_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l518_c3_608f_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l518_c3_608f_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l518_c3_608f_value : unsigned(7 downto 0);
 variable VAR_peek_ram_uxn_opcodes_h_l518_c29_de8d_address : unsigned(15 downto 0);
 variable VAR_peek_ram_uxn_opcodes_h_l518_c29_de8d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_opcodes_h_l518_c29_de8d_return_output : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l518_c3_608f_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_put_stack_uxn_opcodes_h_l518_c3_608f_offset := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l516_c2_dadf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l516_c2_dadf_iftrue := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_h_l515_c9_bd3c_mul := resize(to_unsigned(1, 1), 8);
     VAR_set_uxn_opcodes_h_l515_c9_bd3c_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l515_c9_bd3c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l513_c7_c329_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l515_c9_bd3c_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l515_c9_bd3c_k := VAR_k;
     VAR_put_stack_uxn_opcodes_h_l518_c3_608f_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l515_c9_bd3c_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l513_c7_c329_stack_index := VAR_stack_index;
     -- t_register[uxn_opcodes_h_l513_c7_c329] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l513_c7_c329_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l513_c7_c329_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l513_c7_c329_stack_index <= VAR_t_register_uxn_opcodes_h_l513_c7_c329_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l513_c7_c329_return_output := t_register_uxn_opcodes_h_l513_c7_c329_return_output;

     -- set[uxn_opcodes_h_l515_c9_bd3c] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l515_c9_bd3c_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l515_c9_bd3c_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l515_c9_bd3c_stack_index <= VAR_set_uxn_opcodes_h_l515_c9_bd3c_stack_index;
     set_uxn_opcodes_h_l515_c9_bd3c_ins <= VAR_set_uxn_opcodes_h_l515_c9_bd3c_ins;
     set_uxn_opcodes_h_l515_c9_bd3c_k <= VAR_set_uxn_opcodes_h_l515_c9_bd3c_k;
     set_uxn_opcodes_h_l515_c9_bd3c_mul <= VAR_set_uxn_opcodes_h_l515_c9_bd3c_mul;
     set_uxn_opcodes_h_l515_c9_bd3c_add <= VAR_set_uxn_opcodes_h_l515_c9_bd3c_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l515_c9_bd3c_return_output := set_uxn_opcodes_h_l515_c9_bd3c_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_left := VAR_set_uxn_opcodes_h_l515_c9_bd3c_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l515_c9_bd3c_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l513_c7_c329_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l516_c6_a89c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_left;
     BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_return_output := BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l514_c8_fe54] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l514_c8_fe54_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l513_c7_c329_return_output);

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l516_c2_dadf_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l516_c6_a89c_return_output;
     VAR_peek_ram_uxn_opcodes_h_l518_c29_de8d_address := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l514_c8_fe54_return_output;
     REG_VAR_t16 := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l514_c8_fe54_return_output;
     -- result_MUX[uxn_opcodes_h_l516_c2_dadf] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l516_c2_dadf_cond <= VAR_result_MUX_uxn_opcodes_h_l516_c2_dadf_cond;
     result_MUX_uxn_opcodes_h_l516_c2_dadf_iftrue <= VAR_result_MUX_uxn_opcodes_h_l516_c2_dadf_iftrue;
     result_MUX_uxn_opcodes_h_l516_c2_dadf_iffalse <= VAR_result_MUX_uxn_opcodes_h_l516_c2_dadf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l516_c2_dadf_return_output := result_MUX_uxn_opcodes_h_l516_c2_dadf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_389a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_return_output;

     -- Submodule level 3
     VAR_peek_ram_uxn_opcodes_h_l518_c29_de8d_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_return_output;
     VAR_put_stack_uxn_opcodes_h_l518_c3_608f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_389a_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l516_c2_dadf_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l516_c2_dadf_return_output;
     -- peek_ram[uxn_opcodes_h_l518_c29_de8d] LATENCY=0
     -- Clock enable
     peek_ram_uxn_opcodes_h_l518_c29_de8d_CLOCK_ENABLE <= VAR_peek_ram_uxn_opcodes_h_l518_c29_de8d_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_opcodes_h_l518_c29_de8d_address <= VAR_peek_ram_uxn_opcodes_h_l518_c29_de8d_address;
     -- Outputs
     VAR_peek_ram_uxn_opcodes_h_l518_c29_de8d_return_output := peek_ram_uxn_opcodes_h_l518_c29_de8d_return_output;

     -- Submodule level 4
     VAR_put_stack_uxn_opcodes_h_l518_c3_608f_value := VAR_peek_ram_uxn_opcodes_h_l518_c29_de8d_return_output;
     -- put_stack[uxn_opcodes_h_l518_c3_608f] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l518_c3_608f_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l518_c3_608f_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l518_c3_608f_stack_index <= VAR_put_stack_uxn_opcodes_h_l518_c3_608f_stack_index;
     put_stack_uxn_opcodes_h_l518_c3_608f_offset <= VAR_put_stack_uxn_opcodes_h_l518_c3_608f_offset;
     put_stack_uxn_opcodes_h_l518_c3_608f_value <= VAR_put_stack_uxn_opcodes_h_l518_c3_608f_value;
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
