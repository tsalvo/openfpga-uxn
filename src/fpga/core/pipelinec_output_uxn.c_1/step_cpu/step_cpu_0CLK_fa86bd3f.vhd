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
entity step_cpu_0CLK_fa86bd3f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 use_vector : in unsigned(0 downto 0);
 vector : in unsigned(15 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_fa86bd3f;
architecture arch of step_cpu_0CLK_fa86bd3f is
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
-- BIN_OP_AND[uxn_c_l65_c8_9503]
signal BIN_OP_AND_uxn_c_l65_c8_9503_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l65_c8_9503_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l65_c8_9503_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l65_c8_fab5]
signal MUX_uxn_c_l65_c8_fab5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l65_c8_fab5_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l65_c8_fab5_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l65_c8_fab5_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l66_c15_26b6]
signal MUX_uxn_c_l66_c15_26b6_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l66_c15_26b6_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l66_c15_26b6_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l66_c15_26b6_return_output : unsigned(0 downto 0);

-- printf_uxn_c_l68_c2_dd7b[uxn_c_l68_c2_dd7b]
signal printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg2 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg3 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg4 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l70_c6_cad4]
signal BIN_OP_EQ_uxn_c_l70_c6_cad4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l70_c6_cad4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l70_c6_cad4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l77_c7_8f8d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l70_c2_5857]
signal ins_MUX_uxn_c_l70_c2_5857_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l70_c2_5857_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l70_c2_5857_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l70_c2_5857_return_output : unsigned(7 downto 0);

-- eval_opcode_result_MUX[uxn_c_l70_c2_5857]
signal eval_opcode_result_MUX_uxn_c_l70_c2_5857_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l70_c2_5857_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l70_c2_5857_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l70_c2_5857_return_output : eval_opcode_result_t;

-- is_ins_done_MUX[uxn_c_l70_c2_5857]
signal is_ins_done_MUX_uxn_c_l70_c2_5857_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l70_c2_5857_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l70_c2_5857_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l70_c2_5857_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l70_c2_5857]
signal pc_MUX_uxn_c_l70_c2_5857_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l70_c2_5857_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l70_c2_5857_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l70_c2_5857_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l70_c2_5857]
signal cpu_step_result_MUX_uxn_c_l70_c2_5857_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l70_c2_5857_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l70_c2_5857_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l70_c2_5857_return_output : cpu_step_result_t;

-- is_waiting_MUX[uxn_c_l70_c2_5857]
signal is_waiting_MUX_uxn_c_l70_c2_5857_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l70_c2_5857_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l70_c2_5857_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l70_c2_5857_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l77_c11_0a16]
signal BIN_OP_EQ_uxn_c_l77_c11_0a16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l77_c11_0a16_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l77_c11_0a16_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_cf47]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l77_c7_8f8d]
signal ins_MUX_uxn_c_l77_c7_8f8d_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l77_c7_8f8d_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l77_c7_8f8d_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l77_c7_8f8d_return_output : unsigned(7 downto 0);

-- eval_opcode_result_MUX[uxn_c_l77_c7_8f8d]
signal eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_return_output : eval_opcode_result_t;

-- is_ins_done_MUX[uxn_c_l77_c7_8f8d]
signal is_ins_done_MUX_uxn_c_l77_c7_8f8d_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_8f8d_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_8f8d_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_8f8d_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l77_c7_8f8d]
signal pc_MUX_uxn_c_l77_c7_8f8d_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l77_c7_8f8d_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l77_c7_8f8d_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l77_c7_8f8d_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l77_c7_8f8d]
signal cpu_step_result_MUX_uxn_c_l77_c7_8f8d_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l77_c7_8f8d_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l77_c7_8f8d_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l77_c7_8f8d_return_output : cpu_step_result_t;

-- is_waiting_MUX[uxn_c_l77_c7_8f8d]
signal is_waiting_MUX_uxn_c_l77_c7_8f8d_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l77_c7_8f8d_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l77_c7_8f8d_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l77_c7_8f8d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l78_c3_859f]
signal BIN_OP_PLUS_uxn_c_l78_c3_859f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_859f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_859f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l81_c9_17ba]
signal BIN_OP_EQ_uxn_c_l81_c9_17ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c9_17ba_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c9_17ba_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l81_c9_90c1]
signal MUX_uxn_c_l81_c9_90c1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c9_90c1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l81_c9_90c1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l81_c9_90c1_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l82_c43_6b7f]
signal BIN_OP_MINUS_uxn_c_l82_c43_6b7f_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l82_c43_6b7f_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l82_c43_6b7f_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l82_c24_ebbf]
signal eval_opcode_phased_uxn_c_l82_c24_ebbf_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ebbf_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ebbf_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ebbf_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ebbf_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ebbf_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l83_c8_b2e1]
signal MUX_uxn_c_l83_c8_b2e1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l83_c8_b2e1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l83_c8_b2e1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l83_c8_b2e1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l96_c6_fb34]
signal BIN_OP_OR_uxn_c_l96_c6_fb34_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l96_c6_fb34_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l96_c6_fb34_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l96_c2_f404]
signal step_cpu_phase_MUX_uxn_c_l96_c2_f404_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l96_c2_f404_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l96_c2_f404_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l96_c2_f404_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l99_c21_07fa]
signal BIN_OP_EQ_uxn_c_l99_c21_07fa_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c21_07fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c21_07fa_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l99_c37_fdcf]
signal BIN_OP_PLUS_uxn_c_l99_c37_fdcf_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l99_c37_fdcf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l99_c37_fdcf_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l99_c21_3a20]
signal MUX_uxn_c_l99_c21_3a20_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l99_c21_3a20_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l99_c21_3a20_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l99_c21_3a20_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_c_l65_c8_9503
BIN_OP_AND_uxn_c_l65_c8_9503 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l65_c8_9503_left,
BIN_OP_AND_uxn_c_l65_c8_9503_right,
BIN_OP_AND_uxn_c_l65_c8_9503_return_output);

