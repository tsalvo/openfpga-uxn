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
entity step_cpu_0CLK_ddde2ec8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 use_vector : in unsigned(0 downto 0);
 vector : in unsigned(15 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_ddde2ec8;
architecture arch of step_cpu_0CLK_ddde2ec8 is
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
vram_address => to_unsigned(0, 24),
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
-- BIN_OP_AND[uxn_c_l65_c8_b919]
signal BIN_OP_AND_uxn_c_l65_c8_b919_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l65_c8_b919_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l65_c8_b919_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l65_c8_6f27]
signal MUX_uxn_c_l65_c8_6f27_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l65_c8_6f27_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l65_c8_6f27_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l65_c8_6f27_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l66_c15_53c0]
signal MUX_uxn_c_l66_c15_53c0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l66_c15_53c0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l66_c15_53c0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l66_c15_53c0_return_output : unsigned(0 downto 0);

-- printf_uxn_c_l68_c2_8265[uxn_c_l68_c2_8265]
signal printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg2 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg3 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg4 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l70_c6_4e30]
signal BIN_OP_EQ_uxn_c_l70_c6_4e30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l70_c6_4e30_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l70_c6_4e30_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l77_c7_5b1e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l70_c2_1fb6]
signal ins_MUX_uxn_c_l70_c2_1fb6_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l70_c2_1fb6_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l70_c2_1fb6_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l70_c2_1fb6_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l70_c2_1fb6]
signal pc_MUX_uxn_c_l70_c2_1fb6_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l70_c2_1fb6_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l70_c2_1fb6_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l70_c2_1fb6_return_output : unsigned(15 downto 0);

-- is_ins_done_MUX[uxn_c_l70_c2_1fb6]
signal is_ins_done_MUX_uxn_c_l70_c2_1fb6_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l70_c2_1fb6_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l70_c2_1fb6_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l70_c2_1fb6_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l70_c2_1fb6]
signal eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_return_output : eval_opcode_result_t;

-- is_waiting_MUX[uxn_c_l70_c2_1fb6]
signal is_waiting_MUX_uxn_c_l70_c2_1fb6_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l70_c2_1fb6_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l70_c2_1fb6_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l70_c2_1fb6_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l70_c2_1fb6]
signal cpu_step_result_MUX_uxn_c_l70_c2_1fb6_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l70_c2_1fb6_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l70_c2_1fb6_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l70_c2_1fb6_return_output : cpu_step_result_t;

-- BIN_OP_EQ[uxn_c_l77_c11_220b]
signal BIN_OP_EQ_uxn_c_l77_c11_220b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l77_c11_220b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l77_c11_220b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_1ce7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l77_c7_5b1e]
signal ins_MUX_uxn_c_l77_c7_5b1e_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l77_c7_5b1e_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l77_c7_5b1e_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l77_c7_5b1e_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l77_c7_5b1e]
signal pc_MUX_uxn_c_l77_c7_5b1e_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l77_c7_5b1e_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l77_c7_5b1e_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l77_c7_5b1e_return_output : unsigned(15 downto 0);

-- is_ins_done_MUX[uxn_c_l77_c7_5b1e]
signal is_ins_done_MUX_uxn_c_l77_c7_5b1e_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_5b1e_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_5b1e_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_5b1e_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l77_c7_5b1e]
signal eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_return_output : eval_opcode_result_t;

-- is_waiting_MUX[uxn_c_l77_c7_5b1e]
signal is_waiting_MUX_uxn_c_l77_c7_5b1e_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l77_c7_5b1e_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l77_c7_5b1e_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l77_c7_5b1e_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l77_c7_5b1e]
signal cpu_step_result_MUX_uxn_c_l77_c7_5b1e_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l77_c7_5b1e_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l77_c7_5b1e_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l77_c7_5b1e_return_output : cpu_step_result_t;

-- BIN_OP_PLUS[uxn_c_l78_c3_7781]
signal BIN_OP_PLUS_uxn_c_l78_c3_7781_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_7781_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_7781_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l81_c9_17a2]
signal BIN_OP_EQ_uxn_c_l81_c9_17a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c9_17a2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c9_17a2_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l81_c9_ae85]
signal MUX_uxn_c_l81_c9_ae85_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c9_ae85_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l81_c9_ae85_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l81_c9_ae85_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l82_c43_81b4]
signal BIN_OP_MINUS_uxn_c_l82_c43_81b4_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l82_c43_81b4_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l82_c43_81b4_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l82_c24_7305]
signal eval_opcode_phased_uxn_c_l82_c24_7305_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_7305_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_7305_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_7305_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_7305_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_7305_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_7305_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l83_c8_aace]
signal MUX_uxn_c_l83_c8_aace_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l83_c8_aace_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l83_c8_aace_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l83_c8_aace_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l96_c6_3540]
signal BIN_OP_OR_uxn_c_l96_c6_3540_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l96_c6_3540_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l96_c6_3540_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l96_c2_f1df]
signal step_cpu_phase_MUX_uxn_c_l96_c2_f1df_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l96_c2_f1df_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l96_c2_f1df_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l96_c2_f1df_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l99_c21_c20f]
signal BIN_OP_EQ_uxn_c_l99_c21_c20f_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c21_c20f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c21_c20f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l99_c37_2866]
signal BIN_OP_PLUS_uxn_c_l99_c37_2866_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l99_c37_2866_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l99_c37_2866_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l99_c21_9dac]
signal MUX_uxn_c_l99_c21_9dac_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l99_c21_9dac_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l99_c21_9dac_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l99_c21_9dac_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_c_l65_c8_b919
BIN_OP_AND_uxn_c_l65_c8_b919 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l65_c8_b919_left,
BIN_OP_AND_uxn_c_l65_c8_b919_right,
BIN_OP_AND_uxn_c_l65_c8_b919_return_output);

