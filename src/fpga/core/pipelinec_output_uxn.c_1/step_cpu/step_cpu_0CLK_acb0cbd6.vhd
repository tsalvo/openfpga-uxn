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
-- Submodules: 38
entity step_cpu_0CLK_acb0cbd6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ram_read_value : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_acb0cbd6;
architecture arch of step_cpu_0CLK_acb0cbd6 is
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
signal eval_opcode_result : eval_opcode_result_t := eval_opcode_result_t_NULL;
signal cpu_step_result : cpu_step_result_t := (
is_ram_read => to_unsigned(0, 1),
is_ram_write => to_unsigned(0, 1),
ram_address => to_unsigned(0, 16),
ram_value => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
vram_value => to_unsigned(0, 2))
;
signal REG_COMB_pc : unsigned(15 downto 0);
signal REG_COMB_ins : unsigned(7 downto 0);
signal REG_COMB_step_cpu_phase : unsigned(7 downto 0);
signal REG_COMB_is_ins_done : unsigned(0 downto 0);
signal REG_COMB_eval_opcode_result : eval_opcode_result_t;
signal REG_COMB_cpu_step_result : cpu_step_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_c_l68_c6_9840]
signal BIN_OP_EQ_uxn_c_l68_c6_9840_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_9840_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_9840_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_fe02]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l74_c7_0ec7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l68_c2_a0ee]
signal pc_MUX_uxn_c_l68_c2_a0ee_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l68_c2_a0ee_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_a0ee_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_a0ee_return_output : unsigned(15 downto 0);

-- is_ins_done_MUX[uxn_c_l68_c2_a0ee]
signal is_ins_done_MUX_uxn_c_l68_c2_a0ee_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_a0ee_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_a0ee_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_a0ee_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l68_c2_a0ee]
signal eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_return_output : eval_opcode_result_t;

-- cpu_step_result_MUX[uxn_c_l68_c2_a0ee]
signal cpu_step_result_MUX_uxn_c_l68_c2_a0ee_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l68_c2_a0ee_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_a0ee_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_a0ee_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l68_c2_a0ee]
signal ins_MUX_uxn_c_l68_c2_a0ee_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l68_c2_a0ee_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_a0ee_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_a0ee_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l72_c3_2db6[uxn_c_l72_c3_2db6]
signal printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l74_c11_ac76]
signal BIN_OP_EQ_uxn_c_l74_c11_ac76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c11_ac76_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c11_ac76_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l74_c1_eef6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c7_1fad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l74_c7_0ec7]
signal pc_MUX_uxn_c_l74_c7_0ec7_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l74_c7_0ec7_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c7_0ec7_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c7_0ec7_return_output : unsigned(15 downto 0);

-- is_ins_done_MUX[uxn_c_l74_c7_0ec7]
signal is_ins_done_MUX_uxn_c_l74_c7_0ec7_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c7_0ec7_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c7_0ec7_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c7_0ec7_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l74_c7_0ec7]
signal eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_return_output : eval_opcode_result_t;

-- cpu_step_result_MUX[uxn_c_l74_c7_0ec7]
signal cpu_step_result_MUX_uxn_c_l74_c7_0ec7_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l74_c7_0ec7_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l74_c7_0ec7_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l74_c7_0ec7_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l74_c7_0ec7]
signal ins_MUX_uxn_c_l74_c7_0ec7_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l74_c7_0ec7_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c7_0ec7_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c7_0ec7_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l78_c3_42f1[uxn_c_l78_c3_42f1]
signal printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l80_c11_b1d7]
signal BIN_OP_EQ_uxn_c_l80_c11_b1d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l80_c11_b1d7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l80_c11_b1d7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_3275]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_b96d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l80_c7_1fad]
signal pc_MUX_uxn_c_l80_c7_1fad_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l80_c7_1fad_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l80_c7_1fad_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l80_c7_1fad_return_output : unsigned(15 downto 0);

-- is_ins_done_MUX[uxn_c_l80_c7_1fad]
signal is_ins_done_MUX_uxn_c_l80_c7_1fad_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l80_c7_1fad_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l80_c7_1fad_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l80_c7_1fad_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l80_c7_1fad]
signal eval_opcode_result_MUX_uxn_c_l80_c7_1fad_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l80_c7_1fad_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l80_c7_1fad_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l80_c7_1fad_return_output : eval_opcode_result_t;

-- cpu_step_result_MUX[uxn_c_l80_c7_1fad]
signal cpu_step_result_MUX_uxn_c_l80_c7_1fad_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l80_c7_1fad_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l80_c7_1fad_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l80_c7_1fad_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l80_c7_1fad]
signal ins_MUX_uxn_c_l80_c7_1fad_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l80_c7_1fad_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l80_c7_1fad_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l80_c7_1fad_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l82_c3_c7e1]
signal BIN_OP_PLUS_uxn_c_l82_c3_c7e1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_c7e1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_c7e1_return_output : unsigned(16 downto 0);

-- printf_uxn_c_l83_c3_6d58[uxn_c_l83_c3_6d58]
signal printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg2 : unsigned(31 downto 0);

