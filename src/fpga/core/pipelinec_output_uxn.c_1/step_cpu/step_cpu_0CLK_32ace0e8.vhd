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
entity step_cpu_0CLK_32ace0e8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ram_read_value : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_32ace0e8;
architecture arch of step_cpu_0CLK_32ace0e8 is
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
-- BIN_OP_EQ[uxn_c_l68_c6_a89e]
signal BIN_OP_EQ_uxn_c_l68_c6_a89e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_a89e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_a89e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_b3ca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l74_c7_0dfc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l68_c2_12f9]
signal ins_MUX_uxn_c_l68_c2_12f9_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l68_c2_12f9_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_12f9_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_12f9_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l68_c2_12f9]
signal pc_MUX_uxn_c_l68_c2_12f9_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l68_c2_12f9_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_12f9_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_12f9_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l68_c2_12f9]
signal cpu_step_result_MUX_uxn_c_l68_c2_12f9_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l68_c2_12f9_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_12f9_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_12f9_return_output : cpu_step_result_t;

-- is_ins_done_MUX[uxn_c_l68_c2_12f9]
signal is_ins_done_MUX_uxn_c_l68_c2_12f9_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_12f9_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_12f9_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_12f9_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l68_c2_12f9]
signal eval_opcode_result_MUX_uxn_c_l68_c2_12f9_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l68_c2_12f9_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_12f9_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_12f9_return_output : eval_opcode_result_t;

-- printf_uxn_c_l72_c3_3594[uxn_c_l72_c3_3594]
signal printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l74_c11_d9ba]
signal BIN_OP_EQ_uxn_c_l74_c11_d9ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c11_d9ba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c11_d9ba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l74_c1_b904]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c7_5e9d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l74_c7_0dfc]
signal ins_MUX_uxn_c_l74_c7_0dfc_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l74_c7_0dfc_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c7_0dfc_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c7_0dfc_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l74_c7_0dfc]
signal pc_MUX_uxn_c_l74_c7_0dfc_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l74_c7_0dfc_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c7_0dfc_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c7_0dfc_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l74_c7_0dfc]
signal cpu_step_result_MUX_uxn_c_l74_c7_0dfc_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l74_c7_0dfc_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l74_c7_0dfc_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l74_c7_0dfc_return_output : cpu_step_result_t;

-- is_ins_done_MUX[uxn_c_l74_c7_0dfc]
signal is_ins_done_MUX_uxn_c_l74_c7_0dfc_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c7_0dfc_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c7_0dfc_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c7_0dfc_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l74_c7_0dfc]
signal eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_return_output : eval_opcode_result_t;

-- printf_uxn_c_l78_c3_4d05[uxn_c_l78_c3_4d05]
signal printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l80_c11_76a7]
signal BIN_OP_EQ_uxn_c_l80_c11_76a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l80_c11_76a7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l80_c11_76a7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_56b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_c8de]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l80_c7_5e9d]
signal ins_MUX_uxn_c_l80_c7_5e9d_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l80_c7_5e9d_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l80_c7_5e9d_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l80_c7_5e9d_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l80_c7_5e9d]
signal pc_MUX_uxn_c_l80_c7_5e9d_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l80_c7_5e9d_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l80_c7_5e9d_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l80_c7_5e9d_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l80_c7_5e9d]
signal cpu_step_result_MUX_uxn_c_l80_c7_5e9d_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l80_c7_5e9d_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l80_c7_5e9d_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l80_c7_5e9d_return_output : cpu_step_result_t;

-- is_ins_done_MUX[uxn_c_l80_c7_5e9d]
signal is_ins_done_MUX_uxn_c_l80_c7_5e9d_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l80_c7_5e9d_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l80_c7_5e9d_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l80_c7_5e9d_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l80_c7_5e9d]
signal eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_return_output : eval_opcode_result_t;

-- BIN_OP_PLUS[uxn_c_l82_c3_4de7]
signal BIN_OP_PLUS_uxn_c_l82_c3_4de7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_4de7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_4de7_return_output : unsigned(16 downto 0);

-- printf_uxn_c_l83_c3_bf88[uxn_c_l83_c3_bf88]
signal printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg2 : unsigned(31 downto 0);

-- BIN_OP_MINUS[uxn_c_l86_c43_2e48]
signal BIN_OP_MINUS_uxn_c_l86_c43_2e48_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c43_2e48_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c43_2e48_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l86_c24_3ad7]
signal eval_opcode_phased_uxn_c_l86_c24_3ad7_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_3ad7_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_3ad7_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_3ad7_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_3ad7_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l87_c8_aeb9]
signal MUX_uxn_c_l87_c8_aeb9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l87_c8_aeb9_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_aeb9_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_aeb9_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l96_c3_82be[uxn_c_l96_c3_82be]
signal printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l99_c6_6189]
signal BIN_OP_EQ_uxn_c_l99_c6_6189_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c6_6189_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c6_6189_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l99_c2_6a47]
signal step_cpu_phase_MUX_uxn_c_l99_c2_6a47_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_6a47_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_6a47_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_6a47_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l102_c3_b412]
signal BIN_OP_PLUS_uxn_c_l102_c3_b412_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c3_b412_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c3_b412_return_output : unsigned(8 downto 0);

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
-- BIN_OP_EQ_uxn_c_l68_c6_a89e
BIN_OP_EQ_uxn_c_l68_c6_a89e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l68_c6_a89e_left,
BIN_OP_EQ_uxn_c_l68_c6_a89e_right,
BIN_OP_EQ_uxn_c_l68_c6_a89e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_return_output);

