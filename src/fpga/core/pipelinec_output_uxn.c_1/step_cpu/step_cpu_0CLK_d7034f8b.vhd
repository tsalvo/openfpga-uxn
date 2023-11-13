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
-- Submodules: 33
entity step_cpu_0CLK_d7034f8b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 use_vector : in unsigned(0 downto 0);
 vector : in unsigned(15 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_d7034f8b;
architecture arch of step_cpu_0CLK_d7034f8b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal pc : unsigned(15 downto 0) := to_unsigned(256, 16);
signal ins : unsigned(7 downto 0) := to_unsigned(0, 8);
signal step_cpu_phase : unsigned(7 downto 0) := to_unsigned(0, 8);
signal is_ins_done : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_waiting : unsigned(0 downto 0) := to_unsigned(0, 1);
signal eval_opcode_result : eval_opcode_result_t := eval_opcode_result_t_NULL;
signal cpu_step_result : cpu_step_result_t := (
is_ram_write => to_unsigned(0, 1),
ram_address => to_unsigned(0, 16),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
u8_value => to_unsigned(0, 8))
;
signal REG_COMB_pc : unsigned(15 downto 0);
signal REG_COMB_ins : unsigned(7 downto 0);
signal REG_COMB_step_cpu_phase : unsigned(7 downto 0);
signal REG_COMB_is_ins_done : unsigned(0 downto 0);
signal REG_COMB_is_waiting : unsigned(0 downto 0);
signal REG_COMB_eval_opcode_result : eval_opcode_result_t;
signal REG_COMB_cpu_step_result : cpu_step_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_c_l65_c8_0a04]
signal BIN_OP_AND_uxn_c_l65_c8_0a04_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l65_c8_0a04_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l65_c8_0a04_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l65_c8_f7e1]
signal MUX_uxn_c_l65_c8_f7e1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l65_c8_f7e1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l65_c8_f7e1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l65_c8_f7e1_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l66_c15_ebbe]
signal MUX_uxn_c_l66_c15_ebbe_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l66_c15_ebbe_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l66_c15_ebbe_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l66_c15_ebbe_return_output : unsigned(0 downto 0);

-- printf_uxn_c_l68_c2_2c42[uxn_c_l68_c2_2c42]
signal printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg2 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg3 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg4 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l70_c6_47e5]
signal BIN_OP_EQ_uxn_c_l70_c6_47e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l70_c6_47e5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l70_c6_47e5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l77_c7_f02a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l70_c2_c667]
signal eval_opcode_result_MUX_uxn_c_l70_c2_c667_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l70_c2_c667_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l70_c2_c667_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l70_c2_c667_return_output : eval_opcode_result_t;

-- is_ins_done_MUX[uxn_c_l70_c2_c667]
signal is_ins_done_MUX_uxn_c_l70_c2_c667_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l70_c2_c667_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l70_c2_c667_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l70_c2_c667_return_output : unsigned(0 downto 0);

-- is_waiting_MUX[uxn_c_l70_c2_c667]
signal is_waiting_MUX_uxn_c_l70_c2_c667_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l70_c2_c667_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l70_c2_c667_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l70_c2_c667_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l70_c2_c667]
signal pc_MUX_uxn_c_l70_c2_c667_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l70_c2_c667_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l70_c2_c667_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l70_c2_c667_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l70_c2_c667]
signal cpu_step_result_MUX_uxn_c_l70_c2_c667_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l70_c2_c667_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l70_c2_c667_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l70_c2_c667_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l70_c2_c667]
signal ins_MUX_uxn_c_l70_c2_c667_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l70_c2_c667_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l70_c2_c667_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l70_c2_c667_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l77_c11_2337]
signal BIN_OP_EQ_uxn_c_l77_c11_2337_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l77_c11_2337_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l77_c11_2337_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_c354]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l77_c7_f02a]
signal eval_opcode_result_MUX_uxn_c_l77_c7_f02a_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l77_c7_f02a_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l77_c7_f02a_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l77_c7_f02a_return_output : eval_opcode_result_t;

-- is_ins_done_MUX[uxn_c_l77_c7_f02a]
signal is_ins_done_MUX_uxn_c_l77_c7_f02a_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_f02a_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_f02a_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_f02a_return_output : unsigned(0 downto 0);

-- is_waiting_MUX[uxn_c_l77_c7_f02a]
signal is_waiting_MUX_uxn_c_l77_c7_f02a_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l77_c7_f02a_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l77_c7_f02a_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l77_c7_f02a_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l77_c7_f02a]
signal pc_MUX_uxn_c_l77_c7_f02a_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l77_c7_f02a_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l77_c7_f02a_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l77_c7_f02a_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l77_c7_f02a]
signal cpu_step_result_MUX_uxn_c_l77_c7_f02a_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l77_c7_f02a_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l77_c7_f02a_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l77_c7_f02a_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l77_c7_f02a]
signal ins_MUX_uxn_c_l77_c7_f02a_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l77_c7_f02a_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l77_c7_f02a_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l77_c7_f02a_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l78_c3_3cbb]
signal BIN_OP_PLUS_uxn_c_l78_c3_3cbb_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_3cbb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_3cbb_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l81_c9_0b40]
signal BIN_OP_EQ_uxn_c_l81_c9_0b40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c9_0b40_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c9_0b40_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l81_c9_1ef5]
signal MUX_uxn_c_l81_c9_1ef5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c9_1ef5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l81_c9_1ef5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l81_c9_1ef5_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l82_c43_9bc8]
signal BIN_OP_MINUS_uxn_c_l82_c43_9bc8_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l82_c43_9bc8_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l82_c43_9bc8_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l82_c24_ef0b]
signal eval_opcode_phased_uxn_c_l82_c24_ef0b_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ef0b_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ef0b_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ef0b_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ef0b_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ef0b_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l83_c8_aefe]
signal MUX_uxn_c_l83_c8_aefe_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l83_c8_aefe_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l83_c8_aefe_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l83_c8_aefe_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l96_c6_2a11]
signal BIN_OP_OR_uxn_c_l96_c6_2a11_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l96_c6_2a11_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l96_c6_2a11_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l96_c2_415c]
signal step_cpu_phase_MUX_uxn_c_l96_c2_415c_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l96_c2_415c_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l96_c2_415c_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l96_c2_415c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l99_c21_156a]
signal BIN_OP_EQ_uxn_c_l99_c21_156a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c21_156a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c21_156a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l99_c37_86ae]
signal BIN_OP_PLUS_uxn_c_l99_c37_86ae_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l99_c37_86ae_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l99_c37_86ae_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l99_c21_5dd8]
signal MUX_uxn_c_l99_c21_5dd8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l99_c21_5dd8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l99_c21_5dd8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l99_c21_5dd8_return_output : unsigned(7 downto 0);

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7( ref_toks_0 : cpu_step_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base := ref_toks_0;
      base.ram_address := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base.is_ram_write := ref_toks_0;
      base.ram_address := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.vram_address := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_c_l65_c8_0a04
BIN_OP_AND_uxn_c_l65_c8_0a04 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l65_c8_0a04_left,
BIN_OP_AND_uxn_c_l65_c8_0a04_right,
BIN_OP_AND_uxn_c_l65_c8_0a04_return_output);