-- MUX_uxn_c_l65_c8_fab5
MUX_uxn_c_l65_c8_fab5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l65_c8_fab5_cond,
MUX_uxn_c_l65_c8_fab5_iftrue,
MUX_uxn_c_l65_c8_fab5_iffalse,
MUX_uxn_c_l65_c8_fab5_return_output);

-- MUX_uxn_c_l66_c15_26b6
MUX_uxn_c_l66_c15_26b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l66_c15_26b6_cond,
MUX_uxn_c_l66_c15_26b6_iftrue,
MUX_uxn_c_l66_c15_26b6_iffalse,
MUX_uxn_c_l66_c15_26b6_return_output);

-- printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b
printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b : entity work.printf_uxn_c_l68_c2_dd7b_0CLK_de264c78 port map (
printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_CLOCK_ENABLE,
printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg0,
printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg1,
printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg2,
printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg3,
printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg4);

-- BIN_OP_EQ_uxn_c_l70_c6_cad4
BIN_OP_EQ_uxn_c_l70_c6_cad4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l70_c6_cad4_left,
BIN_OP_EQ_uxn_c_l70_c6_cad4_right,
BIN_OP_EQ_uxn_c_l70_c6_cad4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_return_output);

-- ins_MUX_uxn_c_l70_c2_5857
ins_MUX_uxn_c_l70_c2_5857 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l70_c2_5857_cond,
ins_MUX_uxn_c_l70_c2_5857_iftrue,
ins_MUX_uxn_c_l70_c2_5857_iffalse,
ins_MUX_uxn_c_l70_c2_5857_return_output);

-- eval_opcode_result_MUX_uxn_c_l70_c2_5857
eval_opcode_result_MUX_uxn_c_l70_c2_5857 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l70_c2_5857_cond,
eval_opcode_result_MUX_uxn_c_l70_c2_5857_iftrue,
eval_opcode_result_MUX_uxn_c_l70_c2_5857_iffalse,
eval_opcode_result_MUX_uxn_c_l70_c2_5857_return_output);

-- is_ins_done_MUX_uxn_c_l70_c2_5857
is_ins_done_MUX_uxn_c_l70_c2_5857 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l70_c2_5857_cond,
is_ins_done_MUX_uxn_c_l70_c2_5857_iftrue,
is_ins_done_MUX_uxn_c_l70_c2_5857_iffalse,
is_ins_done_MUX_uxn_c_l70_c2_5857_return_output);

-- pc_MUX_uxn_c_l70_c2_5857
pc_MUX_uxn_c_l70_c2_5857 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l70_c2_5857_cond,
pc_MUX_uxn_c_l70_c2_5857_iftrue,
pc_MUX_uxn_c_l70_c2_5857_iffalse,
pc_MUX_uxn_c_l70_c2_5857_return_output);

-- cpu_step_result_MUX_uxn_c_l70_c2_5857
cpu_step_result_MUX_uxn_c_l70_c2_5857 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l70_c2_5857_cond,
cpu_step_result_MUX_uxn_c_l70_c2_5857_iftrue,
cpu_step_result_MUX_uxn_c_l70_c2_5857_iffalse,
cpu_step_result_MUX_uxn_c_l70_c2_5857_return_output);

-- is_waiting_MUX_uxn_c_l70_c2_5857
is_waiting_MUX_uxn_c_l70_c2_5857 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l70_c2_5857_cond,
is_waiting_MUX_uxn_c_l70_c2_5857_iftrue,
is_waiting_MUX_uxn_c_l70_c2_5857_iffalse,
is_waiting_MUX_uxn_c_l70_c2_5857_return_output);

-- BIN_OP_EQ_uxn_c_l77_c11_0a16
BIN_OP_EQ_uxn_c_l77_c11_0a16 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l77_c11_0a16_left,
BIN_OP_EQ_uxn_c_l77_c11_0a16_right,
BIN_OP_EQ_uxn_c_l77_c11_0a16_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_return_output);

-- ins_MUX_uxn_c_l77_c7_8f8d
ins_MUX_uxn_c_l77_c7_8f8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l77_c7_8f8d_cond,
ins_MUX_uxn_c_l77_c7_8f8d_iftrue,
ins_MUX_uxn_c_l77_c7_8f8d_iffalse,
ins_MUX_uxn_c_l77_c7_8f8d_return_output);

-- eval_opcode_result_MUX_uxn_c_l77_c7_8f8d
eval_opcode_result_MUX_uxn_c_l77_c7_8f8d : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_cond,
eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_iftrue,
eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_iffalse,
eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_return_output);

-- is_ins_done_MUX_uxn_c_l77_c7_8f8d
is_ins_done_MUX_uxn_c_l77_c7_8f8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l77_c7_8f8d_cond,
is_ins_done_MUX_uxn_c_l77_c7_8f8d_iftrue,
is_ins_done_MUX_uxn_c_l77_c7_8f8d_iffalse,
is_ins_done_MUX_uxn_c_l77_c7_8f8d_return_output);