-- ins_MUX_uxn_c_l68_c2_12f9
ins_MUX_uxn_c_l68_c2_12f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l68_c2_12f9_cond,
ins_MUX_uxn_c_l68_c2_12f9_iftrue,
ins_MUX_uxn_c_l68_c2_12f9_iffalse,
ins_MUX_uxn_c_l68_c2_12f9_return_output);

-- pc_MUX_uxn_c_l68_c2_12f9
pc_MUX_uxn_c_l68_c2_12f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l68_c2_12f9_cond,
pc_MUX_uxn_c_l68_c2_12f9_iftrue,
pc_MUX_uxn_c_l68_c2_12f9_iffalse,
pc_MUX_uxn_c_l68_c2_12f9_return_output);

-- cpu_step_result_MUX_uxn_c_l68_c2_12f9
cpu_step_result_MUX_uxn_c_l68_c2_12f9 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l68_c2_12f9_cond,
cpu_step_result_MUX_uxn_c_l68_c2_12f9_iftrue,
cpu_step_result_MUX_uxn_c_l68_c2_12f9_iffalse,
cpu_step_result_MUX_uxn_c_l68_c2_12f9_return_output);

-- is_ins_done_MUX_uxn_c_l68_c2_12f9
is_ins_done_MUX_uxn_c_l68_c2_12f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l68_c2_12f9_cond,
is_ins_done_MUX_uxn_c_l68_c2_12f9_iftrue,
is_ins_done_MUX_uxn_c_l68_c2_12f9_iffalse,
is_ins_done_MUX_uxn_c_l68_c2_12f9_return_output);

-- eval_opcode_result_MUX_uxn_c_l68_c2_12f9
eval_opcode_result_MUX_uxn_c_l68_c2_12f9 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l68_c2_12f9_cond,
eval_opcode_result_MUX_uxn_c_l68_c2_12f9_iftrue,
eval_opcode_result_MUX_uxn_c_l68_c2_12f9_iffalse,
eval_opcode_result_MUX_uxn_c_l68_c2_12f9_return_output);

-- printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594
printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594 : entity work.printf_uxn_c_l72_c3_3594_0CLK_de264c78 port map (
printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_CLOCK_ENABLE,
printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_arg0,
printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_arg1);

-- BIN_OP_EQ_uxn_c_l74_c11_d9ba
BIN_OP_EQ_uxn_c_l74_c11_d9ba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l74_c11_d9ba_left,
BIN_OP_EQ_uxn_c_l74_c11_d9ba_right,
BIN_OP_EQ_uxn_c_l74_c11_d9ba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_return_output);

-- ins_MUX_uxn_c_l74_c7_0dfc
ins_MUX_uxn_c_l74_c7_0dfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l74_c7_0dfc_cond,
ins_MUX_uxn_c_l74_c7_0dfc_iftrue,
ins_MUX_uxn_c_l74_c7_0dfc_iffalse,
ins_MUX_uxn_c_l74_c7_0dfc_return_output);

-- pc_MUX_uxn_c_l74_c7_0dfc
pc_MUX_uxn_c_l74_c7_0dfc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l74_c7_0dfc_cond,
pc_MUX_uxn_c_l74_c7_0dfc_iftrue,
pc_MUX_uxn_c_l74_c7_0dfc_iffalse,
pc_MUX_uxn_c_l74_c7_0dfc_return_output);

-- cpu_step_result_MUX_uxn_c_l74_c7_0dfc
cpu_step_result_MUX_uxn_c_l74_c7_0dfc : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l74_c7_0dfc_cond,
cpu_step_result_MUX_uxn_c_l74_c7_0dfc_iftrue,
cpu_step_result_MUX_uxn_c_l74_c7_0dfc_iffalse,
cpu_step_result_MUX_uxn_c_l74_c7_0dfc_return_output);

-- is_ins_done_MUX_uxn_c_l74_c7_0dfc
is_ins_done_MUX_uxn_c_l74_c7_0dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l74_c7_0dfc_cond,
is_ins_done_MUX_uxn_c_l74_c7_0dfc_iftrue,
is_ins_done_MUX_uxn_c_l74_c7_0dfc_iffalse,
is_ins_done_MUX_uxn_c_l74_c7_0dfc_return_output);

-- eval_opcode_result_MUX_uxn_c_l74_c7_0dfc
eval_opcode_result_MUX_uxn_c_l74_c7_0dfc : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_cond,
eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_iftrue,
eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_iffalse,
eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_return_output);

-- printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05
printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05 : entity work.printf_uxn_c_l78_c3_4d05_0CLK_de264c78 port map (
printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_CLOCK_ENABLE,
printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg0,
printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg1,
printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg2);

-- BIN_OP_EQ_uxn_c_l80_c11_76a7
BIN_OP_EQ_uxn_c_l80_c11_76a7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l80_c11_76a7_left,
BIN_OP_EQ_uxn_c_l80_c11_76a7_right,
BIN_OP_EQ_uxn_c_l80_c11_76a7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_return_output);