-- MUX_uxn_c_l65_c8_6f27
MUX_uxn_c_l65_c8_6f27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l65_c8_6f27_cond,
MUX_uxn_c_l65_c8_6f27_iftrue,
MUX_uxn_c_l65_c8_6f27_iffalse,
MUX_uxn_c_l65_c8_6f27_return_output);

-- MUX_uxn_c_l66_c15_53c0
MUX_uxn_c_l66_c15_53c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l66_c15_53c0_cond,
MUX_uxn_c_l66_c15_53c0_iftrue,
MUX_uxn_c_l66_c15_53c0_iffalse,
MUX_uxn_c_l66_c15_53c0_return_output);

-- printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265
printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265 : entity work.printf_uxn_c_l68_c2_8265_0CLK_de264c78 port map (
printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_CLOCK_ENABLE,
printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg0,
printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg1,
printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg2,
printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg3,
printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg4);

-- BIN_OP_EQ_uxn_c_l70_c6_4e30
BIN_OP_EQ_uxn_c_l70_c6_4e30 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l70_c6_4e30_left,
BIN_OP_EQ_uxn_c_l70_c6_4e30_right,
BIN_OP_EQ_uxn_c_l70_c6_4e30_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_return_output);

-- ins_MUX_uxn_c_l70_c2_1fb6
ins_MUX_uxn_c_l70_c2_1fb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l70_c2_1fb6_cond,
ins_MUX_uxn_c_l70_c2_1fb6_iftrue,
ins_MUX_uxn_c_l70_c2_1fb6_iffalse,
ins_MUX_uxn_c_l70_c2_1fb6_return_output);

-- pc_MUX_uxn_c_l70_c2_1fb6
pc_MUX_uxn_c_l70_c2_1fb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l70_c2_1fb6_cond,
pc_MUX_uxn_c_l70_c2_1fb6_iftrue,
pc_MUX_uxn_c_l70_c2_1fb6_iffalse,
pc_MUX_uxn_c_l70_c2_1fb6_return_output);

-- is_ins_done_MUX_uxn_c_l70_c2_1fb6
is_ins_done_MUX_uxn_c_l70_c2_1fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l70_c2_1fb6_cond,
is_ins_done_MUX_uxn_c_l70_c2_1fb6_iftrue,
is_ins_done_MUX_uxn_c_l70_c2_1fb6_iffalse,
is_ins_done_MUX_uxn_c_l70_c2_1fb6_return_output);

-- eval_opcode_result_MUX_uxn_c_l70_c2_1fb6
eval_opcode_result_MUX_uxn_c_l70_c2_1fb6 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_cond,
eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_iftrue,
eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_iffalse,
eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_return_output);

-- is_waiting_MUX_uxn_c_l70_c2_1fb6
is_waiting_MUX_uxn_c_l70_c2_1fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l70_c2_1fb6_cond,
is_waiting_MUX_uxn_c_l70_c2_1fb6_iftrue,
is_waiting_MUX_uxn_c_l70_c2_1fb6_iffalse,
is_waiting_MUX_uxn_c_l70_c2_1fb6_return_output);

-- cpu_step_result_MUX_uxn_c_l70_c2_1fb6
cpu_step_result_MUX_uxn_c_l70_c2_1fb6 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l70_c2_1fb6_cond,
cpu_step_result_MUX_uxn_c_l70_c2_1fb6_iftrue,
cpu_step_result_MUX_uxn_c_l70_c2_1fb6_iffalse,
cpu_step_result_MUX_uxn_c_l70_c2_1fb6_return_output);

-- BIN_OP_EQ_uxn_c_l77_c11_220b
BIN_OP_EQ_uxn_c_l77_c11_220b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l77_c11_220b_left,
BIN_OP_EQ_uxn_c_l77_c11_220b_right,
BIN_OP_EQ_uxn_c_l77_c11_220b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_return_output);

-- ins_MUX_uxn_c_l77_c7_5b1e
ins_MUX_uxn_c_l77_c7_5b1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l77_c7_5b1e_cond,
ins_MUX_uxn_c_l77_c7_5b1e_iftrue,
ins_MUX_uxn_c_l77_c7_5b1e_iffalse,
ins_MUX_uxn_c_l77_c7_5b1e_return_output);

-- pc_MUX_uxn_c_l77_c7_5b1e
pc_MUX_uxn_c_l77_c7_5b1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l77_c7_5b1e_cond,
pc_MUX_uxn_c_l77_c7_5b1e_iftrue,
pc_MUX_uxn_c_l77_c7_5b1e_iffalse,
pc_MUX_uxn_c_l77_c7_5b1e_return_output);

-- is_ins_done_MUX_uxn_c_l77_c7_5b1e
is_ins_done_MUX_uxn_c_l77_c7_5b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l77_c7_5b1e_cond,
is_ins_done_MUX_uxn_c_l77_c7_5b1e_iftrue,
is_ins_done_MUX_uxn_c_l77_c7_5b1e_iffalse,
is_ins_done_MUX_uxn_c_l77_c7_5b1e_return_output);

-- eval_opcode_result_MUX_uxn_c_l77_c7_5b1e
eval_opcode_result_MUX_uxn_c_l77_c7_5b1e : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_cond,
eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_iftrue,
eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_iffalse,
eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_return_output);