-- pc_MUX_uxn_c_l77_c7_8f8d
pc_MUX_uxn_c_l77_c7_8f8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l77_c7_8f8d_cond,
pc_MUX_uxn_c_l77_c7_8f8d_iftrue,
pc_MUX_uxn_c_l77_c7_8f8d_iffalse,
pc_MUX_uxn_c_l77_c7_8f8d_return_output);

-- cpu_step_result_MUX_uxn_c_l77_c7_8f8d
cpu_step_result_MUX_uxn_c_l77_c7_8f8d : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l77_c7_8f8d_cond,
cpu_step_result_MUX_uxn_c_l77_c7_8f8d_iftrue,
cpu_step_result_MUX_uxn_c_l77_c7_8f8d_iffalse,
cpu_step_result_MUX_uxn_c_l77_c7_8f8d_return_output);

-- is_waiting_MUX_uxn_c_l77_c7_8f8d
is_waiting_MUX_uxn_c_l77_c7_8f8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l77_c7_8f8d_cond,
is_waiting_MUX_uxn_c_l77_c7_8f8d_iftrue,
is_waiting_MUX_uxn_c_l77_c7_8f8d_iffalse,
is_waiting_MUX_uxn_c_l77_c7_8f8d_return_output);

-- BIN_OP_PLUS_uxn_c_l78_c3_859f
BIN_OP_PLUS_uxn_c_l78_c3_859f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l78_c3_859f_left,
BIN_OP_PLUS_uxn_c_l78_c3_859f_right,
BIN_OP_PLUS_uxn_c_l78_c3_859f_return_output);

-- BIN_OP_EQ_uxn_c_l81_c9_17ba
BIN_OP_EQ_uxn_c_l81_c9_17ba : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l81_c9_17ba_left,
BIN_OP_EQ_uxn_c_l81_c9_17ba_right,
BIN_OP_EQ_uxn_c_l81_c9_17ba_return_output);

-- MUX_uxn_c_l81_c9_90c1
MUX_uxn_c_l81_c9_90c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l81_c9_90c1_cond,
MUX_uxn_c_l81_c9_90c1_iftrue,
MUX_uxn_c_l81_c9_90c1_iffalse,
MUX_uxn_c_l81_c9_90c1_return_output);

-- BIN_OP_MINUS_uxn_c_l82_c43_6b7f
BIN_OP_MINUS_uxn_c_l82_c43_6b7f : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l82_c43_6b7f_left,
BIN_OP_MINUS_uxn_c_l82_c43_6b7f_right,
BIN_OP_MINUS_uxn_c_l82_c43_6b7f_return_output);

-- eval_opcode_phased_uxn_c_l82_c24_ebbf
eval_opcode_phased_uxn_c_l82_c24_ebbf : entity work.eval_opcode_phased_0CLK_7feed348 port map (
clk,
eval_opcode_phased_uxn_c_l82_c24_ebbf_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l82_c24_ebbf_phase,
eval_opcode_phased_uxn_c_l82_c24_ebbf_ins,
eval_opcode_phased_uxn_c_l82_c24_ebbf_pc,
eval_opcode_phased_uxn_c_l82_c24_ebbf_previous_ram_read,
eval_opcode_phased_uxn_c_l82_c24_ebbf_previous_device_ram_read,
eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output);

-- MUX_uxn_c_l83_c8_b2e1
MUX_uxn_c_l83_c8_b2e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l83_c8_b2e1_cond,
MUX_uxn_c_l83_c8_b2e1_iftrue,
MUX_uxn_c_l83_c8_b2e1_iffalse,
MUX_uxn_c_l83_c8_b2e1_return_output);

-- BIN_OP_OR_uxn_c_l96_c6_fb34
BIN_OP_OR_uxn_c_l96_c6_fb34 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l96_c6_fb34_left,
BIN_OP_OR_uxn_c_l96_c6_fb34_right,
BIN_OP_OR_uxn_c_l96_c6_fb34_return_output);

-- step_cpu_phase_MUX_uxn_c_l96_c2_f404
step_cpu_phase_MUX_uxn_c_l96_c2_f404 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l96_c2_f404_cond,
step_cpu_phase_MUX_uxn_c_l96_c2_f404_iftrue,
step_cpu_phase_MUX_uxn_c_l96_c2_f404_iffalse,
step_cpu_phase_MUX_uxn_c_l96_c2_f404_return_output);

-- BIN_OP_EQ_uxn_c_l99_c21_07fa
BIN_OP_EQ_uxn_c_l99_c21_07fa : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l99_c21_07fa_left,
BIN_OP_EQ_uxn_c_l99_c21_07fa_right,
BIN_OP_EQ_uxn_c_l99_c21_07fa_return_output);

-- BIN_OP_PLUS_uxn_c_l99_c37_fdcf
BIN_OP_PLUS_uxn_c_l99_c37_fdcf : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l99_c37_fdcf_left,
BIN_OP_PLUS_uxn_c_l99_c37_fdcf_right,
BIN_OP_PLUS_uxn_c_l99_c37_fdcf_return_output);

