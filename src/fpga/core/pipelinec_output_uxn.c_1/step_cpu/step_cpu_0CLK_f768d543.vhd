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
entity step_cpu_0CLK_f768d543 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ram_read_value : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_f768d543;
architecture arch of step_cpu_0CLK_f768d543 is
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
-- BIN_OP_EQ[uxn_c_l68_c6_7c86]
signal BIN_OP_EQ_uxn_c_l68_c6_7c86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_7c86_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_7c86_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_2922]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l75_c7_989e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l68_c2_ea9d]
signal pc_MUX_uxn_c_l68_c2_ea9d_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l68_c2_ea9d_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_ea9d_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_ea9d_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l68_c2_ea9d]
signal ins_MUX_uxn_c_l68_c2_ea9d_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l68_c2_ea9d_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_ea9d_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_ea9d_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l68_c2_ea9d]
signal is_ins_done_MUX_uxn_c_l68_c2_ea9d_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_ea9d_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_ea9d_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_ea9d_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l68_c2_ea9d]
signal cpu_step_result_MUX_uxn_c_l68_c2_ea9d_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l68_c2_ea9d_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_ea9d_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_ea9d_return_output : cpu_step_result_t;

-- eval_opcode_result_MUX[uxn_c_l68_c2_ea9d]
signal eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_return_output : eval_opcode_result_t;

-- printf_uxn_c_l73_c3_4327[uxn_c_l73_c3_4327]
signal printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c11_4bb9]
signal BIN_OP_EQ_uxn_c_l75_c11_4bb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c11_4bb9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c11_4bb9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l75_c1_4520]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l83_c7_61b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l75_c7_989e]
signal pc_MUX_uxn_c_l75_c7_989e_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l75_c7_989e_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c7_989e_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c7_989e_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l75_c7_989e]
signal ins_MUX_uxn_c_l75_c7_989e_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l75_c7_989e_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c7_989e_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c7_989e_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l75_c7_989e]
signal is_ins_done_MUX_uxn_c_l75_c7_989e_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c7_989e_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c7_989e_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c7_989e_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l75_c7_989e]
signal cpu_step_result_MUX_uxn_c_l75_c7_989e_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l75_c7_989e_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c7_989e_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c7_989e_return_output : cpu_step_result_t;

-- eval_opcode_result_MUX[uxn_c_l75_c7_989e]
signal eval_opcode_result_MUX_uxn_c_l75_c7_989e_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l75_c7_989e_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l75_c7_989e_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l75_c7_989e_return_output : eval_opcode_result_t;

-- printf_uxn_c_l81_c3_08fd[uxn_c_l81_c3_08fd]
signal printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l83_c11_3134]
signal BIN_OP_EQ_uxn_c_l83_c11_3134_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l83_c11_3134_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l83_c11_3134_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l83_c1_7d97]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l88_c1_1ac5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l83_c7_61b6]
signal pc_MUX_uxn_c_l83_c7_61b6_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l83_c7_61b6_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l83_c7_61b6_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l83_c7_61b6_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l83_c7_61b6]
signal ins_MUX_uxn_c_l83_c7_61b6_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l83_c7_61b6_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l83_c7_61b6_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l83_c7_61b6_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l83_c7_61b6]
signal is_ins_done_MUX_uxn_c_l83_c7_61b6_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l83_c7_61b6_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l83_c7_61b6_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l83_c7_61b6_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l83_c7_61b6]
signal cpu_step_result_MUX_uxn_c_l83_c7_61b6_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l83_c7_61b6_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l83_c7_61b6_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l83_c7_61b6_return_output : cpu_step_result_t;

-- eval_opcode_result_MUX[uxn_c_l83_c7_61b6]
signal eval_opcode_result_MUX_uxn_c_l83_c7_61b6_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l83_c7_61b6_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l83_c7_61b6_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l83_c7_61b6_return_output : eval_opcode_result_t;

-- BIN_OP_PLUS[uxn_c_l85_c3_7dce]
signal BIN_OP_PLUS_uxn_c_l85_c3_7dce_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l85_c3_7dce_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l85_c3_7dce_return_output : unsigned(16 downto 0);

-- printf_uxn_c_l86_c3_5a06[uxn_c_l86_c3_5a06]
signal printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg2 : unsigned(31 downto 0);

-- BIN_OP_MINUS[uxn_c_l89_c43_9ecb]
signal BIN_OP_MINUS_uxn_c_l89_c43_9ecb_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l89_c43_9ecb_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l89_c43_9ecb_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l89_c24_241f]
signal eval_opcode_phased_uxn_c_l89_c24_241f_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_241f_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_241f_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_241f_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_241f_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_241f_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l90_c8_724c]
signal MUX_uxn_c_l90_c8_724c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l90_c8_724c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l90_c8_724c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l90_c8_724c_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l99_c3_9487[uxn_c_l99_c3_9487]
signal printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l102_c6_acec]
signal BIN_OP_EQ_uxn_c_l102_c6_acec_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c6_acec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c6_acec_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l102_c2_af3e]
signal step_cpu_phase_MUX_uxn_c_l102_c2_af3e_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l102_c2_af3e_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l102_c2_af3e_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l102_c2_af3e_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l105_c3_6204]
signal BIN_OP_PLUS_uxn_c_l105_c3_6204_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l105_c3_6204_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l105_c3_6204_return_output : unsigned(8 downto 0);

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
-- BIN_OP_EQ_uxn_c_l68_c6_7c86
BIN_OP_EQ_uxn_c_l68_c6_7c86 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l68_c6_7c86_left,
BIN_OP_EQ_uxn_c_l68_c6_7c86_right,
BIN_OP_EQ_uxn_c_l68_c6_7c86_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_return_output);