-- ins_MUX_uxn_c_l80_c7_5e9d
ins_MUX_uxn_c_l80_c7_5e9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l80_c7_5e9d_cond,
ins_MUX_uxn_c_l80_c7_5e9d_iftrue,
ins_MUX_uxn_c_l80_c7_5e9d_iffalse,
ins_MUX_uxn_c_l80_c7_5e9d_return_output);

-- pc_MUX_uxn_c_l80_c7_5e9d
pc_MUX_uxn_c_l80_c7_5e9d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l80_c7_5e9d_cond,
pc_MUX_uxn_c_l80_c7_5e9d_iftrue,
pc_MUX_uxn_c_l80_c7_5e9d_iffalse,
pc_MUX_uxn_c_l80_c7_5e9d_return_output);

-- cpu_step_result_MUX_uxn_c_l80_c7_5e9d
cpu_step_result_MUX_uxn_c_l80_c7_5e9d : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l80_c7_5e9d_cond,
cpu_step_result_MUX_uxn_c_l80_c7_5e9d_iftrue,
cpu_step_result_MUX_uxn_c_l80_c7_5e9d_iffalse,
cpu_step_result_MUX_uxn_c_l80_c7_5e9d_return_output);

-- is_ins_done_MUX_uxn_c_l80_c7_5e9d
is_ins_done_MUX_uxn_c_l80_c7_5e9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l80_c7_5e9d_cond,
is_ins_done_MUX_uxn_c_l80_c7_5e9d_iftrue,
is_ins_done_MUX_uxn_c_l80_c7_5e9d_iffalse,
is_ins_done_MUX_uxn_c_l80_c7_5e9d_return_output);

-- eval_opcode_result_MUX_uxn_c_l80_c7_5e9d
eval_opcode_result_MUX_uxn_c_l80_c7_5e9d : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_cond,
eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_iftrue,
eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_iffalse,
eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_return_output);

-- BIN_OP_PLUS_uxn_c_l82_c3_4de7
BIN_OP_PLUS_uxn_c_l82_c3_4de7 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l82_c3_4de7_left,
BIN_OP_PLUS_uxn_c_l82_c3_4de7_right,
BIN_OP_PLUS_uxn_c_l82_c3_4de7_return_output);

-- printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88
printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88 : entity work.printf_uxn_c_l83_c3_bf88_0CLK_de264c78 port map (
printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_CLOCK_ENABLE,
printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg0,
printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg1,
printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg2);

-- BIN_OP_MINUS_uxn_c_l86_c43_2e48
BIN_OP_MINUS_uxn_c_l86_c43_2e48 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l86_c43_2e48_left,
BIN_OP_MINUS_uxn_c_l86_c43_2e48_right,
BIN_OP_MINUS_uxn_c_l86_c43_2e48_return_output);

-- eval_opcode_phased_uxn_c_l86_c24_3ad7
eval_opcode_phased_uxn_c_l86_c24_3ad7 : entity work.eval_opcode_phased_0CLK_3220735c port map (
clk,
eval_opcode_phased_uxn_c_l86_c24_3ad7_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l86_c24_3ad7_phase,
eval_opcode_phased_uxn_c_l86_c24_3ad7_ins,
eval_opcode_phased_uxn_c_l86_c24_3ad7_pc,
eval_opcode_phased_uxn_c_l86_c24_3ad7_previous_ram_read,
eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output);

-- MUX_uxn_c_l87_c8_aeb9
MUX_uxn_c_l87_c8_aeb9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l87_c8_aeb9_cond,
MUX_uxn_c_l87_c8_aeb9_iftrue,
MUX_uxn_c_l87_c8_aeb9_iffalse,
MUX_uxn_c_l87_c8_aeb9_return_output);

-- printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be
printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be : entity work.printf_uxn_c_l96_c3_82be_0CLK_de264c78 port map (
printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_CLOCK_ENABLE,
printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg0,
printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg1,
printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg2);

-- BIN_OP_EQ_uxn_c_l99_c6_6189
BIN_OP_EQ_uxn_c_l99_c6_6189 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l99_c6_6189_left,
BIN_OP_EQ_uxn_c_l99_c6_6189_right,
BIN_OP_EQ_uxn_c_l99_c6_6189_return_output);

-- step_cpu_phase_MUX_uxn_c_l99_c2_6a47
step_cpu_phase_MUX_uxn_c_l99_c2_6a47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l99_c2_6a47_cond,
step_cpu_phase_MUX_uxn_c_l99_c2_6a47_iftrue,
step_cpu_phase_MUX_uxn_c_l99_c2_6a47_iffalse,
step_cpu_phase_MUX_uxn_c_l99_c2_6a47_return_output);