-- is_waiting_MUX_uxn_c_l77_c7_5b1e
is_waiting_MUX_uxn_c_l77_c7_5b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l77_c7_5b1e_cond,
is_waiting_MUX_uxn_c_l77_c7_5b1e_iftrue,
is_waiting_MUX_uxn_c_l77_c7_5b1e_iffalse,
is_waiting_MUX_uxn_c_l77_c7_5b1e_return_output);

-- cpu_step_result_MUX_uxn_c_l77_c7_5b1e
cpu_step_result_MUX_uxn_c_l77_c7_5b1e : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l77_c7_5b1e_cond,
cpu_step_result_MUX_uxn_c_l77_c7_5b1e_iftrue,
cpu_step_result_MUX_uxn_c_l77_c7_5b1e_iffalse,
cpu_step_result_MUX_uxn_c_l77_c7_5b1e_return_output);

-- BIN_OP_PLUS_uxn_c_l78_c3_7781
BIN_OP_PLUS_uxn_c_l78_c3_7781 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l78_c3_7781_left,
BIN_OP_PLUS_uxn_c_l78_c3_7781_right,
BIN_OP_PLUS_uxn_c_l78_c3_7781_return_output);

-- BIN_OP_EQ_uxn_c_l81_c9_17a2
BIN_OP_EQ_uxn_c_l81_c9_17a2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l81_c9_17a2_left,
BIN_OP_EQ_uxn_c_l81_c9_17a2_right,
BIN_OP_EQ_uxn_c_l81_c9_17a2_return_output);

-- MUX_uxn_c_l81_c9_ae85
MUX_uxn_c_l81_c9_ae85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l81_c9_ae85_cond,
MUX_uxn_c_l81_c9_ae85_iftrue,
MUX_uxn_c_l81_c9_ae85_iffalse,
MUX_uxn_c_l81_c9_ae85_return_output);

-- BIN_OP_MINUS_uxn_c_l82_c43_81b4
BIN_OP_MINUS_uxn_c_l82_c43_81b4 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l82_c43_81b4_left,
BIN_OP_MINUS_uxn_c_l82_c43_81b4_right,
BIN_OP_MINUS_uxn_c_l82_c43_81b4_return_output);

-- eval_opcode_phased_uxn_c_l82_c24_7305
eval_opcode_phased_uxn_c_l82_c24_7305 : entity work.eval_opcode_phased_0CLK_993f234f port map (
clk,
eval_opcode_phased_uxn_c_l82_c24_7305_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l82_c24_7305_phase,
eval_opcode_phased_uxn_c_l82_c24_7305_ins,
eval_opcode_phased_uxn_c_l82_c24_7305_pc,
eval_opcode_phased_uxn_c_l82_c24_7305_previous_ram_read,
eval_opcode_phased_uxn_c_l82_c24_7305_previous_device_ram_read,
eval_opcode_phased_uxn_c_l82_c24_7305_return_output);

-- MUX_uxn_c_l83_c8_aace
MUX_uxn_c_l83_c8_aace : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l83_c8_aace_cond,
MUX_uxn_c_l83_c8_aace_iftrue,
MUX_uxn_c_l83_c8_aace_iffalse,
MUX_uxn_c_l83_c8_aace_return_output);

-- BIN_OP_OR_uxn_c_l96_c6_3540
BIN_OP_OR_uxn_c_l96_c6_3540 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l96_c6_3540_left,
BIN_OP_OR_uxn_c_l96_c6_3540_right,
BIN_OP_OR_uxn_c_l96_c6_3540_return_output);

-- step_cpu_phase_MUX_uxn_c_l96_c2_f1df
step_cpu_phase_MUX_uxn_c_l96_c2_f1df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l96_c2_f1df_cond,
step_cpu_phase_MUX_uxn_c_l96_c2_f1df_iftrue,
step_cpu_phase_MUX_uxn_c_l96_c2_f1df_iffalse,
step_cpu_phase_MUX_uxn_c_l96_c2_f1df_return_output);

-- BIN_OP_EQ_uxn_c_l99_c21_c20f
BIN_OP_EQ_uxn_c_l99_c21_c20f : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l99_c21_c20f_left,
BIN_OP_EQ_uxn_c_l99_c21_c20f_right,
BIN_OP_EQ_uxn_c_l99_c21_c20f_return_output);

-- BIN_OP_PLUS_uxn_c_l99_c37_2866
BIN_OP_PLUS_uxn_c_l99_c37_2866 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l99_c37_2866_left,
BIN_OP_PLUS_uxn_c_l99_c37_2866_right,
BIN_OP_PLUS_uxn_c_l99_c37_2866_return_output);

