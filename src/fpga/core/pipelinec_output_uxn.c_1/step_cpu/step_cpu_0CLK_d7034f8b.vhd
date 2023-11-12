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
-- BIN_OP_AND[uxn_c_l65_c8_0d59]
signal BIN_OP_AND_uxn_c_l65_c8_0d59_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l65_c8_0d59_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l65_c8_0d59_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l65_c8_24cd]
signal MUX_uxn_c_l65_c8_24cd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l65_c8_24cd_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l65_c8_24cd_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l65_c8_24cd_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l66_c15_7693]
signal MUX_uxn_c_l66_c15_7693_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l66_c15_7693_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l66_c15_7693_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l66_c15_7693_return_output : unsigned(0 downto 0);

-- printf_uxn_c_l68_c2_e2dd[uxn_c_l68_c2_e2dd]
signal printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg2 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg3 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg4 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l70_c6_7e9f]
signal BIN_OP_EQ_uxn_c_l70_c6_7e9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l70_c6_7e9f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l70_c6_7e9f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l77_c7_efd6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l70_c2_8806]
signal pc_MUX_uxn_c_l70_c2_8806_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l70_c2_8806_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l70_c2_8806_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l70_c2_8806_return_output : unsigned(15 downto 0);

-- is_waiting_MUX[uxn_c_l70_c2_8806]
signal is_waiting_MUX_uxn_c_l70_c2_8806_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l70_c2_8806_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l70_c2_8806_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l70_c2_8806_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l70_c2_8806]
signal cpu_step_result_MUX_uxn_c_l70_c2_8806_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l70_c2_8806_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l70_c2_8806_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l70_c2_8806_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l70_c2_8806]
signal ins_MUX_uxn_c_l70_c2_8806_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l70_c2_8806_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l70_c2_8806_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l70_c2_8806_return_output : unsigned(7 downto 0);

-- eval_opcode_result_MUX[uxn_c_l70_c2_8806]
signal eval_opcode_result_MUX_uxn_c_l70_c2_8806_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l70_c2_8806_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l70_c2_8806_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l70_c2_8806_return_output : eval_opcode_result_t;

-- is_ins_done_MUX[uxn_c_l70_c2_8806]
signal is_ins_done_MUX_uxn_c_l70_c2_8806_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l70_c2_8806_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l70_c2_8806_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l70_c2_8806_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l77_c11_b9ca]
signal BIN_OP_EQ_uxn_c_l77_c11_b9ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l77_c11_b9ca_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l77_c11_b9ca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_5539]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l77_c7_efd6]
signal pc_MUX_uxn_c_l77_c7_efd6_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l77_c7_efd6_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l77_c7_efd6_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l77_c7_efd6_return_output : unsigned(15 downto 0);

-- is_waiting_MUX[uxn_c_l77_c7_efd6]
signal is_waiting_MUX_uxn_c_l77_c7_efd6_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l77_c7_efd6_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l77_c7_efd6_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l77_c7_efd6_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l77_c7_efd6]
signal cpu_step_result_MUX_uxn_c_l77_c7_efd6_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l77_c7_efd6_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l77_c7_efd6_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l77_c7_efd6_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l77_c7_efd6]
signal ins_MUX_uxn_c_l77_c7_efd6_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l77_c7_efd6_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l77_c7_efd6_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l77_c7_efd6_return_output : unsigned(7 downto 0);

-- eval_opcode_result_MUX[uxn_c_l77_c7_efd6]
signal eval_opcode_result_MUX_uxn_c_l77_c7_efd6_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l77_c7_efd6_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l77_c7_efd6_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l77_c7_efd6_return_output : eval_opcode_result_t;

-- is_ins_done_MUX[uxn_c_l77_c7_efd6]
signal is_ins_done_MUX_uxn_c_l77_c7_efd6_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_efd6_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_efd6_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_efd6_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l78_c3_30fe]
signal BIN_OP_PLUS_uxn_c_l78_c3_30fe_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_30fe_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_30fe_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l81_c9_5269]
signal BIN_OP_EQ_uxn_c_l81_c9_5269_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c9_5269_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c9_5269_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l81_c9_d7fa]
signal MUX_uxn_c_l81_c9_d7fa_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c9_d7fa_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l81_c9_d7fa_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l81_c9_d7fa_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l82_c43_e176]
signal BIN_OP_MINUS_uxn_c_l82_c43_e176_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l82_c43_e176_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l82_c43_e176_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l82_c24_ed4e]
signal eval_opcode_phased_uxn_c_l82_c24_ed4e_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ed4e_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ed4e_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ed4e_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ed4e_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ed4e_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l83_c8_6077]
signal MUX_uxn_c_l83_c8_6077_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l83_c8_6077_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l83_c8_6077_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l83_c8_6077_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l96_c6_81ff]
signal BIN_OP_OR_uxn_c_l96_c6_81ff_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l96_c6_81ff_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l96_c6_81ff_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l96_c2_5209]
signal step_cpu_phase_MUX_uxn_c_l96_c2_5209_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l96_c2_5209_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l96_c2_5209_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l96_c2_5209_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l99_c21_24e5]
signal BIN_OP_EQ_uxn_c_l99_c21_24e5_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c21_24e5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c21_24e5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l99_c37_3f64]
signal BIN_OP_PLUS_uxn_c_l99_c37_3f64_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l99_c37_3f64_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l99_c37_3f64_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l99_c21_c251]
signal MUX_uxn_c_l99_c21_c251_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l99_c21_c251_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l99_c21_c251_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l99_c21_c251_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_c_l65_c8_0d59
BIN_OP_AND_uxn_c_l65_c8_0d59 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l65_c8_0d59_left,
BIN_OP_AND_uxn_c_l65_c8_0d59_right,
BIN_OP_AND_uxn_c_l65_c8_0d59_return_output);

