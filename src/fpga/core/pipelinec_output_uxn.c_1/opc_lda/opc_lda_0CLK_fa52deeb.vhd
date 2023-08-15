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
entity opc_lda_0CLK_fa52deeb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_lda_0CLK_fa52deeb;
architecture arch of opc_lda_0CLK_fa52deeb is
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
-- t2_register[uxn_opcodes_h_l637_c8_a2cb]
signal t2_register_uxn_opcodes_h_l637_c8_a2cb_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l637_c8_a2cb_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l637_c8_a2cb_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l638_c9_d7e9]
signal set_uxn_opcodes_h_l638_c9_d7e9_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l638_c9_d7e9_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l638_c9_d7e9_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l638_c9_d7e9_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l638_c9_d7e9_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l638_c9_d7e9_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l638_c9_d7e9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l639_c6_c1c2]
signal BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l640_c1_0a96]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l639_c2_6bde]
signal result_MUX_uxn_opcodes_h_l639_c2_6bde_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l639_c2_6bde_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l639_c2_6bde_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l639_c2_6bde_return_output : unsigned(0 downto 0);

-- peek_ram[uxn_opcodes_h_l641_c29_d060]
signal peek_ram_uxn_opcodes_h_l641_c29_d060_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_opcodes_h_l641_c29_d060_address : unsigned(15 downto 0);
signal peek_ram_uxn_opcodes_h_l641_c29_d060_return_output : unsigned(7 downto 0);

-- put_stack[uxn_opcodes_h_l641_c3_7a1b]
signal put_stack_uxn_opcodes_h_l641_c3_7a1b_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l641_c3_7a1b_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l641_c3_7a1b_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l641_c3_7a1b_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l637_c8_a2cb
t2_register_uxn_opcodes_h_l637_c8_a2cb : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l637_c8_a2cb_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l637_c8_a2cb_stack_index,
t2_register_uxn_opcodes_h_l637_c8_a2cb_return_output);

-- set_uxn_opcodes_h_l638_c9_d7e9
set_uxn_opcodes_h_l638_c9_d7e9 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l638_c9_d7e9_CLOCK_ENABLE,
set_uxn_opcodes_h_l638_c9_d7e9_stack_index,
set_uxn_opcodes_h_l638_c9_d7e9_ins,
set_uxn_opcodes_h_l638_c9_d7e9_k,
set_uxn_opcodes_h_l638_c9_d7e9_mul,
set_uxn_opcodes_h_l638_c9_d7e9_add,
set_uxn_opcodes_h_l638_c9_d7e9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2
BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_left,
BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_right,
BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_return_output);

-- result_MUX_uxn_opcodes_h_l639_c2_6bde
result_MUX_uxn_opcodes_h_l639_c2_6bde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l639_c2_6bde_cond,
result_MUX_uxn_opcodes_h_l639_c2_6bde_iftrue,
result_MUX_uxn_opcodes_h_l639_c2_6bde_iffalse,
result_MUX_uxn_opcodes_h_l639_c2_6bde_return_output);

-- peek_ram_uxn_opcodes_h_l641_c29_d060
peek_ram_uxn_opcodes_h_l641_c29_d060 : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_opcodes_h_l641_c29_d060_CLOCK_ENABLE,
peek_ram_uxn_opcodes_h_l641_c29_d060_address,
peek_ram_uxn_opcodes_h_l641_c29_d060_return_output);

