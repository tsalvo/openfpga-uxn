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
entity step_cpu_0CLK_7e70f4df is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 use_vector : in unsigned(0 downto 0);
 vector : in unsigned(15 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_7e70f4df;
architecture arch of step_cpu_0CLK_7e70f4df is
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
-- BIN_OP_AND[uxn_c_l65_c8_0d40]
signal BIN_OP_AND_uxn_c_l65_c8_0d40_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l65_c8_0d40_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l65_c8_0d40_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l65_c8_53e6]
signal MUX_uxn_c_l65_c8_53e6_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l65_c8_53e6_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l65_c8_53e6_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l65_c8_53e6_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l66_c15_8963]
signal MUX_uxn_c_l66_c15_8963_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l66_c15_8963_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l66_c15_8963_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l66_c15_8963_return_output : unsigned(0 downto 0);

-- printf_uxn_c_l68_c2_6510[uxn_c_l68_c2_6510]
signal printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg2 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg3 : unsigned(31 downto 0);
signal printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg4 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l70_c6_9172]
signal BIN_OP_EQ_uxn_c_l70_c6_9172_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l70_c6_9172_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l70_c6_9172_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l77_c7_279b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l70_c2_9ece]
signal is_ins_done_MUX_uxn_c_l70_c2_9ece_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l70_c2_9ece_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l70_c2_9ece_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l70_c2_9ece_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l70_c2_9ece]
signal eval_opcode_result_MUX_uxn_c_l70_c2_9ece_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l70_c2_9ece_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l70_c2_9ece_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l70_c2_9ece_return_output : eval_opcode_result_t;

-- ins_MUX[uxn_c_l70_c2_9ece]
signal ins_MUX_uxn_c_l70_c2_9ece_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l70_c2_9ece_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l70_c2_9ece_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l70_c2_9ece_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l70_c2_9ece]
signal pc_MUX_uxn_c_l70_c2_9ece_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l70_c2_9ece_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l70_c2_9ece_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l70_c2_9ece_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l70_c2_9ece]
signal cpu_step_result_MUX_uxn_c_l70_c2_9ece_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l70_c2_9ece_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l70_c2_9ece_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l70_c2_9ece_return_output : cpu_step_result_t;

-- is_waiting_MUX[uxn_c_l70_c2_9ece]
signal is_waiting_MUX_uxn_c_l70_c2_9ece_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l70_c2_9ece_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l70_c2_9ece_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l70_c2_9ece_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l77_c11_823e]
signal BIN_OP_EQ_uxn_c_l77_c11_823e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l77_c11_823e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l77_c11_823e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_8289]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l77_c7_279b]
signal is_ins_done_MUX_uxn_c_l77_c7_279b_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_279b_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_279b_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_279b_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l77_c7_279b]
signal eval_opcode_result_MUX_uxn_c_l77_c7_279b_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l77_c7_279b_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l77_c7_279b_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l77_c7_279b_return_output : eval_opcode_result_t;

-- ins_MUX[uxn_c_l77_c7_279b]
signal ins_MUX_uxn_c_l77_c7_279b_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l77_c7_279b_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l77_c7_279b_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l77_c7_279b_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l77_c7_279b]
signal pc_MUX_uxn_c_l77_c7_279b_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l77_c7_279b_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l77_c7_279b_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l77_c7_279b_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l77_c7_279b]
signal cpu_step_result_MUX_uxn_c_l77_c7_279b_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l77_c7_279b_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l77_c7_279b_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l77_c7_279b_return_output : cpu_step_result_t;

-- is_waiting_MUX[uxn_c_l77_c7_279b]
signal is_waiting_MUX_uxn_c_l77_c7_279b_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l77_c7_279b_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l77_c7_279b_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l77_c7_279b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l78_c3_ffbf]
signal BIN_OP_PLUS_uxn_c_l78_c3_ffbf_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_ffbf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_ffbf_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l81_c9_96fd]
signal BIN_OP_EQ_uxn_c_l81_c9_96fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c9_96fd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c9_96fd_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l81_c9_0033]
signal MUX_uxn_c_l81_c9_0033_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l81_c9_0033_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l81_c9_0033_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l81_c9_0033_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l82_c43_74f3]
signal BIN_OP_MINUS_uxn_c_l82_c43_74f3_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l82_c43_74f3_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l82_c43_74f3_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l82_c24_298c]
signal eval_opcode_phased_uxn_c_l82_c24_298c_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_298c_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_298c_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_298c_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_298c_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_298c_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_298c_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l83_c8_c892]
signal MUX_uxn_c_l83_c8_c892_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l83_c8_c892_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l83_c8_c892_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l83_c8_c892_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l96_c6_6257]
signal BIN_OP_OR_uxn_c_l96_c6_6257_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l96_c6_6257_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l96_c6_6257_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l96_c2_e9cb]
signal step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l99_c21_320f]
signal BIN_OP_EQ_uxn_c_l99_c21_320f_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c21_320f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c21_320f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l99_c37_9d69]
signal BIN_OP_PLUS_uxn_c_l99_c37_9d69_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l99_c37_9d69_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l99_c37_9d69_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l99_c21_c828]
signal MUX_uxn_c_l99_c21_c828_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l99_c21_c828_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l99_c21_c828_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l99_c21_c828_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_c_l65_c8_0d40
BIN_OP_AND_uxn_c_l65_c8_0d40 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l65_c8_0d40_left,
BIN_OP_AND_uxn_c_l65_c8_0d40_right,
BIN_OP_AND_uxn_c_l65_c8_0d40_return_output);