-- MUX_uxn_c_l65_c8_24cd
MUX_uxn_c_l65_c8_24cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l65_c8_24cd_cond,
MUX_uxn_c_l65_c8_24cd_iftrue,
MUX_uxn_c_l65_c8_24cd_iffalse,
MUX_uxn_c_l65_c8_24cd_return_output);

-- MUX_uxn_c_l66_c15_7693
MUX_uxn_c_l66_c15_7693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l66_c15_7693_cond,
MUX_uxn_c_l66_c15_7693_iftrue,
MUX_uxn_c_l66_c15_7693_iffalse,
MUX_uxn_c_l66_c15_7693_return_output);

-- printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd
printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd : entity work.printf_uxn_c_l68_c2_e2dd_0CLK_de264c78 port map (
printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_CLOCK_ENABLE,
printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg0,
printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg1,
printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg2,
printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg3,
printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg4);

-- BIN_OP_EQ_uxn_c_l70_c6_7e9f
BIN_OP_EQ_uxn_c_l70_c6_7e9f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l70_c6_7e9f_left,
BIN_OP_EQ_uxn_c_l70_c6_7e9f_right,
BIN_OP_EQ_uxn_c_l70_c6_7e9f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_return_output);

-- pc_MUX_uxn_c_l70_c2_8806
pc_MUX_uxn_c_l70_c2_8806 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l70_c2_8806_cond,
pc_MUX_uxn_c_l70_c2_8806_iftrue,
pc_MUX_uxn_c_l70_c2_8806_iffalse,
pc_MUX_uxn_c_l70_c2_8806_return_output);

-- is_waiting_MUX_uxn_c_l70_c2_8806
is_waiting_MUX_uxn_c_l70_c2_8806 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l70_c2_8806_cond,
is_waiting_MUX_uxn_c_l70_c2_8806_iftrue,
is_waiting_MUX_uxn_c_l70_c2_8806_iffalse,
is_waiting_MUX_uxn_c_l70_c2_8806_return_output);

-- cpu_step_result_MUX_uxn_c_l70_c2_8806
cpu_step_result_MUX_uxn_c_l70_c2_8806 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l70_c2_8806_cond,
cpu_step_result_MUX_uxn_c_l70_c2_8806_iftrue,
cpu_step_result_MUX_uxn_c_l70_c2_8806_iffalse,
cpu_step_result_MUX_uxn_c_l70_c2_8806_return_output);

-- ins_MUX_uxn_c_l70_c2_8806
ins_MUX_uxn_c_l70_c2_8806 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l70_c2_8806_cond,
ins_MUX_uxn_c_l70_c2_8806_iftrue,
ins_MUX_uxn_c_l70_c2_8806_iffalse,
ins_MUX_uxn_c_l70_c2_8806_return_output);

-- eval_opcode_result_MUX_uxn_c_l70_c2_8806
eval_opcode_result_MUX_uxn_c_l70_c2_8806 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l70_c2_8806_cond,
eval_opcode_result_MUX_uxn_c_l70_c2_8806_iftrue,
eval_opcode_result_MUX_uxn_c_l70_c2_8806_iffalse,
eval_opcode_result_MUX_uxn_c_l70_c2_8806_return_output);

-- is_ins_done_MUX_uxn_c_l70_c2_8806
is_ins_done_MUX_uxn_c_l70_c2_8806 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l70_c2_8806_cond,
is_ins_done_MUX_uxn_c_l70_c2_8806_iftrue,
is_ins_done_MUX_uxn_c_l70_c2_8806_iffalse,
is_ins_done_MUX_uxn_c_l70_c2_8806_return_output);

-- BIN_OP_EQ_uxn_c_l77_c11_b9ca
BIN_OP_EQ_uxn_c_l77_c11_b9ca : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l77_c11_b9ca_left,
BIN_OP_EQ_uxn_c_l77_c11_b9ca_right,
BIN_OP_EQ_uxn_c_l77_c11_b9ca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_return_output);

-- pc_MUX_uxn_c_l77_c7_efd6
pc_MUX_uxn_c_l77_c7_efd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l77_c7_efd6_cond,
pc_MUX_uxn_c_l77_c7_efd6_iftrue,
pc_MUX_uxn_c_l77_c7_efd6_iffalse,
pc_MUX_uxn_c_l77_c7_efd6_return_output);

-- is_waiting_MUX_uxn_c_l77_c7_efd6
is_waiting_MUX_uxn_c_l77_c7_efd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l77_c7_efd6_cond,
is_waiting_MUX_uxn_c_l77_c7_efd6_iftrue,
is_waiting_MUX_uxn_c_l77_c7_efd6_iffalse,
is_waiting_MUX_uxn_c_l77_c7_efd6_return_output);

-- cpu_step_result_MUX_uxn_c_l77_c7_efd6
cpu_step_result_MUX_uxn_c_l77_c7_efd6 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l77_c7_efd6_cond,
cpu_step_result_MUX_uxn_c_l77_c7_efd6_iftrue,
cpu_step_result_MUX_uxn_c_l77_c7_efd6_iffalse,
cpu_step_result_MUX_uxn_c_l77_c7_efd6_return_output);