-- MUX_uxn_c_l65_c8_f7e1
MUX_uxn_c_l65_c8_f7e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l65_c8_f7e1_cond,
MUX_uxn_c_l65_c8_f7e1_iftrue,
MUX_uxn_c_l65_c8_f7e1_iffalse,
MUX_uxn_c_l65_c8_f7e1_return_output);

-- MUX_uxn_c_l66_c15_ebbe
MUX_uxn_c_l66_c15_ebbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l66_c15_ebbe_cond,
MUX_uxn_c_l66_c15_ebbe_iftrue,
MUX_uxn_c_l66_c15_ebbe_iffalse,
MUX_uxn_c_l66_c15_ebbe_return_output);

-- printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42
printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42 : entity work.printf_uxn_c_l68_c2_2c42_0CLK_de264c78 port map (
printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_CLOCK_ENABLE,
printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg0,
printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg1,
printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg2,
printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg3,
printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg4);

-- BIN_OP_EQ_uxn_c_l70_c6_47e5
BIN_OP_EQ_uxn_c_l70_c6_47e5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l70_c6_47e5_left,
BIN_OP_EQ_uxn_c_l70_c6_47e5_right,
BIN_OP_EQ_uxn_c_l70_c6_47e5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_return_output);

-- eval_opcode_result_MUX_uxn_c_l70_c2_c667
eval_opcode_result_MUX_uxn_c_l70_c2_c667 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l70_c2_c667_cond,
eval_opcode_result_MUX_uxn_c_l70_c2_c667_iftrue,
eval_opcode_result_MUX_uxn_c_l70_c2_c667_iffalse,
eval_opcode_result_MUX_uxn_c_l70_c2_c667_return_output);

-- is_ins_done_MUX_uxn_c_l70_c2_c667
is_ins_done_MUX_uxn_c_l70_c2_c667 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l70_c2_c667_cond,
is_ins_done_MUX_uxn_c_l70_c2_c667_iftrue,
is_ins_done_MUX_uxn_c_l70_c2_c667_iffalse,
is_ins_done_MUX_uxn_c_l70_c2_c667_return_output);

-- is_waiting_MUX_uxn_c_l70_c2_c667
is_waiting_MUX_uxn_c_l70_c2_c667 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l70_c2_c667_cond,
is_waiting_MUX_uxn_c_l70_c2_c667_iftrue,
is_waiting_MUX_uxn_c_l70_c2_c667_iffalse,
is_waiting_MUX_uxn_c_l70_c2_c667_return_output);

-- pc_MUX_uxn_c_l70_c2_c667
pc_MUX_uxn_c_l70_c2_c667 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l70_c2_c667_cond,
pc_MUX_uxn_c_l70_c2_c667_iftrue,
pc_MUX_uxn_c_l70_c2_c667_iffalse,
pc_MUX_uxn_c_l70_c2_c667_return_output);

-- cpu_step_result_MUX_uxn_c_l70_c2_c667
cpu_step_result_MUX_uxn_c_l70_c2_c667 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l70_c2_c667_cond,
cpu_step_result_MUX_uxn_c_l70_c2_c667_iftrue,
cpu_step_result_MUX_uxn_c_l70_c2_c667_iffalse,
cpu_step_result_MUX_uxn_c_l70_c2_c667_return_output);

-- ins_MUX_uxn_c_l70_c2_c667
ins_MUX_uxn_c_l70_c2_c667 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l70_c2_c667_cond,
ins_MUX_uxn_c_l70_c2_c667_iftrue,
ins_MUX_uxn_c_l70_c2_c667_iffalse,
ins_MUX_uxn_c_l70_c2_c667_return_output);

-- BIN_OP_EQ_uxn_c_l77_c11_2337
BIN_OP_EQ_uxn_c_l77_c11_2337 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l77_c11_2337_left,
BIN_OP_EQ_uxn_c_l77_c11_2337_right,
BIN_OP_EQ_uxn_c_l77_c11_2337_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_return_output);

-- eval_opcode_result_MUX_uxn_c_l77_c7_f02a
eval_opcode_result_MUX_uxn_c_l77_c7_f02a : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l77_c7_f02a_cond,
eval_opcode_result_MUX_uxn_c_l77_c7_f02a_iftrue,
eval_opcode_result_MUX_uxn_c_l77_c7_f02a_iffalse,
eval_opcode_result_MUX_uxn_c_l77_c7_f02a_return_output);

-- is_ins_done_MUX_uxn_c_l77_c7_f02a
is_ins_done_MUX_uxn_c_l77_c7_f02a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l77_c7_f02a_cond,
is_ins_done_MUX_uxn_c_l77_c7_f02a_iftrue,
is_ins_done_MUX_uxn_c_l77_c7_f02a_iffalse,
is_ins_done_MUX_uxn_c_l77_c7_f02a_return_output);

