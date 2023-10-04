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
entity step_cpu_0CLK_43f677bc is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ram_read_value : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_43f677bc;
architecture arch of step_cpu_0CLK_43f677bc is
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
-- BIN_OP_EQ[uxn_c_l68_c6_6e29]
signal BIN_OP_EQ_uxn_c_l68_c6_6e29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_6e29_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_6e29_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_d358]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l74_c7_5e95]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l68_c2_9644]
signal pc_MUX_uxn_c_l68_c2_9644_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l68_c2_9644_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_9644_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_9644_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l68_c2_9644]
signal ins_MUX_uxn_c_l68_c2_9644_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l68_c2_9644_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_9644_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_9644_return_output : unsigned(7 downto 0);

-- cpu_step_result_MUX[uxn_c_l68_c2_9644]
signal cpu_step_result_MUX_uxn_c_l68_c2_9644_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l68_c2_9644_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_9644_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_9644_return_output : cpu_step_result_t;

-- eval_opcode_result_MUX[uxn_c_l68_c2_9644]
signal eval_opcode_result_MUX_uxn_c_l68_c2_9644_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l68_c2_9644_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_9644_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_9644_return_output : eval_opcode_result_t;

-- is_ins_done_MUX[uxn_c_l68_c2_9644]
signal is_ins_done_MUX_uxn_c_l68_c2_9644_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_9644_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_9644_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_9644_return_output : unsigned(0 downto 0);

-- printf_uxn_c_l72_c3_c210[uxn_c_l72_c3_c210]
signal printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l74_c11_d6d4]
signal BIN_OP_EQ_uxn_c_l74_c11_d6d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c11_d6d4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c11_d6d4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l74_c1_a7dc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c7_7d46]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l74_c7_5e95]
signal pc_MUX_uxn_c_l74_c7_5e95_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l74_c7_5e95_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c7_5e95_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c7_5e95_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l74_c7_5e95]
signal ins_MUX_uxn_c_l74_c7_5e95_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l74_c7_5e95_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c7_5e95_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c7_5e95_return_output : unsigned(7 downto 0);

-- cpu_step_result_MUX[uxn_c_l74_c7_5e95]
signal cpu_step_result_MUX_uxn_c_l74_c7_5e95_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l74_c7_5e95_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l74_c7_5e95_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l74_c7_5e95_return_output : cpu_step_result_t;

-- eval_opcode_result_MUX[uxn_c_l74_c7_5e95]
signal eval_opcode_result_MUX_uxn_c_l74_c7_5e95_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l74_c7_5e95_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l74_c7_5e95_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l74_c7_5e95_return_output : eval_opcode_result_t;

-- is_ins_done_MUX[uxn_c_l74_c7_5e95]
signal is_ins_done_MUX_uxn_c_l74_c7_5e95_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c7_5e95_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c7_5e95_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c7_5e95_return_output : unsigned(0 downto 0);

-- printf_uxn_c_l78_c3_dff9[uxn_c_l78_c3_dff9]
signal printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l80_c11_ecea]
signal BIN_OP_EQ_uxn_c_l80_c11_ecea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l80_c11_ecea_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l80_c11_ecea_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_f8b0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_333c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l80_c7_7d46]
signal pc_MUX_uxn_c_l80_c7_7d46_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l80_c7_7d46_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l80_c7_7d46_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l80_c7_7d46_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l80_c7_7d46]
signal ins_MUX_uxn_c_l80_c7_7d46_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l80_c7_7d46_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l80_c7_7d46_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l80_c7_7d46_return_output : unsigned(7 downto 0);

-- cpu_step_result_MUX[uxn_c_l80_c7_7d46]
signal cpu_step_result_MUX_uxn_c_l80_c7_7d46_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l80_c7_7d46_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l80_c7_7d46_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l80_c7_7d46_return_output : cpu_step_result_t;

-- eval_opcode_result_MUX[uxn_c_l80_c7_7d46]
signal eval_opcode_result_MUX_uxn_c_l80_c7_7d46_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l80_c7_7d46_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l80_c7_7d46_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l80_c7_7d46_return_output : eval_opcode_result_t;

-- is_ins_done_MUX[uxn_c_l80_c7_7d46]
signal is_ins_done_MUX_uxn_c_l80_c7_7d46_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l80_c7_7d46_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l80_c7_7d46_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l80_c7_7d46_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l82_c3_12df]
signal BIN_OP_PLUS_uxn_c_l82_c3_12df_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_12df_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_12df_return_output : unsigned(16 downto 0);

-- printf_uxn_c_l83_c3_c42c[uxn_c_l83_c3_c42c]
signal printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg2 : unsigned(31 downto 0);