-- put_stack_uxn_opcodes_h_l641_c3_7a1b
put_stack_uxn_opcodes_h_l641_c3_7a1b : entity work.put_stack_0CLK_5f39ecad port map (
clk,
put_stack_uxn_opcodes_h_l641_c3_7a1b_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l641_c3_7a1b_stack_index,
put_stack_uxn_opcodes_h_l641_c3_7a1b_offset,
put_stack_uxn_opcodes_h_l641_c3_7a1b_value);



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
 t2_register_uxn_opcodes_h_l637_c8_a2cb_return_output,
 set_uxn_opcodes_h_l638_c9_d7e9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_return_output,
 result_MUX_uxn_opcodes_h_l639_c2_6bde_return_output,
 peek_ram_uxn_opcodes_h_l641_c29_d060_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l637_c8_a2cb_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l637_c8_a2cb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l637_c8_a2cb_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l638_c9_d7e9_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l638_c9_d7e9_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l638_c9_d7e9_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l638_c9_d7e9_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l638_c9_d7e9_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l638_c9_d7e9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l638_c9_d7e9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l639_c2_6bde_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l639_c2_6bde_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l639_c2_6bde_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l639_c2_6bde_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l641_c3_7a1b_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l641_c3_7a1b_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l641_c3_7a1b_value : unsigned(7 downto 0);
 variable VAR_peek_ram_uxn_opcodes_h_l641_c29_d060_address : unsigned(15 downto 0);
 variable VAR_peek_ram_uxn_opcodes_h_l641_c29_d060_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_opcodes_h_l641_c29_d060_return_output : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l641_c3_7a1b_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_put_stack_uxn_opcodes_h_l641_c3_7a1b_offset := resize(to_unsigned(0, 1), 8);
     VAR_set_uxn_opcodes_h_l638_c9_d7e9_mul := resize(to_unsigned(2, 2), 8);
     VAR_set_uxn_opcodes_h_l638_c9_d7e9_add := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l639_c2_6bde_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l639_c2_6bde_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l638_c9_d7e9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l637_c8_a2cb_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l638_c9_d7e9_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l638_c9_d7e9_k := VAR_k;
     VAR_put_stack_uxn_opcodes_h_l641_c3_7a1b_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l638_c9_d7e9_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l637_c8_a2cb_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l638_c9_d7e9] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l638_c9_d7e9_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l638_c9_d7e9_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l638_c9_d7e9_stack_index <= VAR_set_uxn_opcodes_h_l638_c9_d7e9_stack_index;
     set_uxn_opcodes_h_l638_c9_d7e9_ins <= VAR_set_uxn_opcodes_h_l638_c9_d7e9_ins;
     set_uxn_opcodes_h_l638_c9_d7e9_k <= VAR_set_uxn_opcodes_h_l638_c9_d7e9_k;
     set_uxn_opcodes_h_l638_c9_d7e9_mul <= VAR_set_uxn_opcodes_h_l638_c9_d7e9_mul;
     set_uxn_opcodes_h_l638_c9_d7e9_add <= VAR_set_uxn_opcodes_h_l638_c9_d7e9_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l638_c9_d7e9_return_output := set_uxn_opcodes_h_l638_c9_d7e9_return_output;

     -- t2_register[uxn_opcodes_h_l637_c8_a2cb] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l637_c8_a2cb_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l637_c8_a2cb_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l637_c8_a2cb_stack_index <= VAR_t2_register_uxn_opcodes_h_l637_c8_a2cb_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l637_c8_a2cb_return_output := t2_register_uxn_opcodes_h_l637_c8_a2cb_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_left := VAR_set_uxn_opcodes_h_l638_c9_d7e9_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l638_c9_d7e9_return_output;
     VAR_peek_ram_uxn_opcodes_h_l641_c29_d060_address := VAR_t2_register_uxn_opcodes_h_l637_c8_a2cb_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l637_c8_a2cb_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l639_c6_c1c2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_left;
     BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_return_output := BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l639_c2_6bde_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l639_c6_c1c2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l640_c1_0a96] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_return_output;

     -- result_MUX[uxn_opcodes_h_l639_c2_6bde] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l639_c2_6bde_cond <= VAR_result_MUX_uxn_opcodes_h_l639_c2_6bde_cond;
     result_MUX_uxn_opcodes_h_l639_c2_6bde_iftrue <= VAR_result_MUX_uxn_opcodes_h_l639_c2_6bde_iftrue;
     result_MUX_uxn_opcodes_h_l639_c2_6bde_iffalse <= VAR_result_MUX_uxn_opcodes_h_l639_c2_6bde_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l639_c2_6bde_return_output := result_MUX_uxn_opcodes_h_l639_c2_6bde_return_output;

     -- Submodule level 3
     VAR_peek_ram_uxn_opcodes_h_l641_c29_d060_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_return_output;
     VAR_put_stack_uxn_opcodes_h_l641_c3_7a1b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l640_c1_0a96_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l639_c2_6bde_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l639_c2_6bde_return_output;
     -- peek_ram[uxn_opcodes_h_l641_c29_d060] LATENCY=0
     -- Clock enable
     peek_ram_uxn_opcodes_h_l641_c29_d060_CLOCK_ENABLE <= VAR_peek_ram_uxn_opcodes_h_l641_c29_d060_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_opcodes_h_l641_c29_d060_address <= VAR_peek_ram_uxn_opcodes_h_l641_c29_d060_address;
     -- Outputs
     VAR_peek_ram_uxn_opcodes_h_l641_c29_d060_return_output := peek_ram_uxn_opcodes_h_l641_c29_d060_return_output;

     -- Submodule level 4
     VAR_put_stack_uxn_opcodes_h_l641_c3_7a1b_value := VAR_peek_ram_uxn_opcodes_h_l641_c29_d060_return_output;
     -- put_stack[uxn_opcodes_h_l641_c3_7a1b] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l641_c3_7a1b_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l641_c3_7a1b_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l641_c3_7a1b_stack_index <= VAR_put_stack_uxn_opcodes_h_l641_c3_7a1b_stack_index;
     put_stack_uxn_opcodes_h_l641_c3_7a1b_offset <= VAR_put_stack_uxn_opcodes_h_l641_c3_7a1b_offset;
     put_stack_uxn_opcodes_h_l641_c3_7a1b_value <= VAR_put_stack_uxn_opcodes_h_l641_c3_7a1b_value;
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