-- MUX_uxn_c_l99_c21_9dac
MUX_uxn_c_l99_c21_9dac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l99_c21_9dac_cond,
MUX_uxn_c_l99_c21_9dac_iftrue,
MUX_uxn_c_l99_c21_9dac_iffalse,
MUX_uxn_c_l99_c21_9dac_return_output);



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
 BIN_OP_AND_uxn_c_l65_c8_b919_return_output,
 MUX_uxn_c_l65_c8_6f27_return_output,
 MUX_uxn_c_l66_c15_53c0_return_output,
 BIN_OP_EQ_uxn_c_l70_c6_4e30_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_return_output,
 ins_MUX_uxn_c_l70_c2_1fb6_return_output,
 pc_MUX_uxn_c_l70_c2_1fb6_return_output,
 is_ins_done_MUX_uxn_c_l70_c2_1fb6_return_output,
 eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_return_output,
 is_waiting_MUX_uxn_c_l70_c2_1fb6_return_output,
 cpu_step_result_MUX_uxn_c_l70_c2_1fb6_return_output,
 BIN_OP_EQ_uxn_c_l77_c11_220b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_return_output,
 ins_MUX_uxn_c_l77_c7_5b1e_return_output,
 pc_MUX_uxn_c_l77_c7_5b1e_return_output,
 is_ins_done_MUX_uxn_c_l77_c7_5b1e_return_output,
 eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_return_output,
 is_waiting_MUX_uxn_c_l77_c7_5b1e_return_output,
 cpu_step_result_MUX_uxn_c_l77_c7_5b1e_return_output,
 BIN_OP_PLUS_uxn_c_l78_c3_7781_return_output,
 BIN_OP_EQ_uxn_c_l81_c9_17a2_return_output,
 MUX_uxn_c_l81_c9_ae85_return_output,
 BIN_OP_MINUS_uxn_c_l82_c43_81b4_return_output,
 eval_opcode_phased_uxn_c_l82_c24_7305_return_output,
 MUX_uxn_c_l83_c8_aace_return_output,
 BIN_OP_OR_uxn_c_l96_c6_3540_return_output,
 step_cpu_phase_MUX_uxn_c_l96_c2_f1df_return_output,
 BIN_OP_EQ_uxn_c_l99_c21_c20f_return_output,
 BIN_OP_PLUS_uxn_c_l99_c37_2866_return_output,
 MUX_uxn_c_l99_c21_9dac_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l65_c2_9866 : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_6f27_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_6f27_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_6f27_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l65_c8_b919_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l65_c8_b919_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l65_c8_b919_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_6f27_return_output : unsigned(15 downto 0);
 variable VAR_is_waiting_uxn_c_l66_c2_3a68 : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_53c0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_53c0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_53c0_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_53c0_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg4 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_4e30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_4e30_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_4e30_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_1fb6_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_1fb6_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_5b1e_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_1fb6_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_1fb6_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_1fb6_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_1fb6_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_5b1e_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_1fb6_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_1fb6_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_1fb6_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_1fb6_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_5b1e_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_1fb6_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_1fb6_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_1fb6_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_1fb6_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_5b1e_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_1fb6_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_1fb6_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_1fb6_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l70_c2_1fb6_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_1fb6_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_5b1e_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_1fb6_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_1fb6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_220b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_220b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_220b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_5b1e_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_5b1e_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_5b1e_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_5b1e_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l78_c3_6ae3 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_5b1e_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_5b1e_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_5b1e_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_5b1e_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_5b1e_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_5b1e_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_5b1e_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_5b1e_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_5b1e_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_5b1e_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l77_c7_5b1e_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_5b1e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_7781_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_7781_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_7781_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_ae85_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_ae85_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_ae85_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c9_17a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c9_17a2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c9_17a2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_ae85_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_7305_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_7305_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_7305_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_7305_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_7305_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_81b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_81b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_81b4_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_7305_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_7305_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l83_c8_aace_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_aace_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_aace_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_3d1b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_aace_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_2204_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l86_c35_4a95_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l87_c38_97ad_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l88_c34_5133_return_output : unsigned(23 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l89_c40_3c11_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l90_c41_6b74_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l91_c30_dc39_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l92_c16_bdba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l93_c17_c55a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l96_c6_3540_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l96_c6_3540_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l96_c6_3540_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f1df_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l97_c3_e36c : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f1df_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f1df_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f1df_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_9dac_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_9dac_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_9dac_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c21_c20f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c21_c20f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c21_c20f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l99_c37_2866_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l99_c37_2866_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l99_c37_2866_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_9dac_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_9411_return_output : unsigned(15 downto 0);
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
     VAR_MUX_uxn_c_l99_c21_9dac_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_PLUS_uxn_c_l99_c37_2866_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l70_c6_4e30_right := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l97_c3_e36c := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f1df_iftrue := VAR_step_cpu_phase_uxn_c_l97_c3_e36c;
     VAR_is_ins_done_MUX_uxn_c_l70_c2_1fb6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l81_c9_17a2_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_7781_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l77_c11_220b_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_81b4_right := to_unsigned(2, 2);
     VAR_MUX_uxn_c_l66_c15_53c0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l99_c21_c20f_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_5b1e_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_iftrue := eval_opcode_result;
     VAR_MUX_uxn_c_l81_c9_ae85_iffalse := ins;
     VAR_ins_MUX_uxn_c_l70_c2_1fb6_iftrue := ins;
     VAR_ins_MUX_uxn_c_l77_c7_5b1e_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_5b1e_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l65_c8_b919_right := is_waiting;
     VAR_MUX_uxn_c_l66_c15_53c0_iffalse := is_waiting;
     VAR_MUX_uxn_c_l65_c8_6f27_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l82_c24_7305_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l81_c9_ae85_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l82_c24_7305_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l70_c6_4e30_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l77_c11_220b_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l81_c9_17a2_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_81b4_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l99_c37_2866_left := step_cpu_phase;
     VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg0 := resize(step_cpu_phase, 32);
     VAR_BIN_OP_AND_uxn_c_l65_c8_b919_left := VAR_use_vector;
     VAR_MUX_uxn_c_l66_c15_53c0_cond := VAR_use_vector;
     VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg3 := resize(VAR_use_vector, 32);
     VAR_MUX_uxn_c_l65_c8_6f27_iftrue := VAR_vector;
     VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg4 := resize(VAR_vector, 32);
     -- BIN_OP_MINUS[uxn_c_l82_c43_81b4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l82_c43_81b4_left <= VAR_BIN_OP_MINUS_uxn_c_l82_c43_81b4_left;
     BIN_OP_MINUS_uxn_c_l82_c43_81b4_right <= VAR_BIN_OP_MINUS_uxn_c_l82_c43_81b4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_81b4_return_output := BIN_OP_MINUS_uxn_c_l82_c43_81b4_return_output;

     -- MUX[uxn_c_l66_c15_53c0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l66_c15_53c0_cond <= VAR_MUX_uxn_c_l66_c15_53c0_cond;
     MUX_uxn_c_l66_c15_53c0_iftrue <= VAR_MUX_uxn_c_l66_c15_53c0_iftrue;
     MUX_uxn_c_l66_c15_53c0_iffalse <= VAR_MUX_uxn_c_l66_c15_53c0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l66_c15_53c0_return_output := MUX_uxn_c_l66_c15_53c0_return_output;

     -- BIN_OP_PLUS[uxn_c_l99_c37_2866] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l99_c37_2866_left <= VAR_BIN_OP_PLUS_uxn_c_l99_c37_2866_left;
     BIN_OP_PLUS_uxn_c_l99_c37_2866_right <= VAR_BIN_OP_PLUS_uxn_c_l99_c37_2866_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l99_c37_2866_return_output := BIN_OP_PLUS_uxn_c_l99_c37_2866_return_output;

     -- BIN_OP_EQ[uxn_c_l77_c11_220b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l77_c11_220b_left <= VAR_BIN_OP_EQ_uxn_c_l77_c11_220b_left;
     BIN_OP_EQ_uxn_c_l77_c11_220b_right <= VAR_BIN_OP_EQ_uxn_c_l77_c11_220b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l77_c11_220b_return_output := BIN_OP_EQ_uxn_c_l77_c11_220b_return_output;

     -- BIN_OP_AND[uxn_c_l65_c8_b919] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l65_c8_b919_left <= VAR_BIN_OP_AND_uxn_c_l65_c8_b919_left;
     BIN_OP_AND_uxn_c_l65_c8_b919_right <= VAR_BIN_OP_AND_uxn_c_l65_c8_b919_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l65_c8_b919_return_output := BIN_OP_AND_uxn_c_l65_c8_b919_return_output;

     -- BIN_OP_EQ[uxn_c_l70_c6_4e30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l70_c6_4e30_left <= VAR_BIN_OP_EQ_uxn_c_l70_c6_4e30_left;
     BIN_OP_EQ_uxn_c_l70_c6_4e30_right <= VAR_BIN_OP_EQ_uxn_c_l70_c6_4e30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l70_c6_4e30_return_output := BIN_OP_EQ_uxn_c_l70_c6_4e30_return_output;

     -- BIN_OP_EQ[uxn_c_l81_c9_17a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l81_c9_17a2_left <= VAR_BIN_OP_EQ_uxn_c_l81_c9_17a2_left;
     BIN_OP_EQ_uxn_c_l81_c9_17a2_right <= VAR_BIN_OP_EQ_uxn_c_l81_c9_17a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l81_c9_17a2_return_output := BIN_OP_EQ_uxn_c_l81_c9_17a2_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l65_c8_6f27_cond := VAR_BIN_OP_AND_uxn_c_l65_c8_b919_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_4e30_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_1fb6_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_4e30_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_4e30_return_output;
     VAR_ins_MUX_uxn_c_l70_c2_1fb6_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_4e30_return_output;
     VAR_is_ins_done_MUX_uxn_c_l70_c2_1fb6_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_4e30_return_output;
     VAR_is_waiting_MUX_uxn_c_l70_c2_1fb6_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_4e30_return_output;
     VAR_pc_MUX_uxn_c_l70_c2_1fb6_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_4e30_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_220b_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_5b1e_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_220b_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_220b_return_output;
     VAR_ins_MUX_uxn_c_l77_c7_5b1e_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_220b_return_output;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_5b1e_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_220b_return_output;
     VAR_is_waiting_MUX_uxn_c_l77_c7_5b1e_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_220b_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_5b1e_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_220b_return_output;
     VAR_MUX_uxn_c_l81_c9_ae85_cond := VAR_BIN_OP_EQ_uxn_c_l81_c9_17a2_return_output;
     VAR_eval_opcode_phased_uxn_c_l82_c24_7305_phase := VAR_BIN_OP_MINUS_uxn_c_l82_c43_81b4_return_output;
     VAR_MUX_uxn_c_l99_c21_9dac_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l99_c37_2866_return_output, 8);
     VAR_is_waiting_uxn_c_l66_c2_3a68 := VAR_MUX_uxn_c_l66_c15_53c0_return_output;
     VAR_is_waiting_MUX_uxn_c_l70_c2_1fb6_iftrue := VAR_is_waiting_uxn_c_l66_c2_3a68;
     VAR_is_waiting_MUX_uxn_c_l77_c7_5b1e_iftrue := VAR_is_waiting_uxn_c_l66_c2_3a68;
     VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg2 := resize(VAR_is_waiting_uxn_c_l66_c2_3a68, 32);
     -- MUX[uxn_c_l65_c8_6f27] LATENCY=0
     -- Inputs
     MUX_uxn_c_l65_c8_6f27_cond <= VAR_MUX_uxn_c_l65_c8_6f27_cond;
     MUX_uxn_c_l65_c8_6f27_iftrue <= VAR_MUX_uxn_c_l65_c8_6f27_iftrue;
     MUX_uxn_c_l65_c8_6f27_iffalse <= VAR_MUX_uxn_c_l65_c8_6f27_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l65_c8_6f27_return_output := MUX_uxn_c_l65_c8_6f27_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l77_c7_5b1e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_return_output;

     -- MUX[uxn_c_l81_c9_ae85] LATENCY=0
     -- Inputs
     MUX_uxn_c_l81_c9_ae85_cond <= VAR_MUX_uxn_c_l81_c9_ae85_cond;
     MUX_uxn_c_l81_c9_ae85_iftrue <= VAR_MUX_uxn_c_l81_c9_ae85_iftrue;
     MUX_uxn_c_l81_c9_ae85_iffalse <= VAR_MUX_uxn_c_l81_c9_ae85_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l81_c9_ae85_return_output := MUX_uxn_c_l81_c9_ae85_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_5b1e_return_output;
     VAR_pc_uxn_c_l65_c2_9866 := VAR_MUX_uxn_c_l65_c8_6f27_return_output;
     VAR_eval_opcode_phased_uxn_c_l82_c24_7305_ins := VAR_MUX_uxn_c_l81_c9_ae85_return_output;
     VAR_ins_MUX_uxn_c_l77_c7_5b1e_iffalse := VAR_MUX_uxn_c_l81_c9_ae85_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_7781_left := VAR_pc_uxn_c_l65_c2_9866;
     VAR_MUX_uxn_c_l83_c8_aace_iffalse := VAR_pc_uxn_c_l65_c2_9866;
     VAR_eval_opcode_phased_uxn_c_l82_c24_7305_pc := VAR_pc_uxn_c_l65_c2_9866;
     VAR_pc_MUX_uxn_c_l70_c2_1fb6_iftrue := VAR_pc_uxn_c_l65_c2_9866;
     VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg1 := resize(VAR_pc_uxn_c_l65_c2_9866, 32);
     -- printf_uxn_c_l68_c2_8265[uxn_c_l68_c2_8265] LATENCY=0
     -- Clock enable
     printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_CLOCK_ENABLE <= VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg0 <= VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg0;
     printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg1 <= VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg1;
     printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg2 <= VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg2;
     printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg3 <= VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg3;
     printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg4 <= VAR_printf_uxn_c_l68_c2_8265_uxn_c_l68_c2_8265_arg4;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_1ce7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_return_output;

     -- ins_MUX[uxn_c_l77_c7_5b1e] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l77_c7_5b1e_cond <= VAR_ins_MUX_uxn_c_l77_c7_5b1e_cond;
     ins_MUX_uxn_c_l77_c7_5b1e_iftrue <= VAR_ins_MUX_uxn_c_l77_c7_5b1e_iftrue;
     ins_MUX_uxn_c_l77_c7_5b1e_iffalse <= VAR_ins_MUX_uxn_c_l77_c7_5b1e_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l77_c7_5b1e_return_output := ins_MUX_uxn_c_l77_c7_5b1e_return_output;

     -- BIN_OP_PLUS[uxn_c_l78_c3_7781] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l78_c3_7781_left <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_7781_left;
     BIN_OP_PLUS_uxn_c_l78_c3_7781_right <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_7781_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_7781_return_output := BIN_OP_PLUS_uxn_c_l78_c3_7781_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7[uxn_c_l70_c2_1fb6] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l70_c2_1fb6_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7(
     cpu_step_result,
     VAR_pc_uxn_c_l65_c2_9866,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- Submodule level 3
     VAR_pc_uxn_c_l78_c3_6ae3 := resize(VAR_BIN_OP_PLUS_uxn_c_l78_c3_7781_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l82_c24_7305_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_1ce7_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_1fb6_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l70_c2_1fb6_return_output;
     VAR_ins_MUX_uxn_c_l70_c2_1fb6_iffalse := VAR_ins_MUX_uxn_c_l77_c7_5b1e_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_5b1e_iftrue := VAR_pc_uxn_c_l78_c3_6ae3;
     -- eval_opcode_phased[uxn_c_l82_c24_7305] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l82_c24_7305_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l82_c24_7305_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l82_c24_7305_phase <= VAR_eval_opcode_phased_uxn_c_l82_c24_7305_phase;
     eval_opcode_phased_uxn_c_l82_c24_7305_ins <= VAR_eval_opcode_phased_uxn_c_l82_c24_7305_ins;
     eval_opcode_phased_uxn_c_l82_c24_7305_pc <= VAR_eval_opcode_phased_uxn_c_l82_c24_7305_pc;
     eval_opcode_phased_uxn_c_l82_c24_7305_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l82_c24_7305_previous_ram_read;
     eval_opcode_phased_uxn_c_l82_c24_7305_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l82_c24_7305_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l82_c24_7305_return_output := eval_opcode_phased_uxn_c_l82_c24_7305_return_output;

     -- ins_MUX[uxn_c_l70_c2_1fb6] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l70_c2_1fb6_cond <= VAR_ins_MUX_uxn_c_l70_c2_1fb6_cond;
     ins_MUX_uxn_c_l70_c2_1fb6_iftrue <= VAR_ins_MUX_uxn_c_l70_c2_1fb6_iftrue;
     ins_MUX_uxn_c_l70_c2_1fb6_iffalse <= VAR_ins_MUX_uxn_c_l70_c2_1fb6_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l70_c2_1fb6_return_output := ins_MUX_uxn_c_l70_c2_1fb6_return_output;

     -- Submodule level 4
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_iffalse := VAR_eval_opcode_phased_uxn_c_l82_c24_7305_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l70_c2_1fb6_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l84_c34_2204] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_2204_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_7305_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l90_c41_6b74] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l90_c41_6b74_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_7305_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l87_c38_97ad] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l87_c38_97ad_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_7305_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l86_c35_4a95] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l86_c35_4a95_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_7305_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l93_c17_c55a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l93_c17_c55a_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_7305_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l92_c16_bdba] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l92_c16_bdba_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_7305_return_output.is_waiting;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l89_c40_3c11] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l89_c40_3c11_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_7305_return_output.device_ram_address;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l91_c30_dc39] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l91_c30_dc39_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_7305_return_output.u8_value;

     -- eval_opcode_result_MUX[uxn_c_l77_c7_5b1e] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_cond <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_cond;
     eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_iftrue;
     eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_return_output := eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_return_output;

     -- CONST_REF_RD_uint24_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l88_c34_5133] LATENCY=0
     VAR_CONST_REF_RD_uint24_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l88_c34_5133_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_7305_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l83_c8_3d1b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_3d1b_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_7305_return_output.is_pc_updated;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_9411 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_9411_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_7305_return_output.u16_value;

     -- Submodule level 5
     VAR_MUX_uxn_c_l83_c8_aace_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_9411_return_output;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_5b1e_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l93_c17_c55a_return_output;
     VAR_MUX_uxn_c_l83_c8_aace_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_3d1b_return_output;
     VAR_is_waiting_MUX_uxn_c_l77_c7_5b1e_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l92_c16_bdba_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l77_c7_5b1e_return_output;
     -- eval_opcode_result_MUX[uxn_c_l70_c2_1fb6] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_cond <= VAR_eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_cond;
     eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_iftrue;
     eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_return_output := eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_return_output;

     -- MUX[uxn_c_l83_c8_aace] LATENCY=0
     -- Inputs
     MUX_uxn_c_l83_c8_aace_cond <= VAR_MUX_uxn_c_l83_c8_aace_cond;
     MUX_uxn_c_l83_c8_aace_iftrue <= VAR_MUX_uxn_c_l83_c8_aace_iftrue;
     MUX_uxn_c_l83_c8_aace_iffalse <= VAR_MUX_uxn_c_l83_c8_aace_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l83_c8_aace_return_output := MUX_uxn_c_l83_c8_aace_return_output;

     -- is_waiting_MUX[uxn_c_l77_c7_5b1e] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l77_c7_5b1e_cond <= VAR_is_waiting_MUX_uxn_c_l77_c7_5b1e_cond;
     is_waiting_MUX_uxn_c_l77_c7_5b1e_iftrue <= VAR_is_waiting_MUX_uxn_c_l77_c7_5b1e_iftrue;
     is_waiting_MUX_uxn_c_l77_c7_5b1e_iffalse <= VAR_is_waiting_MUX_uxn_c_l77_c7_5b1e_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l77_c7_5b1e_return_output := is_waiting_MUX_uxn_c_l77_c7_5b1e_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030[uxn_c_l77_c7_5b1e] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l77_c7_5b1e_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_2204_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_9411_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l86_c35_4a95_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l87_c38_97ad_return_output,
     VAR_CONST_REF_RD_uint24_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l88_c34_5133_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l89_c40_3c11_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l90_c41_6b74_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l91_c30_dc39_return_output);

     -- is_ins_done_MUX[uxn_c_l77_c7_5b1e] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l77_c7_5b1e_cond <= VAR_is_ins_done_MUX_uxn_c_l77_c7_5b1e_cond;
     is_ins_done_MUX_uxn_c_l77_c7_5b1e_iftrue <= VAR_is_ins_done_MUX_uxn_c_l77_c7_5b1e_iftrue;
     is_ins_done_MUX_uxn_c_l77_c7_5b1e_iffalse <= VAR_is_ins_done_MUX_uxn_c_l77_c7_5b1e_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l77_c7_5b1e_return_output := is_ins_done_MUX_uxn_c_l77_c7_5b1e_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l77_c7_5b1e_iffalse := VAR_MUX_uxn_c_l83_c8_aace_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_5b1e_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l77_c7_5b1e_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l70_c2_1fb6_return_output;
     VAR_is_ins_done_MUX_uxn_c_l70_c2_1fb6_iffalse := VAR_is_ins_done_MUX_uxn_c_l77_c7_5b1e_return_output;
     VAR_is_waiting_MUX_uxn_c_l70_c2_1fb6_iffalse := VAR_is_waiting_MUX_uxn_c_l77_c7_5b1e_return_output;
     -- pc_MUX[uxn_c_l77_c7_5b1e] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l77_c7_5b1e_cond <= VAR_pc_MUX_uxn_c_l77_c7_5b1e_cond;
     pc_MUX_uxn_c_l77_c7_5b1e_iftrue <= VAR_pc_MUX_uxn_c_l77_c7_5b1e_iftrue;
     pc_MUX_uxn_c_l77_c7_5b1e_iffalse <= VAR_pc_MUX_uxn_c_l77_c7_5b1e_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l77_c7_5b1e_return_output := pc_MUX_uxn_c_l77_c7_5b1e_return_output;

     -- is_ins_done_MUX[uxn_c_l70_c2_1fb6] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l70_c2_1fb6_cond <= VAR_is_ins_done_MUX_uxn_c_l70_c2_1fb6_cond;
     is_ins_done_MUX_uxn_c_l70_c2_1fb6_iftrue <= VAR_is_ins_done_MUX_uxn_c_l70_c2_1fb6_iftrue;
     is_ins_done_MUX_uxn_c_l70_c2_1fb6_iffalse <= VAR_is_ins_done_MUX_uxn_c_l70_c2_1fb6_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l70_c2_1fb6_return_output := is_ins_done_MUX_uxn_c_l70_c2_1fb6_return_output;

     -- is_waiting_MUX[uxn_c_l70_c2_1fb6] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l70_c2_1fb6_cond <= VAR_is_waiting_MUX_uxn_c_l70_c2_1fb6_cond;
     is_waiting_MUX_uxn_c_l70_c2_1fb6_iftrue <= VAR_is_waiting_MUX_uxn_c_l70_c2_1fb6_iftrue;
     is_waiting_MUX_uxn_c_l70_c2_1fb6_iffalse <= VAR_is_waiting_MUX_uxn_c_l70_c2_1fb6_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l70_c2_1fb6_return_output := is_waiting_MUX_uxn_c_l70_c2_1fb6_return_output;

     -- cpu_step_result_MUX[uxn_c_l77_c7_5b1e] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l77_c7_5b1e_cond <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_5b1e_cond;
     cpu_step_result_MUX_uxn_c_l77_c7_5b1e_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_5b1e_iftrue;
     cpu_step_result_MUX_uxn_c_l77_c7_5b1e_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_5b1e_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_5b1e_return_output := cpu_step_result_MUX_uxn_c_l77_c7_5b1e_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_1fb6_iffalse := VAR_cpu_step_result_MUX_uxn_c_l77_c7_5b1e_return_output;
     VAR_BIN_OP_OR_uxn_c_l96_c6_3540_left := VAR_is_ins_done_MUX_uxn_c_l70_c2_1fb6_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l70_c2_1fb6_return_output;
     VAR_BIN_OP_OR_uxn_c_l96_c6_3540_right := VAR_is_waiting_MUX_uxn_c_l70_c2_1fb6_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l70_c2_1fb6_return_output;
     VAR_pc_MUX_uxn_c_l70_c2_1fb6_iffalse := VAR_pc_MUX_uxn_c_l77_c7_5b1e_return_output;
     -- BIN_OP_OR[uxn_c_l96_c6_3540] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l96_c6_3540_left <= VAR_BIN_OP_OR_uxn_c_l96_c6_3540_left;
     BIN_OP_OR_uxn_c_l96_c6_3540_right <= VAR_BIN_OP_OR_uxn_c_l96_c6_3540_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l96_c6_3540_return_output := BIN_OP_OR_uxn_c_l96_c6_3540_return_output;

     -- cpu_step_result_MUX[uxn_c_l70_c2_1fb6] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l70_c2_1fb6_cond <= VAR_cpu_step_result_MUX_uxn_c_l70_c2_1fb6_cond;
     cpu_step_result_MUX_uxn_c_l70_c2_1fb6_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l70_c2_1fb6_iftrue;
     cpu_step_result_MUX_uxn_c_l70_c2_1fb6_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l70_c2_1fb6_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_1fb6_return_output := cpu_step_result_MUX_uxn_c_l70_c2_1fb6_return_output;

     -- pc_MUX[uxn_c_l70_c2_1fb6] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l70_c2_1fb6_cond <= VAR_pc_MUX_uxn_c_l70_c2_1fb6_cond;
     pc_MUX_uxn_c_l70_c2_1fb6_iftrue <= VAR_pc_MUX_uxn_c_l70_c2_1fb6_iftrue;
     pc_MUX_uxn_c_l70_c2_1fb6_iffalse <= VAR_pc_MUX_uxn_c_l70_c2_1fb6_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l70_c2_1fb6_return_output := pc_MUX_uxn_c_l70_c2_1fb6_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f1df_cond := VAR_BIN_OP_OR_uxn_c_l96_c6_3540_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l70_c2_1fb6_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l70_c2_1fb6_return_output;
     VAR_BIN_OP_EQ_uxn_c_l99_c21_c20f_left := VAR_pc_MUX_uxn_c_l70_c2_1fb6_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l70_c2_1fb6_return_output;
     -- BIN_OP_EQ[uxn_c_l99_c21_c20f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l99_c21_c20f_left <= VAR_BIN_OP_EQ_uxn_c_l99_c21_c20f_left;
     BIN_OP_EQ_uxn_c_l99_c21_c20f_right <= VAR_BIN_OP_EQ_uxn_c_l99_c21_c20f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l99_c21_c20f_return_output := BIN_OP_EQ_uxn_c_l99_c21_c20f_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l99_c21_9dac_cond := VAR_BIN_OP_EQ_uxn_c_l99_c21_c20f_return_output;
     -- MUX[uxn_c_l99_c21_9dac] LATENCY=0
     -- Inputs
     MUX_uxn_c_l99_c21_9dac_cond <= VAR_MUX_uxn_c_l99_c21_9dac_cond;
     MUX_uxn_c_l99_c21_9dac_iftrue <= VAR_MUX_uxn_c_l99_c21_9dac_iftrue;
     MUX_uxn_c_l99_c21_9dac_iffalse <= VAR_MUX_uxn_c_l99_c21_9dac_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l99_c21_9dac_return_output := MUX_uxn_c_l99_c21_9dac_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f1df_iffalse := VAR_MUX_uxn_c_l99_c21_9dac_return_output;
     -- step_cpu_phase_MUX[uxn_c_l96_c2_f1df] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l96_c2_f1df_cond <= VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f1df_cond;
     step_cpu_phase_MUX_uxn_c_l96_c2_f1df_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f1df_iftrue;
     step_cpu_phase_MUX_uxn_c_l96_c2_f1df_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f1df_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f1df_return_output := step_cpu_phase_MUX_uxn_c_l96_c2_f1df_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l96_c2_f1df_return_output;
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