-- MUX_uxn_c_l65_c8_53e6
MUX_uxn_c_l65_c8_53e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l65_c8_53e6_cond,
MUX_uxn_c_l65_c8_53e6_iftrue,
MUX_uxn_c_l65_c8_53e6_iffalse,
MUX_uxn_c_l65_c8_53e6_return_output);

-- MUX_uxn_c_l66_c15_8963
MUX_uxn_c_l66_c15_8963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l66_c15_8963_cond,
MUX_uxn_c_l66_c15_8963_iftrue,
MUX_uxn_c_l66_c15_8963_iffalse,
MUX_uxn_c_l66_c15_8963_return_output);

-- printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510
printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510 : entity work.printf_uxn_c_l68_c2_6510_0CLK_de264c78 port map (
printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_CLOCK_ENABLE,
printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg0,
printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg1,
printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg2,
printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg3,
printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg4);

-- BIN_OP_EQ_uxn_c_l70_c6_9172
BIN_OP_EQ_uxn_c_l70_c6_9172 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l70_c6_9172_left,
BIN_OP_EQ_uxn_c_l70_c6_9172_right,
BIN_OP_EQ_uxn_c_l70_c6_9172_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_return_output);

-- is_ins_done_MUX_uxn_c_l70_c2_9ece
is_ins_done_MUX_uxn_c_l70_c2_9ece : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l70_c2_9ece_cond,
is_ins_done_MUX_uxn_c_l70_c2_9ece_iftrue,
is_ins_done_MUX_uxn_c_l70_c2_9ece_iffalse,
is_ins_done_MUX_uxn_c_l70_c2_9ece_return_output);

-- eval_opcode_result_MUX_uxn_c_l70_c2_9ece
eval_opcode_result_MUX_uxn_c_l70_c2_9ece : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l70_c2_9ece_cond,
eval_opcode_result_MUX_uxn_c_l70_c2_9ece_iftrue,
eval_opcode_result_MUX_uxn_c_l70_c2_9ece_iffalse,
eval_opcode_result_MUX_uxn_c_l70_c2_9ece_return_output);

-- ins_MUX_uxn_c_l70_c2_9ece
ins_MUX_uxn_c_l70_c2_9ece : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l70_c2_9ece_cond,
ins_MUX_uxn_c_l70_c2_9ece_iftrue,
ins_MUX_uxn_c_l70_c2_9ece_iffalse,
ins_MUX_uxn_c_l70_c2_9ece_return_output);

-- pc_MUX_uxn_c_l70_c2_9ece
pc_MUX_uxn_c_l70_c2_9ece : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l70_c2_9ece_cond,
pc_MUX_uxn_c_l70_c2_9ece_iftrue,
pc_MUX_uxn_c_l70_c2_9ece_iffalse,
pc_MUX_uxn_c_l70_c2_9ece_return_output);

-- cpu_step_result_MUX_uxn_c_l70_c2_9ece
cpu_step_result_MUX_uxn_c_l70_c2_9ece : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l70_c2_9ece_cond,
cpu_step_result_MUX_uxn_c_l70_c2_9ece_iftrue,
cpu_step_result_MUX_uxn_c_l70_c2_9ece_iffalse,
cpu_step_result_MUX_uxn_c_l70_c2_9ece_return_output);

-- is_waiting_MUX_uxn_c_l70_c2_9ece
is_waiting_MUX_uxn_c_l70_c2_9ece : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l70_c2_9ece_cond,
is_waiting_MUX_uxn_c_l70_c2_9ece_iftrue,
is_waiting_MUX_uxn_c_l70_c2_9ece_iffalse,
is_waiting_MUX_uxn_c_l70_c2_9ece_return_output);

-- BIN_OP_EQ_uxn_c_l77_c11_823e
BIN_OP_EQ_uxn_c_l77_c11_823e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l77_c11_823e_left,
BIN_OP_EQ_uxn_c_l77_c11_823e_right,
BIN_OP_EQ_uxn_c_l77_c11_823e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_return_output);

-- is_ins_done_MUX_uxn_c_l77_c7_279b
is_ins_done_MUX_uxn_c_l77_c7_279b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l77_c7_279b_cond,
is_ins_done_MUX_uxn_c_l77_c7_279b_iftrue,
is_ins_done_MUX_uxn_c_l77_c7_279b_iffalse,
is_ins_done_MUX_uxn_c_l77_c7_279b_return_output);

-- eval_opcode_result_MUX_uxn_c_l77_c7_279b
eval_opcode_result_MUX_uxn_c_l77_c7_279b : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l77_c7_279b_cond,
eval_opcode_result_MUX_uxn_c_l77_c7_279b_iftrue,
eval_opcode_result_MUX_uxn_c_l77_c7_279b_iffalse,
eval_opcode_result_MUX_uxn_c_l77_c7_279b_return_output);

-- ins_MUX_uxn_c_l77_c7_279b
ins_MUX_uxn_c_l77_c7_279b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l77_c7_279b_cond,
ins_MUX_uxn_c_l77_c7_279b_iftrue,
ins_MUX_uxn_c_l77_c7_279b_iffalse,
ins_MUX_uxn_c_l77_c7_279b_return_output);

-- pc_MUX_uxn_c_l77_c7_279b
pc_MUX_uxn_c_l77_c7_279b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l77_c7_279b_cond,
pc_MUX_uxn_c_l77_c7_279b_iftrue,
pc_MUX_uxn_c_l77_c7_279b_iffalse,
pc_MUX_uxn_c_l77_c7_279b_return_output);

