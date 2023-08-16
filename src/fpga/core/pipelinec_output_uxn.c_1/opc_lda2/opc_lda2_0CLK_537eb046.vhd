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
entity opc_lda2_0CLK_537eb046 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_lda2_0CLK_537eb046;
architecture arch of opc_lda2_0CLK_537eb046 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t2_register[uxn_opcodes_h_l651_c8_07f9]
signal t2_register_uxn_opcodes_h_l651_c8_07f9_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l651_c8_07f9_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l651_c8_07f9_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l652_c9_d471]
signal set_uxn_opcodes_h_l652_c9_d471_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l652_c9_d471_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l652_c9_d471_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l652_c9_d471_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l652_c9_d471_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l652_c9_d471_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l652_c9_d471_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l653_c6_a06a]
signal BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l654_c1_a485]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l653_c2_b10e]
signal result_MUX_uxn_opcodes_h_l653_c2_b10e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l653_c2_b10e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l653_c2_b10e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l653_c2_b10e_return_output : unsigned(0 downto 0);

-- peek2_ram[uxn_opcodes_h_l655_c29_59e2]
signal peek2_ram_uxn_opcodes_h_l655_c29_59e2_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_h_l655_c29_59e2_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_h_l655_c29_59e2_return_output : unsigned(15 downto 0);

-- put_stack[uxn_opcodes_h_l655_c3_92aa]
signal put_stack_uxn_opcodes_h_l655_c3_92aa_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l655_c3_92aa_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l655_c3_92aa_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l655_c3_92aa_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l651_c8_07f9
t2_register_uxn_opcodes_h_l651_c8_07f9 : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l651_c8_07f9_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l651_c8_07f9_stack_index,
t2_register_uxn_opcodes_h_l651_c8_07f9_return_output);

-- set_uxn_opcodes_h_l652_c9_d471
set_uxn_opcodes_h_l652_c9_d471 : entity work.set_0CLK_5678f3b8 port map (
clk,
set_uxn_opcodes_h_l652_c9_d471_CLOCK_ENABLE,
set_uxn_opcodes_h_l652_c9_d471_stack_index,
set_uxn_opcodes_h_l652_c9_d471_ins,
set_uxn_opcodes_h_l652_c9_d471_k,
set_uxn_opcodes_h_l652_c9_d471_mul,
set_uxn_opcodes_h_l652_c9_d471_add,
set_uxn_opcodes_h_l652_c9_d471_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a
BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_left,
BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_right,
BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_return_output);

-- result_MUX_uxn_opcodes_h_l653_c2_b10e
result_MUX_uxn_opcodes_h_l653_c2_b10e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l653_c2_b10e_cond,
result_MUX_uxn_opcodes_h_l653_c2_b10e_iftrue,
result_MUX_uxn_opcodes_h_l653_c2_b10e_iffalse,
result_MUX_uxn_opcodes_h_l653_c2_b10e_return_output);

-- peek2_ram_uxn_opcodes_h_l655_c29_59e2
peek2_ram_uxn_opcodes_h_l655_c29_59e2 : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_h_l655_c29_59e2_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_h_l655_c29_59e2_address,
peek2_ram_uxn_opcodes_h_l655_c29_59e2_return_output);