-- BIN_OP_MINUS[uxn_c_l86_c43_ff6d]
signal BIN_OP_MINUS_uxn_c_l86_c43_ff6d_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c43_ff6d_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c43_ff6d_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l86_c24_6db2]
signal eval_opcode_phased_uxn_c_l86_c24_6db2_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_6db2_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_6db2_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_6db2_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_6db2_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_6db2_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l87_c8_1386]
signal MUX_uxn_c_l87_c8_1386_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l87_c8_1386_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_1386_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_1386_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l96_c3_25a9[uxn_c_l96_c3_25a9]
signal printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l99_c6_1bfc]
signal BIN_OP_EQ_uxn_c_l99_c6_1bfc_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c6_1bfc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c6_1bfc_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l99_c2_50bd]
signal step_cpu_phase_MUX_uxn_c_l99_c2_50bd_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_50bd_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_50bd_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_50bd_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l102_c3_1d34]
signal BIN_OP_PLUS_uxn_c_l102_c3_1d34_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c3_1d34_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c3_1d34_return_output : unsigned(8 downto 0);

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f( ref_toks_0 : cpu_step_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base := ref_toks_0;
      base.ram_address := ref_toks_1;
      base.is_ram_read := ref_toks_2;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base.is_ram_read := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.ram_address := ref_toks_2;
      base.ram_value := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.vram_address := ref_toks_5;
      base.vram_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_c_l68_c6_9840
BIN_OP_EQ_uxn_c_l68_c6_9840 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l68_c6_9840_left,
BIN_OP_EQ_uxn_c_l68_c6_9840_right,
BIN_OP_EQ_uxn_c_l68_c6_9840_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_return_output);

-- pc_MUX_uxn_c_l68_c2_a0ee
pc_MUX_uxn_c_l68_c2_a0ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l68_c2_a0ee_cond,
pc_MUX_uxn_c_l68_c2_a0ee_iftrue,
pc_MUX_uxn_c_l68_c2_a0ee_iffalse,
pc_MUX_uxn_c_l68_c2_a0ee_return_output);

-- is_ins_done_MUX_uxn_c_l68_c2_a0ee
is_ins_done_MUX_uxn_c_l68_c2_a0ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l68_c2_a0ee_cond,
is_ins_done_MUX_uxn_c_l68_c2_a0ee_iftrue,
is_ins_done_MUX_uxn_c_l68_c2_a0ee_iffalse,
is_ins_done_MUX_uxn_c_l68_c2_a0ee_return_output);

-- eval_opcode_result_MUX_uxn_c_l68_c2_a0ee
eval_opcode_result_MUX_uxn_c_l68_c2_a0ee : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_cond,
eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_iftrue,
eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_iffalse,
eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_return_output);

-- cpu_step_result_MUX_uxn_c_l68_c2_a0ee
cpu_step_result_MUX_uxn_c_l68_c2_a0ee : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l68_c2_a0ee_cond,
cpu_step_result_MUX_uxn_c_l68_c2_a0ee_iftrue,
cpu_step_result_MUX_uxn_c_l68_c2_a0ee_iffalse,
cpu_step_result_MUX_uxn_c_l68_c2_a0ee_return_output);

-- ins_MUX_uxn_c_l68_c2_a0ee
ins_MUX_uxn_c_l68_c2_a0ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l68_c2_a0ee_cond,
ins_MUX_uxn_c_l68_c2_a0ee_iftrue,
ins_MUX_uxn_c_l68_c2_a0ee_iffalse,
ins_MUX_uxn_c_l68_c2_a0ee_return_output);

-- printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6
printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6 : entity work.printf_uxn_c_l72_c3_2db6_0CLK_de264c78 port map (
printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_CLOCK_ENABLE,
printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_arg0,
printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_arg1);

-- BIN_OP_EQ_uxn_c_l74_c11_ac76
BIN_OP_EQ_uxn_c_l74_c11_ac76 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l74_c11_ac76_left,
BIN_OP_EQ_uxn_c_l74_c11_ac76_right,
BIN_OP_EQ_uxn_c_l74_c11_ac76_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_return_output);

-- pc_MUX_uxn_c_l74_c7_0ec7
pc_MUX_uxn_c_l74_c7_0ec7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l74_c7_0ec7_cond,
pc_MUX_uxn_c_l74_c7_0ec7_iftrue,
pc_MUX_uxn_c_l74_c7_0ec7_iffalse,
pc_MUX_uxn_c_l74_c7_0ec7_return_output);

-- is_ins_done_MUX_uxn_c_l74_c7_0ec7
is_ins_done_MUX_uxn_c_l74_c7_0ec7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l74_c7_0ec7_cond,
is_ins_done_MUX_uxn_c_l74_c7_0ec7_iftrue,
is_ins_done_MUX_uxn_c_l74_c7_0ec7_iffalse,
is_ins_done_MUX_uxn_c_l74_c7_0ec7_return_output);

-- eval_opcode_result_MUX_uxn_c_l74_c7_0ec7
eval_opcode_result_MUX_uxn_c_l74_c7_0ec7 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_cond,
eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_iftrue,
eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_iffalse,
eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_return_output);

-- cpu_step_result_MUX_uxn_c_l74_c7_0ec7
cpu_step_result_MUX_uxn_c_l74_c7_0ec7 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l74_c7_0ec7_cond,
cpu_step_result_MUX_uxn_c_l74_c7_0ec7_iftrue,
cpu_step_result_MUX_uxn_c_l74_c7_0ec7_iffalse,
cpu_step_result_MUX_uxn_c_l74_c7_0ec7_return_output);

-- ins_MUX_uxn_c_l74_c7_0ec7
ins_MUX_uxn_c_l74_c7_0ec7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l74_c7_0ec7_cond,
ins_MUX_uxn_c_l74_c7_0ec7_iftrue,
ins_MUX_uxn_c_l74_c7_0ec7_iffalse,
ins_MUX_uxn_c_l74_c7_0ec7_return_output);

-- printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1
printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1 : entity work.printf_uxn_c_l78_c3_42f1_0CLK_de264c78 port map (
printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_CLOCK_ENABLE,
printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg0,
printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg1,
printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg2);

-- BIN_OP_EQ_uxn_c_l80_c11_b1d7
BIN_OP_EQ_uxn_c_l80_c11_b1d7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l80_c11_b1d7_left,
BIN_OP_EQ_uxn_c_l80_c11_b1d7_right,
BIN_OP_EQ_uxn_c_l80_c11_b1d7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_return_output);

-- pc_MUX_uxn_c_l80_c7_1fad
pc_MUX_uxn_c_l80_c7_1fad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l80_c7_1fad_cond,
pc_MUX_uxn_c_l80_c7_1fad_iftrue,
pc_MUX_uxn_c_l80_c7_1fad_iffalse,
pc_MUX_uxn_c_l80_c7_1fad_return_output);

-- is_ins_done_MUX_uxn_c_l80_c7_1fad
is_ins_done_MUX_uxn_c_l80_c7_1fad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l80_c7_1fad_cond,
is_ins_done_MUX_uxn_c_l80_c7_1fad_iftrue,
is_ins_done_MUX_uxn_c_l80_c7_1fad_iffalse,
is_ins_done_MUX_uxn_c_l80_c7_1fad_return_output);

-- eval_opcode_result_MUX_uxn_c_l80_c7_1fad
eval_opcode_result_MUX_uxn_c_l80_c7_1fad : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l80_c7_1fad_cond,
eval_opcode_result_MUX_uxn_c_l80_c7_1fad_iftrue,
eval_opcode_result_MUX_uxn_c_l80_c7_1fad_iffalse,
eval_opcode_result_MUX_uxn_c_l80_c7_1fad_return_output);

-- cpu_step_result_MUX_uxn_c_l80_c7_1fad
cpu_step_result_MUX_uxn_c_l80_c7_1fad : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l80_c7_1fad_cond,
cpu_step_result_MUX_uxn_c_l80_c7_1fad_iftrue,
cpu_step_result_MUX_uxn_c_l80_c7_1fad_iffalse,
cpu_step_result_MUX_uxn_c_l80_c7_1fad_return_output);

-- ins_MUX_uxn_c_l80_c7_1fad
ins_MUX_uxn_c_l80_c7_1fad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l80_c7_1fad_cond,
ins_MUX_uxn_c_l80_c7_1fad_iftrue,
ins_MUX_uxn_c_l80_c7_1fad_iffalse,
ins_MUX_uxn_c_l80_c7_1fad_return_output);

-- BIN_OP_PLUS_uxn_c_l82_c3_c7e1
BIN_OP_PLUS_uxn_c_l82_c3_c7e1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l82_c3_c7e1_left,
BIN_OP_PLUS_uxn_c_l82_c3_c7e1_right,
BIN_OP_PLUS_uxn_c_l82_c3_c7e1_return_output);

-- printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58
printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58 : entity work.printf_uxn_c_l83_c3_6d58_0CLK_de264c78 port map (
printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_CLOCK_ENABLE,
printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg0,
printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg1,
printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg2);

-- BIN_OP_MINUS_uxn_c_l86_c43_ff6d
BIN_OP_MINUS_uxn_c_l86_c43_ff6d : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l86_c43_ff6d_left,
BIN_OP_MINUS_uxn_c_l86_c43_ff6d_right,
BIN_OP_MINUS_uxn_c_l86_c43_ff6d_return_output);

-- eval_opcode_phased_uxn_c_l86_c24_6db2
eval_opcode_phased_uxn_c_l86_c24_6db2 : entity work.eval_opcode_phased_0CLK_1d648084 port map (
clk,
eval_opcode_phased_uxn_c_l86_c24_6db2_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l86_c24_6db2_phase,
eval_opcode_phased_uxn_c_l86_c24_6db2_ins,
eval_opcode_phased_uxn_c_l86_c24_6db2_pc,
eval_opcode_phased_uxn_c_l86_c24_6db2_previous_ram_read,
eval_opcode_phased_uxn_c_l86_c24_6db2_return_output);

-- MUX_uxn_c_l87_c8_1386
MUX_uxn_c_l87_c8_1386 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l87_c8_1386_cond,
MUX_uxn_c_l87_c8_1386_iftrue,
MUX_uxn_c_l87_c8_1386_iffalse,
MUX_uxn_c_l87_c8_1386_return_output);

-- printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9
printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9 : entity work.printf_uxn_c_l96_c3_25a9_0CLK_de264c78 port map (
printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_CLOCK_ENABLE,
printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg0,
printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg1,
printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg2);

-- BIN_OP_EQ_uxn_c_l99_c6_1bfc
BIN_OP_EQ_uxn_c_l99_c6_1bfc : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l99_c6_1bfc_left,
BIN_OP_EQ_uxn_c_l99_c6_1bfc_right,
BIN_OP_EQ_uxn_c_l99_c6_1bfc_return_output);

-- step_cpu_phase_MUX_uxn_c_l99_c2_50bd
step_cpu_phase_MUX_uxn_c_l99_c2_50bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l99_c2_50bd_cond,
step_cpu_phase_MUX_uxn_c_l99_c2_50bd_iftrue,
step_cpu_phase_MUX_uxn_c_l99_c2_50bd_iffalse,
step_cpu_phase_MUX_uxn_c_l99_c2_50bd_return_output);

