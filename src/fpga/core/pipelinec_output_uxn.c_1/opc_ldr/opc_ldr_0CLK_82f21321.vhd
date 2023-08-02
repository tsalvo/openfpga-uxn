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
entity opc_ldr_0CLK_82f21321 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_ldr_0CLK_82f21321;
architecture arch of opc_ldr_0CLK_82f21321 is
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
-- t_register[uxn_opcodes_h_l575_c7_8fde]
signal t_register_uxn_opcodes_h_l575_c7_8fde_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l575_c7_8fde_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l575_c7_8fde_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l576_c9_0820]
signal set_uxn_opcodes_h_l576_c9_0820_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l576_c9_0820_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l576_c9_0820_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l576_c9_0820_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l576_c9_0820_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l576_c9_0820_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l576_c9_0820_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l577_c6_d5cc]
signal BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c1_a165]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l577_c2_bcbb]
signal result_MUX_uxn_opcodes_h_l577_c2_bcbb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l577_c2_bcbb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l577_c2_bcbb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l577_c2_bcbb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l577_c2_bcbb]
signal t16_MUX_uxn_opcodes_h_l577_c2_bcbb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l577_c2_bcbb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l577_c2_bcbb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l577_c2_bcbb_return_output : unsigned(15 downto 0);

-- pc_get[uxn_opcodes_h_l579_c9_b348]
signal pc_get_uxn_opcodes_h_l579_c9_b348_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l579_c9_b348_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l579_c9_3778]
signal BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_return_output : signed(17 downto 0);

-- main_ram_read[uxn_opcodes_h_l580_c29_0247]
signal main_ram_read_uxn_opcodes_h_l580_c29_0247_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_read_uxn_opcodes_h_l580_c29_0247_address : unsigned(15 downto 0);
signal main_ram_read_uxn_opcodes_h_l580_c29_0247_return_output : unsigned(7 downto 0);

-- put_stack[uxn_opcodes_h_l580_c3_e3cc]
signal put_stack_uxn_opcodes_h_l580_c3_e3cc_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l580_c3_e3cc_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l580_c3_e3cc_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l580_c3_e3cc_value : unsigned(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l575_c7_8fde
t_register_uxn_opcodes_h_l575_c7_8fde : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l575_c7_8fde_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l575_c7_8fde_stack_index,
t_register_uxn_opcodes_h_l575_c7_8fde_return_output);

-- set_uxn_opcodes_h_l576_c9_0820
set_uxn_opcodes_h_l576_c9_0820 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l576_c9_0820_CLOCK_ENABLE,
set_uxn_opcodes_h_l576_c9_0820_stack_index,
set_uxn_opcodes_h_l576_c9_0820_ins,
set_uxn_opcodes_h_l576_c9_0820_k,
set_uxn_opcodes_h_l576_c9_0820_mul,
set_uxn_opcodes_h_l576_c9_0820_add,
set_uxn_opcodes_h_l576_c9_0820_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc
BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_left,
BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_right,
BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_return_output);

-- result_MUX_uxn_opcodes_h_l577_c2_bcbb
result_MUX_uxn_opcodes_h_l577_c2_bcbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l577_c2_bcbb_cond,
result_MUX_uxn_opcodes_h_l577_c2_bcbb_iftrue,
result_MUX_uxn_opcodes_h_l577_c2_bcbb_iffalse,
result_MUX_uxn_opcodes_h_l577_c2_bcbb_return_output);

-- t16_MUX_uxn_opcodes_h_l577_c2_bcbb
t16_MUX_uxn_opcodes_h_l577_c2_bcbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l577_c2_bcbb_cond,
t16_MUX_uxn_opcodes_h_l577_c2_bcbb_iftrue,
t16_MUX_uxn_opcodes_h_l577_c2_bcbb_iffalse,
t16_MUX_uxn_opcodes_h_l577_c2_bcbb_return_output);

-- pc_get_uxn_opcodes_h_l579_c9_b348
pc_get_uxn_opcodes_h_l579_c9_b348 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l579_c9_b348_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l579_c9_b348_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778
BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_left,
BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_right,
BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_return_output);

-- main_ram_read_uxn_opcodes_h_l580_c29_0247
main_ram_read_uxn_opcodes_h_l580_c29_0247 : entity work.main_ram_read_0CLK_8ab28aec port map (
clk,
main_ram_read_uxn_opcodes_h_l580_c29_0247_CLOCK_ENABLE,
main_ram_read_uxn_opcodes_h_l580_c29_0247_address,
main_ram_read_uxn_opcodes_h_l580_c29_0247_return_output);