-- BIN_OP_MINUS[uxn_c_l86_c43_7f82]
signal BIN_OP_MINUS_uxn_c_l86_c43_7f82_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c43_7f82_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c43_7f82_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l86_c24_cc3f]
signal eval_opcode_phased_uxn_c_l86_c24_cc3f_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_cc3f_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_cc3f_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_cc3f_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_cc3f_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l87_c8_25b1]
signal MUX_uxn_c_l87_c8_25b1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l87_c8_25b1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_25b1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_25b1_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l96_c3_8141[uxn_c_l96_c3_8141]
signal printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l99_c6_a13e]
signal BIN_OP_EQ_uxn_c_l99_c6_a13e_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c6_a13e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c6_a13e_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l99_c2_3ff8]
signal step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l102_c3_7add]
signal BIN_OP_PLUS_uxn_c_l102_c3_7add_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c3_7add_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c3_7add_return_output : unsigned(8 downto 0);

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
-- BIN_OP_EQ_uxn_c_l68_c6_6e29
BIN_OP_EQ_uxn_c_l68_c6_6e29 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l68_c6_6e29_left,
BIN_OP_EQ_uxn_c_l68_c6_6e29_right,
BIN_OP_EQ_uxn_c_l68_c6_6e29_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_return_output);

-- pc_MUX_uxn_c_l68_c2_9644
pc_MUX_uxn_c_l68_c2_9644 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l68_c2_9644_cond,
pc_MUX_uxn_c_l68_c2_9644_iftrue,
pc_MUX_uxn_c_l68_c2_9644_iffalse,
pc_MUX_uxn_c_l68_c2_9644_return_output);

-- ins_MUX_uxn_c_l68_c2_9644
ins_MUX_uxn_c_l68_c2_9644 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l68_c2_9644_cond,
ins_MUX_uxn_c_l68_c2_9644_iftrue,
ins_MUX_uxn_c_l68_c2_9644_iffalse,
ins_MUX_uxn_c_l68_c2_9644_return_output);

-- cpu_step_result_MUX_uxn_c_l68_c2_9644
cpu_step_result_MUX_uxn_c_l68_c2_9644 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l68_c2_9644_cond,
cpu_step_result_MUX_uxn_c_l68_c2_9644_iftrue,
cpu_step_result_MUX_uxn_c_l68_c2_9644_iffalse,
cpu_step_result_MUX_uxn_c_l68_c2_9644_return_output);

-- eval_opcode_result_MUX_uxn_c_l68_c2_9644
eval_opcode_result_MUX_uxn_c_l68_c2_9644 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l68_c2_9644_cond,
eval_opcode_result_MUX_uxn_c_l68_c2_9644_iftrue,
eval_opcode_result_MUX_uxn_c_l68_c2_9644_iffalse,
eval_opcode_result_MUX_uxn_c_l68_c2_9644_return_output);

-- is_ins_done_MUX_uxn_c_l68_c2_9644
is_ins_done_MUX_uxn_c_l68_c2_9644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l68_c2_9644_cond,
is_ins_done_MUX_uxn_c_l68_c2_9644_iftrue,
is_ins_done_MUX_uxn_c_l68_c2_9644_iffalse,
is_ins_done_MUX_uxn_c_l68_c2_9644_return_output);

-- printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210
printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210 : entity work.printf_uxn_c_l72_c3_c210_0CLK_de264c78 port map (
printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_CLOCK_ENABLE,
printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_arg0,
printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_arg1);

-- BIN_OP_EQ_uxn_c_l74_c11_d6d4
BIN_OP_EQ_uxn_c_l74_c11_d6d4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l74_c11_d6d4_left,
BIN_OP_EQ_uxn_c_l74_c11_d6d4_right,
BIN_OP_EQ_uxn_c_l74_c11_d6d4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_return_output);

-- pc_MUX_uxn_c_l74_c7_5e95
pc_MUX_uxn_c_l74_c7_5e95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l74_c7_5e95_cond,
pc_MUX_uxn_c_l74_c7_5e95_iftrue,
pc_MUX_uxn_c_l74_c7_5e95_iffalse,
pc_MUX_uxn_c_l74_c7_5e95_return_output);

-- ins_MUX_uxn_c_l74_c7_5e95
ins_MUX_uxn_c_l74_c7_5e95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l74_c7_5e95_cond,
ins_MUX_uxn_c_l74_c7_5e95_iftrue,
ins_MUX_uxn_c_l74_c7_5e95_iffalse,
ins_MUX_uxn_c_l74_c7_5e95_return_output);

-- cpu_step_result_MUX_uxn_c_l74_c7_5e95
cpu_step_result_MUX_uxn_c_l74_c7_5e95 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l74_c7_5e95_cond,
cpu_step_result_MUX_uxn_c_l74_c7_5e95_iftrue,
cpu_step_result_MUX_uxn_c_l74_c7_5e95_iffalse,
cpu_step_result_MUX_uxn_c_l74_c7_5e95_return_output);

-- eval_opcode_result_MUX_uxn_c_l74_c7_5e95
eval_opcode_result_MUX_uxn_c_l74_c7_5e95 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l74_c7_5e95_cond,
eval_opcode_result_MUX_uxn_c_l74_c7_5e95_iftrue,
eval_opcode_result_MUX_uxn_c_l74_c7_5e95_iffalse,
eval_opcode_result_MUX_uxn_c_l74_c7_5e95_return_output);

-- is_ins_done_MUX_uxn_c_l74_c7_5e95
is_ins_done_MUX_uxn_c_l74_c7_5e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l74_c7_5e95_cond,
is_ins_done_MUX_uxn_c_l74_c7_5e95_iftrue,
is_ins_done_MUX_uxn_c_l74_c7_5e95_iffalse,
is_ins_done_MUX_uxn_c_l74_c7_5e95_return_output);

-- printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9
printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9 : entity work.printf_uxn_c_l78_c3_dff9_0CLK_de264c78 port map (
printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_CLOCK_ENABLE,
printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg0,
printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg1,
printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg2);

-- BIN_OP_EQ_uxn_c_l80_c11_ecea
BIN_OP_EQ_uxn_c_l80_c11_ecea : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l80_c11_ecea_left,
BIN_OP_EQ_uxn_c_l80_c11_ecea_right,
BIN_OP_EQ_uxn_c_l80_c11_ecea_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_return_output);

-- pc_MUX_uxn_c_l80_c7_7d46
pc_MUX_uxn_c_l80_c7_7d46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l80_c7_7d46_cond,
pc_MUX_uxn_c_l80_c7_7d46_iftrue,
pc_MUX_uxn_c_l80_c7_7d46_iffalse,
pc_MUX_uxn_c_l80_c7_7d46_return_output);

-- ins_MUX_uxn_c_l80_c7_7d46
ins_MUX_uxn_c_l80_c7_7d46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l80_c7_7d46_cond,
ins_MUX_uxn_c_l80_c7_7d46_iftrue,
ins_MUX_uxn_c_l80_c7_7d46_iffalse,
ins_MUX_uxn_c_l80_c7_7d46_return_output);

-- cpu_step_result_MUX_uxn_c_l80_c7_7d46
cpu_step_result_MUX_uxn_c_l80_c7_7d46 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l80_c7_7d46_cond,
cpu_step_result_MUX_uxn_c_l80_c7_7d46_iftrue,
cpu_step_result_MUX_uxn_c_l80_c7_7d46_iffalse,
cpu_step_result_MUX_uxn_c_l80_c7_7d46_return_output);

-- eval_opcode_result_MUX_uxn_c_l80_c7_7d46
eval_opcode_result_MUX_uxn_c_l80_c7_7d46 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l80_c7_7d46_cond,
eval_opcode_result_MUX_uxn_c_l80_c7_7d46_iftrue,
eval_opcode_result_MUX_uxn_c_l80_c7_7d46_iffalse,
eval_opcode_result_MUX_uxn_c_l80_c7_7d46_return_output);

-- is_ins_done_MUX_uxn_c_l80_c7_7d46
is_ins_done_MUX_uxn_c_l80_c7_7d46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l80_c7_7d46_cond,
is_ins_done_MUX_uxn_c_l80_c7_7d46_iftrue,
is_ins_done_MUX_uxn_c_l80_c7_7d46_iffalse,
is_ins_done_MUX_uxn_c_l80_c7_7d46_return_output);

-- BIN_OP_PLUS_uxn_c_l82_c3_12df
BIN_OP_PLUS_uxn_c_l82_c3_12df : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l82_c3_12df_left,
BIN_OP_PLUS_uxn_c_l82_c3_12df_right,
BIN_OP_PLUS_uxn_c_l82_c3_12df_return_output);

-- printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c
printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c : entity work.printf_uxn_c_l83_c3_c42c_0CLK_de264c78 port map (
printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_CLOCK_ENABLE,
printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg0,
printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg1,
printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg2);

-- BIN_OP_MINUS_uxn_c_l86_c43_7f82
BIN_OP_MINUS_uxn_c_l86_c43_7f82 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l86_c43_7f82_left,
BIN_OP_MINUS_uxn_c_l86_c43_7f82_right,
BIN_OP_MINUS_uxn_c_l86_c43_7f82_return_output);

-- eval_opcode_phased_uxn_c_l86_c24_cc3f
eval_opcode_phased_uxn_c_l86_c24_cc3f : entity work.eval_opcode_phased_0CLK_f0816edc port map (
clk,
eval_opcode_phased_uxn_c_l86_c24_cc3f_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l86_c24_cc3f_phase,
eval_opcode_phased_uxn_c_l86_c24_cc3f_ins,
eval_opcode_phased_uxn_c_l86_c24_cc3f_pc,
eval_opcode_phased_uxn_c_l86_c24_cc3f_previous_ram_read,
eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output);

-- MUX_uxn_c_l87_c8_25b1
MUX_uxn_c_l87_c8_25b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l87_c8_25b1_cond,
MUX_uxn_c_l87_c8_25b1_iftrue,
MUX_uxn_c_l87_c8_25b1_iffalse,
MUX_uxn_c_l87_c8_25b1_return_output);

-- printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141
printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141 : entity work.printf_uxn_c_l96_c3_8141_0CLK_de264c78 port map (
printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_CLOCK_ENABLE,
printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg0,
printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg1,
printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg2);

-- BIN_OP_EQ_uxn_c_l99_c6_a13e
BIN_OP_EQ_uxn_c_l99_c6_a13e : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l99_c6_a13e_left,
BIN_OP_EQ_uxn_c_l99_c6_a13e_right,
BIN_OP_EQ_uxn_c_l99_c6_a13e_return_output);

-- step_cpu_phase_MUX_uxn_c_l99_c2_3ff8
step_cpu_phase_MUX_uxn_c_l99_c2_3ff8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_cond,
step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_iftrue,
step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_iffalse,
step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_return_output);