-- pc_MUX_uxn_c_l68_c2_ea9d
pc_MUX_uxn_c_l68_c2_ea9d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l68_c2_ea9d_cond,
pc_MUX_uxn_c_l68_c2_ea9d_iftrue,
pc_MUX_uxn_c_l68_c2_ea9d_iffalse,
pc_MUX_uxn_c_l68_c2_ea9d_return_output);

-- ins_MUX_uxn_c_l68_c2_ea9d
ins_MUX_uxn_c_l68_c2_ea9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l68_c2_ea9d_cond,
ins_MUX_uxn_c_l68_c2_ea9d_iftrue,
ins_MUX_uxn_c_l68_c2_ea9d_iffalse,
ins_MUX_uxn_c_l68_c2_ea9d_return_output);

-- is_ins_done_MUX_uxn_c_l68_c2_ea9d
is_ins_done_MUX_uxn_c_l68_c2_ea9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l68_c2_ea9d_cond,
is_ins_done_MUX_uxn_c_l68_c2_ea9d_iftrue,
is_ins_done_MUX_uxn_c_l68_c2_ea9d_iffalse,
is_ins_done_MUX_uxn_c_l68_c2_ea9d_return_output);

-- cpu_step_result_MUX_uxn_c_l68_c2_ea9d
cpu_step_result_MUX_uxn_c_l68_c2_ea9d : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l68_c2_ea9d_cond,
cpu_step_result_MUX_uxn_c_l68_c2_ea9d_iftrue,
cpu_step_result_MUX_uxn_c_l68_c2_ea9d_iffalse,
cpu_step_result_MUX_uxn_c_l68_c2_ea9d_return_output);

-- eval_opcode_result_MUX_uxn_c_l68_c2_ea9d
eval_opcode_result_MUX_uxn_c_l68_c2_ea9d : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_cond,
eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_iftrue,
eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_iffalse,
eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_return_output);

-- printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327
printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327 : entity work.printf_uxn_c_l73_c3_4327_0CLK_de264c78 port map (
printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_CLOCK_ENABLE,
printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_arg0,
printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_arg1);

-- BIN_OP_EQ_uxn_c_l75_c11_4bb9
BIN_OP_EQ_uxn_c_l75_c11_4bb9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c11_4bb9_left,
BIN_OP_EQ_uxn_c_l75_c11_4bb9_right,
BIN_OP_EQ_uxn_c_l75_c11_4bb9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_return_output);

-- pc_MUX_uxn_c_l75_c7_989e
pc_MUX_uxn_c_l75_c7_989e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l75_c7_989e_cond,
pc_MUX_uxn_c_l75_c7_989e_iftrue,
pc_MUX_uxn_c_l75_c7_989e_iffalse,
pc_MUX_uxn_c_l75_c7_989e_return_output);

-- ins_MUX_uxn_c_l75_c7_989e
ins_MUX_uxn_c_l75_c7_989e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l75_c7_989e_cond,
ins_MUX_uxn_c_l75_c7_989e_iftrue,
ins_MUX_uxn_c_l75_c7_989e_iffalse,
ins_MUX_uxn_c_l75_c7_989e_return_output);

-- is_ins_done_MUX_uxn_c_l75_c7_989e
is_ins_done_MUX_uxn_c_l75_c7_989e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l75_c7_989e_cond,
is_ins_done_MUX_uxn_c_l75_c7_989e_iftrue,
is_ins_done_MUX_uxn_c_l75_c7_989e_iffalse,
is_ins_done_MUX_uxn_c_l75_c7_989e_return_output);

-- cpu_step_result_MUX_uxn_c_l75_c7_989e
cpu_step_result_MUX_uxn_c_l75_c7_989e : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l75_c7_989e_cond,
cpu_step_result_MUX_uxn_c_l75_c7_989e_iftrue,
cpu_step_result_MUX_uxn_c_l75_c7_989e_iffalse,
cpu_step_result_MUX_uxn_c_l75_c7_989e_return_output);

-- eval_opcode_result_MUX_uxn_c_l75_c7_989e
eval_opcode_result_MUX_uxn_c_l75_c7_989e : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l75_c7_989e_cond,
eval_opcode_result_MUX_uxn_c_l75_c7_989e_iftrue,
eval_opcode_result_MUX_uxn_c_l75_c7_989e_iffalse,
eval_opcode_result_MUX_uxn_c_l75_c7_989e_return_output);

-- printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd
printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd : entity work.printf_uxn_c_l81_c3_08fd_0CLK_de264c78 port map (
printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_CLOCK_ENABLE,
printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg0,
printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg1,
printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg2);

-- BIN_OP_EQ_uxn_c_l83_c11_3134
BIN_OP_EQ_uxn_c_l83_c11_3134 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l83_c11_3134_left,
BIN_OP_EQ_uxn_c_l83_c11_3134_right,
BIN_OP_EQ_uxn_c_l83_c11_3134_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_return_output);