-- put_stack_uxn_opcodes_h_l580_c3_e3cc
put_stack_uxn_opcodes_h_l580_c3_e3cc : entity work.put_stack_0CLK_5f39ecad port map (
clk,
put_stack_uxn_opcodes_h_l580_c3_e3cc_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l580_c3_e3cc_stack_index,
put_stack_uxn_opcodes_h_l580_c3_e3cc_offset,
put_stack_uxn_opcodes_h_l580_c3_e3cc_value);



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
 t_register_uxn_opcodes_h_l575_c7_8fde_return_output,
 set_uxn_opcodes_h_l576_c9_0820_return_output,
 BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_return_output,
 result_MUX_uxn_opcodes_h_l577_c2_bcbb_return_output,
 t16_MUX_uxn_opcodes_h_l577_c2_bcbb_return_output,
 pc_get_uxn_opcodes_h_l579_c9_b348_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_return_output,
 main_ram_read_uxn_opcodes_h_l580_c29_0247_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l575_c7_8fde_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l575_c7_8fde_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l575_c7_8fde_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l576_c9_0820_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l576_c9_0820_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l576_c9_0820_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l576_c9_0820_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l576_c9_0820_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l576_c9_0820_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l576_c9_0820_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l577_c2_bcbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l577_c2_bcbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l577_c2_bcbb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l577_c2_bcbb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l577_c2_bcbb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l577_c2_bcbb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_uxn_opcodes_h_l579_c3_05f0 : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l577_c2_bcbb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l577_c2_bcbb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_left : signed(16 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l579_c9_b348_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l579_c9_b348_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l579_c21_5cb1_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_return_output : signed(17 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l580_c3_e3cc_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l580_c3_e3cc_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l580_c3_e3cc_value : unsigned(7 downto 0);
 variable VAR_main_ram_read_uxn_opcodes_h_l580_c29_0247_address : unsigned(15 downto 0);
 variable VAR_main_ram_read_uxn_opcodes_h_l580_c29_0247_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_read_uxn_opcodes_h_l580_c29_0247_return_output : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l580_c3_e3cc_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_set_uxn_opcodes_h_l576_c9_0820_mul := resize(to_unsigned(1, 1), 8);
     VAR_put_stack_uxn_opcodes_h_l580_c3_e3cc_offset := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l577_c2_bcbb_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l577_c2_bcbb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l576_c9_0820_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l576_c9_0820_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l575_c7_8fde_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l576_c9_0820_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l576_c9_0820_k := VAR_k;
     VAR_put_stack_uxn_opcodes_h_l580_c3_e3cc_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l576_c9_0820_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l575_c7_8fde_stack_index := VAR_stack_index;
     VAR_t16_MUX_uxn_opcodes_h_l577_c2_bcbb_iftrue := t16;
     -- t_register[uxn_opcodes_h_l575_c7_8fde] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l575_c7_8fde_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l575_c7_8fde_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l575_c7_8fde_stack_index <= VAR_t_register_uxn_opcodes_h_l575_c7_8fde_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l575_c7_8fde_return_output := t_register_uxn_opcodes_h_l575_c7_8fde_return_output;

     -- set[uxn_opcodes_h_l576_c9_0820] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l576_c9_0820_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l576_c9_0820_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l576_c9_0820_stack_index <= VAR_set_uxn_opcodes_h_l576_c9_0820_stack_index;
     set_uxn_opcodes_h_l576_c9_0820_ins <= VAR_set_uxn_opcodes_h_l576_c9_0820_ins;
     set_uxn_opcodes_h_l576_c9_0820_k <= VAR_set_uxn_opcodes_h_l576_c9_0820_k;
     set_uxn_opcodes_h_l576_c9_0820_mul <= VAR_set_uxn_opcodes_h_l576_c9_0820_mul;
     set_uxn_opcodes_h_l576_c9_0820_add <= VAR_set_uxn_opcodes_h_l576_c9_0820_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l576_c9_0820_return_output := set_uxn_opcodes_h_l576_c9_0820_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_left := VAR_set_uxn_opcodes_h_l576_c9_0820_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l576_c9_0820_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l575_c7_8fde_return_output;
     -- CAST_TO_int8_t[uxn_opcodes_h_l579_c21_5cb1] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l579_c21_5cb1_return_output := CAST_TO_int8_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l575_c7_8fde_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l577_c6_d5cc] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_left;
     BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_return_output := BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l577_c2_bcbb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l577_c2_bcbb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l577_c6_d5cc_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l579_c21_5cb1_return_output;
     -- result_MUX[uxn_opcodes_h_l577_c2_bcbb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l577_c2_bcbb_cond <= VAR_result_MUX_uxn_opcodes_h_l577_c2_bcbb_cond;
     result_MUX_uxn_opcodes_h_l577_c2_bcbb_iftrue <= VAR_result_MUX_uxn_opcodes_h_l577_c2_bcbb_iftrue;
     result_MUX_uxn_opcodes_h_l577_c2_bcbb_iffalse <= VAR_result_MUX_uxn_opcodes_h_l577_c2_bcbb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l577_c2_bcbb_return_output := result_MUX_uxn_opcodes_h_l577_c2_bcbb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c1_a165] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_return_output;

     -- Submodule level 3
     VAR_main_ram_read_uxn_opcodes_h_l580_c29_0247_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_return_output;
     VAR_pc_get_uxn_opcodes_h_l579_c9_b348_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_return_output;
     VAR_put_stack_uxn_opcodes_h_l580_c3_e3cc_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c1_a165_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l577_c2_bcbb_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l577_c2_bcbb_return_output;
     -- pc_get[uxn_opcodes_h_l579_c9_b348] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l579_c9_b348_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l579_c9_b348_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l579_c9_b348_return_output := pc_get_uxn_opcodes_h_l579_c9_b348_return_output;

     -- Submodule level 4
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_left := signed(std_logic_vector(resize(VAR_pc_get_uxn_opcodes_h_l579_c9_b348_return_output, 17)));
     -- BIN_OP_PLUS[uxn_opcodes_h_l579_c9_3778] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_left;
     BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_return_output := BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_return_output;

     -- Submodule level 5
     VAR_t16_uxn_opcodes_h_l579_c3_05f0 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l579_c9_3778_return_output)),16);
     VAR_main_ram_read_uxn_opcodes_h_l580_c29_0247_address := VAR_t16_uxn_opcodes_h_l579_c3_05f0;
     VAR_t16_MUX_uxn_opcodes_h_l577_c2_bcbb_iffalse := VAR_t16_uxn_opcodes_h_l579_c3_05f0;
     -- main_ram_read[uxn_opcodes_h_l580_c29_0247] LATENCY=0
     -- Clock enable
     main_ram_read_uxn_opcodes_h_l580_c29_0247_CLOCK_ENABLE <= VAR_main_ram_read_uxn_opcodes_h_l580_c29_0247_CLOCK_ENABLE;
     -- Inputs
     main_ram_read_uxn_opcodes_h_l580_c29_0247_address <= VAR_main_ram_read_uxn_opcodes_h_l580_c29_0247_address;
     -- Outputs
     VAR_main_ram_read_uxn_opcodes_h_l580_c29_0247_return_output := main_ram_read_uxn_opcodes_h_l580_c29_0247_return_output;

     -- t16_MUX[uxn_opcodes_h_l577_c2_bcbb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l577_c2_bcbb_cond <= VAR_t16_MUX_uxn_opcodes_h_l577_c2_bcbb_cond;
     t16_MUX_uxn_opcodes_h_l577_c2_bcbb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l577_c2_bcbb_iftrue;
     t16_MUX_uxn_opcodes_h_l577_c2_bcbb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l577_c2_bcbb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l577_c2_bcbb_return_output := t16_MUX_uxn_opcodes_h_l577_c2_bcbb_return_output;

     -- Submodule level 6
     VAR_put_stack_uxn_opcodes_h_l580_c3_e3cc_value := VAR_main_ram_read_uxn_opcodes_h_l580_c29_0247_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l577_c2_bcbb_return_output;
     -- put_stack[uxn_opcodes_h_l580_c3_e3cc] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l580_c3_e3cc_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l580_c3_e3cc_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l580_c3_e3cc_stack_index <= VAR_put_stack_uxn_opcodes_h_l580_c3_e3cc_stack_index;
     put_stack_uxn_opcodes_h_l580_c3_e3cc_offset <= VAR_put_stack_uxn_opcodes_h_l580_c3_e3cc_offset;
     put_stack_uxn_opcodes_h_l580_c3_e3cc_value <= VAR_put_stack_uxn_opcodes_h_l580_c3_e3cc_value;
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