-- put_stack_uxn_opcodes_h_l655_c3_92aa
put_stack_uxn_opcodes_h_l655_c3_92aa : entity work.put_stack_0CLK_5f39ecad port map (
clk,
put_stack_uxn_opcodes_h_l655_c3_92aa_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l655_c3_92aa_stack_index,
put_stack_uxn_opcodes_h_l655_c3_92aa_offset,
put_stack_uxn_opcodes_h_l655_c3_92aa_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 t2_register_uxn_opcodes_h_l651_c8_07f9_return_output,
 set_uxn_opcodes_h_l652_c9_d471_return_output,
 BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_return_output,
 result_MUX_uxn_opcodes_h_l653_c2_b10e_return_output,
 peek2_ram_uxn_opcodes_h_l655_c29_59e2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l651_c8_07f9_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l651_c8_07f9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l651_c8_07f9_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l652_c9_d471_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l652_c9_d471_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l652_c9_d471_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l652_c9_d471_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l652_c9_d471_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l652_c9_d471_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l652_c9_d471_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l653_c2_b10e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l653_c2_b10e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l653_c2_b10e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l653_c2_b10e_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l655_c3_92aa_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l655_c3_92aa_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l655_c3_92aa_value : unsigned(7 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l655_c29_59e2_address : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l655_c29_59e2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l655_c29_59e2_return_output : unsigned(15 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l655_c3_92aa_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l652_c9_d471_mul := resize(to_unsigned(2, 2), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l652_c9_d471_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_MUX_uxn_opcodes_h_l653_c2_b10e_iffalse := to_unsigned(0, 1);
     VAR_put_stack_uxn_opcodes_h_l655_c3_92aa_offset := resize(to_unsigned(9, 4), 8);
     VAR_result_MUX_uxn_opcodes_h_l653_c2_b10e_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l652_c9_d471_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l651_c8_07f9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l652_c9_d471_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l652_c9_d471_k := VAR_k;
     VAR_put_stack_uxn_opcodes_h_l655_c3_92aa_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l652_c9_d471_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l651_c8_07f9_stack_index := VAR_stack_index;
     -- t2_register[uxn_opcodes_h_l651_c8_07f9] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l651_c8_07f9_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l651_c8_07f9_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l651_c8_07f9_stack_index <= VAR_t2_register_uxn_opcodes_h_l651_c8_07f9_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l651_c8_07f9_return_output := t2_register_uxn_opcodes_h_l651_c8_07f9_return_output;

     -- set[uxn_opcodes_h_l652_c9_d471] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l652_c9_d471_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l652_c9_d471_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l652_c9_d471_stack_index <= VAR_set_uxn_opcodes_h_l652_c9_d471_stack_index;
     set_uxn_opcodes_h_l652_c9_d471_ins <= VAR_set_uxn_opcodes_h_l652_c9_d471_ins;
     set_uxn_opcodes_h_l652_c9_d471_k <= VAR_set_uxn_opcodes_h_l652_c9_d471_k;
     set_uxn_opcodes_h_l652_c9_d471_mul <= VAR_set_uxn_opcodes_h_l652_c9_d471_mul;
     set_uxn_opcodes_h_l652_c9_d471_add <= VAR_set_uxn_opcodes_h_l652_c9_d471_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l652_c9_d471_return_output := set_uxn_opcodes_h_l652_c9_d471_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_left := VAR_set_uxn_opcodes_h_l652_c9_d471_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l652_c9_d471_return_output;
     VAR_peek2_ram_uxn_opcodes_h_l655_c29_59e2_address := VAR_t2_register_uxn_opcodes_h_l651_c8_07f9_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l651_c8_07f9_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l653_c6_a06a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_left;
     BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_return_output := BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l653_c2_b10e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l653_c6_a06a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l654_c1_a485] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_return_output;

     -- result_MUX[uxn_opcodes_h_l653_c2_b10e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l653_c2_b10e_cond <= VAR_result_MUX_uxn_opcodes_h_l653_c2_b10e_cond;
     result_MUX_uxn_opcodes_h_l653_c2_b10e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l653_c2_b10e_iftrue;
     result_MUX_uxn_opcodes_h_l653_c2_b10e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l653_c2_b10e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l653_c2_b10e_return_output := result_MUX_uxn_opcodes_h_l653_c2_b10e_return_output;

     -- Submodule level 3
     VAR_peek2_ram_uxn_opcodes_h_l655_c29_59e2_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_return_output;
     VAR_put_stack_uxn_opcodes_h_l655_c3_92aa_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l654_c1_a485_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l653_c2_b10e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l653_c2_b10e_return_output;
     -- peek2_ram[uxn_opcodes_h_l655_c29_59e2] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_h_l655_c29_59e2_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_h_l655_c29_59e2_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_h_l655_c29_59e2_address <= VAR_peek2_ram_uxn_opcodes_h_l655_c29_59e2_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_h_l655_c29_59e2_return_output := peek2_ram_uxn_opcodes_h_l655_c29_59e2_return_output;

     -- Submodule level 4
     VAR_put_stack_uxn_opcodes_h_l655_c3_92aa_value := resize(VAR_peek2_ram_uxn_opcodes_h_l655_c29_59e2_return_output, 8);
     -- put_stack[uxn_opcodes_h_l655_c3_92aa] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l655_c3_92aa_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l655_c3_92aa_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l655_c3_92aa_stack_index <= VAR_put_stack_uxn_opcodes_h_l655_c3_92aa_stack_index;
     put_stack_uxn_opcodes_h_l655_c3_92aa_offset <= VAR_put_stack_uxn_opcodes_h_l655_c3_92aa_offset;
     put_stack_uxn_opcodes_h_l655_c3_92aa_value <= VAR_put_stack_uxn_opcodes_h_l655_c3_92aa_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