-- pc_MUX_uxn_c_l83_c7_61b6
pc_MUX_uxn_c_l83_c7_61b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l83_c7_61b6_cond,
pc_MUX_uxn_c_l83_c7_61b6_iftrue,
pc_MUX_uxn_c_l83_c7_61b6_iffalse,
pc_MUX_uxn_c_l83_c7_61b6_return_output);

-- ins_MUX_uxn_c_l83_c7_61b6
ins_MUX_uxn_c_l83_c7_61b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l83_c7_61b6_cond,
ins_MUX_uxn_c_l83_c7_61b6_iftrue,
ins_MUX_uxn_c_l83_c7_61b6_iffalse,
ins_MUX_uxn_c_l83_c7_61b6_return_output);

-- is_ins_done_MUX_uxn_c_l83_c7_61b6
is_ins_done_MUX_uxn_c_l83_c7_61b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l83_c7_61b6_cond,
is_ins_done_MUX_uxn_c_l83_c7_61b6_iftrue,
is_ins_done_MUX_uxn_c_l83_c7_61b6_iffalse,
is_ins_done_MUX_uxn_c_l83_c7_61b6_return_output);

-- cpu_step_result_MUX_uxn_c_l83_c7_61b6
cpu_step_result_MUX_uxn_c_l83_c7_61b6 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l83_c7_61b6_cond,
cpu_step_result_MUX_uxn_c_l83_c7_61b6_iftrue,
cpu_step_result_MUX_uxn_c_l83_c7_61b6_iffalse,
cpu_step_result_MUX_uxn_c_l83_c7_61b6_return_output);

-- eval_opcode_result_MUX_uxn_c_l83_c7_61b6
eval_opcode_result_MUX_uxn_c_l83_c7_61b6 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l83_c7_61b6_cond,
eval_opcode_result_MUX_uxn_c_l83_c7_61b6_iftrue,
eval_opcode_result_MUX_uxn_c_l83_c7_61b6_iffalse,
eval_opcode_result_MUX_uxn_c_l83_c7_61b6_return_output);

-- BIN_OP_PLUS_uxn_c_l85_c3_7dce
BIN_OP_PLUS_uxn_c_l85_c3_7dce : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l85_c3_7dce_left,
BIN_OP_PLUS_uxn_c_l85_c3_7dce_right,
BIN_OP_PLUS_uxn_c_l85_c3_7dce_return_output);

-- printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06
printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06 : entity work.printf_uxn_c_l86_c3_5a06_0CLK_de264c78 port map (
printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_CLOCK_ENABLE,
printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg0,
printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg1,
printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg2);

-- BIN_OP_MINUS_uxn_c_l89_c43_9ecb
BIN_OP_MINUS_uxn_c_l89_c43_9ecb : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l89_c43_9ecb_left,
BIN_OP_MINUS_uxn_c_l89_c43_9ecb_right,
BIN_OP_MINUS_uxn_c_l89_c43_9ecb_return_output);

-- eval_opcode_phased_uxn_c_l89_c24_241f
eval_opcode_phased_uxn_c_l89_c24_241f : entity work.eval_opcode_phased_0CLK_487f302d port map (
clk,
eval_opcode_phased_uxn_c_l89_c24_241f_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l89_c24_241f_phase,
eval_opcode_phased_uxn_c_l89_c24_241f_ins,
eval_opcode_phased_uxn_c_l89_c24_241f_pc,
eval_opcode_phased_uxn_c_l89_c24_241f_previous_ram_read,
eval_opcode_phased_uxn_c_l89_c24_241f_return_output);

-- MUX_uxn_c_l90_c8_724c
MUX_uxn_c_l90_c8_724c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l90_c8_724c_cond,
MUX_uxn_c_l90_c8_724c_iftrue,
MUX_uxn_c_l90_c8_724c_iffalse,
MUX_uxn_c_l90_c8_724c_return_output);

-- printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487
printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487 : entity work.printf_uxn_c_l99_c3_9487_0CLK_de264c78 port map (
printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_CLOCK_ENABLE,
printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg0,
printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg1,
printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg2);

-- BIN_OP_EQ_uxn_c_l102_c6_acec
BIN_OP_EQ_uxn_c_l102_c6_acec : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l102_c6_acec_left,
BIN_OP_EQ_uxn_c_l102_c6_acec_right,
BIN_OP_EQ_uxn_c_l102_c6_acec_return_output);

-- step_cpu_phase_MUX_uxn_c_l102_c2_af3e
step_cpu_phase_MUX_uxn_c_l102_c2_af3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l102_c2_af3e_cond,
step_cpu_phase_MUX_uxn_c_l102_c2_af3e_iftrue,
step_cpu_phase_MUX_uxn_c_l102_c2_af3e_iffalse,
step_cpu_phase_MUX_uxn_c_l102_c2_af3e_return_output);