-- BIN_OP_PLUS_uxn_c_l102_c3_b412
BIN_OP_PLUS_uxn_c_l102_c3_b412 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l102_c3_b412_left,
BIN_OP_PLUS_uxn_c_l102_c3_b412_right,
BIN_OP_PLUS_uxn_c_l102_c3_b412_return_output);



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
 BIN_OP_EQ_uxn_c_l68_c6_a89e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_return_output,
 ins_MUX_uxn_c_l68_c2_12f9_return_output,
 pc_MUX_uxn_c_l68_c2_12f9_return_output,
 cpu_step_result_MUX_uxn_c_l68_c2_12f9_return_output,
 is_ins_done_MUX_uxn_c_l68_c2_12f9_return_output,
 eval_opcode_result_MUX_uxn_c_l68_c2_12f9_return_output,
 BIN_OP_EQ_uxn_c_l74_c11_d9ba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_return_output,
 ins_MUX_uxn_c_l74_c7_0dfc_return_output,
 pc_MUX_uxn_c_l74_c7_0dfc_return_output,
 cpu_step_result_MUX_uxn_c_l74_c7_0dfc_return_output,
 is_ins_done_MUX_uxn_c_l74_c7_0dfc_return_output,
 eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_return_output,
 BIN_OP_EQ_uxn_c_l80_c11_76a7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_return_output,
 ins_MUX_uxn_c_l80_c7_5e9d_return_output,
 pc_MUX_uxn_c_l80_c7_5e9d_return_output,
 cpu_step_result_MUX_uxn_c_l80_c7_5e9d_return_output,
 is_ins_done_MUX_uxn_c_l80_c7_5e9d_return_output,
 eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_return_output,
 BIN_OP_PLUS_uxn_c_l82_c3_4de7_return_output,
 BIN_OP_MINUS_uxn_c_l86_c43_2e48_return_output,
 eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output,
 MUX_uxn_c_l87_c8_aeb9_return_output,
 BIN_OP_EQ_uxn_c_l99_c6_6189_return_output,
 step_cpu_phase_MUX_uxn_c_l99_c2_6a47_return_output,
 BIN_OP_PLUS_uxn_c_l102_c3_b412_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_ram_read_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_a89e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_a89e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_a89e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_12f9_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_12f9_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_0dfc_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_12f9_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_12f9_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_12f9_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_12f9_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_0dfc_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_12f9_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_12f9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_12f9_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_12f9_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_12f9_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_0dfc_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_12f9_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_12f9_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_12f9_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_12f9_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_0dfc_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_12f9_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_12f9_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_12f9_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_12f9_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_12f9_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_12f9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c11_d9ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c11_d9ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c11_d9ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_0dfc_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_0dfc_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_5e9d_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_0dfc_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_0dfc_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_0dfc_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_5e9d_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_0dfc_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_0dfc_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l74_c7_0dfc_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_0dfc_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_5e9d_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_0dfc_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_0dfc_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_0dfc_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_5e9d_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_0dfc_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l80_c11_76a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l80_c11_76a7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l80_c11_76a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_5e9d_iftrue : unsigned(7 downto 0);
 variable VAR_ins_uxn_c_l81_c3_7544 : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_5e9d_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_5e9d_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_5e9d_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l82_c3_b9b4 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_5e9d_iffalse : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l87_c3_24ad : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_5e9d_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_5e9d_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_5e9d_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l80_c7_5e9d_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_5e9d_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_5e9d_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_5e9d_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_5e9d_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_4de7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_4de7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_4de7_return_output : unsigned(16 downto 0);
 variable VAR_printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg2 : unsigned(31 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c43_2e48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c43_2e48_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c43_2e48_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l87_c8_aeb9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_aeb9_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_aeb9_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_3363_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l87_c43_0545_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_aeb9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l88_c33_9447_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_8afa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l90_c33_f13c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l91_c31_22c7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l92_c35_2c21_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l93_c34_c5b4_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l94_c32_df09_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l95_c17_7d4b_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c6_6189_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c6_6189_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c6_6189_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_6a47_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l100_c3_a77a : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_6a47_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l102_c3_c116 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_6a47_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_6a47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c3_b412_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c3_b412_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c3_b412_return_output : unsigned(8 downto 0);
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
     VAR_BIN_OP_EQ_uxn_c_l68_c6_a89e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l80_c11_76a7_right := to_unsigned(2, 2);
     VAR_is_ins_done_MUX_uxn_c_l68_c2_12f9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l86_c43_2e48_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l99_c6_6189_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l102_c3_b412_right := to_unsigned(1, 1);
     VAR_step_cpu_phase_uxn_c_l100_c3_a77a := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_6a47_iftrue := VAR_step_cpu_phase_uxn_c_l100_c3_a77a;
     VAR_BIN_OP_EQ_uxn_c_l74_c11_d9ba_right := to_unsigned(1, 1);
     VAR_is_ins_done_MUX_uxn_c_l74_c7_0dfc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_4de7_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ram_read_value := ram_read_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_iftrue := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_5e9d_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_12f9_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_iftrue := eval_opcode_result;
     VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_ins := ins;
     VAR_ins_MUX_uxn_c_l68_c2_12f9_iftrue := ins;
     VAR_ins_MUX_uxn_c_l74_c7_0dfc_iftrue := ins;
     VAR_ins_MUX_uxn_c_l80_c7_5e9d_iffalse := ins;
     VAR_printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg2 := resize(ins, 32);
     VAR_printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg2 := resize(ins, 32);
     VAR_is_ins_done_MUX_uxn_c_l80_c7_5e9d_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_4de7_left := pc;
     VAR_MUX_uxn_c_l87_c8_aeb9_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_pc := pc;
     VAR_pc_MUX_uxn_c_l68_c2_12f9_iftrue := pc;
     VAR_pc_MUX_uxn_c_l74_c7_0dfc_iftrue := pc;
     VAR_printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_arg1 := resize(pc, 32);
     VAR_printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg1 := resize(pc, 32);
     VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_previous_ram_read := VAR_ram_read_value;
     VAR_ins_uxn_c_l81_c3_7544 := VAR_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l68_c6_a89e_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l74_c11_d9ba_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l80_c11_76a7_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l86_c43_2e48_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l102_c3_b412_left := step_cpu_phase;
     VAR_printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg0 := resize(step_cpu_phase, 32);
     VAR_ins_MUX_uxn_c_l80_c7_5e9d_iftrue := VAR_ins_uxn_c_l81_c3_7544;
     VAR_printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg2 := resize(VAR_ins_uxn_c_l81_c3_7544, 32);
     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l74_c7_0dfc] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l74_c7_0dfc_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- BIN_OP_EQ[uxn_c_l68_c6_a89e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l68_c6_a89e_left <= VAR_BIN_OP_EQ_uxn_c_l68_c6_a89e_left;
     BIN_OP_EQ_uxn_c_l68_c6_a89e_right <= VAR_BIN_OP_EQ_uxn_c_l68_c6_a89e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l68_c6_a89e_return_output := BIN_OP_EQ_uxn_c_l68_c6_a89e_return_output;

     -- BIN_OP_PLUS[uxn_c_l102_c3_b412] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l102_c3_b412_left <= VAR_BIN_OP_PLUS_uxn_c_l102_c3_b412_left;
     BIN_OP_PLUS_uxn_c_l102_c3_b412_right <= VAR_BIN_OP_PLUS_uxn_c_l102_c3_b412_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l102_c3_b412_return_output := BIN_OP_PLUS_uxn_c_l102_c3_b412_return_output;

     -- BIN_OP_EQ[uxn_c_l80_c11_76a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l80_c11_76a7_left <= VAR_BIN_OP_EQ_uxn_c_l80_c11_76a7_left;
     BIN_OP_EQ_uxn_c_l80_c11_76a7_right <= VAR_BIN_OP_EQ_uxn_c_l80_c11_76a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l80_c11_76a7_return_output := BIN_OP_EQ_uxn_c_l80_c11_76a7_return_output;

     -- BIN_OP_MINUS[uxn_c_l86_c43_2e48] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l86_c43_2e48_left <= VAR_BIN_OP_MINUS_uxn_c_l86_c43_2e48_left;
     BIN_OP_MINUS_uxn_c_l86_c43_2e48_right <= VAR_BIN_OP_MINUS_uxn_c_l86_c43_2e48_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l86_c43_2e48_return_output := BIN_OP_MINUS_uxn_c_l86_c43_2e48_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l68_c2_12f9] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_12f9_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- BIN_OP_EQ[uxn_c_l74_c11_d9ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l74_c11_d9ba_left <= VAR_BIN_OP_EQ_uxn_c_l74_c11_d9ba_left;
     BIN_OP_EQ_uxn_c_l74_c11_d9ba_right <= VAR_BIN_OP_EQ_uxn_c_l74_c11_d9ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l74_c11_d9ba_return_output := BIN_OP_EQ_uxn_c_l74_c11_d9ba_return_output;

     -- BIN_OP_PLUS[uxn_c_l82_c3_4de7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l82_c3_4de7_left <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_4de7_left;
     BIN_OP_PLUS_uxn_c_l82_c3_4de7_right <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_4de7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_4de7_return_output := BIN_OP_PLUS_uxn_c_l82_c3_4de7_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_a89e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_a89e_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_12f9_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_a89e_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_12f9_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_a89e_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_12f9_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_a89e_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_12f9_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_a89e_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_12f9_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_a89e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_d9ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_d9ba_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_0dfc_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_d9ba_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_d9ba_return_output;
     VAR_ins_MUX_uxn_c_l74_c7_0dfc_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_d9ba_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c7_0dfc_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_d9ba_return_output;
     VAR_pc_MUX_uxn_c_l74_c7_0dfc_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_d9ba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_76a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_76a7_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_5e9d_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_76a7_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_76a7_return_output;
     VAR_ins_MUX_uxn_c_l80_c7_5e9d_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_76a7_return_output;
     VAR_is_ins_done_MUX_uxn_c_l80_c7_5e9d_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_76a7_return_output;
     VAR_pc_MUX_uxn_c_l80_c7_5e9d_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_76a7_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_phase := VAR_BIN_OP_MINUS_uxn_c_l86_c43_2e48_return_output;
     VAR_step_cpu_phase_uxn_c_l102_c3_c116 := resize(VAR_BIN_OP_PLUS_uxn_c_l102_c3_b412_return_output, 8);
     VAR_pc_uxn_c_l82_c3_b9b4 := resize(VAR_BIN_OP_PLUS_uxn_c_l82_c3_4de7_return_output, 16);
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_12f9_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_12f9_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_0dfc_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l74_c7_0dfc_return_output;
     VAR_pc_MUX_uxn_c_l80_c7_5e9d_iftrue := VAR_pc_uxn_c_l82_c3_b9b4;
     VAR_printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg1 := resize(VAR_pc_uxn_c_l82_c3_b9b4, 32);
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_6a47_iffalse := VAR_step_cpu_phase_uxn_c_l102_c3_c116;
     -- ins_MUX[uxn_c_l80_c7_5e9d] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l80_c7_5e9d_cond <= VAR_ins_MUX_uxn_c_l80_c7_5e9d_cond;
     ins_MUX_uxn_c_l80_c7_5e9d_iftrue <= VAR_ins_MUX_uxn_c_l80_c7_5e9d_iftrue;
     ins_MUX_uxn_c_l80_c7_5e9d_iffalse <= VAR_ins_MUX_uxn_c_l80_c7_5e9d_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l80_c7_5e9d_return_output := ins_MUX_uxn_c_l80_c7_5e9d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_b3ca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l74_c7_0dfc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_0dfc_return_output;
     VAR_printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b3ca_return_output;
     VAR_ins_MUX_uxn_c_l74_c7_0dfc_iffalse := VAR_ins_MUX_uxn_c_l80_c7_5e9d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c7_5e9d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_return_output;

     -- printf_uxn_c_l72_c3_3594[uxn_c_l72_c3_3594] LATENCY=0
     -- Clock enable
     printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_CLOCK_ENABLE <= VAR_printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_arg0 <= VAR_printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_arg0;
     printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_arg1 <= VAR_printf_uxn_c_l72_c3_3594_uxn_c_l72_c3_3594_arg1;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l74_c1_b904] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_return_output;

     -- ins_MUX[uxn_c_l74_c7_0dfc] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l74_c7_0dfc_cond <= VAR_ins_MUX_uxn_c_l74_c7_0dfc_cond;
     ins_MUX_uxn_c_l74_c7_0dfc_iftrue <= VAR_ins_MUX_uxn_c_l74_c7_0dfc_iftrue;
     ins_MUX_uxn_c_l74_c7_0dfc_iffalse <= VAR_ins_MUX_uxn_c_l74_c7_0dfc_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l74_c7_0dfc_return_output := ins_MUX_uxn_c_l74_c7_0dfc_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_5e9d_return_output;
     VAR_printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b904_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_12f9_iffalse := VAR_ins_MUX_uxn_c_l74_c7_0dfc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_56b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_return_output;

     -- ins_MUX[uxn_c_l68_c2_12f9] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l68_c2_12f9_cond <= VAR_ins_MUX_uxn_c_l68_c2_12f9_cond;
     ins_MUX_uxn_c_l68_c2_12f9_iftrue <= VAR_ins_MUX_uxn_c_l68_c2_12f9_iftrue;
     ins_MUX_uxn_c_l68_c2_12f9_iffalse <= VAR_ins_MUX_uxn_c_l68_c2_12f9_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l68_c2_12f9_return_output := ins_MUX_uxn_c_l68_c2_12f9_return_output;

     -- printf_uxn_c_l78_c3_4d05[uxn_c_l78_c3_4d05] LATENCY=0
     -- Clock enable
     printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_CLOCK_ENABLE <= VAR_printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg0 <= VAR_printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg0;
     printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg1 <= VAR_printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg1;
     printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg2 <= VAR_printf_uxn_c_l78_c3_4d05_uxn_c_l78_c3_4d05_arg2;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_c8de] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_return_output;

     -- Submodule level 4
     VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_return_output;
     VAR_printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_c8de_return_output;
     VAR_printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_56b6_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l68_c2_12f9_return_output;
     -- printf_uxn_c_l83_c3_bf88[uxn_c_l83_c3_bf88] LATENCY=0
     -- Clock enable
     printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_CLOCK_ENABLE <= VAR_printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg0 <= VAR_printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg0;
     printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg1 <= VAR_printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg1;
     printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg2 <= VAR_printf_uxn_c_l83_c3_bf88_uxn_c_l83_c3_bf88_arg2;
     -- Outputs

     -- eval_opcode_phased[uxn_c_l86_c24_3ad7] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l86_c24_3ad7_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l86_c24_3ad7_phase <= VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_phase;
     eval_opcode_phased_uxn_c_l86_c24_3ad7_ins <= VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_ins;
     eval_opcode_phased_uxn_c_l86_c24_3ad7_pc <= VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_pc;
     eval_opcode_phased_uxn_c_l86_c24_3ad7_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_previous_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output := eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output;

     -- Submodule level 5
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_iffalse := VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l89_c34_8afa] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_8afa_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output.is_ram_write;

     -- eval_opcode_result_MUX[uxn_c_l80_c7_5e9d] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_cond <= VAR_eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_cond;
     eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_iftrue;
     eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_return_output := eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_return_output;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l93_c34_c5b4] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l93_c34_c5b4_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l87_c8_3363] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_3363_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l95_c17_7d4b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l95_c17_7d4b_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d[uxn_c_l90_c33_f13c] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l90_c33_f13c_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output.ram_addr;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d[uxn_c_l91_c31_22c7] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l91_c31_22c7_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d[uxn_c_l88_c33_9447] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l88_c33_9447_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output.is_ram_read;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d[uxn_c_l87_c43_0545] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l87_c43_0545_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output.pc;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l92_c35_2c21] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l92_c35_2c21_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output.is_vram_write;

     -- CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d[uxn_c_l94_c32_df09] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l94_c32_df09_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_3ad7_return_output.vram_value;

     -- Submodule level 6
     VAR_MUX_uxn_c_l87_c8_aeb9_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l87_c43_0545_return_output;
     VAR_is_ins_done_MUX_uxn_c_l80_c7_5e9d_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l95_c17_7d4b_return_output;
     VAR_MUX_uxn_c_l87_c8_aeb9_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_3363_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l80_c7_5e9d_return_output;
     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70[uxn_c_l80_c7_5e9d] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l80_c7_5e9d_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l88_c33_9447_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_8afa_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l90_c33_f13c_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l91_c31_22c7_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l92_c35_2c21_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l93_c34_c5b4_return_output,
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l94_c32_df09_return_output);

     -- is_ins_done_MUX[uxn_c_l80_c7_5e9d] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l80_c7_5e9d_cond <= VAR_is_ins_done_MUX_uxn_c_l80_c7_5e9d_cond;
     is_ins_done_MUX_uxn_c_l80_c7_5e9d_iftrue <= VAR_is_ins_done_MUX_uxn_c_l80_c7_5e9d_iftrue;
     is_ins_done_MUX_uxn_c_l80_c7_5e9d_iffalse <= VAR_is_ins_done_MUX_uxn_c_l80_c7_5e9d_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l80_c7_5e9d_return_output := is_ins_done_MUX_uxn_c_l80_c7_5e9d_return_output;

     -- eval_opcode_result_MUX[uxn_c_l74_c7_0dfc] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_cond <= VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_cond;
     eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_iftrue;
     eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_return_output := eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_return_output;

     -- MUX[uxn_c_l87_c8_aeb9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l87_c8_aeb9_cond <= VAR_MUX_uxn_c_l87_c8_aeb9_cond;
     MUX_uxn_c_l87_c8_aeb9_iftrue <= VAR_MUX_uxn_c_l87_c8_aeb9_iftrue;
     MUX_uxn_c_l87_c8_aeb9_iffalse <= VAR_MUX_uxn_c_l87_c8_aeb9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l87_c8_aeb9_return_output := MUX_uxn_c_l87_c8_aeb9_return_output;

     -- Submodule level 7
     VAR_pc_uxn_c_l87_c3_24ad := VAR_MUX_uxn_c_l87_c8_aeb9_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_5e9d_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l80_c7_5e9d_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_12f9_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l74_c7_0dfc_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c7_0dfc_iffalse := VAR_is_ins_done_MUX_uxn_c_l80_c7_5e9d_return_output;
     VAR_pc_MUX_uxn_c_l80_c7_5e9d_iffalse := VAR_pc_uxn_c_l87_c3_24ad;
     VAR_printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg1 := resize(VAR_pc_uxn_c_l87_c3_24ad, 32);
     -- printf_uxn_c_l96_c3_82be[uxn_c_l96_c3_82be] LATENCY=0
     -- Clock enable
     printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_CLOCK_ENABLE <= VAR_printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg0 <= VAR_printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg0;
     printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg1 <= VAR_printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg1;
     printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg2 <= VAR_printf_uxn_c_l96_c3_82be_uxn_c_l96_c3_82be_arg2;
     -- Outputs

     -- eval_opcode_result_MUX[uxn_c_l68_c2_12f9] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l68_c2_12f9_cond <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_12f9_cond;
     eval_opcode_result_MUX_uxn_c_l68_c2_12f9_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_12f9_iftrue;
     eval_opcode_result_MUX_uxn_c_l68_c2_12f9_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_12f9_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_12f9_return_output := eval_opcode_result_MUX_uxn_c_l68_c2_12f9_return_output;

     -- cpu_step_result_MUX[uxn_c_l80_c7_5e9d] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l80_c7_5e9d_cond <= VAR_cpu_step_result_MUX_uxn_c_l80_c7_5e9d_cond;
     cpu_step_result_MUX_uxn_c_l80_c7_5e9d_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l80_c7_5e9d_iftrue;
     cpu_step_result_MUX_uxn_c_l80_c7_5e9d_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l80_c7_5e9d_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_5e9d_return_output := cpu_step_result_MUX_uxn_c_l80_c7_5e9d_return_output;

     -- is_ins_done_MUX[uxn_c_l74_c7_0dfc] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l74_c7_0dfc_cond <= VAR_is_ins_done_MUX_uxn_c_l74_c7_0dfc_cond;
     is_ins_done_MUX_uxn_c_l74_c7_0dfc_iftrue <= VAR_is_ins_done_MUX_uxn_c_l74_c7_0dfc_iftrue;
     is_ins_done_MUX_uxn_c_l74_c7_0dfc_iffalse <= VAR_is_ins_done_MUX_uxn_c_l74_c7_0dfc_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l74_c7_0dfc_return_output := is_ins_done_MUX_uxn_c_l74_c7_0dfc_return_output;

     -- pc_MUX[uxn_c_l80_c7_5e9d] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l80_c7_5e9d_cond <= VAR_pc_MUX_uxn_c_l80_c7_5e9d_cond;
     pc_MUX_uxn_c_l80_c7_5e9d_iftrue <= VAR_pc_MUX_uxn_c_l80_c7_5e9d_iftrue;
     pc_MUX_uxn_c_l80_c7_5e9d_iffalse <= VAR_pc_MUX_uxn_c_l80_c7_5e9d_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l80_c7_5e9d_return_output := pc_MUX_uxn_c_l80_c7_5e9d_return_output;

     -- Submodule level 8
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_0dfc_iffalse := VAR_cpu_step_result_MUX_uxn_c_l80_c7_5e9d_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l68_c2_12f9_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_12f9_iffalse := VAR_is_ins_done_MUX_uxn_c_l74_c7_0dfc_return_output;
     VAR_pc_MUX_uxn_c_l74_c7_0dfc_iffalse := VAR_pc_MUX_uxn_c_l80_c7_5e9d_return_output;
     -- pc_MUX[uxn_c_l74_c7_0dfc] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l74_c7_0dfc_cond <= VAR_pc_MUX_uxn_c_l74_c7_0dfc_cond;
     pc_MUX_uxn_c_l74_c7_0dfc_iftrue <= VAR_pc_MUX_uxn_c_l74_c7_0dfc_iftrue;
     pc_MUX_uxn_c_l74_c7_0dfc_iffalse <= VAR_pc_MUX_uxn_c_l74_c7_0dfc_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l74_c7_0dfc_return_output := pc_MUX_uxn_c_l74_c7_0dfc_return_output;

     -- is_ins_done_MUX[uxn_c_l68_c2_12f9] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l68_c2_12f9_cond <= VAR_is_ins_done_MUX_uxn_c_l68_c2_12f9_cond;
     is_ins_done_MUX_uxn_c_l68_c2_12f9_iftrue <= VAR_is_ins_done_MUX_uxn_c_l68_c2_12f9_iftrue;
     is_ins_done_MUX_uxn_c_l68_c2_12f9_iffalse <= VAR_is_ins_done_MUX_uxn_c_l68_c2_12f9_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l68_c2_12f9_return_output := is_ins_done_MUX_uxn_c_l68_c2_12f9_return_output;

     -- cpu_step_result_MUX[uxn_c_l74_c7_0dfc] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l74_c7_0dfc_cond <= VAR_cpu_step_result_MUX_uxn_c_l74_c7_0dfc_cond;
     cpu_step_result_MUX_uxn_c_l74_c7_0dfc_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l74_c7_0dfc_iftrue;
     cpu_step_result_MUX_uxn_c_l74_c7_0dfc_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l74_c7_0dfc_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_0dfc_return_output := cpu_step_result_MUX_uxn_c_l74_c7_0dfc_return_output;

     -- Submodule level 9
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_12f9_iffalse := VAR_cpu_step_result_MUX_uxn_c_l74_c7_0dfc_return_output;
     VAR_BIN_OP_EQ_uxn_c_l99_c6_6189_left := VAR_is_ins_done_MUX_uxn_c_l68_c2_12f9_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l68_c2_12f9_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_12f9_iffalse := VAR_pc_MUX_uxn_c_l74_c7_0dfc_return_output;
     -- cpu_step_result_MUX[uxn_c_l68_c2_12f9] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l68_c2_12f9_cond <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_12f9_cond;
     cpu_step_result_MUX_uxn_c_l68_c2_12f9_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_12f9_iftrue;
     cpu_step_result_MUX_uxn_c_l68_c2_12f9_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_12f9_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_12f9_return_output := cpu_step_result_MUX_uxn_c_l68_c2_12f9_return_output;

     -- pc_MUX[uxn_c_l68_c2_12f9] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l68_c2_12f9_cond <= VAR_pc_MUX_uxn_c_l68_c2_12f9_cond;
     pc_MUX_uxn_c_l68_c2_12f9_iftrue <= VAR_pc_MUX_uxn_c_l68_c2_12f9_iftrue;
     pc_MUX_uxn_c_l68_c2_12f9_iffalse <= VAR_pc_MUX_uxn_c_l68_c2_12f9_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l68_c2_12f9_return_output := pc_MUX_uxn_c_l68_c2_12f9_return_output;

     -- BIN_OP_EQ[uxn_c_l99_c6_6189] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l99_c6_6189_left <= VAR_BIN_OP_EQ_uxn_c_l99_c6_6189_left;
     BIN_OP_EQ_uxn_c_l99_c6_6189_right <= VAR_BIN_OP_EQ_uxn_c_l99_c6_6189_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l99_c6_6189_return_output := BIN_OP_EQ_uxn_c_l99_c6_6189_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_6a47_cond := VAR_BIN_OP_EQ_uxn_c_l99_c6_6189_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l68_c2_12f9_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l68_c2_12f9_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l68_c2_12f9_return_output;
     -- step_cpu_phase_MUX[uxn_c_l99_c2_6a47] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l99_c2_6a47_cond <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_6a47_cond;
     step_cpu_phase_MUX_uxn_c_l99_c2_6a47_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_6a47_iftrue;
     step_cpu_phase_MUX_uxn_c_l99_c2_6a47_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_6a47_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_6a47_return_output := step_cpu_phase_MUX_uxn_c_l99_c2_6a47_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l99_c2_6a47_return_output;
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
