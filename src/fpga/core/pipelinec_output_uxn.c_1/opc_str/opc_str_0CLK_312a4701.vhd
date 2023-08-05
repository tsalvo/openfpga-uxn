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
entity opc_str_0CLK_312a4701 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_str_0CLK_312a4701;
architecture arch of opc_str_0CLK_312a4701 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l605_c7_e0b4]
signal t_register_uxn_opcodes_h_l605_c7_e0b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l605_c7_e0b4_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l605_c7_e0b4_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l606_c7_c264]
signal n_register_uxn_opcodes_h_l606_c7_c264_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l606_c7_c264_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l606_c7_c264_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l607_c9_2533]
signal set_uxn_opcodes_h_l607_c9_2533_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l607_c9_2533_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l607_c9_2533_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l607_c9_2533_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l607_c9_2533_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l607_c9_2533_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l607_c9_2533_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l608_c6_ed64]
signal BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l609_c1_f9ba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l608_c2_93e9]
signal t16_MUX_uxn_opcodes_h_l608_c2_93e9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l608_c2_93e9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l608_c2_93e9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l608_c2_93e9_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_h_l608_c2_93e9]
signal result_MUX_uxn_opcodes_h_l608_c2_93e9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l608_c2_93e9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l608_c2_93e9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l608_c2_93e9_return_output : unsigned(0 downto 0);

-- pc_get[uxn_opcodes_h_l610_c9_06a8]
signal pc_get_uxn_opcodes_h_l610_c9_06a8_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l610_c9_06a8_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l610_c9_e2d6]
signal BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_return_output : signed(17 downto 0);

-- main_ram_write[uxn_opcodes_h_l611_c3_a229]
signal main_ram_write_uxn_opcodes_h_l611_c3_a229_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_write_uxn_opcodes_h_l611_c3_a229_address : unsigned(15 downto 0);
signal main_ram_write_uxn_opcodes_h_l611_c3_a229_value : unsigned(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l605_c7_e0b4
t_register_uxn_opcodes_h_l605_c7_e0b4 : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l605_c7_e0b4_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l605_c7_e0b4_stack_index,
t_register_uxn_opcodes_h_l605_c7_e0b4_return_output);

-- n_register_uxn_opcodes_h_l606_c7_c264
n_register_uxn_opcodes_h_l606_c7_c264 : entity work.n_register_0CLK_9682be37 port map (
clk,
n_register_uxn_opcodes_h_l606_c7_c264_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l606_c7_c264_stack_index,
n_register_uxn_opcodes_h_l606_c7_c264_return_output);

-- set_uxn_opcodes_h_l607_c9_2533
set_uxn_opcodes_h_l607_c9_2533 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l607_c9_2533_CLOCK_ENABLE,
set_uxn_opcodes_h_l607_c9_2533_stack_index,
set_uxn_opcodes_h_l607_c9_2533_ins,
set_uxn_opcodes_h_l607_c9_2533_k,
set_uxn_opcodes_h_l607_c9_2533_mul,
set_uxn_opcodes_h_l607_c9_2533_add,
set_uxn_opcodes_h_l607_c9_2533_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64
BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_left,
BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_right,
BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_return_output);

-- t16_MUX_uxn_opcodes_h_l608_c2_93e9
t16_MUX_uxn_opcodes_h_l608_c2_93e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l608_c2_93e9_cond,
t16_MUX_uxn_opcodes_h_l608_c2_93e9_iftrue,
t16_MUX_uxn_opcodes_h_l608_c2_93e9_iffalse,
t16_MUX_uxn_opcodes_h_l608_c2_93e9_return_output);

-- result_MUX_uxn_opcodes_h_l608_c2_93e9
result_MUX_uxn_opcodes_h_l608_c2_93e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l608_c2_93e9_cond,
result_MUX_uxn_opcodes_h_l608_c2_93e9_iftrue,
result_MUX_uxn_opcodes_h_l608_c2_93e9_iffalse,
result_MUX_uxn_opcodes_h_l608_c2_93e9_return_output);

-- pc_get_uxn_opcodes_h_l610_c9_06a8
pc_get_uxn_opcodes_h_l610_c9_06a8 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l610_c9_06a8_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l610_c9_06a8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6
BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_left,
BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_right,
BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_return_output);