-- cpu_step_result_MUX_uxn_c_l77_c7_279b
cpu_step_result_MUX_uxn_c_l77_c7_279b : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l77_c7_279b_cond,
cpu_step_result_MUX_uxn_c_l77_c7_279b_iftrue,
cpu_step_result_MUX_uxn_c_l77_c7_279b_iffalse,
cpu_step_result_MUX_uxn_c_l77_c7_279b_return_output);

-- is_waiting_MUX_uxn_c_l77_c7_279b
is_waiting_MUX_uxn_c_l77_c7_279b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l77_c7_279b_cond,
is_waiting_MUX_uxn_c_l77_c7_279b_iftrue,
is_waiting_MUX_uxn_c_l77_c7_279b_iffalse,
is_waiting_MUX_uxn_c_l77_c7_279b_return_output);

-- BIN_OP_PLUS_uxn_c_l78_c3_ffbf
BIN_OP_PLUS_uxn_c_l78_c3_ffbf : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l78_c3_ffbf_left,
BIN_OP_PLUS_uxn_c_l78_c3_ffbf_right,
BIN_OP_PLUS_uxn_c_l78_c3_ffbf_return_output);

-- BIN_OP_EQ_uxn_c_l81_c9_96fd
BIN_OP_EQ_uxn_c_l81_c9_96fd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l81_c9_96fd_left,
BIN_OP_EQ_uxn_c_l81_c9_96fd_right,
BIN_OP_EQ_uxn_c_l81_c9_96fd_return_output);

-- MUX_uxn_c_l81_c9_0033
MUX_uxn_c_l81_c9_0033 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l81_c9_0033_cond,
MUX_uxn_c_l81_c9_0033_iftrue,
MUX_uxn_c_l81_c9_0033_iffalse,
MUX_uxn_c_l81_c9_0033_return_output);

-- BIN_OP_MINUS_uxn_c_l82_c43_74f3
BIN_OP_MINUS_uxn_c_l82_c43_74f3 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l82_c43_74f3_left,
BIN_OP_MINUS_uxn_c_l82_c43_74f3_right,
BIN_OP_MINUS_uxn_c_l82_c43_74f3_return_output);

-- eval_opcode_phased_uxn_c_l82_c24_298c
eval_opcode_phased_uxn_c_l82_c24_298c : entity work.eval_opcode_phased_0CLK_98495c5b port map (
clk,
eval_opcode_phased_uxn_c_l82_c24_298c_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l82_c24_298c_phase,
eval_opcode_phased_uxn_c_l82_c24_298c_ins,
eval_opcode_phased_uxn_c_l82_c24_298c_pc,
eval_opcode_phased_uxn_c_l82_c24_298c_previous_ram_read,
eval_opcode_phased_uxn_c_l82_c24_298c_previous_device_ram_read,
eval_opcode_phased_uxn_c_l82_c24_298c_return_output);

-- MUX_uxn_c_l83_c8_c892
MUX_uxn_c_l83_c8_c892 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l83_c8_c892_cond,
MUX_uxn_c_l83_c8_c892_iftrue,
MUX_uxn_c_l83_c8_c892_iffalse,
MUX_uxn_c_l83_c8_c892_return_output);

-- BIN_OP_OR_uxn_c_l96_c6_6257
BIN_OP_OR_uxn_c_l96_c6_6257 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l96_c6_6257_left,
BIN_OP_OR_uxn_c_l96_c6_6257_right,
BIN_OP_OR_uxn_c_l96_c6_6257_return_output);

-- step_cpu_phase_MUX_uxn_c_l96_c2_e9cb
step_cpu_phase_MUX_uxn_c_l96_c2_e9cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_cond,
step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_iftrue,
step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_iffalse,
step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_return_output);

-- BIN_OP_EQ_uxn_c_l99_c21_320f
BIN_OP_EQ_uxn_c_l99_c21_320f : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l99_c21_320f_left,
BIN_OP_EQ_uxn_c_l99_c21_320f_right,
BIN_OP_EQ_uxn_c_l99_c21_320f_return_output);

-- BIN_OP_PLUS_uxn_c_l99_c37_9d69
BIN_OP_PLUS_uxn_c_l99_c37_9d69 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l99_c37_9d69_left,
BIN_OP_PLUS_uxn_c_l99_c37_9d69_right,
BIN_OP_PLUS_uxn_c_l99_c37_9d69_return_output);