-- MUX_uxn_c_l99_c21_3a20
MUX_uxn_c_l99_c21_3a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l99_c21_3a20_cond,
MUX_uxn_c_l99_c21_3a20_iftrue,
MUX_uxn_c_l99_c21_3a20_iffalse,
MUX_uxn_c_l99_c21_3a20_return_output);



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
 BIN_OP_AND_uxn_c_l65_c8_9503_return_output,
 MUX_uxn_c_l65_c8_fab5_return_output,
 MUX_uxn_c_l66_c15_26b6_return_output,
 BIN_OP_EQ_uxn_c_l70_c6_cad4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_return_output,
 ins_MUX_uxn_c_l70_c2_5857_return_output,
 eval_opcode_result_MUX_uxn_c_l70_c2_5857_return_output,
 is_ins_done_MUX_uxn_c_l70_c2_5857_return_output,
 pc_MUX_uxn_c_l70_c2_5857_return_output,
 cpu_step_result_MUX_uxn_c_l70_c2_5857_return_output,
 is_waiting_MUX_uxn_c_l70_c2_5857_return_output,
 BIN_OP_EQ_uxn_c_l77_c11_0a16_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_return_output,
 ins_MUX_uxn_c_l77_c7_8f8d_return_output,
 eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_return_output,
 is_ins_done_MUX_uxn_c_l77_c7_8f8d_return_output,
 pc_MUX_uxn_c_l77_c7_8f8d_return_output,
 cpu_step_result_MUX_uxn_c_l77_c7_8f8d_return_output,
 is_waiting_MUX_uxn_c_l77_c7_8f8d_return_output,
 BIN_OP_PLUS_uxn_c_l78_c3_859f_return_output,
 BIN_OP_EQ_uxn_c_l81_c9_17ba_return_output,
 MUX_uxn_c_l81_c9_90c1_return_output,
 BIN_OP_MINUS_uxn_c_l82_c43_6b7f_return_output,
 eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output,
 MUX_uxn_c_l83_c8_b2e1_return_output,
 BIN_OP_OR_uxn_c_l96_c6_fb34_return_output,
 step_cpu_phase_MUX_uxn_c_l96_c2_f404_return_output,
 BIN_OP_EQ_uxn_c_l99_c21_07fa_return_output,
 BIN_OP_PLUS_uxn_c_l99_c37_fdcf_return_output,
 MUX_uxn_c_l99_c21_3a20_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l65_c2_7d9f : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_fab5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_fab5_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_fab5_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l65_c8_9503_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l65_c8_9503_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l65_c8_9503_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_fab5_return_output : unsigned(15 downto 0);
 variable VAR_is_waiting_uxn_c_l66_c2_db0b : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_26b6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_26b6_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_26b6_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_26b6_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg4 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_cad4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_cad4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_cad4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_5857_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_5857_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_8f8d_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_5857_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_5857_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_5857_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_5857_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_5857_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_5857_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_5857_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_5857_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_8f8d_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_5857_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_5857_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_5857_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_5857_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_8f8d_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_5857_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_5857_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_5857_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l70_c2_5857_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_5857_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_8f8d_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_5857_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_5857_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_5857_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_5857_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_8f8d_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_5857_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_5857_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_0a16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_0a16_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_0a16_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_8f8d_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_8f8d_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_8f8d_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_8f8d_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_8f8d_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_8f8d_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_8f8d_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l78_c3_9e08 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_8f8d_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_8f8d_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_8f8d_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_8f8d_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l77_c7_8f8d_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_8f8d_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_8f8d_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_8f8d_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_8f8d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_859f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_859f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_859f_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_90c1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_90c1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_90c1_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c9_17ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c9_17ba_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c9_17ba_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_90c1_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_6b7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_6b7f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_6b7f_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l83_c8_b2e1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_b2e1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_b2e1_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_b1d2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_b2e1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_d76b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l86_c35_50bb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l87_c38_f192_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l88_c34_4a83_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l89_c40_6b00_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l90_c41_9970_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l91_c30_edcf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l92_c16_3078_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l93_c17_8c17_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l96_c6_fb34_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l96_c6_fb34_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l96_c6_fb34_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f404_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l97_c3_c619 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f404_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f404_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f404_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_3a20_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_3a20_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_3a20_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c21_07fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c21_07fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c21_07fa_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l99_c37_fdcf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l99_c37_fdcf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l99_c37_fdcf_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_3a20_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_0911_return_output : unsigned(15 downto 0);
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
     VAR_BIN_OP_PLUS_uxn_c_l99_c37_fdcf_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l77_c11_0a16_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_iftrue := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l97_c3_c619 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f404_iftrue := VAR_step_cpu_phase_uxn_c_l97_c3_c619;
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_859f_right := to_unsigned(1, 1);
     VAR_is_ins_done_MUX_uxn_c_l70_c2_5857_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l66_c15_26b6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l70_c6_cad4_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l99_c21_3a20_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_6b7f_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l99_c21_07fa_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l81_c9_17ba_right := to_unsigned(2, 2);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_8f8d_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_5857_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_iftrue := eval_opcode_result;
     VAR_MUX_uxn_c_l81_c9_90c1_iffalse := ins;
     VAR_ins_MUX_uxn_c_l70_c2_5857_iftrue := ins;
     VAR_ins_MUX_uxn_c_l77_c7_8f8d_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_8f8d_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l65_c8_9503_right := is_waiting;
     VAR_MUX_uxn_c_l66_c15_26b6_iffalse := is_waiting;
     VAR_MUX_uxn_c_l65_c8_fab5_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l81_c9_90c1_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l70_c6_cad4_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l77_c11_0a16_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l81_c9_17ba_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_6b7f_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l99_c37_fdcf_left := step_cpu_phase;
     VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg0 := resize(step_cpu_phase, 32);
     VAR_BIN_OP_AND_uxn_c_l65_c8_9503_left := VAR_use_vector;
     VAR_MUX_uxn_c_l66_c15_26b6_cond := VAR_use_vector;
     VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg3 := resize(VAR_use_vector, 32);
     VAR_MUX_uxn_c_l65_c8_fab5_iftrue := VAR_vector;
     VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg4 := resize(VAR_vector, 32);
     -- BIN_OP_PLUS[uxn_c_l99_c37_fdcf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l99_c37_fdcf_left <= VAR_BIN_OP_PLUS_uxn_c_l99_c37_fdcf_left;
     BIN_OP_PLUS_uxn_c_l99_c37_fdcf_right <= VAR_BIN_OP_PLUS_uxn_c_l99_c37_fdcf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l99_c37_fdcf_return_output := BIN_OP_PLUS_uxn_c_l99_c37_fdcf_return_output;

     -- MUX[uxn_c_l66_c15_26b6] LATENCY=0
     -- Inputs
     MUX_uxn_c_l66_c15_26b6_cond <= VAR_MUX_uxn_c_l66_c15_26b6_cond;
     MUX_uxn_c_l66_c15_26b6_iftrue <= VAR_MUX_uxn_c_l66_c15_26b6_iftrue;
     MUX_uxn_c_l66_c15_26b6_iffalse <= VAR_MUX_uxn_c_l66_c15_26b6_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l66_c15_26b6_return_output := MUX_uxn_c_l66_c15_26b6_return_output;

     -- BIN_OP_MINUS[uxn_c_l82_c43_6b7f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l82_c43_6b7f_left <= VAR_BIN_OP_MINUS_uxn_c_l82_c43_6b7f_left;
     BIN_OP_MINUS_uxn_c_l82_c43_6b7f_right <= VAR_BIN_OP_MINUS_uxn_c_l82_c43_6b7f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_6b7f_return_output := BIN_OP_MINUS_uxn_c_l82_c43_6b7f_return_output;

     -- BIN_OP_EQ[uxn_c_l77_c11_0a16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l77_c11_0a16_left <= VAR_BIN_OP_EQ_uxn_c_l77_c11_0a16_left;
     BIN_OP_EQ_uxn_c_l77_c11_0a16_right <= VAR_BIN_OP_EQ_uxn_c_l77_c11_0a16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l77_c11_0a16_return_output := BIN_OP_EQ_uxn_c_l77_c11_0a16_return_output;

     -- BIN_OP_AND[uxn_c_l65_c8_9503] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l65_c8_9503_left <= VAR_BIN_OP_AND_uxn_c_l65_c8_9503_left;
     BIN_OP_AND_uxn_c_l65_c8_9503_right <= VAR_BIN_OP_AND_uxn_c_l65_c8_9503_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l65_c8_9503_return_output := BIN_OP_AND_uxn_c_l65_c8_9503_return_output;

     -- BIN_OP_EQ[uxn_c_l70_c6_cad4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l70_c6_cad4_left <= VAR_BIN_OP_EQ_uxn_c_l70_c6_cad4_left;
     BIN_OP_EQ_uxn_c_l70_c6_cad4_right <= VAR_BIN_OP_EQ_uxn_c_l70_c6_cad4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l70_c6_cad4_return_output := BIN_OP_EQ_uxn_c_l70_c6_cad4_return_output;

     -- BIN_OP_EQ[uxn_c_l81_c9_17ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l81_c9_17ba_left <= VAR_BIN_OP_EQ_uxn_c_l81_c9_17ba_left;
     BIN_OP_EQ_uxn_c_l81_c9_17ba_right <= VAR_BIN_OP_EQ_uxn_c_l81_c9_17ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l81_c9_17ba_return_output := BIN_OP_EQ_uxn_c_l81_c9_17ba_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l65_c8_fab5_cond := VAR_BIN_OP_AND_uxn_c_l65_c8_9503_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_cad4_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_5857_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_cad4_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_5857_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_cad4_return_output;
     VAR_ins_MUX_uxn_c_l70_c2_5857_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_cad4_return_output;
     VAR_is_ins_done_MUX_uxn_c_l70_c2_5857_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_cad4_return_output;
     VAR_is_waiting_MUX_uxn_c_l70_c2_5857_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_cad4_return_output;
     VAR_pc_MUX_uxn_c_l70_c2_5857_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_cad4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_0a16_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_8f8d_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_0a16_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_0a16_return_output;
     VAR_ins_MUX_uxn_c_l77_c7_8f8d_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_0a16_return_output;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_8f8d_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_0a16_return_output;
     VAR_is_waiting_MUX_uxn_c_l77_c7_8f8d_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_0a16_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_8f8d_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_0a16_return_output;
     VAR_MUX_uxn_c_l81_c9_90c1_cond := VAR_BIN_OP_EQ_uxn_c_l81_c9_17ba_return_output;
     VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_phase := VAR_BIN_OP_MINUS_uxn_c_l82_c43_6b7f_return_output;
     VAR_MUX_uxn_c_l99_c21_3a20_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l99_c37_fdcf_return_output, 8);
     VAR_is_waiting_uxn_c_l66_c2_db0b := VAR_MUX_uxn_c_l66_c15_26b6_return_output;
     VAR_is_waiting_MUX_uxn_c_l70_c2_5857_iftrue := VAR_is_waiting_uxn_c_l66_c2_db0b;
     VAR_is_waiting_MUX_uxn_c_l77_c7_8f8d_iftrue := VAR_is_waiting_uxn_c_l66_c2_db0b;
     VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg2 := resize(VAR_is_waiting_uxn_c_l66_c2_db0b, 32);
     -- MUX[uxn_c_l81_c9_90c1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l81_c9_90c1_cond <= VAR_MUX_uxn_c_l81_c9_90c1_cond;
     MUX_uxn_c_l81_c9_90c1_iftrue <= VAR_MUX_uxn_c_l81_c9_90c1_iftrue;
     MUX_uxn_c_l81_c9_90c1_iffalse <= VAR_MUX_uxn_c_l81_c9_90c1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l81_c9_90c1_return_output := MUX_uxn_c_l81_c9_90c1_return_output;

     -- MUX[uxn_c_l65_c8_fab5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l65_c8_fab5_cond <= VAR_MUX_uxn_c_l65_c8_fab5_cond;
     MUX_uxn_c_l65_c8_fab5_iftrue <= VAR_MUX_uxn_c_l65_c8_fab5_iftrue;
     MUX_uxn_c_l65_c8_fab5_iffalse <= VAR_MUX_uxn_c_l65_c8_fab5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l65_c8_fab5_return_output := MUX_uxn_c_l65_c8_fab5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l77_c7_8f8d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_8f8d_return_output;
     VAR_pc_uxn_c_l65_c2_7d9f := VAR_MUX_uxn_c_l65_c8_fab5_return_output;
     VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_ins := VAR_MUX_uxn_c_l81_c9_90c1_return_output;
     VAR_ins_MUX_uxn_c_l77_c7_8f8d_iffalse := VAR_MUX_uxn_c_l81_c9_90c1_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_859f_left := VAR_pc_uxn_c_l65_c2_7d9f;
     VAR_MUX_uxn_c_l83_c8_b2e1_iffalse := VAR_pc_uxn_c_l65_c2_7d9f;
     VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_pc := VAR_pc_uxn_c_l65_c2_7d9f;
     VAR_pc_MUX_uxn_c_l70_c2_5857_iftrue := VAR_pc_uxn_c_l65_c2_7d9f;
     VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg1 := resize(VAR_pc_uxn_c_l65_c2_7d9f, 32);
     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7[uxn_c_l70_c2_5857] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l70_c2_5857_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7(
     cpu_step_result,
     VAR_pc_uxn_c_l65_c2_7d9f,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- printf_uxn_c_l68_c2_dd7b[uxn_c_l68_c2_dd7b] LATENCY=0
     -- Clock enable
     printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_CLOCK_ENABLE <= VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg0 <= VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg0;
     printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg1 <= VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg1;
     printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg2 <= VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg2;
     printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg3 <= VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg3;
     printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg4 <= VAR_printf_uxn_c_l68_c2_dd7b_uxn_c_l68_c2_dd7b_arg4;
     -- Outputs

     -- BIN_OP_PLUS[uxn_c_l78_c3_859f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l78_c3_859f_left <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_859f_left;
     BIN_OP_PLUS_uxn_c_l78_c3_859f_right <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_859f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_859f_return_output := BIN_OP_PLUS_uxn_c_l78_c3_859f_return_output;

     -- ins_MUX[uxn_c_l77_c7_8f8d] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l77_c7_8f8d_cond <= VAR_ins_MUX_uxn_c_l77_c7_8f8d_cond;
     ins_MUX_uxn_c_l77_c7_8f8d_iftrue <= VAR_ins_MUX_uxn_c_l77_c7_8f8d_iftrue;
     ins_MUX_uxn_c_l77_c7_8f8d_iffalse <= VAR_ins_MUX_uxn_c_l77_c7_8f8d_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l77_c7_8f8d_return_output := ins_MUX_uxn_c_l77_c7_8f8d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_cf47] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_return_output;

     -- Submodule level 3
     VAR_pc_uxn_c_l78_c3_9e08 := resize(VAR_BIN_OP_PLUS_uxn_c_l78_c3_859f_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_cf47_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_5857_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l70_c2_5857_return_output;
     VAR_ins_MUX_uxn_c_l70_c2_5857_iffalse := VAR_ins_MUX_uxn_c_l77_c7_8f8d_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_8f8d_iftrue := VAR_pc_uxn_c_l78_c3_9e08;
     -- ins_MUX[uxn_c_l70_c2_5857] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l70_c2_5857_cond <= VAR_ins_MUX_uxn_c_l70_c2_5857_cond;
     ins_MUX_uxn_c_l70_c2_5857_iftrue <= VAR_ins_MUX_uxn_c_l70_c2_5857_iftrue;
     ins_MUX_uxn_c_l70_c2_5857_iffalse <= VAR_ins_MUX_uxn_c_l70_c2_5857_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l70_c2_5857_return_output := ins_MUX_uxn_c_l70_c2_5857_return_output;

     -- eval_opcode_phased[uxn_c_l82_c24_ebbf] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l82_c24_ebbf_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l82_c24_ebbf_phase <= VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_phase;
     eval_opcode_phased_uxn_c_l82_c24_ebbf_ins <= VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_ins;
     eval_opcode_phased_uxn_c_l82_c24_ebbf_pc <= VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_pc;
     eval_opcode_phased_uxn_c_l82_c24_ebbf_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_previous_ram_read;
     eval_opcode_phased_uxn_c_l82_c24_ebbf_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output := eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output;

     -- Submodule level 4
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_iffalse := VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l70_c2_5857_return_output;
     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l89_c40_6b00] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l89_c40_6b00_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l84_c34_d76b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_d76b_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l87_c38_f192] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l87_c38_f192_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output.vram_write_layer;

     -- eval_opcode_result_MUX[uxn_c_l77_c7_8f8d] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_cond <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_cond;
     eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_iftrue;
     eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_return_output := eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l90_c41_9970] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l90_c41_9970_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_0911 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_0911_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l83_c8_b1d2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_b1d2_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output.is_pc_updated;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l91_c30_edcf] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l91_c30_edcf_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output.u8_value;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l88_c34_4a83] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l88_c34_4a83_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l92_c16_3078] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l92_c16_3078_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l93_c17_8c17] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l93_c17_8c17_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l86_c35_50bb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l86_c35_50bb_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ebbf_return_output.is_vram_write;

     -- Submodule level 5
     VAR_MUX_uxn_c_l83_c8_b2e1_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_0911_return_output;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_8f8d_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l93_c17_8c17_return_output;
     VAR_MUX_uxn_c_l83_c8_b2e1_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_b1d2_return_output;
     VAR_is_waiting_MUX_uxn_c_l77_c7_8f8d_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l92_c16_3078_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_5857_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l77_c7_8f8d_return_output;
     -- is_ins_done_MUX[uxn_c_l77_c7_8f8d] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l77_c7_8f8d_cond <= VAR_is_ins_done_MUX_uxn_c_l77_c7_8f8d_cond;
     is_ins_done_MUX_uxn_c_l77_c7_8f8d_iftrue <= VAR_is_ins_done_MUX_uxn_c_l77_c7_8f8d_iftrue;
     is_ins_done_MUX_uxn_c_l77_c7_8f8d_iffalse <= VAR_is_ins_done_MUX_uxn_c_l77_c7_8f8d_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l77_c7_8f8d_return_output := is_ins_done_MUX_uxn_c_l77_c7_8f8d_return_output;

     -- is_waiting_MUX[uxn_c_l77_c7_8f8d] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l77_c7_8f8d_cond <= VAR_is_waiting_MUX_uxn_c_l77_c7_8f8d_cond;
     is_waiting_MUX_uxn_c_l77_c7_8f8d_iftrue <= VAR_is_waiting_MUX_uxn_c_l77_c7_8f8d_iftrue;
     is_waiting_MUX_uxn_c_l77_c7_8f8d_iffalse <= VAR_is_waiting_MUX_uxn_c_l77_c7_8f8d_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l77_c7_8f8d_return_output := is_waiting_MUX_uxn_c_l77_c7_8f8d_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030[uxn_c_l77_c7_8f8d] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l77_c7_8f8d_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_d76b_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_0911_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l86_c35_50bb_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l87_c38_f192_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l88_c34_4a83_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l89_c40_6b00_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l90_c41_9970_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l91_c30_edcf_return_output);

     -- eval_opcode_result_MUX[uxn_c_l70_c2_5857] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l70_c2_5857_cond <= VAR_eval_opcode_result_MUX_uxn_c_l70_c2_5857_cond;
     eval_opcode_result_MUX_uxn_c_l70_c2_5857_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l70_c2_5857_iftrue;
     eval_opcode_result_MUX_uxn_c_l70_c2_5857_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l70_c2_5857_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_5857_return_output := eval_opcode_result_MUX_uxn_c_l70_c2_5857_return_output;

     -- MUX[uxn_c_l83_c8_b2e1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l83_c8_b2e1_cond <= VAR_MUX_uxn_c_l83_c8_b2e1_cond;
     MUX_uxn_c_l83_c8_b2e1_iftrue <= VAR_MUX_uxn_c_l83_c8_b2e1_iftrue;
     MUX_uxn_c_l83_c8_b2e1_iffalse <= VAR_MUX_uxn_c_l83_c8_b2e1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l83_c8_b2e1_return_output := MUX_uxn_c_l83_c8_b2e1_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l77_c7_8f8d_iffalse := VAR_MUX_uxn_c_l83_c8_b2e1_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_8f8d_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l77_c7_8f8d_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l70_c2_5857_return_output;
     VAR_is_ins_done_MUX_uxn_c_l70_c2_5857_iffalse := VAR_is_ins_done_MUX_uxn_c_l77_c7_8f8d_return_output;
     VAR_is_waiting_MUX_uxn_c_l70_c2_5857_iffalse := VAR_is_waiting_MUX_uxn_c_l77_c7_8f8d_return_output;
     -- pc_MUX[uxn_c_l77_c7_8f8d] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l77_c7_8f8d_cond <= VAR_pc_MUX_uxn_c_l77_c7_8f8d_cond;
     pc_MUX_uxn_c_l77_c7_8f8d_iftrue <= VAR_pc_MUX_uxn_c_l77_c7_8f8d_iftrue;
     pc_MUX_uxn_c_l77_c7_8f8d_iffalse <= VAR_pc_MUX_uxn_c_l77_c7_8f8d_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l77_c7_8f8d_return_output := pc_MUX_uxn_c_l77_c7_8f8d_return_output;

     -- cpu_step_result_MUX[uxn_c_l77_c7_8f8d] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l77_c7_8f8d_cond <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_8f8d_cond;
     cpu_step_result_MUX_uxn_c_l77_c7_8f8d_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_8f8d_iftrue;
     cpu_step_result_MUX_uxn_c_l77_c7_8f8d_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_8f8d_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_8f8d_return_output := cpu_step_result_MUX_uxn_c_l77_c7_8f8d_return_output;

     -- is_ins_done_MUX[uxn_c_l70_c2_5857] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l70_c2_5857_cond <= VAR_is_ins_done_MUX_uxn_c_l70_c2_5857_cond;
     is_ins_done_MUX_uxn_c_l70_c2_5857_iftrue <= VAR_is_ins_done_MUX_uxn_c_l70_c2_5857_iftrue;
     is_ins_done_MUX_uxn_c_l70_c2_5857_iffalse <= VAR_is_ins_done_MUX_uxn_c_l70_c2_5857_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l70_c2_5857_return_output := is_ins_done_MUX_uxn_c_l70_c2_5857_return_output;

     -- is_waiting_MUX[uxn_c_l70_c2_5857] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l70_c2_5857_cond <= VAR_is_waiting_MUX_uxn_c_l70_c2_5857_cond;
     is_waiting_MUX_uxn_c_l70_c2_5857_iftrue <= VAR_is_waiting_MUX_uxn_c_l70_c2_5857_iftrue;
     is_waiting_MUX_uxn_c_l70_c2_5857_iffalse <= VAR_is_waiting_MUX_uxn_c_l70_c2_5857_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l70_c2_5857_return_output := is_waiting_MUX_uxn_c_l70_c2_5857_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_5857_iffalse := VAR_cpu_step_result_MUX_uxn_c_l77_c7_8f8d_return_output;
     VAR_BIN_OP_OR_uxn_c_l96_c6_fb34_left := VAR_is_ins_done_MUX_uxn_c_l70_c2_5857_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l70_c2_5857_return_output;
     VAR_BIN_OP_OR_uxn_c_l96_c6_fb34_right := VAR_is_waiting_MUX_uxn_c_l70_c2_5857_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l70_c2_5857_return_output;
     VAR_pc_MUX_uxn_c_l70_c2_5857_iffalse := VAR_pc_MUX_uxn_c_l77_c7_8f8d_return_output;
     -- BIN_OP_OR[uxn_c_l96_c6_fb34] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l96_c6_fb34_left <= VAR_BIN_OP_OR_uxn_c_l96_c6_fb34_left;
     BIN_OP_OR_uxn_c_l96_c6_fb34_right <= VAR_BIN_OP_OR_uxn_c_l96_c6_fb34_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l96_c6_fb34_return_output := BIN_OP_OR_uxn_c_l96_c6_fb34_return_output;

     -- pc_MUX[uxn_c_l70_c2_5857] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l70_c2_5857_cond <= VAR_pc_MUX_uxn_c_l70_c2_5857_cond;
     pc_MUX_uxn_c_l70_c2_5857_iftrue <= VAR_pc_MUX_uxn_c_l70_c2_5857_iftrue;
     pc_MUX_uxn_c_l70_c2_5857_iffalse <= VAR_pc_MUX_uxn_c_l70_c2_5857_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l70_c2_5857_return_output := pc_MUX_uxn_c_l70_c2_5857_return_output;

     -- cpu_step_result_MUX[uxn_c_l70_c2_5857] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l70_c2_5857_cond <= VAR_cpu_step_result_MUX_uxn_c_l70_c2_5857_cond;
     cpu_step_result_MUX_uxn_c_l70_c2_5857_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l70_c2_5857_iftrue;
     cpu_step_result_MUX_uxn_c_l70_c2_5857_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l70_c2_5857_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_5857_return_output := cpu_step_result_MUX_uxn_c_l70_c2_5857_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f404_cond := VAR_BIN_OP_OR_uxn_c_l96_c6_fb34_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l70_c2_5857_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l70_c2_5857_return_output;
     VAR_BIN_OP_EQ_uxn_c_l99_c21_07fa_left := VAR_pc_MUX_uxn_c_l70_c2_5857_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l70_c2_5857_return_output;
     -- BIN_OP_EQ[uxn_c_l99_c21_07fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l99_c21_07fa_left <= VAR_BIN_OP_EQ_uxn_c_l99_c21_07fa_left;
     BIN_OP_EQ_uxn_c_l99_c21_07fa_right <= VAR_BIN_OP_EQ_uxn_c_l99_c21_07fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l99_c21_07fa_return_output := BIN_OP_EQ_uxn_c_l99_c21_07fa_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l99_c21_3a20_cond := VAR_BIN_OP_EQ_uxn_c_l99_c21_07fa_return_output;
     -- MUX[uxn_c_l99_c21_3a20] LATENCY=0
     -- Inputs
     MUX_uxn_c_l99_c21_3a20_cond <= VAR_MUX_uxn_c_l99_c21_3a20_cond;
     MUX_uxn_c_l99_c21_3a20_iftrue <= VAR_MUX_uxn_c_l99_c21_3a20_iftrue;
     MUX_uxn_c_l99_c21_3a20_iffalse <= VAR_MUX_uxn_c_l99_c21_3a20_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l99_c21_3a20_return_output := MUX_uxn_c_l99_c21_3a20_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f404_iffalse := VAR_MUX_uxn_c_l99_c21_3a20_return_output;
     -- step_cpu_phase_MUX[uxn_c_l96_c2_f404] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l96_c2_f404_cond <= VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f404_cond;
     step_cpu_phase_MUX_uxn_c_l96_c2_f404_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f404_iftrue;
     step_cpu_phase_MUX_uxn_c_l96_c2_f404_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f404_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f404_return_output := step_cpu_phase_MUX_uxn_c_l96_c2_f404_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f404_return_output;
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