-- main_ram_write_uxn_opcodes_h_l611_c3_a229
main_ram_write_uxn_opcodes_h_l611_c3_a229 : entity work.main_ram_write_0CLK_b45f1687 port map (
clk,
main_ram_write_uxn_opcodes_h_l611_c3_a229_CLOCK_ENABLE,
main_ram_write_uxn_opcodes_h_l611_c3_a229_address,
main_ram_write_uxn_opcodes_h_l611_c3_a229_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t16,
 n8,
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l605_c7_e0b4_return_output,
 n_register_uxn_opcodes_h_l606_c7_c264_return_output,
 set_uxn_opcodes_h_l607_c9_2533_return_output,
 BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_return_output,
 t16_MUX_uxn_opcodes_h_l608_c2_93e9_return_output,
 result_MUX_uxn_opcodes_h_l608_c2_93e9_return_output,
 pc_get_uxn_opcodes_h_l610_c9_06a8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l605_c7_e0b4_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l605_c7_e0b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l605_c7_e0b4_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l606_c7_c264_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l606_c7_c264_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l606_c7_c264_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l607_c9_2533_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l607_c9_2533_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l607_c9_2533_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l607_c9_2533_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l607_c9_2533_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l607_c9_2533_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l607_c9_2533_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l608_c2_93e9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l608_c2_93e9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_uxn_opcodes_h_l610_c3_be1c : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l608_c2_93e9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l608_c2_93e9_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l608_c2_93e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l608_c2_93e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l608_c2_93e9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l608_c2_93e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_left : signed(16 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l610_c9_06a8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l610_c9_06a8_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l610_c21_61b4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_return_output : signed(17 downto 0);
 variable VAR_main_ram_write_uxn_opcodes_h_l611_c3_a229_address : unsigned(15 downto 0);
 variable VAR_main_ram_write_uxn_opcodes_h_l611_c3_a229_value : unsigned(7 downto 0);
 variable VAR_main_ram_write_uxn_opcodes_h_l611_c3_a229_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l608_c2_93e9_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l607_c9_2533_add := resize(to_signed(-2, 3), 8);
     VAR_set_uxn_opcodes_h_l607_c9_2533_mul := resize(to_unsigned(2, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l608_c2_93e9_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_iffalse := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l606_c7_c264_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l607_c9_2533_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l605_c7_e0b4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l607_c9_2533_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l607_c9_2533_k := VAR_k;
     VAR_n_register_uxn_opcodes_h_l606_c7_c264_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l607_c9_2533_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l605_c7_e0b4_stack_index := VAR_stack_index;
     VAR_t16_MUX_uxn_opcodes_h_l608_c2_93e9_iftrue := t16;
     -- n_register[uxn_opcodes_h_l606_c7_c264] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l606_c7_c264_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l606_c7_c264_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l606_c7_c264_stack_index <= VAR_n_register_uxn_opcodes_h_l606_c7_c264_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l606_c7_c264_return_output := n_register_uxn_opcodes_h_l606_c7_c264_return_output;

     -- t_register[uxn_opcodes_h_l605_c7_e0b4] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l605_c7_e0b4_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l605_c7_e0b4_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l605_c7_e0b4_stack_index <= VAR_t_register_uxn_opcodes_h_l605_c7_e0b4_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l605_c7_e0b4_return_output := t_register_uxn_opcodes_h_l605_c7_e0b4_return_output;

     -- set[uxn_opcodes_h_l607_c9_2533] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l607_c9_2533_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l607_c9_2533_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l607_c9_2533_stack_index <= VAR_set_uxn_opcodes_h_l607_c9_2533_stack_index;
     set_uxn_opcodes_h_l607_c9_2533_ins <= VAR_set_uxn_opcodes_h_l607_c9_2533_ins;
     set_uxn_opcodes_h_l607_c9_2533_k <= VAR_set_uxn_opcodes_h_l607_c9_2533_k;
     set_uxn_opcodes_h_l607_c9_2533_mul <= VAR_set_uxn_opcodes_h_l607_c9_2533_mul;
     set_uxn_opcodes_h_l607_c9_2533_add <= VAR_set_uxn_opcodes_h_l607_c9_2533_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l607_c9_2533_return_output := set_uxn_opcodes_h_l607_c9_2533_return_output;

     -- Submodule level 1
     VAR_main_ram_write_uxn_opcodes_h_l611_c3_a229_value := VAR_n_register_uxn_opcodes_h_l606_c7_c264_return_output;
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l606_c7_c264_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_left := VAR_set_uxn_opcodes_h_l607_c9_2533_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l607_c9_2533_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l605_c7_e0b4_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l608_c6_ed64] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_left;
     BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_return_output := BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l610_c21_61b4] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l610_c21_61b4_return_output := CAST_TO_int8_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l605_c7_e0b4_return_output);

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_return_output;
     VAR_result_MUX_uxn_opcodes_h_l608_c2_93e9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l608_c2_93e9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_ed64_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l610_c21_61b4_return_output;
     -- result_MUX[uxn_opcodes_h_l608_c2_93e9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l608_c2_93e9_cond <= VAR_result_MUX_uxn_opcodes_h_l608_c2_93e9_cond;
     result_MUX_uxn_opcodes_h_l608_c2_93e9_iftrue <= VAR_result_MUX_uxn_opcodes_h_l608_c2_93e9_iftrue;
     result_MUX_uxn_opcodes_h_l608_c2_93e9_iffalse <= VAR_result_MUX_uxn_opcodes_h_l608_c2_93e9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l608_c2_93e9_return_output := result_MUX_uxn_opcodes_h_l608_c2_93e9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l609_c1_f9ba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_return_output;

     -- Submodule level 3
     VAR_main_ram_write_uxn_opcodes_h_l611_c3_a229_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_return_output;
     VAR_pc_get_uxn_opcodes_h_l610_c9_06a8_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_f9ba_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l608_c2_93e9_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l608_c2_93e9_return_output;
     -- pc_get[uxn_opcodes_h_l610_c9_06a8] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l610_c9_06a8_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l610_c9_06a8_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l610_c9_06a8_return_output := pc_get_uxn_opcodes_h_l610_c9_06a8_return_output;

     -- Submodule level 4
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_left := signed(std_logic_vector(resize(VAR_pc_get_uxn_opcodes_h_l610_c9_06a8_return_output, 17)));
     -- BIN_OP_PLUS[uxn_opcodes_h_l610_c9_e2d6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_return_output;

     -- Submodule level 5
     VAR_t16_uxn_opcodes_h_l610_c3_be1c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_e2d6_return_output)),16);
     VAR_main_ram_write_uxn_opcodes_h_l611_c3_a229_address := VAR_t16_uxn_opcodes_h_l610_c3_be1c;
     VAR_t16_MUX_uxn_opcodes_h_l608_c2_93e9_iffalse := VAR_t16_uxn_opcodes_h_l610_c3_be1c;
     -- t16_MUX[uxn_opcodes_h_l608_c2_93e9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l608_c2_93e9_cond <= VAR_t16_MUX_uxn_opcodes_h_l608_c2_93e9_cond;
     t16_MUX_uxn_opcodes_h_l608_c2_93e9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l608_c2_93e9_iftrue;
     t16_MUX_uxn_opcodes_h_l608_c2_93e9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l608_c2_93e9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l608_c2_93e9_return_output := t16_MUX_uxn_opcodes_h_l608_c2_93e9_return_output;

     -- main_ram_write[uxn_opcodes_h_l611_c3_a229] LATENCY=0
     -- Clock enable
     main_ram_write_uxn_opcodes_h_l611_c3_a229_CLOCK_ENABLE <= VAR_main_ram_write_uxn_opcodes_h_l611_c3_a229_CLOCK_ENABLE;
     -- Inputs
     main_ram_write_uxn_opcodes_h_l611_c3_a229_address <= VAR_main_ram_write_uxn_opcodes_h_l611_c3_a229_address;
     main_ram_write_uxn_opcodes_h_l611_c3_a229_value <= VAR_main_ram_write_uxn_opcodes_h_l611_c3_a229_value;
     -- Outputs

     -- Submodule level 6
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l608_c2_93e9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
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
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