-- ins_MUX_uxn_c_l77_c7_efd6
ins_MUX_uxn_c_l77_c7_efd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l77_c7_efd6_cond,
ins_MUX_uxn_c_l77_c7_efd6_iftrue,
ins_MUX_uxn_c_l77_c7_efd6_iffalse,
ins_MUX_uxn_c_l77_c7_efd6_return_output);

-- eval_opcode_result_MUX_uxn_c_l77_c7_efd6
eval_opcode_result_MUX_uxn_c_l77_c7_efd6 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l77_c7_efd6_cond,
eval_opcode_result_MUX_uxn_c_l77_c7_efd6_iftrue,
eval_opcode_result_MUX_uxn_c_l77_c7_efd6_iffalse,
eval_opcode_result_MUX_uxn_c_l77_c7_efd6_return_output);

-- is_ins_done_MUX_uxn_c_l77_c7_efd6
is_ins_done_MUX_uxn_c_l77_c7_efd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l77_c7_efd6_cond,
is_ins_done_MUX_uxn_c_l77_c7_efd6_iftrue,
is_ins_done_MUX_uxn_c_l77_c7_efd6_iffalse,
is_ins_done_MUX_uxn_c_l77_c7_efd6_return_output);

-- BIN_OP_PLUS_uxn_c_l78_c3_30fe
BIN_OP_PLUS_uxn_c_l78_c3_30fe : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l78_c3_30fe_left,
BIN_OP_PLUS_uxn_c_l78_c3_30fe_right,
BIN_OP_PLUS_uxn_c_l78_c3_30fe_return_output);

-- BIN_OP_EQ_uxn_c_l81_c9_5269
BIN_OP_EQ_uxn_c_l81_c9_5269 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l81_c9_5269_left,
BIN_OP_EQ_uxn_c_l81_c9_5269_right,
BIN_OP_EQ_uxn_c_l81_c9_5269_return_output);

-- MUX_uxn_c_l81_c9_d7fa
MUX_uxn_c_l81_c9_d7fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l81_c9_d7fa_cond,
MUX_uxn_c_l81_c9_d7fa_iftrue,
MUX_uxn_c_l81_c9_d7fa_iffalse,
MUX_uxn_c_l81_c9_d7fa_return_output);

-- BIN_OP_MINUS_uxn_c_l82_c43_e176
BIN_OP_MINUS_uxn_c_l82_c43_e176 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l82_c43_e176_left,
BIN_OP_MINUS_uxn_c_l82_c43_e176_right,
BIN_OP_MINUS_uxn_c_l82_c43_e176_return_output);

-- eval_opcode_phased_uxn_c_l82_c24_ed4e
eval_opcode_phased_uxn_c_l82_c24_ed4e : entity work.eval_opcode_phased_0CLK_5f229284 port map (
clk,
eval_opcode_phased_uxn_c_l82_c24_ed4e_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l82_c24_ed4e_phase,
eval_opcode_phased_uxn_c_l82_c24_ed4e_ins,
eval_opcode_phased_uxn_c_l82_c24_ed4e_pc,
eval_opcode_phased_uxn_c_l82_c24_ed4e_previous_ram_read,
eval_opcode_phased_uxn_c_l82_c24_ed4e_previous_device_ram_read,
eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output);

-- MUX_uxn_c_l83_c8_6077
MUX_uxn_c_l83_c8_6077 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l83_c8_6077_cond,
MUX_uxn_c_l83_c8_6077_iftrue,
MUX_uxn_c_l83_c8_6077_iffalse,
MUX_uxn_c_l83_c8_6077_return_output);

-- BIN_OP_OR_uxn_c_l96_c6_81ff
BIN_OP_OR_uxn_c_l96_c6_81ff : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l96_c6_81ff_left,
BIN_OP_OR_uxn_c_l96_c6_81ff_right,
BIN_OP_OR_uxn_c_l96_c6_81ff_return_output);

-- step_cpu_phase_MUX_uxn_c_l96_c2_5209
step_cpu_phase_MUX_uxn_c_l96_c2_5209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l96_c2_5209_cond,
step_cpu_phase_MUX_uxn_c_l96_c2_5209_iftrue,
step_cpu_phase_MUX_uxn_c_l96_c2_5209_iffalse,
step_cpu_phase_MUX_uxn_c_l96_c2_5209_return_output);

-- BIN_OP_EQ_uxn_c_l99_c21_24e5
BIN_OP_EQ_uxn_c_l99_c21_24e5 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l99_c21_24e5_left,
BIN_OP_EQ_uxn_c_l99_c21_24e5_right,
BIN_OP_EQ_uxn_c_l99_c21_24e5_return_output);

-- BIN_OP_PLUS_uxn_c_l99_c37_3f64
BIN_OP_PLUS_uxn_c_l99_c37_3f64 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l99_c37_3f64_left,
BIN_OP_PLUS_uxn_c_l99_c37_3f64_right,
BIN_OP_PLUS_uxn_c_l99_c37_3f64_return_output);