-- BIN_OP_PLUS_uxn_c_l102_c3_1d34
BIN_OP_PLUS_uxn_c_l102_c3_1d34 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l102_c3_1d34_left,
BIN_OP_PLUS_uxn_c_l102_c3_1d34_right,
BIN_OP_PLUS_uxn_c_l102_c3_1d34_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 ram_read_value,
 -- Registers
 pc,
 ins,
 step_cpu_phase,
 is_ins_done,
 eval_opcode_result,
 cpu_step_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_c_l68_c6_9840_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_return_output,
 pc_MUX_uxn_c_l68_c2_a0ee_return_output,
 is_ins_done_MUX_uxn_c_l68_c2_a0ee_return_output,
 eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_return_output,
 cpu_step_result_MUX_uxn_c_l68_c2_a0ee_return_output,
 ins_MUX_uxn_c_l68_c2_a0ee_return_output,
 BIN_OP_EQ_uxn_c_l74_c11_ac76_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_return_output,
 pc_MUX_uxn_c_l74_c7_0ec7_return_output,
 is_ins_done_MUX_uxn_c_l74_c7_0ec7_return_output,
 eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_return_output,
 cpu_step_result_MUX_uxn_c_l74_c7_0ec7_return_output,
 ins_MUX_uxn_c_l74_c7_0ec7_return_output,
 BIN_OP_EQ_uxn_c_l80_c11_b1d7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_return_output,
 pc_MUX_uxn_c_l80_c7_1fad_return_output,
 is_ins_done_MUX_uxn_c_l80_c7_1fad_return_output,
 eval_opcode_result_MUX_uxn_c_l80_c7_1fad_return_output,
 cpu_step_result_MUX_uxn_c_l80_c7_1fad_return_output,
 ins_MUX_uxn_c_l80_c7_1fad_return_output,
 BIN_OP_PLUS_uxn_c_l82_c3_c7e1_return_output,
 BIN_OP_MINUS_uxn_c_l86_c43_ff6d_return_output,
 eval_opcode_phased_uxn_c_l86_c24_6db2_return_output,
 MUX_uxn_c_l87_c8_1386_return_output,
 BIN_OP_EQ_uxn_c_l99_c6_1bfc_return_output,
 step_cpu_phase_MUX_uxn_c_l99_c2_50bd_return_output,
 BIN_OP_PLUS_uxn_c_l102_c3_1d34_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_ram_read_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_9840_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_9840_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_9840_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_a0ee_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_a0ee_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_0ec7_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_a0ee_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_a0ee_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_a0ee_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_a0ee_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_0ec7_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_a0ee_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_a0ee_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_a0ee_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_a0ee_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_a0ee_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_0ec7_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_a0ee_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_a0ee_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_a0ee_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_a0ee_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_0ec7_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_a0ee_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_a0ee_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c11_ac76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c11_ac76_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c11_ac76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_0ec7_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_0ec7_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_1fad_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_0ec7_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_0ec7_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_0ec7_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_1fad_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_0ec7_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_1fad_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_0ec7_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l74_c7_0ec7_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_0ec7_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_1fad_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_0ec7_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_0ec7_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_0ec7_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_1fad_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_0ec7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l80_c11_b1d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l80_c11_b1d7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l80_c11_b1d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_1fad_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l82_c3_5f8a : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_1fad_iffalse : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l87_c3_4b54 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_1fad_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_1fad_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_1fad_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_1fad_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_1fad_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_1fad_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_1fad_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_1fad_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_1fad_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l80_c7_1fad_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_1fad_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_1fad_iftrue : unsigned(7 downto 0);
 variable VAR_ins_uxn_c_l81_c3_7ba1 : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_1fad_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_1fad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_c7e1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_c7e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_c7e1_return_output : unsigned(16 downto 0);
 variable VAR_printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg2 : unsigned(31 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c43_ff6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c43_ff6d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c43_ff6d_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l87_c8_1386_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_1386_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_1386_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_c588_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l87_c43_4f02_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_1386_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l88_c33_d3f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_cb0a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l90_c33_08d6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l91_c31_ccf4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l92_c35_012b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l93_c34_b094_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l94_c32_12f4_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l95_c17_e2b1_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c6_1bfc_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c6_1bfc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c6_1bfc_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_50bd_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l100_c3_1ac7 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_50bd_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l102_c3_6588 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_50bd_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_50bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c3_1d34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c3_1d34_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c3_1d34_return_output : unsigned(8 downto 0);
 -- State registers comb logic variables
variable REG_VAR_pc : unsigned(15 downto 0);
variable REG_VAR_ins : unsigned(7 downto 0);
variable REG_VAR_step_cpu_phase : unsigned(7 downto 0);
variable REG_VAR_is_ins_done : unsigned(0 downto 0);
variable REG_VAR_eval_opcode_result : eval_opcode_result_t;
variable REG_VAR_cpu_step_result : cpu_step_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_pc := pc;
  REG_VAR_ins := ins;
  REG_VAR_step_cpu_phase := step_cpu_phase;
  REG_VAR_is_ins_done := is_ins_done;
  REG_VAR_eval_opcode_result := eval_opcode_result;
  REG_VAR_cpu_step_result := cpu_step_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_is_ins_done_MUX_uxn_c_l74_c7_0ec7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l102_c3_1d34_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l99_c6_1bfc_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l68_c6_9840_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_c7e1_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l80_c11_b1d7_right := to_unsigned(2, 2);
     VAR_BIN_OP_MINUS_uxn_c_l86_c43_ff6d_right := to_unsigned(3, 2);
     VAR_is_ins_done_MUX_uxn_c_l68_c2_a0ee_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_iffalse := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l100_c3_1ac7 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_50bd_iftrue := VAR_step_cpu_phase_uxn_c_l100_c3_1ac7;
     VAR_BIN_OP_EQ_uxn_c_l74_c11_ac76_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ram_read_value := ram_read_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_iftrue := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_1fad_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_1fad_iftrue := eval_opcode_result;
     VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_ins := ins;
     VAR_ins_MUX_uxn_c_l68_c2_a0ee_iftrue := ins;
     VAR_ins_MUX_uxn_c_l74_c7_0ec7_iftrue := ins;
     VAR_ins_MUX_uxn_c_l80_c7_1fad_iffalse := ins;
     VAR_printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg2 := resize(ins, 32);
     VAR_printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg2 := resize(ins, 32);
     VAR_is_ins_done_MUX_uxn_c_l80_c7_1fad_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_c7e1_left := pc;
     VAR_MUX_uxn_c_l87_c8_1386_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_pc := pc;
     VAR_pc_MUX_uxn_c_l68_c2_a0ee_iftrue := pc;
     VAR_pc_MUX_uxn_c_l74_c7_0ec7_iftrue := pc;
     VAR_printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_arg1 := resize(pc, 32);
     VAR_printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg1 := resize(pc, 32);
     VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_previous_ram_read := VAR_ram_read_value;
     VAR_ins_uxn_c_l81_c3_7ba1 := VAR_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l68_c6_9840_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l74_c11_ac76_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l80_c11_b1d7_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l86_c43_ff6d_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l102_c3_1d34_left := step_cpu_phase;
     VAR_printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg0 := resize(step_cpu_phase, 32);
     VAR_ins_MUX_uxn_c_l80_c7_1fad_iftrue := VAR_ins_uxn_c_l81_c3_7ba1;
     VAR_printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg2 := resize(VAR_ins_uxn_c_l81_c3_7ba1, 32);
     -- BIN_OP_PLUS[uxn_c_l82_c3_c7e1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l82_c3_c7e1_left <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_c7e1_left;
     BIN_OP_PLUS_uxn_c_l82_c3_c7e1_right <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_c7e1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_c7e1_return_output := BIN_OP_PLUS_uxn_c_l82_c3_c7e1_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l68_c2_a0ee] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_a0ee_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l74_c7_0ec7] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l74_c7_0ec7_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- BIN_OP_EQ[uxn_c_l74_c11_ac76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l74_c11_ac76_left <= VAR_BIN_OP_EQ_uxn_c_l74_c11_ac76_left;
     BIN_OP_EQ_uxn_c_l74_c11_ac76_right <= VAR_BIN_OP_EQ_uxn_c_l74_c11_ac76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l74_c11_ac76_return_output := BIN_OP_EQ_uxn_c_l74_c11_ac76_return_output;

     -- BIN_OP_EQ[uxn_c_l80_c11_b1d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l80_c11_b1d7_left <= VAR_BIN_OP_EQ_uxn_c_l80_c11_b1d7_left;
     BIN_OP_EQ_uxn_c_l80_c11_b1d7_right <= VAR_BIN_OP_EQ_uxn_c_l80_c11_b1d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l80_c11_b1d7_return_output := BIN_OP_EQ_uxn_c_l80_c11_b1d7_return_output;

     -- BIN_OP_PLUS[uxn_c_l102_c3_1d34] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l102_c3_1d34_left <= VAR_BIN_OP_PLUS_uxn_c_l102_c3_1d34_left;
     BIN_OP_PLUS_uxn_c_l102_c3_1d34_right <= VAR_BIN_OP_PLUS_uxn_c_l102_c3_1d34_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l102_c3_1d34_return_output := BIN_OP_PLUS_uxn_c_l102_c3_1d34_return_output;

     -- BIN_OP_MINUS[uxn_c_l86_c43_ff6d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l86_c43_ff6d_left <= VAR_BIN_OP_MINUS_uxn_c_l86_c43_ff6d_left;
     BIN_OP_MINUS_uxn_c_l86_c43_ff6d_right <= VAR_BIN_OP_MINUS_uxn_c_l86_c43_ff6d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l86_c43_ff6d_return_output := BIN_OP_MINUS_uxn_c_l86_c43_ff6d_return_output;

     -- BIN_OP_EQ[uxn_c_l68_c6_9840] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l68_c6_9840_left <= VAR_BIN_OP_EQ_uxn_c_l68_c6_9840_left;
     BIN_OP_EQ_uxn_c_l68_c6_9840_right <= VAR_BIN_OP_EQ_uxn_c_l68_c6_9840_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l68_c6_9840_return_output := BIN_OP_EQ_uxn_c_l68_c6_9840_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_9840_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_9840_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_a0ee_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_9840_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_9840_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_a0ee_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_9840_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_a0ee_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_9840_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_a0ee_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_9840_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_ac76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_ac76_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_0ec7_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_ac76_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_ac76_return_output;
     VAR_ins_MUX_uxn_c_l74_c7_0ec7_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_ac76_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c7_0ec7_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_ac76_return_output;
     VAR_pc_MUX_uxn_c_l74_c7_0ec7_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_ac76_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_b1d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_b1d7_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_1fad_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_b1d7_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_1fad_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_b1d7_return_output;
     VAR_ins_MUX_uxn_c_l80_c7_1fad_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_b1d7_return_output;
     VAR_is_ins_done_MUX_uxn_c_l80_c7_1fad_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_b1d7_return_output;
     VAR_pc_MUX_uxn_c_l80_c7_1fad_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_b1d7_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_phase := VAR_BIN_OP_MINUS_uxn_c_l86_c43_ff6d_return_output;
     VAR_step_cpu_phase_uxn_c_l102_c3_6588 := resize(VAR_BIN_OP_PLUS_uxn_c_l102_c3_1d34_return_output, 8);
     VAR_pc_uxn_c_l82_c3_5f8a := resize(VAR_BIN_OP_PLUS_uxn_c_l82_c3_c7e1_return_output, 16);
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_a0ee_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_a0ee_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_0ec7_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l74_c7_0ec7_return_output;
     VAR_pc_MUX_uxn_c_l80_c7_1fad_iftrue := VAR_pc_uxn_c_l82_c3_5f8a;
     VAR_printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg1 := resize(VAR_pc_uxn_c_l82_c3_5f8a, 32);
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_50bd_iffalse := VAR_step_cpu_phase_uxn_c_l102_c3_6588;
     -- ins_MUX[uxn_c_l80_c7_1fad] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l80_c7_1fad_cond <= VAR_ins_MUX_uxn_c_l80_c7_1fad_cond;
     ins_MUX_uxn_c_l80_c7_1fad_iftrue <= VAR_ins_MUX_uxn_c_l80_c7_1fad_iftrue;
     ins_MUX_uxn_c_l80_c7_1fad_iffalse <= VAR_ins_MUX_uxn_c_l80_c7_1fad_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l80_c7_1fad_return_output := ins_MUX_uxn_c_l80_c7_1fad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l74_c7_0ec7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_fe02] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0ec7_return_output;
     VAR_printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_fe02_return_output;
     VAR_ins_MUX_uxn_c_l74_c7_0ec7_iffalse := VAR_ins_MUX_uxn_c_l80_c7_1fad_return_output;
     -- ins_MUX[uxn_c_l74_c7_0ec7] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l74_c7_0ec7_cond <= VAR_ins_MUX_uxn_c_l74_c7_0ec7_cond;
     ins_MUX_uxn_c_l74_c7_0ec7_iftrue <= VAR_ins_MUX_uxn_c_l74_c7_0ec7_iftrue;
     ins_MUX_uxn_c_l74_c7_0ec7_iffalse <= VAR_ins_MUX_uxn_c_l74_c7_0ec7_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l74_c7_0ec7_return_output := ins_MUX_uxn_c_l74_c7_0ec7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c7_1fad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_return_output;

     -- printf_uxn_c_l72_c3_2db6[uxn_c_l72_c3_2db6] LATENCY=0
     -- Clock enable
     printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_CLOCK_ENABLE <= VAR_printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_arg0 <= VAR_printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_arg0;
     printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_arg1 <= VAR_printf_uxn_c_l72_c3_2db6_uxn_c_l72_c3_2db6_arg1;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l74_c1_eef6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_1fad_return_output;
     VAR_printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_eef6_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_a0ee_iffalse := VAR_ins_MUX_uxn_c_l74_c7_0ec7_return_output;
     -- ins_MUX[uxn_c_l68_c2_a0ee] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l68_c2_a0ee_cond <= VAR_ins_MUX_uxn_c_l68_c2_a0ee_cond;
     ins_MUX_uxn_c_l68_c2_a0ee_iftrue <= VAR_ins_MUX_uxn_c_l68_c2_a0ee_iftrue;
     ins_MUX_uxn_c_l68_c2_a0ee_iffalse <= VAR_ins_MUX_uxn_c_l68_c2_a0ee_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l68_c2_a0ee_return_output := ins_MUX_uxn_c_l68_c2_a0ee_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_b96d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_3275] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_return_output;

     -- printf_uxn_c_l78_c3_42f1[uxn_c_l78_c3_42f1] LATENCY=0
     -- Clock enable
     printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_CLOCK_ENABLE <= VAR_printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg0 <= VAR_printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg0;
     printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg1 <= VAR_printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg1;
     printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg2 <= VAR_printf_uxn_c_l78_c3_42f1_uxn_c_l78_c3_42f1_arg2;
     -- Outputs

     -- Submodule level 4
     VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_return_output;
     VAR_printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_b96d_return_output;
     VAR_printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_3275_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l68_c2_a0ee_return_output;
     -- eval_opcode_phased[uxn_c_l86_c24_6db2] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l86_c24_6db2_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l86_c24_6db2_phase <= VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_phase;
     eval_opcode_phased_uxn_c_l86_c24_6db2_ins <= VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_ins;
     eval_opcode_phased_uxn_c_l86_c24_6db2_pc <= VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_pc;
     eval_opcode_phased_uxn_c_l86_c24_6db2_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_previous_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_return_output := eval_opcode_phased_uxn_c_l86_c24_6db2_return_output;

     -- printf_uxn_c_l83_c3_6d58[uxn_c_l83_c3_6d58] LATENCY=0
     -- Clock enable
     printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_CLOCK_ENABLE <= VAR_printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg0 <= VAR_printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg0;
     printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg1 <= VAR_printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg1;
     printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg2 <= VAR_printf_uxn_c_l83_c3_6d58_uxn_c_l83_c3_6d58_arg2;
     -- Outputs

     -- Submodule level 5
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_1fad_iffalse := VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l89_c34_cb0a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_cb0a_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d[uxn_c_l91_c31_ccf4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l91_c31_ccf4_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_return_output.ram_value;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l93_c34_b094] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l93_c34_b094_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_return_output.vram_address;

     -- eval_opcode_result_MUX[uxn_c_l80_c7_1fad] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l80_c7_1fad_cond <= VAR_eval_opcode_result_MUX_uxn_c_l80_c7_1fad_cond;
     eval_opcode_result_MUX_uxn_c_l80_c7_1fad_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l80_c7_1fad_iftrue;
     eval_opcode_result_MUX_uxn_c_l80_c7_1fad_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l80_c7_1fad_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_1fad_return_output := eval_opcode_result_MUX_uxn_c_l80_c7_1fad_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l95_c17_e2b1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l95_c17_e2b1_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d[uxn_c_l90_c33_08d6] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l90_c33_08d6_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_return_output.ram_addr;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d[uxn_c_l87_c43_4f02] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l87_c43_4f02_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_return_output.pc;

     -- CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d[uxn_c_l94_c32_12f4] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l94_c32_12f4_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l92_c35_012b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l92_c35_012b_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l87_c8_c588] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_c588_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d[uxn_c_l88_c33_d3f5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l88_c33_d3f5_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_6db2_return_output.is_ram_read;

     -- Submodule level 6
     VAR_MUX_uxn_c_l87_c8_1386_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l87_c43_4f02_return_output;
     VAR_is_ins_done_MUX_uxn_c_l80_c7_1fad_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l95_c17_e2b1_return_output;
     VAR_MUX_uxn_c_l87_c8_1386_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_c588_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l80_c7_1fad_return_output;
     -- MUX[uxn_c_l87_c8_1386] LATENCY=0
     -- Inputs
     MUX_uxn_c_l87_c8_1386_cond <= VAR_MUX_uxn_c_l87_c8_1386_cond;
     MUX_uxn_c_l87_c8_1386_iftrue <= VAR_MUX_uxn_c_l87_c8_1386_iftrue;
     MUX_uxn_c_l87_c8_1386_iffalse <= VAR_MUX_uxn_c_l87_c8_1386_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l87_c8_1386_return_output := MUX_uxn_c_l87_c8_1386_return_output;

     -- eval_opcode_result_MUX[uxn_c_l74_c7_0ec7] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_cond <= VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_cond;
     eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_iftrue;
     eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_return_output := eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_return_output;

     -- is_ins_done_MUX[uxn_c_l80_c7_1fad] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l80_c7_1fad_cond <= VAR_is_ins_done_MUX_uxn_c_l80_c7_1fad_cond;
     is_ins_done_MUX_uxn_c_l80_c7_1fad_iftrue <= VAR_is_ins_done_MUX_uxn_c_l80_c7_1fad_iftrue;
     is_ins_done_MUX_uxn_c_l80_c7_1fad_iffalse <= VAR_is_ins_done_MUX_uxn_c_l80_c7_1fad_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l80_c7_1fad_return_output := is_ins_done_MUX_uxn_c_l80_c7_1fad_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70[uxn_c_l80_c7_1fad] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l80_c7_1fad_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l88_c33_d3f5_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_cb0a_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l90_c33_08d6_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l91_c31_ccf4_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l92_c35_012b_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l93_c34_b094_return_output,
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l94_c32_12f4_return_output);

     -- Submodule level 7
     VAR_pc_uxn_c_l87_c3_4b54 := VAR_MUX_uxn_c_l87_c8_1386_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_1fad_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l80_c7_1fad_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0ec7_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c7_0ec7_iffalse := VAR_is_ins_done_MUX_uxn_c_l80_c7_1fad_return_output;
     VAR_pc_MUX_uxn_c_l80_c7_1fad_iffalse := VAR_pc_uxn_c_l87_c3_4b54;
     VAR_printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg1 := resize(VAR_pc_uxn_c_l87_c3_4b54, 32);
     -- printf_uxn_c_l96_c3_25a9[uxn_c_l96_c3_25a9] LATENCY=0
     -- Clock enable
     printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_CLOCK_ENABLE <= VAR_printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg0 <= VAR_printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg0;
     printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg1 <= VAR_printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg1;
     printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg2 <= VAR_printf_uxn_c_l96_c3_25a9_uxn_c_l96_c3_25a9_arg2;
     -- Outputs

     -- cpu_step_result_MUX[uxn_c_l80_c7_1fad] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l80_c7_1fad_cond <= VAR_cpu_step_result_MUX_uxn_c_l80_c7_1fad_cond;
     cpu_step_result_MUX_uxn_c_l80_c7_1fad_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l80_c7_1fad_iftrue;
     cpu_step_result_MUX_uxn_c_l80_c7_1fad_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l80_c7_1fad_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_1fad_return_output := cpu_step_result_MUX_uxn_c_l80_c7_1fad_return_output;

     -- is_ins_done_MUX[uxn_c_l74_c7_0ec7] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l74_c7_0ec7_cond <= VAR_is_ins_done_MUX_uxn_c_l74_c7_0ec7_cond;
     is_ins_done_MUX_uxn_c_l74_c7_0ec7_iftrue <= VAR_is_ins_done_MUX_uxn_c_l74_c7_0ec7_iftrue;
     is_ins_done_MUX_uxn_c_l74_c7_0ec7_iffalse <= VAR_is_ins_done_MUX_uxn_c_l74_c7_0ec7_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l74_c7_0ec7_return_output := is_ins_done_MUX_uxn_c_l74_c7_0ec7_return_output;

     -- pc_MUX[uxn_c_l80_c7_1fad] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l80_c7_1fad_cond <= VAR_pc_MUX_uxn_c_l80_c7_1fad_cond;
     pc_MUX_uxn_c_l80_c7_1fad_iftrue <= VAR_pc_MUX_uxn_c_l80_c7_1fad_iftrue;
     pc_MUX_uxn_c_l80_c7_1fad_iffalse <= VAR_pc_MUX_uxn_c_l80_c7_1fad_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l80_c7_1fad_return_output := pc_MUX_uxn_c_l80_c7_1fad_return_output;

     -- eval_opcode_result_MUX[uxn_c_l68_c2_a0ee] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_cond <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_cond;
     eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_iftrue;
     eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_return_output := eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_return_output;

     -- Submodule level 8
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_0ec7_iffalse := VAR_cpu_step_result_MUX_uxn_c_l80_c7_1fad_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l68_c2_a0ee_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_a0ee_iffalse := VAR_is_ins_done_MUX_uxn_c_l74_c7_0ec7_return_output;
     VAR_pc_MUX_uxn_c_l74_c7_0ec7_iffalse := VAR_pc_MUX_uxn_c_l80_c7_1fad_return_output;
     -- pc_MUX[uxn_c_l74_c7_0ec7] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l74_c7_0ec7_cond <= VAR_pc_MUX_uxn_c_l74_c7_0ec7_cond;
     pc_MUX_uxn_c_l74_c7_0ec7_iftrue <= VAR_pc_MUX_uxn_c_l74_c7_0ec7_iftrue;
     pc_MUX_uxn_c_l74_c7_0ec7_iffalse <= VAR_pc_MUX_uxn_c_l74_c7_0ec7_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l74_c7_0ec7_return_output := pc_MUX_uxn_c_l74_c7_0ec7_return_output;

     -- cpu_step_result_MUX[uxn_c_l74_c7_0ec7] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l74_c7_0ec7_cond <= VAR_cpu_step_result_MUX_uxn_c_l74_c7_0ec7_cond;
     cpu_step_result_MUX_uxn_c_l74_c7_0ec7_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l74_c7_0ec7_iftrue;
     cpu_step_result_MUX_uxn_c_l74_c7_0ec7_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l74_c7_0ec7_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_0ec7_return_output := cpu_step_result_MUX_uxn_c_l74_c7_0ec7_return_output;

     -- is_ins_done_MUX[uxn_c_l68_c2_a0ee] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l68_c2_a0ee_cond <= VAR_is_ins_done_MUX_uxn_c_l68_c2_a0ee_cond;
     is_ins_done_MUX_uxn_c_l68_c2_a0ee_iftrue <= VAR_is_ins_done_MUX_uxn_c_l68_c2_a0ee_iftrue;
     is_ins_done_MUX_uxn_c_l68_c2_a0ee_iffalse <= VAR_is_ins_done_MUX_uxn_c_l68_c2_a0ee_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l68_c2_a0ee_return_output := is_ins_done_MUX_uxn_c_l68_c2_a0ee_return_output;

     -- Submodule level 9
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_a0ee_iffalse := VAR_cpu_step_result_MUX_uxn_c_l74_c7_0ec7_return_output;
     VAR_BIN_OP_EQ_uxn_c_l99_c6_1bfc_left := VAR_is_ins_done_MUX_uxn_c_l68_c2_a0ee_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l68_c2_a0ee_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_a0ee_iffalse := VAR_pc_MUX_uxn_c_l74_c7_0ec7_return_output;
     -- BIN_OP_EQ[uxn_c_l99_c6_1bfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l99_c6_1bfc_left <= VAR_BIN_OP_EQ_uxn_c_l99_c6_1bfc_left;
     BIN_OP_EQ_uxn_c_l99_c6_1bfc_right <= VAR_BIN_OP_EQ_uxn_c_l99_c6_1bfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l99_c6_1bfc_return_output := BIN_OP_EQ_uxn_c_l99_c6_1bfc_return_output;

     -- pc_MUX[uxn_c_l68_c2_a0ee] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l68_c2_a0ee_cond <= VAR_pc_MUX_uxn_c_l68_c2_a0ee_cond;
     pc_MUX_uxn_c_l68_c2_a0ee_iftrue <= VAR_pc_MUX_uxn_c_l68_c2_a0ee_iftrue;
     pc_MUX_uxn_c_l68_c2_a0ee_iffalse <= VAR_pc_MUX_uxn_c_l68_c2_a0ee_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l68_c2_a0ee_return_output := pc_MUX_uxn_c_l68_c2_a0ee_return_output;

     -- cpu_step_result_MUX[uxn_c_l68_c2_a0ee] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l68_c2_a0ee_cond <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_a0ee_cond;
     cpu_step_result_MUX_uxn_c_l68_c2_a0ee_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_a0ee_iftrue;
     cpu_step_result_MUX_uxn_c_l68_c2_a0ee_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_a0ee_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_a0ee_return_output := cpu_step_result_MUX_uxn_c_l68_c2_a0ee_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_50bd_cond := VAR_BIN_OP_EQ_uxn_c_l99_c6_1bfc_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l68_c2_a0ee_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l68_c2_a0ee_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l68_c2_a0ee_return_output;
     -- step_cpu_phase_MUX[uxn_c_l99_c2_50bd] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l99_c2_50bd_cond <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_50bd_cond;
     step_cpu_phase_MUX_uxn_c_l99_c2_50bd_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_50bd_iftrue;
     step_cpu_phase_MUX_uxn_c_l99_c2_50bd_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_50bd_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_50bd_return_output := step_cpu_phase_MUX_uxn_c_l99_c2_50bd_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l99_c2_50bd_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_pc <= REG_VAR_pc;
REG_COMB_ins <= REG_VAR_ins;
REG_COMB_step_cpu_phase <= REG_VAR_step_cpu_phase;
REG_COMB_is_ins_done <= REG_VAR_is_ins_done;
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
     eval_opcode_result <= REG_COMB_eval_opcode_result;
     cpu_step_result <= REG_COMB_cpu_step_result;
 end if;
 end if;
end process;

end arch;