-- is_waiting_MUX_uxn_c_l77_c7_f02a
is_waiting_MUX_uxn_c_l77_c7_f02a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l77_c7_f02a_cond,
is_waiting_MUX_uxn_c_l77_c7_f02a_iftrue,
is_waiting_MUX_uxn_c_l77_c7_f02a_iffalse,
is_waiting_MUX_uxn_c_l77_c7_f02a_return_output);

-- pc_MUX_uxn_c_l77_c7_f02a
pc_MUX_uxn_c_l77_c7_f02a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l77_c7_f02a_cond,
pc_MUX_uxn_c_l77_c7_f02a_iftrue,
pc_MUX_uxn_c_l77_c7_f02a_iffalse,
pc_MUX_uxn_c_l77_c7_f02a_return_output);

-- cpu_step_result_MUX_uxn_c_l77_c7_f02a
cpu_step_result_MUX_uxn_c_l77_c7_f02a : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l77_c7_f02a_cond,
cpu_step_result_MUX_uxn_c_l77_c7_f02a_iftrue,
cpu_step_result_MUX_uxn_c_l77_c7_f02a_iffalse,
cpu_step_result_MUX_uxn_c_l77_c7_f02a_return_output);

-- ins_MUX_uxn_c_l77_c7_f02a
ins_MUX_uxn_c_l77_c7_f02a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l77_c7_f02a_cond,
ins_MUX_uxn_c_l77_c7_f02a_iftrue,
ins_MUX_uxn_c_l77_c7_f02a_iffalse,
ins_MUX_uxn_c_l77_c7_f02a_return_output);

-- BIN_OP_PLUS_uxn_c_l78_c3_3cbb
BIN_OP_PLUS_uxn_c_l78_c3_3cbb : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l78_c3_3cbb_left,
BIN_OP_PLUS_uxn_c_l78_c3_3cbb_right,
BIN_OP_PLUS_uxn_c_l78_c3_3cbb_return_output);

-- BIN_OP_EQ_uxn_c_l81_c9_0b40
BIN_OP_EQ_uxn_c_l81_c9_0b40 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l81_c9_0b40_left,
BIN_OP_EQ_uxn_c_l81_c9_0b40_right,
BIN_OP_EQ_uxn_c_l81_c9_0b40_return_output);

-- MUX_uxn_c_l81_c9_1ef5
MUX_uxn_c_l81_c9_1ef5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l81_c9_1ef5_cond,
MUX_uxn_c_l81_c9_1ef5_iftrue,
MUX_uxn_c_l81_c9_1ef5_iffalse,
MUX_uxn_c_l81_c9_1ef5_return_output);

-- BIN_OP_MINUS_uxn_c_l82_c43_9bc8
BIN_OP_MINUS_uxn_c_l82_c43_9bc8 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l82_c43_9bc8_left,
BIN_OP_MINUS_uxn_c_l82_c43_9bc8_right,
BIN_OP_MINUS_uxn_c_l82_c43_9bc8_return_output);

-- eval_opcode_phased_uxn_c_l82_c24_ef0b
eval_opcode_phased_uxn_c_l82_c24_ef0b : entity work.eval_opcode_phased_0CLK_5f229284 port map (
clk,
eval_opcode_phased_uxn_c_l82_c24_ef0b_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l82_c24_ef0b_phase,
eval_opcode_phased_uxn_c_l82_c24_ef0b_ins,
eval_opcode_phased_uxn_c_l82_c24_ef0b_pc,
eval_opcode_phased_uxn_c_l82_c24_ef0b_previous_ram_read,
eval_opcode_phased_uxn_c_l82_c24_ef0b_previous_device_ram_read,
eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output);

-- MUX_uxn_c_l83_c8_aefe
MUX_uxn_c_l83_c8_aefe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l83_c8_aefe_cond,
MUX_uxn_c_l83_c8_aefe_iftrue,
MUX_uxn_c_l83_c8_aefe_iffalse,
MUX_uxn_c_l83_c8_aefe_return_output);

-- BIN_OP_OR_uxn_c_l96_c6_2a11
BIN_OP_OR_uxn_c_l96_c6_2a11 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l96_c6_2a11_left,
BIN_OP_OR_uxn_c_l96_c6_2a11_right,
BIN_OP_OR_uxn_c_l96_c6_2a11_return_output);

-- step_cpu_phase_MUX_uxn_c_l96_c2_415c
step_cpu_phase_MUX_uxn_c_l96_c2_415c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l96_c2_415c_cond,
step_cpu_phase_MUX_uxn_c_l96_c2_415c_iftrue,
step_cpu_phase_MUX_uxn_c_l96_c2_415c_iffalse,
step_cpu_phase_MUX_uxn_c_l96_c2_415c_return_output);

-- BIN_OP_EQ_uxn_c_l99_c21_156a
BIN_OP_EQ_uxn_c_l99_c21_156a : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l99_c21_156a_left,
BIN_OP_EQ_uxn_c_l99_c21_156a_right,
BIN_OP_EQ_uxn_c_l99_c21_156a_return_output);

-- BIN_OP_PLUS_uxn_c_l99_c37_86ae
BIN_OP_PLUS_uxn_c_l99_c37_86ae : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l99_c37_86ae_left,
BIN_OP_PLUS_uxn_c_l99_c37_86ae_right,
BIN_OP_PLUS_uxn_c_l99_c37_86ae_return_output);