-- BIN_OP_PLUS_uxn_c_l102_c3_7add
BIN_OP_PLUS_uxn_c_l102_c3_7add : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l102_c3_7add_left,
BIN_OP_PLUS_uxn_c_l102_c3_7add_right,
BIN_OP_PLUS_uxn_c_l102_c3_7add_return_output);



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
 BIN_OP_EQ_uxn_c_l68_c6_6e29_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_return_output,
 pc_MUX_uxn_c_l68_c2_9644_return_output,
 ins_MUX_uxn_c_l68_c2_9644_return_output,
 cpu_step_result_MUX_uxn_c_l68_c2_9644_return_output,
 eval_opcode_result_MUX_uxn_c_l68_c2_9644_return_output,
 is_ins_done_MUX_uxn_c_l68_c2_9644_return_output,
 BIN_OP_EQ_uxn_c_l74_c11_d6d4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_return_output,
 pc_MUX_uxn_c_l74_c7_5e95_return_output,
 ins_MUX_uxn_c_l74_c7_5e95_return_output,
 cpu_step_result_MUX_uxn_c_l74_c7_5e95_return_output,
 eval_opcode_result_MUX_uxn_c_l74_c7_5e95_return_output,
 is_ins_done_MUX_uxn_c_l74_c7_5e95_return_output,
 BIN_OP_EQ_uxn_c_l80_c11_ecea_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_return_output,
 pc_MUX_uxn_c_l80_c7_7d46_return_output,
 ins_MUX_uxn_c_l80_c7_7d46_return_output,
 cpu_step_result_MUX_uxn_c_l80_c7_7d46_return_output,
 eval_opcode_result_MUX_uxn_c_l80_c7_7d46_return_output,
 is_ins_done_MUX_uxn_c_l80_c7_7d46_return_output,
 BIN_OP_PLUS_uxn_c_l82_c3_12df_return_output,
 BIN_OP_MINUS_uxn_c_l86_c43_7f82_return_output,
 eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output,
 MUX_uxn_c_l87_c8_25b1_return_output,
 BIN_OP_EQ_uxn_c_l99_c6_a13e_return_output,
 step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_return_output,
 BIN_OP_PLUS_uxn_c_l102_c3_7add_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_ram_read_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_6e29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_6e29_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_6e29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_9644_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_9644_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_5e95_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_9644_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_9644_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_9644_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_9644_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_5e95_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_9644_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_9644_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_9644_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_9644_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_9644_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_5e95_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_9644_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_9644_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_9644_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_9644_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_5e95_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_9644_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_9644_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_9644_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_9644_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_5e95_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_9644_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_9644_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c11_d6d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c11_d6d4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c11_d6d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_5e95_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_5e95_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_7d46_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_5e95_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_5e95_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_5e95_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_7d46_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_5e95_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_5e95_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l74_c7_5e95_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_5e95_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_7d46_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_5e95_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_5e95_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_5e95_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_7d46_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_5e95_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_5e95_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_5e95_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_7d46_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_5e95_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l80_c11_ecea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l80_c11_ecea_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l80_c11_ecea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_7d46_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l82_c3_ab43 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_7d46_iffalse : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l87_c3_1d01 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_7d46_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_7d46_iftrue : unsigned(7 downto 0);
 variable VAR_ins_uxn_c_l81_c3_c160 : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_7d46_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_7d46_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_7d46_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_7d46_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l80_c7_7d46_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_7d46_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_7d46_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_7d46_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_7d46_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_7d46_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_7d46_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_7d46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_12df_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_12df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_12df_return_output : unsigned(16 downto 0);
 variable VAR_printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg2 : unsigned(31 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c43_7f82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c43_7f82_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c43_7f82_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l87_c8_25b1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_25b1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_25b1_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_661f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l87_c43_e4fb_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_25b1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l88_c33_b939_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_08d3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l90_c33_7cea_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l91_c31_957a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l92_c35_bbe7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l93_c34_3afc_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l94_c32_0bff_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l95_c17_e67a_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c6_a13e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c6_a13e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c6_a13e_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l100_c3_078e : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l102_c3_fd24 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c3_7add_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c3_7add_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c3_7add_return_output : unsigned(8 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_iffalse := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l68_c2_9644_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l99_c6_a13e_right := to_unsigned(1, 1);
     VAR_step_cpu_phase_uxn_c_l100_c3_078e := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_iftrue := VAR_step_cpu_phase_uxn_c_l100_c3_078e;
     VAR_is_ins_done_MUX_uxn_c_l74_c7_5e95_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l80_c11_ecea_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l74_c11_d6d4_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l86_c43_7f82_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_c_l68_c6_6e29_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_12df_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l102_c3_7add_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ram_read_value := ram_read_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_iftrue := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_7d46_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_9644_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_5e95_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_7d46_iftrue := eval_opcode_result;
     VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_ins := ins;
     VAR_ins_MUX_uxn_c_l68_c2_9644_iftrue := ins;
     VAR_ins_MUX_uxn_c_l74_c7_5e95_iftrue := ins;
     VAR_ins_MUX_uxn_c_l80_c7_7d46_iffalse := ins;
     VAR_printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg2 := resize(ins, 32);
     VAR_printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg2 := resize(ins, 32);
     VAR_is_ins_done_MUX_uxn_c_l80_c7_7d46_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_12df_left := pc;
     VAR_MUX_uxn_c_l87_c8_25b1_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_pc := pc;
     VAR_pc_MUX_uxn_c_l68_c2_9644_iftrue := pc;
     VAR_pc_MUX_uxn_c_l74_c7_5e95_iftrue := pc;
     VAR_printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_arg1 := resize(pc, 32);
     VAR_printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg1 := resize(pc, 32);
     VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_previous_ram_read := VAR_ram_read_value;
     VAR_ins_uxn_c_l81_c3_c160 := VAR_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l68_c6_6e29_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l74_c11_d6d4_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l80_c11_ecea_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l86_c43_7f82_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l102_c3_7add_left := step_cpu_phase;
     VAR_printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg0 := resize(step_cpu_phase, 32);
     VAR_ins_MUX_uxn_c_l80_c7_7d46_iftrue := VAR_ins_uxn_c_l81_c3_c160;
     VAR_printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg2 := resize(VAR_ins_uxn_c_l81_c3_c160, 32);
     -- BIN_OP_PLUS[uxn_c_l82_c3_12df] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l82_c3_12df_left <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_12df_left;
     BIN_OP_PLUS_uxn_c_l82_c3_12df_right <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_12df_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_12df_return_output := BIN_OP_PLUS_uxn_c_l82_c3_12df_return_output;

     -- BIN_OP_EQ[uxn_c_l80_c11_ecea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l80_c11_ecea_left <= VAR_BIN_OP_EQ_uxn_c_l80_c11_ecea_left;
     BIN_OP_EQ_uxn_c_l80_c11_ecea_right <= VAR_BIN_OP_EQ_uxn_c_l80_c11_ecea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l80_c11_ecea_return_output := BIN_OP_EQ_uxn_c_l80_c11_ecea_return_output;

     -- BIN_OP_PLUS[uxn_c_l102_c3_7add] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l102_c3_7add_left <= VAR_BIN_OP_PLUS_uxn_c_l102_c3_7add_left;
     BIN_OP_PLUS_uxn_c_l102_c3_7add_right <= VAR_BIN_OP_PLUS_uxn_c_l102_c3_7add_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l102_c3_7add_return_output := BIN_OP_PLUS_uxn_c_l102_c3_7add_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l68_c2_9644] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_9644_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- BIN_OP_MINUS[uxn_c_l86_c43_7f82] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l86_c43_7f82_left <= VAR_BIN_OP_MINUS_uxn_c_l86_c43_7f82_left;
     BIN_OP_MINUS_uxn_c_l86_c43_7f82_right <= VAR_BIN_OP_MINUS_uxn_c_l86_c43_7f82_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l86_c43_7f82_return_output := BIN_OP_MINUS_uxn_c_l86_c43_7f82_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l74_c7_5e95] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l74_c7_5e95_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- BIN_OP_EQ[uxn_c_l74_c11_d6d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l74_c11_d6d4_left <= VAR_BIN_OP_EQ_uxn_c_l74_c11_d6d4_left;
     BIN_OP_EQ_uxn_c_l74_c11_d6d4_right <= VAR_BIN_OP_EQ_uxn_c_l74_c11_d6d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l74_c11_d6d4_return_output := BIN_OP_EQ_uxn_c_l74_c11_d6d4_return_output;

     -- BIN_OP_EQ[uxn_c_l68_c6_6e29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l68_c6_6e29_left <= VAR_BIN_OP_EQ_uxn_c_l68_c6_6e29_left;
     BIN_OP_EQ_uxn_c_l68_c6_6e29_right <= VAR_BIN_OP_EQ_uxn_c_l68_c6_6e29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l68_c6_6e29_return_output := BIN_OP_EQ_uxn_c_l68_c6_6e29_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_6e29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_6e29_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_9644_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_6e29_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_9644_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_6e29_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_9644_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_6e29_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_9644_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_6e29_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_9644_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_6e29_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_d6d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_d6d4_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_5e95_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_d6d4_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_5e95_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_d6d4_return_output;
     VAR_ins_MUX_uxn_c_l74_c7_5e95_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_d6d4_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c7_5e95_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_d6d4_return_output;
     VAR_pc_MUX_uxn_c_l74_c7_5e95_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_d6d4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_ecea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_ecea_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_7d46_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_ecea_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_7d46_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_ecea_return_output;
     VAR_ins_MUX_uxn_c_l80_c7_7d46_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_ecea_return_output;
     VAR_is_ins_done_MUX_uxn_c_l80_c7_7d46_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_ecea_return_output;
     VAR_pc_MUX_uxn_c_l80_c7_7d46_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_ecea_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_phase := VAR_BIN_OP_MINUS_uxn_c_l86_c43_7f82_return_output;
     VAR_step_cpu_phase_uxn_c_l102_c3_fd24 := resize(VAR_BIN_OP_PLUS_uxn_c_l102_c3_7add_return_output, 8);
     VAR_pc_uxn_c_l82_c3_ab43 := resize(VAR_BIN_OP_PLUS_uxn_c_l82_c3_12df_return_output, 16);
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_9644_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_9644_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_5e95_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l74_c7_5e95_return_output;
     VAR_pc_MUX_uxn_c_l80_c7_7d46_iftrue := VAR_pc_uxn_c_l82_c3_ab43;
     VAR_printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg1 := resize(VAR_pc_uxn_c_l82_c3_ab43, 32);
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_iffalse := VAR_step_cpu_phase_uxn_c_l102_c3_fd24;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l74_c7_5e95] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_d358] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_return_output;

     -- ins_MUX[uxn_c_l80_c7_7d46] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l80_c7_7d46_cond <= VAR_ins_MUX_uxn_c_l80_c7_7d46_cond;
     ins_MUX_uxn_c_l80_c7_7d46_iftrue <= VAR_ins_MUX_uxn_c_l80_c7_7d46_iftrue;
     ins_MUX_uxn_c_l80_c7_7d46_iffalse <= VAR_ins_MUX_uxn_c_l80_c7_7d46_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l80_c7_7d46_return_output := ins_MUX_uxn_c_l80_c7_7d46_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_5e95_return_output;
     VAR_printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_d358_return_output;
     VAR_ins_MUX_uxn_c_l74_c7_5e95_iffalse := VAR_ins_MUX_uxn_c_l80_c7_7d46_return_output;
     -- printf_uxn_c_l72_c3_c210[uxn_c_l72_c3_c210] LATENCY=0
     -- Clock enable
     printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_CLOCK_ENABLE <= VAR_printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_arg0 <= VAR_printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_arg0;
     printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_arg1 <= VAR_printf_uxn_c_l72_c3_c210_uxn_c_l72_c3_c210_arg1;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c7_7d46] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_return_output;

     -- ins_MUX[uxn_c_l74_c7_5e95] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l74_c7_5e95_cond <= VAR_ins_MUX_uxn_c_l74_c7_5e95_cond;
     ins_MUX_uxn_c_l74_c7_5e95_iftrue <= VAR_ins_MUX_uxn_c_l74_c7_5e95_iftrue;
     ins_MUX_uxn_c_l74_c7_5e95_iffalse <= VAR_ins_MUX_uxn_c_l74_c7_5e95_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l74_c7_5e95_return_output := ins_MUX_uxn_c_l74_c7_5e95_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l74_c1_a7dc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_7d46_return_output;
     VAR_printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_a7dc_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_9644_iffalse := VAR_ins_MUX_uxn_c_l74_c7_5e95_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_333c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_f8b0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_return_output;

     -- ins_MUX[uxn_c_l68_c2_9644] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l68_c2_9644_cond <= VAR_ins_MUX_uxn_c_l68_c2_9644_cond;
     ins_MUX_uxn_c_l68_c2_9644_iftrue <= VAR_ins_MUX_uxn_c_l68_c2_9644_iftrue;
     ins_MUX_uxn_c_l68_c2_9644_iffalse <= VAR_ins_MUX_uxn_c_l68_c2_9644_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l68_c2_9644_return_output := ins_MUX_uxn_c_l68_c2_9644_return_output;

     -- printf_uxn_c_l78_c3_dff9[uxn_c_l78_c3_dff9] LATENCY=0
     -- Clock enable
     printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_CLOCK_ENABLE <= VAR_printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg0 <= VAR_printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg0;
     printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg1 <= VAR_printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg1;
     printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg2 <= VAR_printf_uxn_c_l78_c3_dff9_uxn_c_l78_c3_dff9_arg2;
     -- Outputs

     -- Submodule level 4
     VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_return_output;
     VAR_printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_333c_return_output;
     VAR_printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_f8b0_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l68_c2_9644_return_output;
     -- eval_opcode_phased[uxn_c_l86_c24_cc3f] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l86_c24_cc3f_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l86_c24_cc3f_phase <= VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_phase;
     eval_opcode_phased_uxn_c_l86_c24_cc3f_ins <= VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_ins;
     eval_opcode_phased_uxn_c_l86_c24_cc3f_pc <= VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_pc;
     eval_opcode_phased_uxn_c_l86_c24_cc3f_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_previous_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output := eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output;

     -- printf_uxn_c_l83_c3_c42c[uxn_c_l83_c3_c42c] LATENCY=0
     -- Clock enable
     printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_CLOCK_ENABLE <= VAR_printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg0 <= VAR_printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg0;
     printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg1 <= VAR_printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg1;
     printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg2 <= VAR_printf_uxn_c_l83_c3_c42c_uxn_c_l83_c3_c42c_arg2;
     -- Outputs

     -- Submodule level 5
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_7d46_iffalse := VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l87_c8_661f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_661f_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output.is_pc_updated;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d[uxn_c_l87_c43_e4fb] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l87_c43_e4fb_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output.pc;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l89_c34_08d3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_08d3_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d[uxn_c_l88_c33_b939] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l88_c33_b939_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output.is_ram_read;

     -- CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d[uxn_c_l94_c32_0bff] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l94_c32_0bff_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l95_c17_e67a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l95_c17_e67a_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l92_c35_bbe7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l92_c35_bbe7_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output.is_vram_write;

     -- eval_opcode_result_MUX[uxn_c_l80_c7_7d46] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l80_c7_7d46_cond <= VAR_eval_opcode_result_MUX_uxn_c_l80_c7_7d46_cond;
     eval_opcode_result_MUX_uxn_c_l80_c7_7d46_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l80_c7_7d46_iftrue;
     eval_opcode_result_MUX_uxn_c_l80_c7_7d46_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l80_c7_7d46_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_7d46_return_output := eval_opcode_result_MUX_uxn_c_l80_c7_7d46_return_output;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d[uxn_c_l91_c31_957a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l91_c31_957a_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output.ram_value;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d[uxn_c_l90_c33_7cea] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l90_c33_7cea_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output.ram_addr;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l93_c34_3afc] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l93_c34_3afc_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_cc3f_return_output.vram_address;

     -- Submodule level 6
     VAR_MUX_uxn_c_l87_c8_25b1_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l87_c43_e4fb_return_output;
     VAR_is_ins_done_MUX_uxn_c_l80_c7_7d46_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l95_c17_e67a_return_output;
     VAR_MUX_uxn_c_l87_c8_25b1_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_661f_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_5e95_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l80_c7_7d46_return_output;
     -- is_ins_done_MUX[uxn_c_l80_c7_7d46] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l80_c7_7d46_cond <= VAR_is_ins_done_MUX_uxn_c_l80_c7_7d46_cond;
     is_ins_done_MUX_uxn_c_l80_c7_7d46_iftrue <= VAR_is_ins_done_MUX_uxn_c_l80_c7_7d46_iftrue;
     is_ins_done_MUX_uxn_c_l80_c7_7d46_iffalse <= VAR_is_ins_done_MUX_uxn_c_l80_c7_7d46_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l80_c7_7d46_return_output := is_ins_done_MUX_uxn_c_l80_c7_7d46_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70[uxn_c_l80_c7_7d46] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l80_c7_7d46_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l88_c33_b939_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_08d3_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l90_c33_7cea_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l91_c31_957a_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l92_c35_bbe7_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l93_c34_3afc_return_output,
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l94_c32_0bff_return_output);

     -- eval_opcode_result_MUX[uxn_c_l74_c7_5e95] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l74_c7_5e95_cond <= VAR_eval_opcode_result_MUX_uxn_c_l74_c7_5e95_cond;
     eval_opcode_result_MUX_uxn_c_l74_c7_5e95_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l74_c7_5e95_iftrue;
     eval_opcode_result_MUX_uxn_c_l74_c7_5e95_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l74_c7_5e95_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_5e95_return_output := eval_opcode_result_MUX_uxn_c_l74_c7_5e95_return_output;

     -- MUX[uxn_c_l87_c8_25b1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l87_c8_25b1_cond <= VAR_MUX_uxn_c_l87_c8_25b1_cond;
     MUX_uxn_c_l87_c8_25b1_iftrue <= VAR_MUX_uxn_c_l87_c8_25b1_iftrue;
     MUX_uxn_c_l87_c8_25b1_iffalse <= VAR_MUX_uxn_c_l87_c8_25b1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l87_c8_25b1_return_output := MUX_uxn_c_l87_c8_25b1_return_output;

     -- Submodule level 7
     VAR_pc_uxn_c_l87_c3_1d01 := VAR_MUX_uxn_c_l87_c8_25b1_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_7d46_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l80_c7_7d46_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_9644_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l74_c7_5e95_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c7_5e95_iffalse := VAR_is_ins_done_MUX_uxn_c_l80_c7_7d46_return_output;
     VAR_pc_MUX_uxn_c_l80_c7_7d46_iffalse := VAR_pc_uxn_c_l87_c3_1d01;
     VAR_printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg1 := resize(VAR_pc_uxn_c_l87_c3_1d01, 32);
     -- eval_opcode_result_MUX[uxn_c_l68_c2_9644] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l68_c2_9644_cond <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_9644_cond;
     eval_opcode_result_MUX_uxn_c_l68_c2_9644_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_9644_iftrue;
     eval_opcode_result_MUX_uxn_c_l68_c2_9644_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_9644_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_9644_return_output := eval_opcode_result_MUX_uxn_c_l68_c2_9644_return_output;

     -- printf_uxn_c_l96_c3_8141[uxn_c_l96_c3_8141] LATENCY=0
     -- Clock enable
     printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_CLOCK_ENABLE <= VAR_printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg0 <= VAR_printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg0;
     printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg1 <= VAR_printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg1;
     printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg2 <= VAR_printf_uxn_c_l96_c3_8141_uxn_c_l96_c3_8141_arg2;
     -- Outputs

     -- pc_MUX[uxn_c_l80_c7_7d46] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l80_c7_7d46_cond <= VAR_pc_MUX_uxn_c_l80_c7_7d46_cond;
     pc_MUX_uxn_c_l80_c7_7d46_iftrue <= VAR_pc_MUX_uxn_c_l80_c7_7d46_iftrue;
     pc_MUX_uxn_c_l80_c7_7d46_iffalse <= VAR_pc_MUX_uxn_c_l80_c7_7d46_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l80_c7_7d46_return_output := pc_MUX_uxn_c_l80_c7_7d46_return_output;

     -- is_ins_done_MUX[uxn_c_l74_c7_5e95] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l74_c7_5e95_cond <= VAR_is_ins_done_MUX_uxn_c_l74_c7_5e95_cond;
     is_ins_done_MUX_uxn_c_l74_c7_5e95_iftrue <= VAR_is_ins_done_MUX_uxn_c_l74_c7_5e95_iftrue;
     is_ins_done_MUX_uxn_c_l74_c7_5e95_iffalse <= VAR_is_ins_done_MUX_uxn_c_l74_c7_5e95_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l74_c7_5e95_return_output := is_ins_done_MUX_uxn_c_l74_c7_5e95_return_output;

     -- cpu_step_result_MUX[uxn_c_l80_c7_7d46] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l80_c7_7d46_cond <= VAR_cpu_step_result_MUX_uxn_c_l80_c7_7d46_cond;
     cpu_step_result_MUX_uxn_c_l80_c7_7d46_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l80_c7_7d46_iftrue;
     cpu_step_result_MUX_uxn_c_l80_c7_7d46_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l80_c7_7d46_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_7d46_return_output := cpu_step_result_MUX_uxn_c_l80_c7_7d46_return_output;

     -- Submodule level 8
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_5e95_iffalse := VAR_cpu_step_result_MUX_uxn_c_l80_c7_7d46_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l68_c2_9644_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_9644_iffalse := VAR_is_ins_done_MUX_uxn_c_l74_c7_5e95_return_output;
     VAR_pc_MUX_uxn_c_l74_c7_5e95_iffalse := VAR_pc_MUX_uxn_c_l80_c7_7d46_return_output;
     -- pc_MUX[uxn_c_l74_c7_5e95] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l74_c7_5e95_cond <= VAR_pc_MUX_uxn_c_l74_c7_5e95_cond;
     pc_MUX_uxn_c_l74_c7_5e95_iftrue <= VAR_pc_MUX_uxn_c_l74_c7_5e95_iftrue;
     pc_MUX_uxn_c_l74_c7_5e95_iffalse <= VAR_pc_MUX_uxn_c_l74_c7_5e95_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l74_c7_5e95_return_output := pc_MUX_uxn_c_l74_c7_5e95_return_output;

     -- is_ins_done_MUX[uxn_c_l68_c2_9644] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l68_c2_9644_cond <= VAR_is_ins_done_MUX_uxn_c_l68_c2_9644_cond;
     is_ins_done_MUX_uxn_c_l68_c2_9644_iftrue <= VAR_is_ins_done_MUX_uxn_c_l68_c2_9644_iftrue;
     is_ins_done_MUX_uxn_c_l68_c2_9644_iffalse <= VAR_is_ins_done_MUX_uxn_c_l68_c2_9644_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l68_c2_9644_return_output := is_ins_done_MUX_uxn_c_l68_c2_9644_return_output;

     -- cpu_step_result_MUX[uxn_c_l74_c7_5e95] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l74_c7_5e95_cond <= VAR_cpu_step_result_MUX_uxn_c_l74_c7_5e95_cond;
     cpu_step_result_MUX_uxn_c_l74_c7_5e95_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l74_c7_5e95_iftrue;
     cpu_step_result_MUX_uxn_c_l74_c7_5e95_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l74_c7_5e95_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_5e95_return_output := cpu_step_result_MUX_uxn_c_l74_c7_5e95_return_output;

     -- Submodule level 9
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_9644_iffalse := VAR_cpu_step_result_MUX_uxn_c_l74_c7_5e95_return_output;
     VAR_BIN_OP_EQ_uxn_c_l99_c6_a13e_left := VAR_is_ins_done_MUX_uxn_c_l68_c2_9644_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l68_c2_9644_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_9644_iffalse := VAR_pc_MUX_uxn_c_l74_c7_5e95_return_output;
     -- BIN_OP_EQ[uxn_c_l99_c6_a13e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l99_c6_a13e_left <= VAR_BIN_OP_EQ_uxn_c_l99_c6_a13e_left;
     BIN_OP_EQ_uxn_c_l99_c6_a13e_right <= VAR_BIN_OP_EQ_uxn_c_l99_c6_a13e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l99_c6_a13e_return_output := BIN_OP_EQ_uxn_c_l99_c6_a13e_return_output;

     -- pc_MUX[uxn_c_l68_c2_9644] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l68_c2_9644_cond <= VAR_pc_MUX_uxn_c_l68_c2_9644_cond;
     pc_MUX_uxn_c_l68_c2_9644_iftrue <= VAR_pc_MUX_uxn_c_l68_c2_9644_iftrue;
     pc_MUX_uxn_c_l68_c2_9644_iffalse <= VAR_pc_MUX_uxn_c_l68_c2_9644_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l68_c2_9644_return_output := pc_MUX_uxn_c_l68_c2_9644_return_output;

     -- cpu_step_result_MUX[uxn_c_l68_c2_9644] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l68_c2_9644_cond <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_9644_cond;
     cpu_step_result_MUX_uxn_c_l68_c2_9644_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_9644_iftrue;
     cpu_step_result_MUX_uxn_c_l68_c2_9644_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_9644_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_9644_return_output := cpu_step_result_MUX_uxn_c_l68_c2_9644_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_cond := VAR_BIN_OP_EQ_uxn_c_l99_c6_a13e_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l68_c2_9644_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l68_c2_9644_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l68_c2_9644_return_output;
     -- step_cpu_phase_MUX[uxn_c_l99_c2_3ff8] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_cond <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_cond;
     step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_iftrue;
     step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_return_output := step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l99_c2_3ff8_return_output;
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