-- MUX_uxn_c_l99_c21_c828
MUX_uxn_c_l99_c21_c828 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l99_c21_c828_cond,
MUX_uxn_c_l99_c21_c828_iftrue,
MUX_uxn_c_l99_c21_c828_iffalse,
MUX_uxn_c_l99_c21_c828_return_output);



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
 BIN_OP_AND_uxn_c_l65_c8_0d40_return_output,
 MUX_uxn_c_l65_c8_53e6_return_output,
 MUX_uxn_c_l66_c15_8963_return_output,
 BIN_OP_EQ_uxn_c_l70_c6_9172_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_return_output,
 is_ins_done_MUX_uxn_c_l70_c2_9ece_return_output,
 eval_opcode_result_MUX_uxn_c_l70_c2_9ece_return_output,
 ins_MUX_uxn_c_l70_c2_9ece_return_output,
 pc_MUX_uxn_c_l70_c2_9ece_return_output,
 cpu_step_result_MUX_uxn_c_l70_c2_9ece_return_output,
 is_waiting_MUX_uxn_c_l70_c2_9ece_return_output,
 BIN_OP_EQ_uxn_c_l77_c11_823e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_return_output,
 is_ins_done_MUX_uxn_c_l77_c7_279b_return_output,
 eval_opcode_result_MUX_uxn_c_l77_c7_279b_return_output,
 ins_MUX_uxn_c_l77_c7_279b_return_output,
 pc_MUX_uxn_c_l77_c7_279b_return_output,
 cpu_step_result_MUX_uxn_c_l77_c7_279b_return_output,
 is_waiting_MUX_uxn_c_l77_c7_279b_return_output,
 BIN_OP_PLUS_uxn_c_l78_c3_ffbf_return_output,
 BIN_OP_EQ_uxn_c_l81_c9_96fd_return_output,
 MUX_uxn_c_l81_c9_0033_return_output,
 BIN_OP_MINUS_uxn_c_l82_c43_74f3_return_output,
 eval_opcode_phased_uxn_c_l82_c24_298c_return_output,
 MUX_uxn_c_l83_c8_c892_return_output,
 BIN_OP_OR_uxn_c_l96_c6_6257_return_output,
 step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_return_output,
 BIN_OP_EQ_uxn_c_l99_c21_320f_return_output,
 BIN_OP_PLUS_uxn_c_l99_c37_9d69_return_output,
 MUX_uxn_c_l99_c21_c828_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l65_c2_7f94 : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_53e6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_53e6_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_53e6_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l65_c8_0d40_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l65_c8_0d40_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l65_c8_0d40_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l65_c8_53e6_return_output : unsigned(15 downto 0);
 variable VAR_is_waiting_uxn_c_l66_c2_b18d : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_8963_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_8963_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_8963_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l66_c15_8963_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg4 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_9172_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_9172_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_9172_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_9ece_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_9ece_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_279b_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_9ece_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l70_c2_9ece_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_9ece_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_9ece_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_279b_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_9ece_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l70_c2_9ece_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_9ece_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_9ece_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_279b_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_9ece_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l70_c2_9ece_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_9ece_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_9ece_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_279b_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_9ece_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l70_c2_9ece_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_9ece_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l70_c2_9ece_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_9ece_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_279b_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_9ece_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l70_c2_9ece_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_9ece_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_9ece_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_279b_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_9ece_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l70_c2_9ece_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_823e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_823e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_823e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_279b_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_279b_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_279b_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_279b_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_279b_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_279b_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_279b_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_279b_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_279b_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_279b_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l78_c3_9e25 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_279b_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_279b_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_279b_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_279b_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l77_c7_279b_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_279b_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_279b_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_279b_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l77_c7_279b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_ffbf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_ffbf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_ffbf_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_0033_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_0033_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_0033_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c9_96fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c9_96fd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c9_96fd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l81_c9_0033_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_298c_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_298c_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_298c_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_298c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_298c_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_74f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_74f3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_74f3_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_298c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_298c_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l83_c8_c892_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_c892_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_c892_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_4b50_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_c892_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_90f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l86_c35_8200_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l87_c38_e46c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l88_c34_f2fd_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l89_c40_4764_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l90_c41_cfc4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l91_c30_e5b3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l92_c16_3022_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l93_c17_c095_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l96_c6_6257_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l96_c6_6257_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l96_c6_6257_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l97_c3_7aad : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_c828_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_c828_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_c828_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c21_320f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c21_320f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c21_320f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l99_c37_9d69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l99_c37_9d69_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l99_c37_9d69_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l99_c21_c828_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_ee32_return_output : unsigned(15 downto 0);
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
     VAR_MUX_uxn_c_l99_c21_c828_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_PLUS_uxn_c_l99_c37_9d69_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l66_c15_8963_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l77_c11_823e_right := to_unsigned(1, 1);
     VAR_is_ins_done_MUX_uxn_c_l70_c2_9ece_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l81_c9_96fd_right := to_unsigned(2, 2);
     VAR_step_cpu_phase_uxn_c_l97_c3_7aad := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_iftrue := VAR_step_cpu_phase_uxn_c_l97_c3_7aad;
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_ffbf_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l99_c21_320f_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_74f3_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l70_c6_9172_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_279b_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_9ece_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_279b_iftrue := eval_opcode_result;
     VAR_MUX_uxn_c_l81_c9_0033_iffalse := ins;
     VAR_ins_MUX_uxn_c_l70_c2_9ece_iftrue := ins;
     VAR_ins_MUX_uxn_c_l77_c7_279b_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_279b_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l65_c8_0d40_right := is_waiting;
     VAR_MUX_uxn_c_l66_c15_8963_iffalse := is_waiting;
     VAR_MUX_uxn_c_l65_c8_53e6_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l82_c24_298c_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l81_c9_0033_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l82_c24_298c_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l70_c6_9172_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l77_c11_823e_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l81_c9_96fd_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_74f3_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l99_c37_9d69_left := step_cpu_phase;
     VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg0 := resize(step_cpu_phase, 32);
     VAR_BIN_OP_AND_uxn_c_l65_c8_0d40_left := VAR_use_vector;
     VAR_MUX_uxn_c_l66_c15_8963_cond := VAR_use_vector;
     VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg3 := resize(VAR_use_vector, 32);
     VAR_MUX_uxn_c_l65_c8_53e6_iftrue := VAR_vector;
     VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg4 := resize(VAR_vector, 32);
     -- BIN_OP_AND[uxn_c_l65_c8_0d40] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l65_c8_0d40_left <= VAR_BIN_OP_AND_uxn_c_l65_c8_0d40_left;
     BIN_OP_AND_uxn_c_l65_c8_0d40_right <= VAR_BIN_OP_AND_uxn_c_l65_c8_0d40_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l65_c8_0d40_return_output := BIN_OP_AND_uxn_c_l65_c8_0d40_return_output;

     -- BIN_OP_EQ[uxn_c_l70_c6_9172] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l70_c6_9172_left <= VAR_BIN_OP_EQ_uxn_c_l70_c6_9172_left;
     BIN_OP_EQ_uxn_c_l70_c6_9172_right <= VAR_BIN_OP_EQ_uxn_c_l70_c6_9172_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l70_c6_9172_return_output := BIN_OP_EQ_uxn_c_l70_c6_9172_return_output;

     -- BIN_OP_EQ[uxn_c_l81_c9_96fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l81_c9_96fd_left <= VAR_BIN_OP_EQ_uxn_c_l81_c9_96fd_left;
     BIN_OP_EQ_uxn_c_l81_c9_96fd_right <= VAR_BIN_OP_EQ_uxn_c_l81_c9_96fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l81_c9_96fd_return_output := BIN_OP_EQ_uxn_c_l81_c9_96fd_return_output;

     -- MUX[uxn_c_l66_c15_8963] LATENCY=0
     -- Inputs
     MUX_uxn_c_l66_c15_8963_cond <= VAR_MUX_uxn_c_l66_c15_8963_cond;
     MUX_uxn_c_l66_c15_8963_iftrue <= VAR_MUX_uxn_c_l66_c15_8963_iftrue;
     MUX_uxn_c_l66_c15_8963_iffalse <= VAR_MUX_uxn_c_l66_c15_8963_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l66_c15_8963_return_output := MUX_uxn_c_l66_c15_8963_return_output;

     -- BIN_OP_PLUS[uxn_c_l99_c37_9d69] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l99_c37_9d69_left <= VAR_BIN_OP_PLUS_uxn_c_l99_c37_9d69_left;
     BIN_OP_PLUS_uxn_c_l99_c37_9d69_right <= VAR_BIN_OP_PLUS_uxn_c_l99_c37_9d69_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l99_c37_9d69_return_output := BIN_OP_PLUS_uxn_c_l99_c37_9d69_return_output;

     -- BIN_OP_EQ[uxn_c_l77_c11_823e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l77_c11_823e_left <= VAR_BIN_OP_EQ_uxn_c_l77_c11_823e_left;
     BIN_OP_EQ_uxn_c_l77_c11_823e_right <= VAR_BIN_OP_EQ_uxn_c_l77_c11_823e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l77_c11_823e_return_output := BIN_OP_EQ_uxn_c_l77_c11_823e_return_output;

     -- BIN_OP_MINUS[uxn_c_l82_c43_74f3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l82_c43_74f3_left <= VAR_BIN_OP_MINUS_uxn_c_l82_c43_74f3_left;
     BIN_OP_MINUS_uxn_c_l82_c43_74f3_right <= VAR_BIN_OP_MINUS_uxn_c_l82_c43_74f3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_74f3_return_output := BIN_OP_MINUS_uxn_c_l82_c43_74f3_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l65_c8_53e6_cond := VAR_BIN_OP_AND_uxn_c_l65_c8_0d40_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_9172_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_9ece_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_9172_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_9ece_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_9172_return_output;
     VAR_ins_MUX_uxn_c_l70_c2_9ece_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_9172_return_output;
     VAR_is_ins_done_MUX_uxn_c_l70_c2_9ece_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_9172_return_output;
     VAR_is_waiting_MUX_uxn_c_l70_c2_9ece_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_9172_return_output;
     VAR_pc_MUX_uxn_c_l70_c2_9ece_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_9172_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_823e_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_279b_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_823e_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_279b_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_823e_return_output;
     VAR_ins_MUX_uxn_c_l77_c7_279b_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_823e_return_output;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_279b_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_823e_return_output;
     VAR_is_waiting_MUX_uxn_c_l77_c7_279b_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_823e_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_279b_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_823e_return_output;
     VAR_MUX_uxn_c_l81_c9_0033_cond := VAR_BIN_OP_EQ_uxn_c_l81_c9_96fd_return_output;
     VAR_eval_opcode_phased_uxn_c_l82_c24_298c_phase := VAR_BIN_OP_MINUS_uxn_c_l82_c43_74f3_return_output;
     VAR_MUX_uxn_c_l99_c21_c828_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l99_c37_9d69_return_output, 8);
     VAR_is_waiting_uxn_c_l66_c2_b18d := VAR_MUX_uxn_c_l66_c15_8963_return_output;
     VAR_is_waiting_MUX_uxn_c_l70_c2_9ece_iftrue := VAR_is_waiting_uxn_c_l66_c2_b18d;
     VAR_is_waiting_MUX_uxn_c_l77_c7_279b_iftrue := VAR_is_waiting_uxn_c_l66_c2_b18d;
     VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg2 := resize(VAR_is_waiting_uxn_c_l66_c2_b18d, 32);
     -- MUX[uxn_c_l65_c8_53e6] LATENCY=0
     -- Inputs
     MUX_uxn_c_l65_c8_53e6_cond <= VAR_MUX_uxn_c_l65_c8_53e6_cond;
     MUX_uxn_c_l65_c8_53e6_iftrue <= VAR_MUX_uxn_c_l65_c8_53e6_iftrue;
     MUX_uxn_c_l65_c8_53e6_iffalse <= VAR_MUX_uxn_c_l65_c8_53e6_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l65_c8_53e6_return_output := MUX_uxn_c_l65_c8_53e6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l77_c7_279b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_return_output;

     -- MUX[uxn_c_l81_c9_0033] LATENCY=0
     -- Inputs
     MUX_uxn_c_l81_c9_0033_cond <= VAR_MUX_uxn_c_l81_c9_0033_cond;
     MUX_uxn_c_l81_c9_0033_iftrue <= VAR_MUX_uxn_c_l81_c9_0033_iftrue;
     MUX_uxn_c_l81_c9_0033_iffalse <= VAR_MUX_uxn_c_l81_c9_0033_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l81_c9_0033_return_output := MUX_uxn_c_l81_c9_0033_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_279b_return_output;
     VAR_pc_uxn_c_l65_c2_7f94 := VAR_MUX_uxn_c_l65_c8_53e6_return_output;
     VAR_eval_opcode_phased_uxn_c_l82_c24_298c_ins := VAR_MUX_uxn_c_l81_c9_0033_return_output;
     VAR_ins_MUX_uxn_c_l77_c7_279b_iffalse := VAR_MUX_uxn_c_l81_c9_0033_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_ffbf_left := VAR_pc_uxn_c_l65_c2_7f94;
     VAR_MUX_uxn_c_l83_c8_c892_iffalse := VAR_pc_uxn_c_l65_c2_7f94;
     VAR_eval_opcode_phased_uxn_c_l82_c24_298c_pc := VAR_pc_uxn_c_l65_c2_7f94;
     VAR_pc_MUX_uxn_c_l70_c2_9ece_iftrue := VAR_pc_uxn_c_l65_c2_7f94;
     VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg1 := resize(VAR_pc_uxn_c_l65_c2_7f94, 32);
     -- BIN_OP_PLUS[uxn_c_l78_c3_ffbf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l78_c3_ffbf_left <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_ffbf_left;
     BIN_OP_PLUS_uxn_c_l78_c3_ffbf_right <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_ffbf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_ffbf_return_output := BIN_OP_PLUS_uxn_c_l78_c3_ffbf_return_output;

     -- printf_uxn_c_l68_c2_6510[uxn_c_l68_c2_6510] LATENCY=0
     -- Clock enable
     printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_CLOCK_ENABLE <= VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg0 <= VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg0;
     printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg1 <= VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg1;
     printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg2 <= VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg2;
     printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg3 <= VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg3;
     printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg4 <= VAR_printf_uxn_c_l68_c2_6510_uxn_c_l68_c2_6510_arg4;
     -- Outputs

     -- ins_MUX[uxn_c_l77_c7_279b] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l77_c7_279b_cond <= VAR_ins_MUX_uxn_c_l77_c7_279b_cond;
     ins_MUX_uxn_c_l77_c7_279b_iftrue <= VAR_ins_MUX_uxn_c_l77_c7_279b_iftrue;
     ins_MUX_uxn_c_l77_c7_279b_iffalse <= VAR_ins_MUX_uxn_c_l77_c7_279b_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l77_c7_279b_return_output := ins_MUX_uxn_c_l77_c7_279b_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7[uxn_c_l70_c2_9ece] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l70_c2_9ece_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7(
     cpu_step_result,
     VAR_pc_uxn_c_l65_c2_7f94,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_8289] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_return_output;

     -- Submodule level 3
     VAR_pc_uxn_c_l78_c3_9e25 := resize(VAR_BIN_OP_PLUS_uxn_c_l78_c3_ffbf_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l82_c24_298c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_8289_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_9ece_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l70_c2_9ece_return_output;
     VAR_ins_MUX_uxn_c_l70_c2_9ece_iffalse := VAR_ins_MUX_uxn_c_l77_c7_279b_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_279b_iftrue := VAR_pc_uxn_c_l78_c3_9e25;
     -- ins_MUX[uxn_c_l70_c2_9ece] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l70_c2_9ece_cond <= VAR_ins_MUX_uxn_c_l70_c2_9ece_cond;
     ins_MUX_uxn_c_l70_c2_9ece_iftrue <= VAR_ins_MUX_uxn_c_l70_c2_9ece_iftrue;
     ins_MUX_uxn_c_l70_c2_9ece_iffalse <= VAR_ins_MUX_uxn_c_l70_c2_9ece_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l70_c2_9ece_return_output := ins_MUX_uxn_c_l70_c2_9ece_return_output;

     -- eval_opcode_phased[uxn_c_l82_c24_298c] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l82_c24_298c_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l82_c24_298c_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l82_c24_298c_phase <= VAR_eval_opcode_phased_uxn_c_l82_c24_298c_phase;
     eval_opcode_phased_uxn_c_l82_c24_298c_ins <= VAR_eval_opcode_phased_uxn_c_l82_c24_298c_ins;
     eval_opcode_phased_uxn_c_l82_c24_298c_pc <= VAR_eval_opcode_phased_uxn_c_l82_c24_298c_pc;
     eval_opcode_phased_uxn_c_l82_c24_298c_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l82_c24_298c_previous_ram_read;
     eval_opcode_phased_uxn_c_l82_c24_298c_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l82_c24_298c_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l82_c24_298c_return_output := eval_opcode_phased_uxn_c_l82_c24_298c_return_output;

     -- Submodule level 4
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_279b_iffalse := VAR_eval_opcode_phased_uxn_c_l82_c24_298c_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l70_c2_9ece_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l92_c16_3022] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l92_c16_3022_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_298c_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l87_c38_e46c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l87_c38_e46c_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_298c_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l89_c40_4764] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l89_c40_4764_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_298c_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l86_c35_8200] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l86_c35_8200_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_298c_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l90_c41_cfc4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l90_c41_cfc4_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_298c_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l88_c34_f2fd] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l88_c34_f2fd_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_298c_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l84_c34_90f5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_90f5_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_298c_return_output.is_ram_write;

     -- eval_opcode_result_MUX[uxn_c_l77_c7_279b] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l77_c7_279b_cond <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_279b_cond;
     eval_opcode_result_MUX_uxn_c_l77_c7_279b_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_279b_iftrue;
     eval_opcode_result_MUX_uxn_c_l77_c7_279b_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_279b_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_279b_return_output := eval_opcode_result_MUX_uxn_c_l77_c7_279b_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l83_c8_4b50] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_4b50_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_298c_return_output.is_pc_updated;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l91_c30_e5b3] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l91_c30_e5b3_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_298c_return_output.u8_value;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_ee32 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_ee32_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_298c_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l93_c17_c095] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l93_c17_c095_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_298c_return_output.is_opc_done;

     -- Submodule level 5
     VAR_MUX_uxn_c_l83_c8_c892_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_ee32_return_output;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_279b_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l93_c17_c095_return_output;
     VAR_MUX_uxn_c_l83_c8_c892_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_4b50_return_output;
     VAR_is_waiting_MUX_uxn_c_l77_c7_279b_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l92_c16_3022_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_9ece_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l77_c7_279b_return_output;
     -- is_waiting_MUX[uxn_c_l77_c7_279b] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l77_c7_279b_cond <= VAR_is_waiting_MUX_uxn_c_l77_c7_279b_cond;
     is_waiting_MUX_uxn_c_l77_c7_279b_iftrue <= VAR_is_waiting_MUX_uxn_c_l77_c7_279b_iftrue;
     is_waiting_MUX_uxn_c_l77_c7_279b_iffalse <= VAR_is_waiting_MUX_uxn_c_l77_c7_279b_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l77_c7_279b_return_output := is_waiting_MUX_uxn_c_l77_c7_279b_return_output;

     -- eval_opcode_result_MUX[uxn_c_l70_c2_9ece] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l70_c2_9ece_cond <= VAR_eval_opcode_result_MUX_uxn_c_l70_c2_9ece_cond;
     eval_opcode_result_MUX_uxn_c_l70_c2_9ece_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l70_c2_9ece_iftrue;
     eval_opcode_result_MUX_uxn_c_l70_c2_9ece_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l70_c2_9ece_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l70_c2_9ece_return_output := eval_opcode_result_MUX_uxn_c_l70_c2_9ece_return_output;

     -- is_ins_done_MUX[uxn_c_l77_c7_279b] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l77_c7_279b_cond <= VAR_is_ins_done_MUX_uxn_c_l77_c7_279b_cond;
     is_ins_done_MUX_uxn_c_l77_c7_279b_iftrue <= VAR_is_ins_done_MUX_uxn_c_l77_c7_279b_iftrue;
     is_ins_done_MUX_uxn_c_l77_c7_279b_iffalse <= VAR_is_ins_done_MUX_uxn_c_l77_c7_279b_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l77_c7_279b_return_output := is_ins_done_MUX_uxn_c_l77_c7_279b_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030[uxn_c_l77_c7_279b] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l77_c7_279b_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_90f5_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l85_l83_DUPLICATE_ee32_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l86_c35_8200_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l87_c38_e46c_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l88_c34_f2fd_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l89_c40_4764_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l90_c41_cfc4_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l91_c30_e5b3_return_output);

     -- MUX[uxn_c_l83_c8_c892] LATENCY=0
     -- Inputs
     MUX_uxn_c_l83_c8_c892_cond <= VAR_MUX_uxn_c_l83_c8_c892_cond;
     MUX_uxn_c_l83_c8_c892_iftrue <= VAR_MUX_uxn_c_l83_c8_c892_iftrue;
     MUX_uxn_c_l83_c8_c892_iffalse <= VAR_MUX_uxn_c_l83_c8_c892_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l83_c8_c892_return_output := MUX_uxn_c_l83_c8_c892_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l77_c7_279b_iffalse := VAR_MUX_uxn_c_l83_c8_c892_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_279b_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l77_c7_279b_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l70_c2_9ece_return_output;
     VAR_is_ins_done_MUX_uxn_c_l70_c2_9ece_iffalse := VAR_is_ins_done_MUX_uxn_c_l77_c7_279b_return_output;
     VAR_is_waiting_MUX_uxn_c_l70_c2_9ece_iffalse := VAR_is_waiting_MUX_uxn_c_l77_c7_279b_return_output;
     -- is_ins_done_MUX[uxn_c_l70_c2_9ece] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l70_c2_9ece_cond <= VAR_is_ins_done_MUX_uxn_c_l70_c2_9ece_cond;
     is_ins_done_MUX_uxn_c_l70_c2_9ece_iftrue <= VAR_is_ins_done_MUX_uxn_c_l70_c2_9ece_iftrue;
     is_ins_done_MUX_uxn_c_l70_c2_9ece_iffalse <= VAR_is_ins_done_MUX_uxn_c_l70_c2_9ece_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l70_c2_9ece_return_output := is_ins_done_MUX_uxn_c_l70_c2_9ece_return_output;

     -- is_waiting_MUX[uxn_c_l70_c2_9ece] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l70_c2_9ece_cond <= VAR_is_waiting_MUX_uxn_c_l70_c2_9ece_cond;
     is_waiting_MUX_uxn_c_l70_c2_9ece_iftrue <= VAR_is_waiting_MUX_uxn_c_l70_c2_9ece_iftrue;
     is_waiting_MUX_uxn_c_l70_c2_9ece_iffalse <= VAR_is_waiting_MUX_uxn_c_l70_c2_9ece_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l70_c2_9ece_return_output := is_waiting_MUX_uxn_c_l70_c2_9ece_return_output;

     -- cpu_step_result_MUX[uxn_c_l77_c7_279b] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l77_c7_279b_cond <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_279b_cond;
     cpu_step_result_MUX_uxn_c_l77_c7_279b_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_279b_iftrue;
     cpu_step_result_MUX_uxn_c_l77_c7_279b_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_279b_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_279b_return_output := cpu_step_result_MUX_uxn_c_l77_c7_279b_return_output;

     -- pc_MUX[uxn_c_l77_c7_279b] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l77_c7_279b_cond <= VAR_pc_MUX_uxn_c_l77_c7_279b_cond;
     pc_MUX_uxn_c_l77_c7_279b_iftrue <= VAR_pc_MUX_uxn_c_l77_c7_279b_iftrue;
     pc_MUX_uxn_c_l77_c7_279b_iffalse <= VAR_pc_MUX_uxn_c_l77_c7_279b_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l77_c7_279b_return_output := pc_MUX_uxn_c_l77_c7_279b_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_9ece_iffalse := VAR_cpu_step_result_MUX_uxn_c_l77_c7_279b_return_output;
     VAR_BIN_OP_OR_uxn_c_l96_c6_6257_left := VAR_is_ins_done_MUX_uxn_c_l70_c2_9ece_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l70_c2_9ece_return_output;
     VAR_BIN_OP_OR_uxn_c_l96_c6_6257_right := VAR_is_waiting_MUX_uxn_c_l70_c2_9ece_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l70_c2_9ece_return_output;
     VAR_pc_MUX_uxn_c_l70_c2_9ece_iffalse := VAR_pc_MUX_uxn_c_l77_c7_279b_return_output;
     -- pc_MUX[uxn_c_l70_c2_9ece] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l70_c2_9ece_cond <= VAR_pc_MUX_uxn_c_l70_c2_9ece_cond;
     pc_MUX_uxn_c_l70_c2_9ece_iftrue <= VAR_pc_MUX_uxn_c_l70_c2_9ece_iftrue;
     pc_MUX_uxn_c_l70_c2_9ece_iffalse <= VAR_pc_MUX_uxn_c_l70_c2_9ece_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l70_c2_9ece_return_output := pc_MUX_uxn_c_l70_c2_9ece_return_output;

     -- BIN_OP_OR[uxn_c_l96_c6_6257] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l96_c6_6257_left <= VAR_BIN_OP_OR_uxn_c_l96_c6_6257_left;
     BIN_OP_OR_uxn_c_l96_c6_6257_right <= VAR_BIN_OP_OR_uxn_c_l96_c6_6257_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l96_c6_6257_return_output := BIN_OP_OR_uxn_c_l96_c6_6257_return_output;

     -- cpu_step_result_MUX[uxn_c_l70_c2_9ece] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l70_c2_9ece_cond <= VAR_cpu_step_result_MUX_uxn_c_l70_c2_9ece_cond;
     cpu_step_result_MUX_uxn_c_l70_c2_9ece_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l70_c2_9ece_iftrue;
     cpu_step_result_MUX_uxn_c_l70_c2_9ece_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l70_c2_9ece_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l70_c2_9ece_return_output := cpu_step_result_MUX_uxn_c_l70_c2_9ece_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_cond := VAR_BIN_OP_OR_uxn_c_l96_c6_6257_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l70_c2_9ece_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l70_c2_9ece_return_output;
     VAR_BIN_OP_EQ_uxn_c_l99_c21_320f_left := VAR_pc_MUX_uxn_c_l70_c2_9ece_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l70_c2_9ece_return_output;
     -- BIN_OP_EQ[uxn_c_l99_c21_320f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l99_c21_320f_left <= VAR_BIN_OP_EQ_uxn_c_l99_c21_320f_left;
     BIN_OP_EQ_uxn_c_l99_c21_320f_right <= VAR_BIN_OP_EQ_uxn_c_l99_c21_320f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l99_c21_320f_return_output := BIN_OP_EQ_uxn_c_l99_c21_320f_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l99_c21_c828_cond := VAR_BIN_OP_EQ_uxn_c_l99_c21_320f_return_output;
     -- MUX[uxn_c_l99_c21_c828] LATENCY=0
     -- Inputs
     MUX_uxn_c_l99_c21_c828_cond <= VAR_MUX_uxn_c_l99_c21_c828_cond;
     MUX_uxn_c_l99_c21_c828_iftrue <= VAR_MUX_uxn_c_l99_c21_c828_iftrue;
     MUX_uxn_c_l99_c21_c828_iffalse <= VAR_MUX_uxn_c_l99_c21_c828_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l99_c21_c828_return_output := MUX_uxn_c_l99_c21_c828_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_iffalse := VAR_MUX_uxn_c_l99_c21_c828_return_output;
     -- step_cpu_phase_MUX[uxn_c_l96_c2_e9cb] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_cond <= VAR_step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_cond;
     step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_iftrue;
     step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_return_output := step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l96_c2_e9cb_return_output;
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