-- MUX_uxn_c_l99_c21_5dd8
MUX_uxn_c_l99_c21_5dd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l99_c21_5dd8_cond,
MUX_uxn_c_l99_c21_5dd8_iftrue,
MUX_uxn_c_l99_c21_5dd8_iffalse,
MUX_uxn_c_l99_c21_5dd8_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 previous_ram_read_value,
 previous_device_ram_read,
 use_vector,
 vector,
 -- Registers
 pc,
 ins,
 step_cpu_phase,
 is_ins_done,
 is_waiting,
 eval_opcode_result,
 cpu_step_result,
 -- All submodule outputs
 BIN_OP_AND_uxn_c_l65_c8_0a04_return_output,
 MUX_uxn_c_l65_c8_f7e1_return_output,
 MUX_uxn_c_l66_c15_ebbe_return_output,
 BIN_OP_EQ_uxn_c_l70_c6_47e5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_return_output,
 eval_opcode_result_MUX_uxn_c_l70_c2_c667_return_output,
 is_ins_done_MUX_uxn_c_l70_c2_c667_return_output,
 is_waiting_MUX_uxn_c_l70_c2_c667_return_output,
 pc_MUX_uxn_c_l70_c2_c667_return_output,
 cpu_step_result_MUX_uxn_c_l70_c2_c667_return_output,
 ins_MUX_uxn_c_l70_c2_c667_return_output,
 BIN_OP_EQ_uxn_c_l77_c11_2337_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_return_output,
 eval_opcode_result_MUX_uxn_c_l77_c7_f02a_return_output,
 is_ins_done_MUX_uxn_c_l77_c7_f02a_return_output,
 is_waiting_MUX_uxn_c_l77_c7_f02a_return_output,
 pc_MUX_uxn_c_l77_c7_f02a_return_output,
 cpu_step_result_MUX_uxn_c_l77_c7_f02a_return_output,
 ins_MUX_uxn_c_l77_c7_f02a_return_output,
 BIN_OP_PLUS_uxn_c_l78_c3_3cbb_return_output,
 BIN_OP_EQ_uxn_c_l81_c9_0b40_return_output,
 MUX_uxn_c_l81_c9_1ef5_return_output,
 BIN_OP_MINUS_uxn_c_l82_c43_9bc8_return_output,
 eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output,
 MUX_uxn_c_l83_c8_aefe_return_output,
 BIN_OP_OR_uxn_c_l96_c6_2a11_return_output,
 step_cpu_phase_MUX_uxn_c_l96_c2_415c_return_output,
 BIN_OP_EQ_uxn_c_l99_c21_156a_return_output,
 BIN_OP_PLUS_uxn_c_l99_c37_86ae_return_output,
 MUX_uxn_c_l99_c21_5dd8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l65_c2_2800 : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_f7e1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_f7e1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_f7e1_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l65_c8_0a04_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l65_c8_0a04_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l65_c8_0a04_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_f7e1_return_output : unsigned(15 downto 0);
 variable VAR_is_waiting_uxn_c_l66_c2_669c : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_ebbe_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_ebbe_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_ebbe_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_ebbe_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg4 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_47e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_47e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_47e5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_iffalse : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_c667_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_c667_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_f02a_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_c667_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_c667_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_c667_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_c667_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_f02a_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_c667_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_c667_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_c667_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_c667_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_f02a_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_c667_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_c667_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_c667_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_c667_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_f02a_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_c667_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_c667_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_c667_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l70_c2_c667_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_c667_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_f02a_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_c667_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_c667_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_c667_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_c667_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_f02a_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_c667_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_c667_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_2337_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_2337_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_2337_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_iffalse : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_f02a_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_f02a_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_f02a_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_f02a_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_f02a_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_f02a_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_f02a_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_f02a_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_f02a_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_f02a_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l78_c3_fac3 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_f02a_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_f02a_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_f02a_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_f02a_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l77_c7_f02a_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_f02a_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_f02a_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_f02a_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_f02a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_3cbb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_3cbb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_3cbb_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_1ef5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_1ef5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_1ef5_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c9_0b40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c9_0b40_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c9_0b40_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_1ef5_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_9bc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_9bc8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_9bc8_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l83_c8_aefe_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_aefe_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_aefe_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_2b69_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_aefe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_7979_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l86_c35_9af3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l87_c38_2a8e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l88_c34_19e8_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l89_c40_0de2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l90_c41_4ad1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l91_c30_0e12_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l92_c16_e5c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l93_c17_3607_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l96_c6_2a11_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l96_c6_2a11_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l96_c6_2a11_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_415c_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l97_c3_6fac : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_415c_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_415c_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_415c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_5dd8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_5dd8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_5dd8_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c21_156a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c21_156a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c21_156a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l99_c37_86ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l99_c37_86ae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l99_c37_86ae_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_5dd8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_c72d_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_pc : unsigned(15 downto 0);