-- MUX_uxn_c_l99_c21_c251
MUX_uxn_c_l99_c21_c251 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l99_c21_c251_cond,
MUX_uxn_c_l99_c21_c251_iftrue,
MUX_uxn_c_l99_c21_c251_iffalse,
MUX_uxn_c_l99_c21_c251_return_output);



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
 BIN_OP_AND_uxn_c_l65_c8_0d59_return_output,
 MUX_uxn_c_l65_c8_24cd_return_output,
 MUX_uxn_c_l66_c15_7693_return_output,
 BIN_OP_EQ_uxn_c_l70_c6_7e9f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_return_output,
 pc_MUX_uxn_c_l70_c2_8806_return_output,
 is_waiting_MUX_uxn_c_l70_c2_8806_return_output,
 cpu_step_result_MUX_uxn_c_l70_c2_8806_return_output,
 ins_MUX_uxn_c_l70_c2_8806_return_output,
 eval_opcode_result_MUX_uxn_c_l70_c2_8806_return_output,
 is_ins_done_MUX_uxn_c_l70_c2_8806_return_output,
 BIN_OP_EQ_uxn_c_l77_c11_b9ca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_return_output,
 pc_MUX_uxn_c_l77_c7_efd6_return_output,
 is_waiting_MUX_uxn_c_l77_c7_efd6_return_output,
 cpu_step_result_MUX_uxn_c_l77_c7_efd6_return_output,
 ins_MUX_uxn_c_l77_c7_efd6_return_output,
 eval_opcode_result_MUX_uxn_c_l77_c7_efd6_return_output,
 is_ins_done_MUX_uxn_c_l77_c7_efd6_return_output,
 BIN_OP_PLUS_uxn_c_l78_c3_30fe_return_output,
 BIN_OP_EQ_uxn_c_l81_c9_5269_return_output,
 MUX_uxn_c_l81_c9_d7fa_return_output,
 BIN_OP_MINUS_uxn_c_l82_c43_e176_return_output,
 eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output,
 MUX_uxn_c_l83_c8_6077_return_output,
 BIN_OP_OR_uxn_c_l96_c6_81ff_return_output,
 step_cpu_phase_MUX_uxn_c_l96_c2_5209_return_output,
 BIN_OP_EQ_uxn_c_l99_c21_24e5_return_output,
 BIN_OP_PLUS_uxn_c_l99_c37_3f64_return_output,
 MUX_uxn_c_l99_c21_c251_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l65_c2_e078 : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_24cd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_24cd_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_24cd_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l65_c8_0d59_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l65_c8_0d59_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l65_c8_0d59_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_24cd_return_output : unsigned(15 downto 0);
 variable VAR_is_waiting_uxn_c_l66_c2_e993 : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_7693_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_7693_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_7693_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_7693_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg4 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_7e9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_7e9f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_7e9f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_8806_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_8806_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_efd6_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_8806_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_8806_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_8806_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_8806_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_efd6_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_8806_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_8806_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_8806_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l70_c2_8806_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_8806_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_efd6_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_8806_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_8806_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_8806_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_8806_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_efd6_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_8806_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_8806_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_8806_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_8806_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_efd6_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_8806_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_8806_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_8806_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_8806_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_efd6_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_8806_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_8806_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_b9ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_b9ca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_b9ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_efd6_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l78_c3_45dc : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_efd6_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_efd6_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_efd6_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_efd6_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_efd6_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_efd6_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_efd6_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l77_c7_efd6_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_efd6_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_efd6_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_efd6_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_efd6_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_efd6_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_efd6_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_efd6_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_efd6_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_efd6_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_efd6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_30fe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_30fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_30fe_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_d7fa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_d7fa_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_d7fa_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c9_5269_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c9_5269_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c9_5269_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_d7fa_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_e176_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_e176_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_e176_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l83_c8_6077_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_6077_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_6077_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_cd38_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_6077_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_686d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l86_c35_bd3b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l87_c38_c1ac_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l88_c34_0448_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l89_c40_1ccd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l90_c41_5fae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l91_c30_75f3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l92_c16_6d2c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l93_c17_0fc7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l96_c6_81ff_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l96_c6_81ff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l96_c6_81ff_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_5209_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l97_c3_5b24 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_5209_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_5209_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_5209_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_c251_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_c251_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_c251_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c21_24e5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c21_24e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c21_24e5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l99_c37_3f64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l99_c37_3f64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l99_c37_3f64_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_c251_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_3bee_return_output : unsigned(15 downto 0);
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
     VAR_BIN_OP_EQ_uxn_c_l77_c11_b9ca_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l66_c15_7693_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l81_c9_5269_right := to_unsigned(2, 2);
     VAR_step_cpu_phase_uxn_c_l97_c3_5b24 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_5209_iftrue := VAR_step_cpu_phase_uxn_c_l97_c3_5b24;
     VAR_BIN_OP_PLUS_uxn_c_l99_c37_3f64_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l99_c21_24e5_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l70_c6_7e9f_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_30fe_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_e176_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l99_c21_c251_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_is_ins_done_MUX_uxn_c_l70_c2_8806_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_efd6_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_8806_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_efd6_iftrue := eval_opcode_result;
     VAR_MUX_uxn_c_l81_c9_d7fa_iffalse := ins;
     VAR_ins_MUX_uxn_c_l70_c2_8806_iftrue := ins;
     VAR_ins_MUX_uxn_c_l77_c7_efd6_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_efd6_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l65_c8_0d59_right := is_waiting;
     VAR_MUX_uxn_c_l66_c15_7693_iffalse := is_waiting;
     VAR_MUX_uxn_c_l65_c8_24cd_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l81_c9_d7fa_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l70_c6_7e9f_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l77_c11_b9ca_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l81_c9_5269_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_e176_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l99_c37_3f64_left := step_cpu_phase;
     VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg0 := resize(step_cpu_phase, 32);
     VAR_BIN_OP_AND_uxn_c_l65_c8_0d59_left := VAR_use_vector;
     VAR_MUX_uxn_c_l66_c15_7693_cond := VAR_use_vector;
     VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg3 := resize(VAR_use_vector, 32);
     VAR_MUX_uxn_c_l65_c8_24cd_iftrue := VAR_vector;
     VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg4 := resize(VAR_vector, 32);
     -- MUX[uxn_c_l66_c15_7693] LATENCY=0
     -- Inputs
     MUX_uxn_c_l66_c15_7693_cond <= VAR_MUX_uxn_c_l66_c15_7693_cond;
     MUX_uxn_c_l66_c15_7693_iftrue <= VAR_MUX_uxn_c_l66_c15_7693_iftrue;
     MUX_uxn_c_l66_c15_7693_iffalse <= VAR_MUX_uxn_c_l66_c15_7693_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l66_c15_7693_return_output := MUX_uxn_c_l66_c15_7693_return_output;

     -- BIN_OP_AND[uxn_c_l65_c8_0d59] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l65_c8_0d59_left <= VAR_BIN_OP_AND_uxn_c_l65_c8_0d59_left;
     BIN_OP_AND_uxn_c_l65_c8_0d59_right <= VAR_BIN_OP_AND_uxn_c_l65_c8_0d59_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l65_c8_0d59_return_output := BIN_OP_AND_uxn_c_l65_c8_0d59_return_output;

     -- BIN_OP_PLUS[uxn_c_l99_c37_3f64] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l99_c37_3f64_left <= VAR_BIN_OP_PLUS_uxn_c_l99_c37_3f64_left;
     BIN_OP_PLUS_uxn_c_l99_c37_3f64_right <= VAR_BIN_OP_PLUS_uxn_c_l99_c37_3f64_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l99_c37_3f64_return_output := BIN_OP_PLUS_uxn_c_l99_c37_3f64_return_output;

     -- BIN_OP_EQ[uxn_c_l81_c9_5269] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l81_c9_5269_left <= VAR_BIN_OP_EQ_uxn_c_l81_c9_5269_left;
     BIN_OP_EQ_uxn_c_l81_c9_5269_right <= VAR_BIN_OP_EQ_uxn_c_l81_c9_5269_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l81_c9_5269_return_output := BIN_OP_EQ_uxn_c_l81_c9_5269_return_output;

     -- BIN_OP_EQ[uxn_c_l77_c11_b9ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l77_c11_b9ca_left <= VAR_BIN_OP_EQ_uxn_c_l77_c11_b9ca_left;
     BIN_OP_EQ_uxn_c_l77_c11_b9ca_right <= VAR_BIN_OP_EQ_uxn_c_l77_c11_b9ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l77_c11_b9ca_return_output := BIN_OP_EQ_uxn_c_l77_c11_b9ca_return_output;

     -- BIN_OP_EQ[uxn_c_l70_c6_7e9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l70_c6_7e9f_left <= VAR_BIN_OP_EQ_uxn_c_l70_c6_7e9f_left;
     BIN_OP_EQ_uxn_c_l70_c6_7e9f_right <= VAR_BIN_OP_EQ_uxn_c_l70_c6_7e9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l70_c6_7e9f_return_output := BIN_OP_EQ_uxn_c_l70_c6_7e9f_return_output;

     -- BIN_OP_MINUS[uxn_c_l82_c43_e176] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l82_c43_e176_left <= VAR_BIN_OP_MINUS_uxn_c_l82_c43_e176_left;
     BIN_OP_MINUS_uxn_c_l82_c43_e176_right <= VAR_BIN_OP_MINUS_uxn_c_l82_c43_e176_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_e176_return_output := BIN_OP_MINUS_uxn_c_l82_c43_e176_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l65_c8_24cd_cond := VAR_BIN_OP_AND_uxn_c_l65_c8_0d59_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_7e9f_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_8806_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_7e9f_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_8806_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_7e9f_return_output;
     VAR_ins_MUX_uxn_c_l70_c2_8806_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_7e9f_return_output;
     VAR_is_ins_done_MUX_uxn_c_l70_c2_8806_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_7e9f_return_output;
     VAR_is_waiting_MUX_uxn_c_l70_c2_8806_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_7e9f_return_output;
     VAR_pc_MUX_uxn_c_l70_c2_8806_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_7e9f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_b9ca_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_efd6_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_b9ca_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_efd6_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_b9ca_return_output;
     VAR_ins_MUX_uxn_c_l77_c7_efd6_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_b9ca_return_output;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_efd6_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_b9ca_return_output;
     VAR_is_waiting_MUX_uxn_c_l77_c7_efd6_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_b9ca_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_efd6_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_b9ca_return_output;
     VAR_MUX_uxn_c_l81_c9_d7fa_cond := VAR_BIN_OP_EQ_uxn_c_l81_c9_5269_return_output;
     VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_phase := VAR_BIN_OP_MINUS_uxn_c_l82_c43_e176_return_output;
     VAR_MUX_uxn_c_l99_c21_c251_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l99_c37_3f64_return_output, 8);
     VAR_is_waiting_uxn_c_l66_c2_e993 := VAR_MUX_uxn_c_l66_c15_7693_return_output;
     VAR_is_waiting_MUX_uxn_c_l70_c2_8806_iftrue := VAR_is_waiting_uxn_c_l66_c2_e993;
     VAR_is_waiting_MUX_uxn_c_l77_c7_efd6_iftrue := VAR_is_waiting_uxn_c_l66_c2_e993;
     VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg2 := resize(VAR_is_waiting_uxn_c_l66_c2_e993, 32);
     -- MUX[uxn_c_l65_c8_24cd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l65_c8_24cd_cond <= VAR_MUX_uxn_c_l65_c8_24cd_cond;
     MUX_uxn_c_l65_c8_24cd_iftrue <= VAR_MUX_uxn_c_l65_c8_24cd_iftrue;
     MUX_uxn_c_l65_c8_24cd_iffalse <= VAR_MUX_uxn_c_l65_c8_24cd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l65_c8_24cd_return_output := MUX_uxn_c_l65_c8_24cd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l77_c7_efd6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_return_output;

     -- MUX[uxn_c_l81_c9_d7fa] LATENCY=0
     -- Inputs
     MUX_uxn_c_l81_c9_d7fa_cond <= VAR_MUX_uxn_c_l81_c9_d7fa_cond;
     MUX_uxn_c_l81_c9_d7fa_iftrue <= VAR_MUX_uxn_c_l81_c9_d7fa_iftrue;
     MUX_uxn_c_l81_c9_d7fa_iffalse <= VAR_MUX_uxn_c_l81_c9_d7fa_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l81_c9_d7fa_return_output := MUX_uxn_c_l81_c9_d7fa_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_efd6_return_output;
     VAR_pc_uxn_c_l65_c2_e078 := VAR_MUX_uxn_c_l65_c8_24cd_return_output;
     VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_ins := VAR_MUX_uxn_c_l81_c9_d7fa_return_output;
     VAR_ins_MUX_uxn_c_l77_c7_efd6_iffalse := VAR_MUX_uxn_c_l81_c9_d7fa_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_30fe_left := VAR_pc_uxn_c_l65_c2_e078;
     VAR_MUX_uxn_c_l83_c8_6077_iffalse := VAR_pc_uxn_c_l65_c2_e078;
     VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_pc := VAR_pc_uxn_c_l65_c2_e078;
     VAR_pc_MUX_uxn_c_l70_c2_8806_iftrue := VAR_pc_uxn_c_l65_c2_e078;
     VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg1 := resize(VAR_pc_uxn_c_l65_c2_e078, 32);
     -- ins_MUX[uxn_c_l77_c7_efd6] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l77_c7_efd6_cond <= VAR_ins_MUX_uxn_c_l77_c7_efd6_cond;
     ins_MUX_uxn_c_l77_c7_efd6_iftrue <= VAR_ins_MUX_uxn_c_l77_c7_efd6_iftrue;
     ins_MUX_uxn_c_l77_c7_efd6_iffalse <= VAR_ins_MUX_uxn_c_l77_c7_efd6_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l77_c7_efd6_return_output := ins_MUX_uxn_c_l77_c7_efd6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_5539] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_return_output;

     -- BIN_OP_PLUS[uxn_c_l78_c3_30fe] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l78_c3_30fe_left <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_30fe_left;
     BIN_OP_PLUS_uxn_c_l78_c3_30fe_right <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_30fe_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_30fe_return_output := BIN_OP_PLUS_uxn_c_l78_c3_30fe_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7[uxn_c_l70_c2_8806] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l70_c2_8806_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7(
     cpu_step_result,
     VAR_pc_uxn_c_l65_c2_e078,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- printf_uxn_c_l68_c2_e2dd[uxn_c_l68_c2_e2dd] LATENCY=0
     -- Clock enable
     printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_CLOCK_ENABLE <= VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg0 <= VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg0;
     printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg1 <= VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg1;
     printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg2 <= VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg2;
     printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg3 <= VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg3;
     printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg4 <= VAR_printf_uxn_c_l68_c2_e2dd_uxn_c_l68_c2_e2dd_arg4;
     -- Outputs

     -- Submodule level 3
     VAR_pc_uxn_c_l78_c3_45dc := resize(VAR_BIN_OP_PLUS_uxn_c_l78_c3_30fe_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5539_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_8806_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l70_c2_8806_return_output;
     VAR_ins_MUX_uxn_c_l70_c2_8806_iffalse := VAR_ins_MUX_uxn_c_l77_c7_efd6_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_efd6_iftrue := VAR_pc_uxn_c_l78_c3_45dc;
     -- eval_opcode_phased[uxn_c_l82_c24_ed4e] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l82_c24_ed4e_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l82_c24_ed4e_phase <= VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_phase;
     eval_opcode_phased_uxn_c_l82_c24_ed4e_ins <= VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_ins;
     eval_opcode_phased_uxn_c_l82_c24_ed4e_pc <= VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_pc;
     eval_opcode_phased_uxn_c_l82_c24_ed4e_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_previous_ram_read;
     eval_opcode_phased_uxn_c_l82_c24_ed4e_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output := eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output;

     -- ins_MUX[uxn_c_l70_c2_8806] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l70_c2_8806_cond <= VAR_ins_MUX_uxn_c_l70_c2_8806_cond;
     ins_MUX_uxn_c_l70_c2_8806_iftrue <= VAR_ins_MUX_uxn_c_l70_c2_8806_iftrue;
     ins_MUX_uxn_c_l70_c2_8806_iffalse <= VAR_ins_MUX_uxn_c_l70_c2_8806_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l70_c2_8806_return_output := ins_MUX_uxn_c_l70_c2_8806_return_output;

     -- Submodule level 4
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_efd6_iffalse := VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l70_c2_8806_return_output;
     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l91_c30_75f3] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l91_c30_75f3_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output.u8_value;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l88_c34_0448] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l88_c34_0448_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l86_c35_bd3b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l86_c35_bd3b_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l89_c40_1ccd] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l89_c40_1ccd_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l83_c8_cd38] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_cd38_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l84_c34_686d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_686d_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l87_c38_c1ac] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l87_c38_c1ac_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output.vram_write_layer;

     -- eval_opcode_result_MUX[uxn_c_l77_c7_efd6] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l77_c7_efd6_cond <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_efd6_cond;
     eval_opcode_result_MUX_uxn_c_l77_c7_efd6_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_efd6_iftrue;
     eval_opcode_result_MUX_uxn_c_l77_c7_efd6_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_efd6_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_efd6_return_output := eval_opcode_result_MUX_uxn_c_l77_c7_efd6_return_output;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_3bee LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_3bee_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l90_c41_5fae] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l90_c41_5fae_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l93_c17_0fc7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l93_c17_0fc7_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l92_c16_6d2c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l92_c16_6d2c_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_ed4e_return_output.is_waiting;

     -- Submodule level 5
     VAR_MUX_uxn_c_l83_c8_6077_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_3bee_return_output;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_efd6_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l93_c17_0fc7_return_output;
     VAR_MUX_uxn_c_l83_c8_6077_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_cd38_return_output;
     VAR_is_waiting_MUX_uxn_c_l77_c7_efd6_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l92_c16_6d2c_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_8806_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l77_c7_efd6_return_output;
     -- eval_opcode_result_MUX[uxn_c_l70_c2_8806] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l70_c2_8806_cond <= VAR_eval_opcode_result_MUX_uxn_c_l70_c2_8806_cond;
     eval_opcode_result_MUX_uxn_c_l70_c2_8806_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l70_c2_8806_iftrue;
     eval_opcode_result_MUX_uxn_c_l70_c2_8806_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l70_c2_8806_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_8806_return_output := eval_opcode_result_MUX_uxn_c_l70_c2_8806_return_output;

     -- MUX[uxn_c_l83_c8_6077] LATENCY=0
     -- Inputs
     MUX_uxn_c_l83_c8_6077_cond <= VAR_MUX_uxn_c_l83_c8_6077_cond;
     MUX_uxn_c_l83_c8_6077_iftrue <= VAR_MUX_uxn_c_l83_c8_6077_iftrue;
     MUX_uxn_c_l83_c8_6077_iffalse <= VAR_MUX_uxn_c_l83_c8_6077_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l83_c8_6077_return_output := MUX_uxn_c_l83_c8_6077_return_output;

     -- is_ins_done_MUX[uxn_c_l77_c7_efd6] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l77_c7_efd6_cond <= VAR_is_ins_done_MUX_uxn_c_l77_c7_efd6_cond;
     is_ins_done_MUX_uxn_c_l77_c7_efd6_iftrue <= VAR_is_ins_done_MUX_uxn_c_l77_c7_efd6_iftrue;
     is_ins_done_MUX_uxn_c_l77_c7_efd6_iffalse <= VAR_is_ins_done_MUX_uxn_c_l77_c7_efd6_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l77_c7_efd6_return_output := is_ins_done_MUX_uxn_c_l77_c7_efd6_return_output;

     -- is_waiting_MUX[uxn_c_l77_c7_efd6] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l77_c7_efd6_cond <= VAR_is_waiting_MUX_uxn_c_l77_c7_efd6_cond;
     is_waiting_MUX_uxn_c_l77_c7_efd6_iftrue <= VAR_is_waiting_MUX_uxn_c_l77_c7_efd6_iftrue;
     is_waiting_MUX_uxn_c_l77_c7_efd6_iffalse <= VAR_is_waiting_MUX_uxn_c_l77_c7_efd6_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l77_c7_efd6_return_output := is_waiting_MUX_uxn_c_l77_c7_efd6_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030[uxn_c_l77_c7_efd6] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l77_c7_efd6_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_686d_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_3bee_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l86_c35_bd3b_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l87_c38_c1ac_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l88_c34_0448_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l89_c40_1ccd_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l90_c41_5fae_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l91_c30_75f3_return_output);

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l77_c7_efd6_iffalse := VAR_MUX_uxn_c_l83_c8_6077_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_efd6_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l77_c7_efd6_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l70_c2_8806_return_output;
     VAR_is_ins_done_MUX_uxn_c_l70_c2_8806_iffalse := VAR_is_ins_done_MUX_uxn_c_l77_c7_efd6_return_output;
     VAR_is_waiting_MUX_uxn_c_l70_c2_8806_iffalse := VAR_is_waiting_MUX_uxn_c_l77_c7_efd6_return_output;
     -- cpu_step_result_MUX[uxn_c_l77_c7_efd6] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l77_c7_efd6_cond <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_efd6_cond;
     cpu_step_result_MUX_uxn_c_l77_c7_efd6_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_efd6_iftrue;
     cpu_step_result_MUX_uxn_c_l77_c7_efd6_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_efd6_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_efd6_return_output := cpu_step_result_MUX_uxn_c_l77_c7_efd6_return_output;

     -- is_waiting_MUX[uxn_c_l70_c2_8806] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l70_c2_8806_cond <= VAR_is_waiting_MUX_uxn_c_l70_c2_8806_cond;
     is_waiting_MUX_uxn_c_l70_c2_8806_iftrue <= VAR_is_waiting_MUX_uxn_c_l70_c2_8806_iftrue;
     is_waiting_MUX_uxn_c_l70_c2_8806_iffalse <= VAR_is_waiting_MUX_uxn_c_l70_c2_8806_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l70_c2_8806_return_output := is_waiting_MUX_uxn_c_l70_c2_8806_return_output;

     -- pc_MUX[uxn_c_l77_c7_efd6] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l77_c7_efd6_cond <= VAR_pc_MUX_uxn_c_l77_c7_efd6_cond;
     pc_MUX_uxn_c_l77_c7_efd6_iftrue <= VAR_pc_MUX_uxn_c_l77_c7_efd6_iftrue;
     pc_MUX_uxn_c_l77_c7_efd6_iffalse <= VAR_pc_MUX_uxn_c_l77_c7_efd6_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l77_c7_efd6_return_output := pc_MUX_uxn_c_l77_c7_efd6_return_output;

     -- is_ins_done_MUX[uxn_c_l70_c2_8806] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l70_c2_8806_cond <= VAR_is_ins_done_MUX_uxn_c_l70_c2_8806_cond;
     is_ins_done_MUX_uxn_c_l70_c2_8806_iftrue <= VAR_is_ins_done_MUX_uxn_c_l70_c2_8806_iftrue;
     is_ins_done_MUX_uxn_c_l70_c2_8806_iffalse <= VAR_is_ins_done_MUX_uxn_c_l70_c2_8806_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l70_c2_8806_return_output := is_ins_done_MUX_uxn_c_l70_c2_8806_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_8806_iffalse := VAR_cpu_step_result_MUX_uxn_c_l77_c7_efd6_return_output;
     VAR_BIN_OP_OR_uxn_c_l96_c6_81ff_left := VAR_is_ins_done_MUX_uxn_c_l70_c2_8806_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l70_c2_8806_return_output;
     VAR_BIN_OP_OR_uxn_c_l96_c6_81ff_right := VAR_is_waiting_MUX_uxn_c_l70_c2_8806_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l70_c2_8806_return_output;
     VAR_pc_MUX_uxn_c_l70_c2_8806_iffalse := VAR_pc_MUX_uxn_c_l77_c7_efd6_return_output;
     -- cpu_step_result_MUX[uxn_c_l70_c2_8806] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l70_c2_8806_cond <= VAR_cpu_step_result_MUX_uxn_c_l70_c2_8806_cond;
     cpu_step_result_MUX_uxn_c_l70_c2_8806_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l70_c2_8806_iftrue;
     cpu_step_result_MUX_uxn_c_l70_c2_8806_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l70_c2_8806_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_8806_return_output := cpu_step_result_MUX_uxn_c_l70_c2_8806_return_output;

     -- BIN_OP_OR[uxn_c_l96_c6_81ff] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l96_c6_81ff_left <= VAR_BIN_OP_OR_uxn_c_l96_c6_81ff_left;
     BIN_OP_OR_uxn_c_l96_c6_81ff_right <= VAR_BIN_OP_OR_uxn_c_l96_c6_81ff_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l96_c6_81ff_return_output := BIN_OP_OR_uxn_c_l96_c6_81ff_return_output;

     -- pc_MUX[uxn_c_l70_c2_8806] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l70_c2_8806_cond <= VAR_pc_MUX_uxn_c_l70_c2_8806_cond;
     pc_MUX_uxn_c_l70_c2_8806_iftrue <= VAR_pc_MUX_uxn_c_l70_c2_8806_iftrue;
     pc_MUX_uxn_c_l70_c2_8806_iffalse <= VAR_pc_MUX_uxn_c_l70_c2_8806_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l70_c2_8806_return_output := pc_MUX_uxn_c_l70_c2_8806_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_5209_cond := VAR_BIN_OP_OR_uxn_c_l96_c6_81ff_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l70_c2_8806_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l70_c2_8806_return_output;
     VAR_BIN_OP_EQ_uxn_c_l99_c21_24e5_left := VAR_pc_MUX_uxn_c_l70_c2_8806_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l70_c2_8806_return_output;
     -- BIN_OP_EQ[uxn_c_l99_c21_24e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l99_c21_24e5_left <= VAR_BIN_OP_EQ_uxn_c_l99_c21_24e5_left;
     BIN_OP_EQ_uxn_c_l99_c21_24e5_right <= VAR_BIN_OP_EQ_uxn_c_l99_c21_24e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l99_c21_24e5_return_output := BIN_OP_EQ_uxn_c_l99_c21_24e5_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l99_c21_c251_cond := VAR_BIN_OP_EQ_uxn_c_l99_c21_24e5_return_output;
     -- MUX[uxn_c_l99_c21_c251] LATENCY=0
     -- Inputs
     MUX_uxn_c_l99_c21_c251_cond <= VAR_MUX_uxn_c_l99_c21_c251_cond;
     MUX_uxn_c_l99_c21_c251_iftrue <= VAR_MUX_uxn_c_l99_c21_c251_iftrue;
     MUX_uxn_c_l99_c21_c251_iffalse <= VAR_MUX_uxn_c_l99_c21_c251_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l99_c21_c251_return_output := MUX_uxn_c_l99_c21_c251_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_5209_iffalse := VAR_MUX_uxn_c_l99_c21_c251_return_output;
     -- step_cpu_phase_MUX[uxn_c_l96_c2_5209] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l96_c2_5209_cond <= VAR_step_cpu_phase_MUX_uxn_c_l96_c2_5209_cond;
     step_cpu_phase_MUX_uxn_c_l96_c2_5209_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l96_c2_5209_iftrue;
     step_cpu_phase_MUX_uxn_c_l96_c2_5209_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l96_c2_5209_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_5209_return_output := step_cpu_phase_MUX_uxn_c_l96_c2_5209_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l96_c2_5209_return_output;
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