-- BIN_OP_PLUS_uxn_c_l105_c3_6204
BIN_OP_PLUS_uxn_c_l105_c3_6204 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l105_c3_6204_left,
BIN_OP_PLUS_uxn_c_l105_c3_6204_right,
BIN_OP_PLUS_uxn_c_l105_c3_6204_return_output);



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
 BIN_OP_EQ_uxn_c_l68_c6_7c86_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_return_output,
 pc_MUX_uxn_c_l68_c2_ea9d_return_output,
 ins_MUX_uxn_c_l68_c2_ea9d_return_output,
 is_ins_done_MUX_uxn_c_l68_c2_ea9d_return_output,
 cpu_step_result_MUX_uxn_c_l68_c2_ea9d_return_output,
 eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_return_output,
 BIN_OP_EQ_uxn_c_l75_c11_4bb9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_return_output,
 pc_MUX_uxn_c_l75_c7_989e_return_output,
 ins_MUX_uxn_c_l75_c7_989e_return_output,
 is_ins_done_MUX_uxn_c_l75_c7_989e_return_output,
 cpu_step_result_MUX_uxn_c_l75_c7_989e_return_output,
 eval_opcode_result_MUX_uxn_c_l75_c7_989e_return_output,
 BIN_OP_EQ_uxn_c_l83_c11_3134_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_return_output,
 pc_MUX_uxn_c_l83_c7_61b6_return_output,
 ins_MUX_uxn_c_l83_c7_61b6_return_output,
 is_ins_done_MUX_uxn_c_l83_c7_61b6_return_output,
 cpu_step_result_MUX_uxn_c_l83_c7_61b6_return_output,
 eval_opcode_result_MUX_uxn_c_l83_c7_61b6_return_output,
 BIN_OP_PLUS_uxn_c_l85_c3_7dce_return_output,
 BIN_OP_MINUS_uxn_c_l89_c43_9ecb_return_output,
 eval_opcode_phased_uxn_c_l89_c24_241f_return_output,
 MUX_uxn_c_l90_c8_724c_return_output,
 BIN_OP_EQ_uxn_c_l102_c6_acec_return_output,
 step_cpu_phase_MUX_uxn_c_l102_c2_af3e_return_output,
 BIN_OP_PLUS_uxn_c_l105_c3_6204_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_ram_read_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_7c86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_7c86_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_7c86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_ea9d_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_ea9d_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_989e_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_ea9d_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_ea9d_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_ea9d_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_ea9d_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_989e_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_ea9d_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_ea9d_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_ea9d_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_ea9d_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_989e_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_ea9d_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_ea9d_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_ea9d_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_ea9d_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_ea9d_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_989e_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_ea9d_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_ea9d_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_989e_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c11_4bb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c11_4bb9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c11_4bb9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_989e_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_989e_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_61b6_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_989e_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_989e_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_989e_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_61b6_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_989e_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_989e_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_989e_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_61b6_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_989e_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_989e_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l75_c7_989e_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_989e_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_61b6_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_989e_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_989e_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_989e_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_61b6_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_989e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l83_c11_3134_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l83_c11_3134_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l83_c11_3134_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_61b6_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l85_c3_bf2a : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_61b6_iffalse : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l90_c3_3942 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_61b6_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_61b6_iftrue : unsigned(7 downto 0);
 variable VAR_ins_uxn_c_l84_c3_36db : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_61b6_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_61b6_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_61b6_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_61b6_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_61b6_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_61b6_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_61b6_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l83_c7_61b6_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_61b6_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_61b6_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_61b6_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_61b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l85_c3_7dce_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l85_c3_7dce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l85_c3_7dce_return_output : unsigned(16 downto 0);
 variable VAR_printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg2 : unsigned(31 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_241f_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_241f_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_241f_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_241f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l89_c43_9ecb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l89_c43_9ecb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l89_c43_9ecb_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_241f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_241f_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l90_c8_724c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l90_c8_724c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l90_c8_724c_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l90_c8_eec1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l90_c43_6ce0_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l90_c8_724c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l91_c33_8b84_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l92_c34_7b01_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l93_c33_e16a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l94_c31_446d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l95_c35_46f3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l96_c34_c388_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l97_c32_d76e_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l98_c17_9f2d_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c6_acec_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c6_acec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c6_acec_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_af3e_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l103_c3_fa83 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_af3e_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l105_c3_28e4 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_af3e_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_af3e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l105_c3_6204_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l105_c3_6204_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l105_c3_6204_return_output : unsigned(8 downto 0);
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l83_c11_3134_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_c_l85_c3_7dce_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_iffalse := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l68_c2_ea9d_iftrue := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l75_c7_989e_iftrue := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l103_c3_fa83 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_af3e_iftrue := VAR_step_cpu_phase_uxn_c_l103_c3_fa83;
     VAR_BIN_OP_MINUS_uxn_c_l89_c43_9ecb_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_c_l105_c3_6204_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l102_c6_acec_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l75_c11_4bb9_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l68_c6_7c86_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ram_read_value := ram_read_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_iftrue := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_61b6_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_989e_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_61b6_iftrue := eval_opcode_result;
     VAR_eval_opcode_phased_uxn_c_l89_c24_241f_ins := ins;
     VAR_ins_MUX_uxn_c_l68_c2_ea9d_iftrue := ins;
     VAR_ins_MUX_uxn_c_l75_c7_989e_iftrue := ins;
     VAR_ins_MUX_uxn_c_l83_c7_61b6_iffalse := ins;
     VAR_printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg2 := resize(ins, 32);
     VAR_printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg2 := resize(ins, 32);
     VAR_is_ins_done_MUX_uxn_c_l83_c7_61b6_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l85_c3_7dce_left := pc;
     VAR_MUX_uxn_c_l90_c8_724c_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l89_c24_241f_pc := pc;
     VAR_pc_MUX_uxn_c_l68_c2_ea9d_iftrue := pc;
     VAR_pc_MUX_uxn_c_l75_c7_989e_iftrue := pc;
     VAR_printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_arg1 := resize(pc, 32);
     VAR_printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg1 := resize(pc, 32);
     VAR_eval_opcode_phased_uxn_c_l89_c24_241f_previous_ram_read := VAR_ram_read_value;
     VAR_ins_uxn_c_l84_c3_36db := VAR_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l68_c6_7c86_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l75_c11_4bb9_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l83_c11_3134_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l89_c43_9ecb_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l105_c3_6204_left := step_cpu_phase;
     VAR_printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg0 := resize(step_cpu_phase, 32);
     VAR_ins_MUX_uxn_c_l83_c7_61b6_iftrue := VAR_ins_uxn_c_l84_c3_36db;
     VAR_printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg2 := resize(VAR_ins_uxn_c_l84_c3_36db, 32);
     -- BIN_OP_MINUS[uxn_c_l89_c43_9ecb] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l89_c43_9ecb_left <= VAR_BIN_OP_MINUS_uxn_c_l89_c43_9ecb_left;
     BIN_OP_MINUS_uxn_c_l89_c43_9ecb_right <= VAR_BIN_OP_MINUS_uxn_c_l89_c43_9ecb_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l89_c43_9ecb_return_output := BIN_OP_MINUS_uxn_c_l89_c43_9ecb_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l75_c7_989e] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l75_c7_989e_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l68_c2_ea9d] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_ea9d_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- BIN_OP_EQ[uxn_c_l68_c6_7c86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l68_c6_7c86_left <= VAR_BIN_OP_EQ_uxn_c_l68_c6_7c86_left;
     BIN_OP_EQ_uxn_c_l68_c6_7c86_right <= VAR_BIN_OP_EQ_uxn_c_l68_c6_7c86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l68_c6_7c86_return_output := BIN_OP_EQ_uxn_c_l68_c6_7c86_return_output;

     -- BIN_OP_PLUS[uxn_c_l85_c3_7dce] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l85_c3_7dce_left <= VAR_BIN_OP_PLUS_uxn_c_l85_c3_7dce_left;
     BIN_OP_PLUS_uxn_c_l85_c3_7dce_right <= VAR_BIN_OP_PLUS_uxn_c_l85_c3_7dce_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l85_c3_7dce_return_output := BIN_OP_PLUS_uxn_c_l85_c3_7dce_return_output;

     -- BIN_OP_PLUS[uxn_c_l105_c3_6204] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l105_c3_6204_left <= VAR_BIN_OP_PLUS_uxn_c_l105_c3_6204_left;
     BIN_OP_PLUS_uxn_c_l105_c3_6204_right <= VAR_BIN_OP_PLUS_uxn_c_l105_c3_6204_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l105_c3_6204_return_output := BIN_OP_PLUS_uxn_c_l105_c3_6204_return_output;

     -- BIN_OP_EQ[uxn_c_l83_c11_3134] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l83_c11_3134_left <= VAR_BIN_OP_EQ_uxn_c_l83_c11_3134_left;
     BIN_OP_EQ_uxn_c_l83_c11_3134_right <= VAR_BIN_OP_EQ_uxn_c_l83_c11_3134_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l83_c11_3134_return_output := BIN_OP_EQ_uxn_c_l83_c11_3134_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c11_4bb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c11_4bb9_left <= VAR_BIN_OP_EQ_uxn_c_l75_c11_4bb9_left;
     BIN_OP_EQ_uxn_c_l75_c11_4bb9_right <= VAR_BIN_OP_EQ_uxn_c_l75_c11_4bb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c11_4bb9_return_output := BIN_OP_EQ_uxn_c_l75_c11_4bb9_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_7c86_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_7c86_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_ea9d_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_7c86_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_7c86_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_ea9d_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_7c86_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_ea9d_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_7c86_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_ea9d_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_7c86_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_4bb9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_4bb9_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_989e_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_4bb9_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_989e_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_4bb9_return_output;
     VAR_ins_MUX_uxn_c_l75_c7_989e_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_4bb9_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c7_989e_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_4bb9_return_output;
     VAR_pc_MUX_uxn_c_l75_c7_989e_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_4bb9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_3134_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_3134_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_61b6_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_3134_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_61b6_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_3134_return_output;
     VAR_ins_MUX_uxn_c_l83_c7_61b6_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_3134_return_output;
     VAR_is_ins_done_MUX_uxn_c_l83_c7_61b6_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_3134_return_output;
     VAR_pc_MUX_uxn_c_l83_c7_61b6_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_3134_return_output;
     VAR_eval_opcode_phased_uxn_c_l89_c24_241f_phase := VAR_BIN_OP_MINUS_uxn_c_l89_c43_9ecb_return_output;
     VAR_step_cpu_phase_uxn_c_l105_c3_28e4 := resize(VAR_BIN_OP_PLUS_uxn_c_l105_c3_6204_return_output, 8);
     VAR_pc_uxn_c_l85_c3_bf2a := resize(VAR_BIN_OP_PLUS_uxn_c_l85_c3_7dce_return_output, 16);
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_ea9d_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_ea9d_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_989e_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l75_c7_989e_return_output;
     VAR_pc_MUX_uxn_c_l83_c7_61b6_iftrue := VAR_pc_uxn_c_l85_c3_bf2a;
     VAR_printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg1 := resize(VAR_pc_uxn_c_l85_c3_bf2a, 32);
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_af3e_iffalse := VAR_step_cpu_phase_uxn_c_l105_c3_28e4;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l75_c7_989e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_2922] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_return_output;

     -- ins_MUX[uxn_c_l83_c7_61b6] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l83_c7_61b6_cond <= VAR_ins_MUX_uxn_c_l83_c7_61b6_cond;
     ins_MUX_uxn_c_l83_c7_61b6_iftrue <= VAR_ins_MUX_uxn_c_l83_c7_61b6_iftrue;
     ins_MUX_uxn_c_l83_c7_61b6_iffalse <= VAR_ins_MUX_uxn_c_l83_c7_61b6_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l83_c7_61b6_return_output := ins_MUX_uxn_c_l83_c7_61b6_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_989e_return_output;
     VAR_printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_2922_return_output;
     VAR_ins_MUX_uxn_c_l75_c7_989e_iffalse := VAR_ins_MUX_uxn_c_l83_c7_61b6_return_output;
     -- printf_uxn_c_l73_c3_4327[uxn_c_l73_c3_4327] LATENCY=0
     -- Clock enable
     printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_CLOCK_ENABLE <= VAR_printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_arg0 <= VAR_printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_arg0;
     printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_arg1 <= VAR_printf_uxn_c_l73_c3_4327_uxn_c_l73_c3_4327_arg1;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l75_c1_4520] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_return_output;

     -- ins_MUX[uxn_c_l75_c7_989e] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l75_c7_989e_cond <= VAR_ins_MUX_uxn_c_l75_c7_989e_cond;
     ins_MUX_uxn_c_l75_c7_989e_iftrue <= VAR_ins_MUX_uxn_c_l75_c7_989e_iftrue;
     ins_MUX_uxn_c_l75_c7_989e_iffalse <= VAR_ins_MUX_uxn_c_l75_c7_989e_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l75_c7_989e_return_output := ins_MUX_uxn_c_l75_c7_989e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l83_c7_61b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_61b6_return_output;
     VAR_printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_4520_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_ea9d_iffalse := VAR_ins_MUX_uxn_c_l75_c7_989e_return_output;
     -- ins_MUX[uxn_c_l68_c2_ea9d] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l68_c2_ea9d_cond <= VAR_ins_MUX_uxn_c_l68_c2_ea9d_cond;
     ins_MUX_uxn_c_l68_c2_ea9d_iftrue <= VAR_ins_MUX_uxn_c_l68_c2_ea9d_iftrue;
     ins_MUX_uxn_c_l68_c2_ea9d_iffalse <= VAR_ins_MUX_uxn_c_l68_c2_ea9d_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l68_c2_ea9d_return_output := ins_MUX_uxn_c_l68_c2_ea9d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l83_c1_7d97] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l88_c1_1ac5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_return_output;

     -- printf_uxn_c_l81_c3_08fd[uxn_c_l81_c3_08fd] LATENCY=0
     -- Clock enable
     printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_CLOCK_ENABLE <= VAR_printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg0 <= VAR_printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg0;
     printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg1 <= VAR_printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg1;
     printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg2 <= VAR_printf_uxn_c_l81_c3_08fd_uxn_c_l81_c3_08fd_arg2;
     -- Outputs

     -- Submodule level 4
     VAR_eval_opcode_phased_uxn_c_l89_c24_241f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_return_output;
     VAR_printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_1ac5_return_output;
     VAR_printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_7d97_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l68_c2_ea9d_return_output;
     -- eval_opcode_phased[uxn_c_l89_c24_241f] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l89_c24_241f_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l89_c24_241f_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l89_c24_241f_phase <= VAR_eval_opcode_phased_uxn_c_l89_c24_241f_phase;
     eval_opcode_phased_uxn_c_l89_c24_241f_ins <= VAR_eval_opcode_phased_uxn_c_l89_c24_241f_ins;
     eval_opcode_phased_uxn_c_l89_c24_241f_pc <= VAR_eval_opcode_phased_uxn_c_l89_c24_241f_pc;
     eval_opcode_phased_uxn_c_l89_c24_241f_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l89_c24_241f_previous_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l89_c24_241f_return_output := eval_opcode_phased_uxn_c_l89_c24_241f_return_output;

     -- printf_uxn_c_l86_c3_5a06[uxn_c_l86_c3_5a06] LATENCY=0
     -- Clock enable
     printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_CLOCK_ENABLE <= VAR_printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg0 <= VAR_printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg0;
     printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg1 <= VAR_printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg1;
     printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg2 <= VAR_printf_uxn_c_l86_c3_5a06_uxn_c_l86_c3_5a06_arg2;
     -- Outputs

     -- Submodule level 5
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_61b6_iffalse := VAR_eval_opcode_phased_uxn_c_l89_c24_241f_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d[uxn_c_l91_c33_8b84] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l91_c33_8b84_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_241f_return_output.is_ram_read;

     -- CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d[uxn_c_l97_c32_d76e] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l97_c32_d76e_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_241f_return_output.vram_value;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d[uxn_c_l94_c31_446d] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l94_c31_446d_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_241f_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l95_c35_46f3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l95_c35_46f3_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_241f_return_output.is_vram_write;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d[uxn_c_l93_c33_e16a] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l93_c33_e16a_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_241f_return_output.ram_addr;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d[uxn_c_l90_c43_6ce0] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l90_c43_6ce0_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_241f_return_output.pc;

     -- eval_opcode_result_MUX[uxn_c_l83_c7_61b6] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l83_c7_61b6_cond <= VAR_eval_opcode_result_MUX_uxn_c_l83_c7_61b6_cond;
     eval_opcode_result_MUX_uxn_c_l83_c7_61b6_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l83_c7_61b6_iftrue;
     eval_opcode_result_MUX_uxn_c_l83_c7_61b6_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l83_c7_61b6_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_61b6_return_output := eval_opcode_result_MUX_uxn_c_l83_c7_61b6_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l90_c8_eec1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l90_c8_eec1_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_241f_return_output.is_pc_updated;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l96_c34_c388] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l96_c34_c388_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_241f_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l92_c34_7b01] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l92_c34_7b01_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_241f_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l98_c17_9f2d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l98_c17_9f2d_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_241f_return_output.is_opc_done;

     -- Submodule level 6
     VAR_MUX_uxn_c_l90_c8_724c_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l90_c43_6ce0_return_output;
     VAR_is_ins_done_MUX_uxn_c_l83_c7_61b6_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l98_c17_9f2d_return_output;
     VAR_MUX_uxn_c_l90_c8_724c_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l90_c8_eec1_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_989e_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l83_c7_61b6_return_output;
     -- eval_opcode_result_MUX[uxn_c_l75_c7_989e] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l75_c7_989e_cond <= VAR_eval_opcode_result_MUX_uxn_c_l75_c7_989e_cond;
     eval_opcode_result_MUX_uxn_c_l75_c7_989e_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l75_c7_989e_iftrue;
     eval_opcode_result_MUX_uxn_c_l75_c7_989e_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l75_c7_989e_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_989e_return_output := eval_opcode_result_MUX_uxn_c_l75_c7_989e_return_output;

     -- is_ins_done_MUX[uxn_c_l83_c7_61b6] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l83_c7_61b6_cond <= VAR_is_ins_done_MUX_uxn_c_l83_c7_61b6_cond;
     is_ins_done_MUX_uxn_c_l83_c7_61b6_iftrue <= VAR_is_ins_done_MUX_uxn_c_l83_c7_61b6_iftrue;
     is_ins_done_MUX_uxn_c_l83_c7_61b6_iffalse <= VAR_is_ins_done_MUX_uxn_c_l83_c7_61b6_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l83_c7_61b6_return_output := is_ins_done_MUX_uxn_c_l83_c7_61b6_return_output;

     -- MUX[uxn_c_l90_c8_724c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l90_c8_724c_cond <= VAR_MUX_uxn_c_l90_c8_724c_cond;
     MUX_uxn_c_l90_c8_724c_iftrue <= VAR_MUX_uxn_c_l90_c8_724c_iftrue;
     MUX_uxn_c_l90_c8_724c_iffalse <= VAR_MUX_uxn_c_l90_c8_724c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l90_c8_724c_return_output := MUX_uxn_c_l90_c8_724c_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70[uxn_c_l83_c7_61b6] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l83_c7_61b6_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l91_c33_8b84_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l92_c34_7b01_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l93_c33_e16a_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l94_c31_446d_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l95_c35_46f3_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l96_c34_c388_return_output,
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l97_c32_d76e_return_output);

     -- Submodule level 7
     VAR_pc_uxn_c_l90_c3_3942 := VAR_MUX_uxn_c_l90_c8_724c_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_61b6_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l83_c7_61b6_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l75_c7_989e_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c7_989e_iffalse := VAR_is_ins_done_MUX_uxn_c_l83_c7_61b6_return_output;
     VAR_pc_MUX_uxn_c_l83_c7_61b6_iffalse := VAR_pc_uxn_c_l90_c3_3942;
     VAR_printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg1 := resize(VAR_pc_uxn_c_l90_c3_3942, 32);
     -- eval_opcode_result_MUX[uxn_c_l68_c2_ea9d] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_cond <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_cond;
     eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_iftrue;
     eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_return_output := eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_return_output;

     -- printf_uxn_c_l99_c3_9487[uxn_c_l99_c3_9487] LATENCY=0
     -- Clock enable
     printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_CLOCK_ENABLE <= VAR_printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg0 <= VAR_printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg0;
     printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg1 <= VAR_printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg1;
     printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg2 <= VAR_printf_uxn_c_l99_c3_9487_uxn_c_l99_c3_9487_arg2;
     -- Outputs

     -- cpu_step_result_MUX[uxn_c_l83_c7_61b6] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l83_c7_61b6_cond <= VAR_cpu_step_result_MUX_uxn_c_l83_c7_61b6_cond;
     cpu_step_result_MUX_uxn_c_l83_c7_61b6_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l83_c7_61b6_iftrue;
     cpu_step_result_MUX_uxn_c_l83_c7_61b6_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l83_c7_61b6_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_61b6_return_output := cpu_step_result_MUX_uxn_c_l83_c7_61b6_return_output;

     -- pc_MUX[uxn_c_l83_c7_61b6] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l83_c7_61b6_cond <= VAR_pc_MUX_uxn_c_l83_c7_61b6_cond;
     pc_MUX_uxn_c_l83_c7_61b6_iftrue <= VAR_pc_MUX_uxn_c_l83_c7_61b6_iftrue;
     pc_MUX_uxn_c_l83_c7_61b6_iffalse <= VAR_pc_MUX_uxn_c_l83_c7_61b6_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l83_c7_61b6_return_output := pc_MUX_uxn_c_l83_c7_61b6_return_output;

     -- is_ins_done_MUX[uxn_c_l75_c7_989e] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l75_c7_989e_cond <= VAR_is_ins_done_MUX_uxn_c_l75_c7_989e_cond;
     is_ins_done_MUX_uxn_c_l75_c7_989e_iftrue <= VAR_is_ins_done_MUX_uxn_c_l75_c7_989e_iftrue;
     is_ins_done_MUX_uxn_c_l75_c7_989e_iffalse <= VAR_is_ins_done_MUX_uxn_c_l75_c7_989e_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l75_c7_989e_return_output := is_ins_done_MUX_uxn_c_l75_c7_989e_return_output;

     -- Submodule level 8
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_989e_iffalse := VAR_cpu_step_result_MUX_uxn_c_l83_c7_61b6_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l68_c2_ea9d_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_ea9d_iffalse := VAR_is_ins_done_MUX_uxn_c_l75_c7_989e_return_output;
     VAR_pc_MUX_uxn_c_l75_c7_989e_iffalse := VAR_pc_MUX_uxn_c_l83_c7_61b6_return_output;
     -- cpu_step_result_MUX[uxn_c_l75_c7_989e] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l75_c7_989e_cond <= VAR_cpu_step_result_MUX_uxn_c_l75_c7_989e_cond;
     cpu_step_result_MUX_uxn_c_l75_c7_989e_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l75_c7_989e_iftrue;
     cpu_step_result_MUX_uxn_c_l75_c7_989e_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l75_c7_989e_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_989e_return_output := cpu_step_result_MUX_uxn_c_l75_c7_989e_return_output;

     -- pc_MUX[uxn_c_l75_c7_989e] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l75_c7_989e_cond <= VAR_pc_MUX_uxn_c_l75_c7_989e_cond;
     pc_MUX_uxn_c_l75_c7_989e_iftrue <= VAR_pc_MUX_uxn_c_l75_c7_989e_iftrue;
     pc_MUX_uxn_c_l75_c7_989e_iffalse <= VAR_pc_MUX_uxn_c_l75_c7_989e_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l75_c7_989e_return_output := pc_MUX_uxn_c_l75_c7_989e_return_output;

     -- is_ins_done_MUX[uxn_c_l68_c2_ea9d] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l68_c2_ea9d_cond <= VAR_is_ins_done_MUX_uxn_c_l68_c2_ea9d_cond;
     is_ins_done_MUX_uxn_c_l68_c2_ea9d_iftrue <= VAR_is_ins_done_MUX_uxn_c_l68_c2_ea9d_iftrue;
     is_ins_done_MUX_uxn_c_l68_c2_ea9d_iffalse <= VAR_is_ins_done_MUX_uxn_c_l68_c2_ea9d_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l68_c2_ea9d_return_output := is_ins_done_MUX_uxn_c_l68_c2_ea9d_return_output;

     -- Submodule level 9
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_ea9d_iffalse := VAR_cpu_step_result_MUX_uxn_c_l75_c7_989e_return_output;
     VAR_BIN_OP_EQ_uxn_c_l102_c6_acec_left := VAR_is_ins_done_MUX_uxn_c_l68_c2_ea9d_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l68_c2_ea9d_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_ea9d_iffalse := VAR_pc_MUX_uxn_c_l75_c7_989e_return_output;
     -- cpu_step_result_MUX[uxn_c_l68_c2_ea9d] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l68_c2_ea9d_cond <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_ea9d_cond;
     cpu_step_result_MUX_uxn_c_l68_c2_ea9d_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_ea9d_iftrue;
     cpu_step_result_MUX_uxn_c_l68_c2_ea9d_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_ea9d_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_ea9d_return_output := cpu_step_result_MUX_uxn_c_l68_c2_ea9d_return_output;

     -- BIN_OP_EQ[uxn_c_l102_c6_acec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l102_c6_acec_left <= VAR_BIN_OP_EQ_uxn_c_l102_c6_acec_left;
     BIN_OP_EQ_uxn_c_l102_c6_acec_right <= VAR_BIN_OP_EQ_uxn_c_l102_c6_acec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l102_c6_acec_return_output := BIN_OP_EQ_uxn_c_l102_c6_acec_return_output;

     -- pc_MUX[uxn_c_l68_c2_ea9d] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l68_c2_ea9d_cond <= VAR_pc_MUX_uxn_c_l68_c2_ea9d_cond;
     pc_MUX_uxn_c_l68_c2_ea9d_iftrue <= VAR_pc_MUX_uxn_c_l68_c2_ea9d_iftrue;
     pc_MUX_uxn_c_l68_c2_ea9d_iffalse <= VAR_pc_MUX_uxn_c_l68_c2_ea9d_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l68_c2_ea9d_return_output := pc_MUX_uxn_c_l68_c2_ea9d_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_af3e_cond := VAR_BIN_OP_EQ_uxn_c_l102_c6_acec_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l68_c2_ea9d_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l68_c2_ea9d_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l68_c2_ea9d_return_output;
     -- step_cpu_phase_MUX[uxn_c_l102_c2_af3e] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l102_c2_af3e_cond <= VAR_step_cpu_phase_MUX_uxn_c_l102_c2_af3e_cond;
     step_cpu_phase_MUX_uxn_c_l102_c2_af3e_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l102_c2_af3e_iftrue;
     step_cpu_phase_MUX_uxn_c_l102_c2_af3e_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l102_c2_af3e_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_af3e_return_output := step_cpu_phase_MUX_uxn_c_l102_c2_af3e_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l102_c2_af3e_return_output;
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