variable REG_VAR_ins : unsigned(7 downto 0);
variable REG_VAR_step_cpu_phase : unsigned(7 downto 0);
variable REG_VAR_is_ins_done : unsigned(0 downto 0);
variable REG_VAR_is_waiting : unsigned(0 downto 0);
variable REG_VAR_eval_opcode_result : eval_opcode_result_t;
variable REG_VAR_cpu_step_result : cpu_step_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_pc := pc;
  REG_VAR_ins := ins;
  REG_VAR_step_cpu_phase := step_cpu_phase;
  REG_VAR_is_ins_done := is_ins_done;
  REG_VAR_is_waiting := is_waiting;
  REG_VAR_eval_opcode_result := eval_opcode_result;
  REG_VAR_cpu_step_result := cpu_step_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_c_l99_c37_86ae_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l81_c9_0b40_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l77_c11_2337_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_9bc8_right := to_unsigned(2, 2);
     VAR_is_ins_done_MUX_uxn_c_l70_c2_c667_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l66_c15_ebbe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l70_c6_47e5_right := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l97_c3_6fac := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_415c_iftrue := VAR_step_cpu_phase_uxn_c_l97_c3_6fac;
     VAR_MUX_uxn_c_l99_c21_5dd8_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_3cbb_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l99_c21_156a_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_previous_ram_read_value := previous_ram_read_value;
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_use_vector := use_vector;
     VAR_vector := vector;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_f02a_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_c667_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_f02a_iftrue := eval_opcode_result;
     VAR_MUX_uxn_c_l81_c9_1ef5_iffalse := ins;
     VAR_ins_MUX_uxn_c_l70_c2_c667_iftrue := ins;
     VAR_ins_MUX_uxn_c_l77_c7_f02a_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_f02a_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l65_c8_0a04_right := is_waiting;
     VAR_MUX_uxn_c_l66_c15_ebbe_iffalse := is_waiting;
     VAR_MUX_uxn_c_l65_c8_f7e1_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l81_c9_1ef5_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l70_c6_47e5_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l77_c11_2337_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l81_c9_0b40_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_9bc8_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l99_c37_86ae_left := step_cpu_phase;
     VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg0 := resize(step_cpu_phase, 32);
     VAR_BIN_OP_AND_uxn_c_l65_c8_0a04_left := VAR_use_vector;
     VAR_MUX_uxn_c_l66_c15_ebbe_cond := VAR_use_vector;
     VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg3 := resize(VAR_use_vector, 32);
     VAR_MUX_uxn_c_l65_c8_f7e1_iftrue := VAR_vector;
     VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg4 := resize(VAR_vector, 32);
     -- BIN_OP_EQ[uxn_c_l81_c9_0b40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l81_c9_0b40_left <= VAR_BIN_OP_EQ_uxn_c_l81_c9_0b40_left;
     BIN_OP_EQ_uxn_c_l81_c9_0b40_right <= VAR_BIN_OP_EQ_uxn_c_l81_c9_0b40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l81_c9_0b40_return_output := BIN_OP_EQ_uxn_c_l81_c9_0b40_return_output;

     -- BIN_OP_EQ[uxn_c_l70_c6_47e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l70_c6_47e5_left <= VAR_BIN_OP_EQ_uxn_c_l70_c6_47e5_left;
     BIN_OP_EQ_uxn_c_l70_c6_47e5_right <= VAR_BIN_OP_EQ_uxn_c_l70_c6_47e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l70_c6_47e5_return_output := BIN_OP_EQ_uxn_c_l70_c6_47e5_return_output;

     -- BIN_OP_EQ[uxn_c_l77_c11_2337] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l77_c11_2337_left <= VAR_BIN_OP_EQ_uxn_c_l77_c11_2337_left;
     BIN_OP_EQ_uxn_c_l77_c11_2337_right <= VAR_BIN_OP_EQ_uxn_c_l77_c11_2337_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l77_c11_2337_return_output := BIN_OP_EQ_uxn_c_l77_c11_2337_return_output;

     -- BIN_OP_PLUS[uxn_c_l99_c37_86ae] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l99_c37_86ae_left <= VAR_BIN_OP_PLUS_uxn_c_l99_c37_86ae_left;
     BIN_OP_PLUS_uxn_c_l99_c37_86ae_right <= VAR_BIN_OP_PLUS_uxn_c_l99_c37_86ae_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l99_c37_86ae_return_output := BIN_OP_PLUS_uxn_c_l99_c37_86ae_return_output;

     -- BIN_OP_AND[uxn_c_l65_c8_0a04] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l65_c8_0a04_left <= VAR_BIN_OP_AND_uxn_c_l65_c8_0a04_left;
     BIN_OP_AND_uxn_c_l65_c8_0a04_right <= VAR_BIN_OP_AND_uxn_c_l65_c8_0a04_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l65_c8_0a04_return_output := BIN_OP_AND_uxn_c_l65_c8_0a04_return_output;

     -- BIN_OP_MINUS[uxn_c_l82_c43_9bc8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l82_c43_9bc8_left <= VAR_BIN_OP_MINUS_uxn_c_l82_c43_9bc8_left;
     BIN_OP_MINUS_uxn_c_l82_c43_9bc8_right <= VAR_BIN_OP_MINUS_uxn_c_l82_c43_9bc8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_9bc8_return_output := BIN_OP_MINUS_uxn_c_l82_c43_9bc8_return_output;

     -- MUX[uxn_c_l66_c15_ebbe] LATENCY=0
     -- Inputs
     MUX_uxn_c_l66_c15_ebbe_cond <= VAR_MUX_uxn_c_l66_c15_ebbe_cond;
     MUX_uxn_c_l66_c15_ebbe_iftrue <= VAR_MUX_uxn_c_l66_c15_ebbe_iftrue;
     MUX_uxn_c_l66_c15_ebbe_iffalse <= VAR_MUX_uxn_c_l66_c15_ebbe_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l66_c15_ebbe_return_output := MUX_uxn_c_l66_c15_ebbe_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l65_c8_f7e1_cond := VAR_BIN_OP_AND_uxn_c_l65_c8_0a04_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_47e5_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_c667_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_47e5_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_c667_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_47e5_return_output;
     VAR_ins_MUX_uxn_c_l70_c2_c667_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_47e5_return_output;
     VAR_is_ins_done_MUX_uxn_c_l70_c2_c667_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_47e5_return_output;
     VAR_is_waiting_MUX_uxn_c_l70_c2_c667_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_47e5_return_output;
     VAR_pc_MUX_uxn_c_l70_c2_c667_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_47e5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_2337_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_f02a_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_2337_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_f02a_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_2337_return_output;
     VAR_ins_MUX_uxn_c_l77_c7_f02a_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_2337_return_output;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_f02a_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_2337_return_output;
     VAR_is_waiting_MUX_uxn_c_l77_c7_f02a_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_2337_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_f02a_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_2337_return_output;
     VAR_MUX_uxn_c_l81_c9_1ef5_cond := VAR_BIN_OP_EQ_uxn_c_l81_c9_0b40_return_output;
     VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_phase := VAR_BIN_OP_MINUS_uxn_c_l82_c43_9bc8_return_output;
     VAR_MUX_uxn_c_l99_c21_5dd8_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l99_c37_86ae_return_output, 8);
     VAR_is_waiting_uxn_c_l66_c2_669c := VAR_MUX_uxn_c_l66_c15_ebbe_return_output;
     VAR_is_waiting_MUX_uxn_c_l70_c2_c667_iftrue := VAR_is_waiting_uxn_c_l66_c2_669c;
     VAR_is_waiting_MUX_uxn_c_l77_c7_f02a_iftrue := VAR_is_waiting_uxn_c_l66_c2_669c;
     VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg2 := resize(VAR_is_waiting_uxn_c_l66_c2_669c, 32);
     -- MUX[uxn_c_l65_c8_f7e1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l65_c8_f7e1_cond <= VAR_MUX_uxn_c_l65_c8_f7e1_cond;
     MUX_uxn_c_l65_c8_f7e1_iftrue <= VAR_MUX_uxn_c_l65_c8_f7e1_iftrue;
     MUX_uxn_c_l65_c8_f7e1_iffalse <= VAR_MUX_uxn_c_l65_c8_f7e1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l65_c8_f7e1_return_output := MUX_uxn_c_l65_c8_f7e1_return_output;

     -- MUX[uxn_c_l81_c9_1ef5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l81_c9_1ef5_cond <= VAR_MUX_uxn_c_l81_c9_1ef5_cond;
     MUX_uxn_c_l81_c9_1ef5_iftrue <= VAR_MUX_uxn_c_l81_c9_1ef5_iftrue;
     MUX_uxn_c_l81_c9_1ef5_iffalse <= VAR_MUX_uxn_c_l81_c9_1ef5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l81_c9_1ef5_return_output := MUX_uxn_c_l81_c9_1ef5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l77_c7_f02a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_f02a_return_output;
     VAR_pc_uxn_c_l65_c2_2800 := VAR_MUX_uxn_c_l65_c8_f7e1_return_output;
     VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_ins := VAR_MUX_uxn_c_l81_c9_1ef5_return_output;
     VAR_ins_MUX_uxn_c_l77_c7_f02a_iffalse := VAR_MUX_uxn_c_l81_c9_1ef5_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_3cbb_left := VAR_pc_uxn_c_l65_c2_2800;
     VAR_MUX_uxn_c_l83_c8_aefe_iffalse := VAR_pc_uxn_c_l65_c2_2800;
     VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_pc := VAR_pc_uxn_c_l65_c2_2800;
     VAR_pc_MUX_uxn_c_l70_c2_c667_iftrue := VAR_pc_uxn_c_l65_c2_2800;
     VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg1 := resize(VAR_pc_uxn_c_l65_c2_2800, 32);
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_c354] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_return_output;

     -- printf_uxn_c_l68_c2_2c42[uxn_c_l68_c2_2c42] LATENCY=0
     -- Clock enable
     printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_CLOCK_ENABLE <= VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg0 <= VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg0;
     printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg1 <= VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg1;
     printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg2 <= VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg2;
     printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg3 <= VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg3;
     printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg4 <= VAR_printf_uxn_c_l68_c2_2c42_uxn_c_l68_c2_2c42_arg4;
     -- Outputs

     -- ins_MUX[uxn_c_l77_c7_f02a] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l77_c7_f02a_cond <= VAR_ins_MUX_uxn_c_l77_c7_f02a_cond;
     ins_MUX_uxn_c_l77_c7_f02a_iftrue <= VAR_ins_MUX_uxn_c_l77_c7_f02a_iftrue;
     ins_MUX_uxn_c_l77_c7_f02a_iffalse <= VAR_ins_MUX_uxn_c_l77_c7_f02a_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l77_c7_f02a_return_output := ins_MUX_uxn_c_l77_c7_f02a_return_output;

     -- BIN_OP_PLUS[uxn_c_l78_c3_3cbb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l78_c3_3cbb_left <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_3cbb_left;
     BIN_OP_PLUS_uxn_c_l78_c3_3cbb_right <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_3cbb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_3cbb_return_output := BIN_OP_PLUS_uxn_c_l78_c3_3cbb_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7[uxn_c_l70_c2_c667] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l70_c2_c667_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7(
     cpu_step_result,
     VAR_pc_uxn_c_l65_c2_2800,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- Submodule level 3
     VAR_pc_uxn_c_l78_c3_fac3 := resize(VAR_BIN_OP_PLUS_uxn_c_l78_c3_3cbb_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_c354_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_c667_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l70_c2_c667_return_output;
     VAR_ins_MUX_uxn_c_l70_c2_c667_iffalse := VAR_ins_MUX_uxn_c_l77_c7_f02a_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_f02a_iftrue := VAR_pc_uxn_c_l78_c3_fac3;
     -- eval_opcode_phased[uxn_c_l82_c24_ef0b] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l82_c24_ef0b_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l82_c24_ef0b_phase <= VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_phase;
     eval_opcode_phased_uxn_c_l82_c24_ef0b_ins <= VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_ins;
     eval_opcode_phased_uxn_c_l82_c24_ef0b_pc <= VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_pc;
     eval_opcode_phased_uxn_c_l82_c24_ef0b_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_previous_ram_read;
     eval_opcode_phased_uxn_c_l82_c24_ef0b_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output := eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output;

     -- ins_MUX[uxn_c_l70_c2_c667] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l70_c2_c667_cond <= VAR_ins_MUX_uxn_c_l70_c2_c667_cond;
     ins_MUX_uxn_c_l70_c2_c667_iftrue <= VAR_ins_MUX_uxn_c_l70_c2_c667_iftrue;
     ins_MUX_uxn_c_l70_c2_c667_iffalse <= VAR_ins_MUX_uxn_c_l70_c2_c667_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l70_c2_c667_return_output := ins_MUX_uxn_c_l70_c2_c667_return_output;

     -- Submodule level 4
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_f02a_iffalse := VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l70_c2_c667_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l93_c17_3607] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l93_c17_3607_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output.is_opc_done;

     -- eval_opcode_result_MUX[uxn_c_l77_c7_f02a] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l77_c7_f02a_cond <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_f02a_cond;
     eval_opcode_result_MUX_uxn_c_l77_c7_f02a_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_f02a_iftrue;
     eval_opcode_result_MUX_uxn_c_l77_c7_f02a_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_f02a_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_f02a_return_output := eval_opcode_result_MUX_uxn_c_l77_c7_f02a_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l83_c8_2b69] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_2b69_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output.is_pc_updated;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l91_c30_0e12] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l91_c30_0e12_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l90_c41_4ad1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l90_c41_4ad1_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l89_c40_0de2] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l89_c40_0de2_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output.device_ram_address;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_c72d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_c72d_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output.u16_value;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l88_c34_19e8] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l88_c34_19e8_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l87_c38_2a8e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l87_c38_2a8e_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l84_c34_7979] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_7979_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l92_c16_e5c7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l92_c16_e5c7_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l86_c35_9af3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l86_c35_9af3_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ef0b_return_output.is_vram_write;

     -- Submodule level 5
     VAR_MUX_uxn_c_l83_c8_aefe_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_c72d_return_output;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_f02a_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l93_c17_3607_return_output;
     VAR_MUX_uxn_c_l83_c8_aefe_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_2b69_return_output;
     VAR_is_waiting_MUX_uxn_c_l77_c7_f02a_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l92_c16_e5c7_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_c667_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l77_c7_f02a_return_output;
     -- is_waiting_MUX[uxn_c_l77_c7_f02a] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l77_c7_f02a_cond <= VAR_is_waiting_MUX_uxn_c_l77_c7_f02a_cond;
     is_waiting_MUX_uxn_c_l77_c7_f02a_iftrue <= VAR_is_waiting_MUX_uxn_c_l77_c7_f02a_iftrue;
     is_waiting_MUX_uxn_c_l77_c7_f02a_iffalse <= VAR_is_waiting_MUX_uxn_c_l77_c7_f02a_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l77_c7_f02a_return_output := is_waiting_MUX_uxn_c_l77_c7_f02a_return_output;

     -- is_ins_done_MUX[uxn_c_l77_c7_f02a] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l77_c7_f02a_cond <= VAR_is_ins_done_MUX_uxn_c_l77_c7_f02a_cond;
     is_ins_done_MUX_uxn_c_l77_c7_f02a_iftrue <= VAR_is_ins_done_MUX_uxn_c_l77_c7_f02a_iftrue;
     is_ins_done_MUX_uxn_c_l77_c7_f02a_iffalse <= VAR_is_ins_done_MUX_uxn_c_l77_c7_f02a_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l77_c7_f02a_return_output := is_ins_done_MUX_uxn_c_l77_c7_f02a_return_output;

     -- eval_opcode_result_MUX[uxn_c_l70_c2_c667] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l70_c2_c667_cond <= VAR_eval_opcode_result_MUX_uxn_c_l70_c2_c667_cond;
     eval_opcode_result_MUX_uxn_c_l70_c2_c667_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l70_c2_c667_iftrue;
     eval_opcode_result_MUX_uxn_c_l70_c2_c667_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l70_c2_c667_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_c667_return_output := eval_opcode_result_MUX_uxn_c_l70_c2_c667_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030[uxn_c_l77_c7_f02a] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l77_c7_f02a_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_7979_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_c72d_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l86_c35_9af3_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l87_c38_2a8e_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l88_c34_19e8_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l89_c40_0de2_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l90_c41_4ad1_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l91_c30_0e12_return_output);

     -- MUX[uxn_c_l83_c8_aefe] LATENCY=0
     -- Inputs
     MUX_uxn_c_l83_c8_aefe_cond <= VAR_MUX_uxn_c_l83_c8_aefe_cond;
     MUX_uxn_c_l83_c8_aefe_iftrue <= VAR_MUX_uxn_c_l83_c8_aefe_iftrue;
     MUX_uxn_c_l83_c8_aefe_iffalse <= VAR_MUX_uxn_c_l83_c8_aefe_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l83_c8_aefe_return_output := MUX_uxn_c_l83_c8_aefe_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l77_c7_f02a_iffalse := VAR_MUX_uxn_c_l83_c8_aefe_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_f02a_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l77_c7_f02a_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l70_c2_c667_return_output;
     VAR_is_ins_done_MUX_uxn_c_l70_c2_c667_iffalse := VAR_is_ins_done_MUX_uxn_c_l77_c7_f02a_return_output;
     VAR_is_waiting_MUX_uxn_c_l70_c2_c667_iffalse := VAR_is_waiting_MUX_uxn_c_l77_c7_f02a_return_output;
     -- pc_MUX[uxn_c_l77_c7_f02a] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l77_c7_f02a_cond <= VAR_pc_MUX_uxn_c_l77_c7_f02a_cond;
     pc_MUX_uxn_c_l77_c7_f02a_iftrue <= VAR_pc_MUX_uxn_c_l77_c7_f02a_iftrue;
     pc_MUX_uxn_c_l77_c7_f02a_iffalse <= VAR_pc_MUX_uxn_c_l77_c7_f02a_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l77_c7_f02a_return_output := pc_MUX_uxn_c_l77_c7_f02a_return_output;

     -- cpu_step_result_MUX[uxn_c_l77_c7_f02a] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l77_c7_f02a_cond <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_f02a_cond;
     cpu_step_result_MUX_uxn_c_l77_c7_f02a_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_f02a_iftrue;
     cpu_step_result_MUX_uxn_c_l77_c7_f02a_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_f02a_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_f02a_return_output := cpu_step_result_MUX_uxn_c_l77_c7_f02a_return_output;

     -- is_ins_done_MUX[uxn_c_l70_c2_c667] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l70_c2_c667_cond <= VAR_is_ins_done_MUX_uxn_c_l70_c2_c667_cond;
     is_ins_done_MUX_uxn_c_l70_c2_c667_iftrue <= VAR_is_ins_done_MUX_uxn_c_l70_c2_c667_iftrue;
     is_ins_done_MUX_uxn_c_l70_c2_c667_iffalse <= VAR_is_ins_done_MUX_uxn_c_l70_c2_c667_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l70_c2_c667_return_output := is_ins_done_MUX_uxn_c_l70_c2_c667_return_output;

     -- is_waiting_MUX[uxn_c_l70_c2_c667] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l70_c2_c667_cond <= VAR_is_waiting_MUX_uxn_c_l70_c2_c667_cond;
     is_waiting_MUX_uxn_c_l70_c2_c667_iftrue <= VAR_is_waiting_MUX_uxn_c_l70_c2_c667_iftrue;
     is_waiting_MUX_uxn_c_l70_c2_c667_iffalse <= VAR_is_waiting_MUX_uxn_c_l70_c2_c667_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l70_c2_c667_return_output := is_waiting_MUX_uxn_c_l70_c2_c667_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_c667_iffalse := VAR_cpu_step_result_MUX_uxn_c_l77_c7_f02a_return_output;
     VAR_BIN_OP_OR_uxn_c_l96_c6_2a11_left := VAR_is_ins_done_MUX_uxn_c_l70_c2_c667_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l70_c2_c667_return_output;
     VAR_BIN_OP_OR_uxn_c_l96_c6_2a11_right := VAR_is_waiting_MUX_uxn_c_l70_c2_c667_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l70_c2_c667_return_output;
     VAR_pc_MUX_uxn_c_l70_c2_c667_iffalse := VAR_pc_MUX_uxn_c_l77_c7_f02a_return_output;
     -- pc_MUX[uxn_c_l70_c2_c667] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l70_c2_c667_cond <= VAR_pc_MUX_uxn_c_l70_c2_c667_cond;
     pc_MUX_uxn_c_l70_c2_c667_iftrue <= VAR_pc_MUX_uxn_c_l70_c2_c667_iftrue;
     pc_MUX_uxn_c_l70_c2_c667_iffalse <= VAR_pc_MUX_uxn_c_l70_c2_c667_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l70_c2_c667_return_output := pc_MUX_uxn_c_l70_c2_c667_return_output;

     -- BIN_OP_OR[uxn_c_l96_c6_2a11] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l96_c6_2a11_left <= VAR_BIN_OP_OR_uxn_c_l96_c6_2a11_left;
     BIN_OP_OR_uxn_c_l96_c6_2a11_right <= VAR_BIN_OP_OR_uxn_c_l96_c6_2a11_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l96_c6_2a11_return_output := BIN_OP_OR_uxn_c_l96_c6_2a11_return_output;

     -- cpu_step_result_MUX[uxn_c_l70_c2_c667] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l70_c2_c667_cond <= VAR_cpu_step_result_MUX_uxn_c_l70_c2_c667_cond;
     cpu_step_result_MUX_uxn_c_l70_c2_c667_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l70_c2_c667_iftrue;
     cpu_step_result_MUX_uxn_c_l70_c2_c667_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l70_c2_c667_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_c667_return_output := cpu_step_result_MUX_uxn_c_l70_c2_c667_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_415c_cond := VAR_BIN_OP_OR_uxn_c_l96_c6_2a11_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l70_c2_c667_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l70_c2_c667_return_output;
     VAR_BIN_OP_EQ_uxn_c_l99_c21_156a_left := VAR_pc_MUX_uxn_c_l70_c2_c667_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l70_c2_c667_return_output;
     -- BIN_OP_EQ[uxn_c_l99_c21_156a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l99_c21_156a_left <= VAR_BIN_OP_EQ_uxn_c_l99_c21_156a_left;
     BIN_OP_EQ_uxn_c_l99_c21_156a_right <= VAR_BIN_OP_EQ_uxn_c_l99_c21_156a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l99_c21_156a_return_output := BIN_OP_EQ_uxn_c_l99_c21_156a_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l99_c21_5dd8_cond := VAR_BIN_OP_EQ_uxn_c_l99_c21_156a_return_output;
     -- MUX[uxn_c_l99_c21_5dd8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l99_c21_5dd8_cond <= VAR_MUX_uxn_c_l99_c21_5dd8_cond;
     MUX_uxn_c_l99_c21_5dd8_iftrue <= VAR_MUX_uxn_c_l99_c21_5dd8_iftrue;
     MUX_uxn_c_l99_c21_5dd8_iffalse <= VAR_MUX_uxn_c_l99_c21_5dd8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l99_c21_5dd8_return_output := MUX_uxn_c_l99_c21_5dd8_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_415c_iffalse := VAR_MUX_uxn_c_l99_c21_5dd8_return_output;
     -- step_cpu_phase_MUX[uxn_c_l96_c2_415c] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l96_c2_415c_cond <= VAR_step_cpu_phase_MUX_uxn_c_l96_c2_415c_cond;
     step_cpu_phase_MUX_uxn_c_l96_c2_415c_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l96_c2_415c_iftrue;
     step_cpu_phase_MUX_uxn_c_l96_c2_415c_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l96_c2_415c_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_415c_return_output := step_cpu_phase_MUX_uxn_c_l96_c2_415c_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l96_c2_415c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_pc <= REG_VAR_pc;
REG_COMB_ins <= REG_VAR_ins;
REG_COMB_step_cpu_phase <= REG_VAR_step_cpu_phase;
REG_COMB_is_ins_done <= REG_VAR_is_ins_done;
REG_COMB_is_waiting <= REG_VAR_is_waiting;
REG_COMB_eval_opcode_result <= REG_VAR_eval_opcode_result;
REG_COMB_cpu_step_result <= REG_VAR_cpu_step_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     pc <= REG_COMB_pc;
     ins <= REG_COMB_ins;
     step_cpu_phase <= REG_COMB_step_cpu_phase;
     is_ins_done <= REG_COMB_is_ins_done;
     is_waiting <= REG_COMB_is_waiting;
     eval_opcode_result <= REG_COMB_eval_opcode_result;
     cpu_step_result <= REG_COMB_cpu_step_result;
 end if;
 end if;
end process;

end arch;
