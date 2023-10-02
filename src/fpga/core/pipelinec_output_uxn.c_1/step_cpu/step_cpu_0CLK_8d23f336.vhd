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
entity step_cpu_0CLK_8d23f336 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ram_read_value : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_8d23f336;
architecture arch of step_cpu_0CLK_8d23f336 is
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
-- BIN_OP_EQ[uxn_c_l68_c6_637c]
signal BIN_OP_EQ_uxn_c_l68_c6_637c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_637c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_637c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_b52c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l75_c7_f957]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l68_c2_b753]
signal cpu_step_result_MUX_uxn_c_l68_c2_b753_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l68_c2_b753_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_b753_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_b753_return_output : cpu_step_result_t;

-- is_ins_done_MUX[uxn_c_l68_c2_b753]
signal is_ins_done_MUX_uxn_c_l68_c2_b753_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_b753_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_b753_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_b753_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l68_c2_b753]
signal pc_MUX_uxn_c_l68_c2_b753_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l68_c2_b753_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_b753_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_b753_return_output : unsigned(15 downto 0);

-- eval_opcode_result_MUX[uxn_c_l68_c2_b753]
signal eval_opcode_result_MUX_uxn_c_l68_c2_b753_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l68_c2_b753_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_b753_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_b753_return_output : eval_opcode_result_t;

-- ins_MUX[uxn_c_l68_c2_b753]
signal ins_MUX_uxn_c_l68_c2_b753_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l68_c2_b753_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_b753_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_b753_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l73_c3_ad1f[uxn_c_l73_c3_ad1f]
signal printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c11_2e01]
signal BIN_OP_EQ_uxn_c_l75_c11_2e01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c11_2e01_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c11_2e01_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l75_c1_0214]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l83_c7_87fa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l75_c7_f957]
signal cpu_step_result_MUX_uxn_c_l75_c7_f957_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l75_c7_f957_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c7_f957_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c7_f957_return_output : cpu_step_result_t;

-- is_ins_done_MUX[uxn_c_l75_c7_f957]
signal is_ins_done_MUX_uxn_c_l75_c7_f957_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c7_f957_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c7_f957_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c7_f957_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l75_c7_f957]
signal pc_MUX_uxn_c_l75_c7_f957_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l75_c7_f957_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c7_f957_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c7_f957_return_output : unsigned(15 downto 0);

-- eval_opcode_result_MUX[uxn_c_l75_c7_f957]
signal eval_opcode_result_MUX_uxn_c_l75_c7_f957_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l75_c7_f957_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l75_c7_f957_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l75_c7_f957_return_output : eval_opcode_result_t;

-- ins_MUX[uxn_c_l75_c7_f957]
signal ins_MUX_uxn_c_l75_c7_f957_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l75_c7_f957_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c7_f957_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c7_f957_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l81_c3_209e[uxn_c_l81_c3_209e]
signal printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l83_c11_67ad]
signal BIN_OP_EQ_uxn_c_l83_c11_67ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l83_c11_67ad_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l83_c11_67ad_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l83_c1_1ecd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l88_c1_9a59]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l83_c7_87fa]
signal cpu_step_result_MUX_uxn_c_l83_c7_87fa_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l83_c7_87fa_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l83_c7_87fa_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l83_c7_87fa_return_output : cpu_step_result_t;

-- is_ins_done_MUX[uxn_c_l83_c7_87fa]
signal is_ins_done_MUX_uxn_c_l83_c7_87fa_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l83_c7_87fa_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l83_c7_87fa_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l83_c7_87fa_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l83_c7_87fa]
signal pc_MUX_uxn_c_l83_c7_87fa_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l83_c7_87fa_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l83_c7_87fa_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l83_c7_87fa_return_output : unsigned(15 downto 0);

-- eval_opcode_result_MUX[uxn_c_l83_c7_87fa]
signal eval_opcode_result_MUX_uxn_c_l83_c7_87fa_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l83_c7_87fa_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l83_c7_87fa_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l83_c7_87fa_return_output : eval_opcode_result_t;

-- ins_MUX[uxn_c_l83_c7_87fa]
signal ins_MUX_uxn_c_l83_c7_87fa_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l83_c7_87fa_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l83_c7_87fa_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l83_c7_87fa_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l85_c3_8666]
signal BIN_OP_PLUS_uxn_c_l85_c3_8666_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l85_c3_8666_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l85_c3_8666_return_output : unsigned(16 downto 0);

-- printf_uxn_c_l86_c3_1d29[uxn_c_l86_c3_1d29]
signal printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg2 : unsigned(31 downto 0);

-- BIN_OP_MINUS[uxn_c_l89_c43_bfa1]
signal BIN_OP_MINUS_uxn_c_l89_c43_bfa1_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l89_c43_bfa1_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l89_c43_bfa1_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l89_c24_5faf]
signal eval_opcode_phased_uxn_c_l89_c24_5faf_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_5faf_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_5faf_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_5faf_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_5faf_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_5faf_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l90_c8_f99a]
signal MUX_uxn_c_l90_c8_f99a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l90_c8_f99a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l90_c8_f99a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l90_c8_f99a_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l99_c3_03b5[uxn_c_l99_c3_03b5]
signal printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l102_c6_0096]
signal BIN_OP_EQ_uxn_c_l102_c6_0096_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c6_0096_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c6_0096_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l102_c2_4440]
signal step_cpu_phase_MUX_uxn_c_l102_c2_4440_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l102_c2_4440_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l102_c2_4440_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l102_c2_4440_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l105_c3_b6cd]
signal BIN_OP_PLUS_uxn_c_l105_c3_b6cd_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l105_c3_b6cd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l105_c3_b6cd_return_output : unsigned(8 downto 0);

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
-- BIN_OP_EQ_uxn_c_l68_c6_637c
BIN_OP_EQ_uxn_c_l68_c6_637c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l68_c6_637c_left,
BIN_OP_EQ_uxn_c_l68_c6_637c_right,
BIN_OP_EQ_uxn_c_l68_c6_637c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_return_output);

-- cpu_step_result_MUX_uxn_c_l68_c2_b753
cpu_step_result_MUX_uxn_c_l68_c2_b753 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l68_c2_b753_cond,
cpu_step_result_MUX_uxn_c_l68_c2_b753_iftrue,
cpu_step_result_MUX_uxn_c_l68_c2_b753_iffalse,
cpu_step_result_MUX_uxn_c_l68_c2_b753_return_output);

-- is_ins_done_MUX_uxn_c_l68_c2_b753
is_ins_done_MUX_uxn_c_l68_c2_b753 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l68_c2_b753_cond,
is_ins_done_MUX_uxn_c_l68_c2_b753_iftrue,
is_ins_done_MUX_uxn_c_l68_c2_b753_iffalse,
is_ins_done_MUX_uxn_c_l68_c2_b753_return_output);

-- pc_MUX_uxn_c_l68_c2_b753
pc_MUX_uxn_c_l68_c2_b753 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l68_c2_b753_cond,
pc_MUX_uxn_c_l68_c2_b753_iftrue,
pc_MUX_uxn_c_l68_c2_b753_iffalse,
pc_MUX_uxn_c_l68_c2_b753_return_output);

-- eval_opcode_result_MUX_uxn_c_l68_c2_b753
eval_opcode_result_MUX_uxn_c_l68_c2_b753 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l68_c2_b753_cond,
eval_opcode_result_MUX_uxn_c_l68_c2_b753_iftrue,
eval_opcode_result_MUX_uxn_c_l68_c2_b753_iffalse,
eval_opcode_result_MUX_uxn_c_l68_c2_b753_return_output);

-- ins_MUX_uxn_c_l68_c2_b753
ins_MUX_uxn_c_l68_c2_b753 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l68_c2_b753_cond,
ins_MUX_uxn_c_l68_c2_b753_iftrue,
ins_MUX_uxn_c_l68_c2_b753_iffalse,
ins_MUX_uxn_c_l68_c2_b753_return_output);

-- printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f
printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f : entity work.printf_uxn_c_l73_c3_ad1f_0CLK_de264c78 port map (
printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_CLOCK_ENABLE,
printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_arg0,
printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_arg1);

-- BIN_OP_EQ_uxn_c_l75_c11_2e01
BIN_OP_EQ_uxn_c_l75_c11_2e01 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c11_2e01_left,
BIN_OP_EQ_uxn_c_l75_c11_2e01_right,
BIN_OP_EQ_uxn_c_l75_c11_2e01_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_return_output);

-- cpu_step_result_MUX_uxn_c_l75_c7_f957
cpu_step_result_MUX_uxn_c_l75_c7_f957 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l75_c7_f957_cond,
cpu_step_result_MUX_uxn_c_l75_c7_f957_iftrue,
cpu_step_result_MUX_uxn_c_l75_c7_f957_iffalse,
cpu_step_result_MUX_uxn_c_l75_c7_f957_return_output);

-- is_ins_done_MUX_uxn_c_l75_c7_f957
is_ins_done_MUX_uxn_c_l75_c7_f957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l75_c7_f957_cond,
is_ins_done_MUX_uxn_c_l75_c7_f957_iftrue,
is_ins_done_MUX_uxn_c_l75_c7_f957_iffalse,
is_ins_done_MUX_uxn_c_l75_c7_f957_return_output);

-- pc_MUX_uxn_c_l75_c7_f957
pc_MUX_uxn_c_l75_c7_f957 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l75_c7_f957_cond,
pc_MUX_uxn_c_l75_c7_f957_iftrue,
pc_MUX_uxn_c_l75_c7_f957_iffalse,
pc_MUX_uxn_c_l75_c7_f957_return_output);

-- eval_opcode_result_MUX_uxn_c_l75_c7_f957
eval_opcode_result_MUX_uxn_c_l75_c7_f957 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l75_c7_f957_cond,
eval_opcode_result_MUX_uxn_c_l75_c7_f957_iftrue,
eval_opcode_result_MUX_uxn_c_l75_c7_f957_iffalse,
eval_opcode_result_MUX_uxn_c_l75_c7_f957_return_output);

-- ins_MUX_uxn_c_l75_c7_f957
ins_MUX_uxn_c_l75_c7_f957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l75_c7_f957_cond,
ins_MUX_uxn_c_l75_c7_f957_iftrue,
ins_MUX_uxn_c_l75_c7_f957_iffalse,
ins_MUX_uxn_c_l75_c7_f957_return_output);

-- printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e
printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e : entity work.printf_uxn_c_l81_c3_209e_0CLK_de264c78 port map (
printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_CLOCK_ENABLE,
printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg0,
printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg1,
printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg2);

-- BIN_OP_EQ_uxn_c_l83_c11_67ad
BIN_OP_EQ_uxn_c_l83_c11_67ad : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l83_c11_67ad_left,
BIN_OP_EQ_uxn_c_l83_c11_67ad_right,
BIN_OP_EQ_uxn_c_l83_c11_67ad_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_return_output);

-- cpu_step_result_MUX_uxn_c_l83_c7_87fa
cpu_step_result_MUX_uxn_c_l83_c7_87fa : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l83_c7_87fa_cond,
cpu_step_result_MUX_uxn_c_l83_c7_87fa_iftrue,
cpu_step_result_MUX_uxn_c_l83_c7_87fa_iffalse,
cpu_step_result_MUX_uxn_c_l83_c7_87fa_return_output);

-- is_ins_done_MUX_uxn_c_l83_c7_87fa
is_ins_done_MUX_uxn_c_l83_c7_87fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l83_c7_87fa_cond,
is_ins_done_MUX_uxn_c_l83_c7_87fa_iftrue,
is_ins_done_MUX_uxn_c_l83_c7_87fa_iffalse,
is_ins_done_MUX_uxn_c_l83_c7_87fa_return_output);

-- pc_MUX_uxn_c_l83_c7_87fa
pc_MUX_uxn_c_l83_c7_87fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l83_c7_87fa_cond,
pc_MUX_uxn_c_l83_c7_87fa_iftrue,
pc_MUX_uxn_c_l83_c7_87fa_iffalse,
pc_MUX_uxn_c_l83_c7_87fa_return_output);

-- eval_opcode_result_MUX_uxn_c_l83_c7_87fa
eval_opcode_result_MUX_uxn_c_l83_c7_87fa : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l83_c7_87fa_cond,
eval_opcode_result_MUX_uxn_c_l83_c7_87fa_iftrue,
eval_opcode_result_MUX_uxn_c_l83_c7_87fa_iffalse,
eval_opcode_result_MUX_uxn_c_l83_c7_87fa_return_output);

-- ins_MUX_uxn_c_l83_c7_87fa
ins_MUX_uxn_c_l83_c7_87fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l83_c7_87fa_cond,
ins_MUX_uxn_c_l83_c7_87fa_iftrue,
ins_MUX_uxn_c_l83_c7_87fa_iffalse,
ins_MUX_uxn_c_l83_c7_87fa_return_output);

-- BIN_OP_PLUS_uxn_c_l85_c3_8666
BIN_OP_PLUS_uxn_c_l85_c3_8666 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l85_c3_8666_left,
BIN_OP_PLUS_uxn_c_l85_c3_8666_right,
BIN_OP_PLUS_uxn_c_l85_c3_8666_return_output);

-- printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29
printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29 : entity work.printf_uxn_c_l86_c3_1d29_0CLK_de264c78 port map (
printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_CLOCK_ENABLE,
printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg0,
printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg1,
printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg2);

-- BIN_OP_MINUS_uxn_c_l89_c43_bfa1
BIN_OP_MINUS_uxn_c_l89_c43_bfa1 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l89_c43_bfa1_left,
BIN_OP_MINUS_uxn_c_l89_c43_bfa1_right,
BIN_OP_MINUS_uxn_c_l89_c43_bfa1_return_output);

-- eval_opcode_phased_uxn_c_l89_c24_5faf
eval_opcode_phased_uxn_c_l89_c24_5faf : entity work.eval_opcode_phased_0CLK_50a1998d port map (
clk,
eval_opcode_phased_uxn_c_l89_c24_5faf_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l89_c24_5faf_phase,
eval_opcode_phased_uxn_c_l89_c24_5faf_ins,
eval_opcode_phased_uxn_c_l89_c24_5faf_pc,
eval_opcode_phased_uxn_c_l89_c24_5faf_previous_ram_read,
eval_opcode_phased_uxn_c_l89_c24_5faf_return_output);

-- MUX_uxn_c_l90_c8_f99a
MUX_uxn_c_l90_c8_f99a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l90_c8_f99a_cond,
MUX_uxn_c_l90_c8_f99a_iftrue,
MUX_uxn_c_l90_c8_f99a_iffalse,
MUX_uxn_c_l90_c8_f99a_return_output);

-- printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5
printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5 : entity work.printf_uxn_c_l99_c3_03b5_0CLK_de264c78 port map (
printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_CLOCK_ENABLE,
printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg0,
printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg1,
printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg2);

-- BIN_OP_EQ_uxn_c_l102_c6_0096
BIN_OP_EQ_uxn_c_l102_c6_0096 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l102_c6_0096_left,
BIN_OP_EQ_uxn_c_l102_c6_0096_right,
BIN_OP_EQ_uxn_c_l102_c6_0096_return_output);

-- step_cpu_phase_MUX_uxn_c_l102_c2_4440
step_cpu_phase_MUX_uxn_c_l102_c2_4440 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l102_c2_4440_cond,
step_cpu_phase_MUX_uxn_c_l102_c2_4440_iftrue,
step_cpu_phase_MUX_uxn_c_l102_c2_4440_iffalse,
step_cpu_phase_MUX_uxn_c_l102_c2_4440_return_output);

-- BIN_OP_PLUS_uxn_c_l105_c3_b6cd
BIN_OP_PLUS_uxn_c_l105_c3_b6cd : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l105_c3_b6cd_left,
BIN_OP_PLUS_uxn_c_l105_c3_b6cd_right,
BIN_OP_PLUS_uxn_c_l105_c3_b6cd_return_output);



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
 BIN_OP_EQ_uxn_c_l68_c6_637c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_return_output,
 cpu_step_result_MUX_uxn_c_l68_c2_b753_return_output,
 is_ins_done_MUX_uxn_c_l68_c2_b753_return_output,
 pc_MUX_uxn_c_l68_c2_b753_return_output,
 eval_opcode_result_MUX_uxn_c_l68_c2_b753_return_output,
 ins_MUX_uxn_c_l68_c2_b753_return_output,
 BIN_OP_EQ_uxn_c_l75_c11_2e01_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_return_output,
 cpu_step_result_MUX_uxn_c_l75_c7_f957_return_output,
 is_ins_done_MUX_uxn_c_l75_c7_f957_return_output,
 pc_MUX_uxn_c_l75_c7_f957_return_output,
 eval_opcode_result_MUX_uxn_c_l75_c7_f957_return_output,
 ins_MUX_uxn_c_l75_c7_f957_return_output,
 BIN_OP_EQ_uxn_c_l83_c11_67ad_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_return_output,
 cpu_step_result_MUX_uxn_c_l83_c7_87fa_return_output,
 is_ins_done_MUX_uxn_c_l83_c7_87fa_return_output,
 pc_MUX_uxn_c_l83_c7_87fa_return_output,
 eval_opcode_result_MUX_uxn_c_l83_c7_87fa_return_output,
 ins_MUX_uxn_c_l83_c7_87fa_return_output,
 BIN_OP_PLUS_uxn_c_l85_c3_8666_return_output,
 BIN_OP_MINUS_uxn_c_l89_c43_bfa1_return_output,
 eval_opcode_phased_uxn_c_l89_c24_5faf_return_output,
 MUX_uxn_c_l90_c8_f99a_return_output,
 BIN_OP_EQ_uxn_c_l102_c6_0096_return_output,
 step_cpu_phase_MUX_uxn_c_l102_c2_4440_return_output,
 BIN_OP_PLUS_uxn_c_l105_c3_b6cd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_ram_read_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_637c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_637c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_637c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_b753_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_b753_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_b753_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_f957_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_b753_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_b753_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_b753_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_b753_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_f957_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_b753_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_b753_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_b753_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_b753_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_f957_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_b753_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_b753_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_b753_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_b753_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_f957_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_b753_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_b753_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_b753_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_b753_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_f957_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_b753_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_b753_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c11_2e01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c11_2e01_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c11_2e01_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_f957_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l75_c7_f957_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_f957_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_87fa_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_f957_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_f957_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_f957_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_87fa_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_f957_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_f957_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_f957_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_87fa_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_f957_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_f957_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_f957_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_87fa_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_f957_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_f957_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_f957_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_87fa_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_f957_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l83_c11_67ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l83_c11_67ad_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l83_c11_67ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_87fa_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_87fa_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l83_c7_87fa_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_87fa_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_87fa_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_87fa_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_87fa_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_87fa_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l85_c3_02b6 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_87fa_iffalse : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l90_c3_acd6 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_87fa_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_87fa_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_87fa_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_87fa_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_87fa_iftrue : unsigned(7 downto 0);
 variable VAR_ins_uxn_c_l84_c3_748e : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_87fa_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_87fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l85_c3_8666_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l85_c3_8666_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l85_c3_8666_return_output : unsigned(16 downto 0);
 variable VAR_printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg2 : unsigned(31 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l89_c43_bfa1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l89_c43_bfa1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l89_c43_bfa1_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l90_c8_f99a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l90_c8_f99a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l90_c8_f99a_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l90_c8_d47d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l90_c43_3fe9_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l90_c8_f99a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l91_c33_f696_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l92_c34_f9e0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l93_c33_a322_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l94_c31_3408_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l95_c35_c87f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l96_c34_0db7_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l97_c32_6af2_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l98_c17_2063_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c6_0096_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c6_0096_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c6_0096_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_4440_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l103_c3_1b29 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_4440_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l105_c3_6554 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_4440_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_4440_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l105_c3_b6cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l105_c3_b6cd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l105_c3_b6cd_return_output : unsigned(8 downto 0);
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
     VAR_BIN_OP_PLUS_uxn_c_l85_c3_8666_right := to_unsigned(1, 1);
     VAR_is_ins_done_MUX_uxn_c_l75_c7_f957_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l68_c6_637c_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l89_c43_bfa1_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l83_c11_67ad_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_c_l105_c3_b6cd_right := to_unsigned(1, 1);
     VAR_is_ins_done_MUX_uxn_c_l68_c2_b753_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_iftrue := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l103_c3_1b29 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_4440_iftrue := VAR_step_cpu_phase_uxn_c_l103_c3_1b29;
     VAR_BIN_OP_EQ_uxn_c_l102_c6_0096_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l75_c11_2e01_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ram_read_value := ram_read_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_iftrue := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_87fa_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_b753_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_f957_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_87fa_iftrue := eval_opcode_result;
     VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_ins := ins;
     VAR_ins_MUX_uxn_c_l68_c2_b753_iftrue := ins;
     VAR_ins_MUX_uxn_c_l75_c7_f957_iftrue := ins;
     VAR_ins_MUX_uxn_c_l83_c7_87fa_iffalse := ins;
     VAR_printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg2 := resize(ins, 32);
     VAR_printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg2 := resize(ins, 32);
     VAR_is_ins_done_MUX_uxn_c_l83_c7_87fa_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l85_c3_8666_left := pc;
     VAR_MUX_uxn_c_l90_c8_f99a_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_pc := pc;
     VAR_pc_MUX_uxn_c_l68_c2_b753_iftrue := pc;
     VAR_pc_MUX_uxn_c_l75_c7_f957_iftrue := pc;
     VAR_printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_arg1 := resize(pc, 32);
     VAR_printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg1 := resize(pc, 32);
     VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_previous_ram_read := VAR_ram_read_value;
     VAR_ins_uxn_c_l84_c3_748e := VAR_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l68_c6_637c_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l75_c11_2e01_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l83_c11_67ad_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l89_c43_bfa1_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l105_c3_b6cd_left := step_cpu_phase;
     VAR_printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg0 := resize(step_cpu_phase, 32);
     VAR_ins_MUX_uxn_c_l83_c7_87fa_iftrue := VAR_ins_uxn_c_l84_c3_748e;
     VAR_printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg2 := resize(VAR_ins_uxn_c_l84_c3_748e, 32);
     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l68_c2_b753] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_b753_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- BIN_OP_EQ[uxn_c_l68_c6_637c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l68_c6_637c_left <= VAR_BIN_OP_EQ_uxn_c_l68_c6_637c_left;
     BIN_OP_EQ_uxn_c_l68_c6_637c_right <= VAR_BIN_OP_EQ_uxn_c_l68_c6_637c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l68_c6_637c_return_output := BIN_OP_EQ_uxn_c_l68_c6_637c_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c11_2e01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c11_2e01_left <= VAR_BIN_OP_EQ_uxn_c_l75_c11_2e01_left;
     BIN_OP_EQ_uxn_c_l75_c11_2e01_right <= VAR_BIN_OP_EQ_uxn_c_l75_c11_2e01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c11_2e01_return_output := BIN_OP_EQ_uxn_c_l75_c11_2e01_return_output;

     -- BIN_OP_PLUS[uxn_c_l85_c3_8666] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l85_c3_8666_left <= VAR_BIN_OP_PLUS_uxn_c_l85_c3_8666_left;
     BIN_OP_PLUS_uxn_c_l85_c3_8666_right <= VAR_BIN_OP_PLUS_uxn_c_l85_c3_8666_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l85_c3_8666_return_output := BIN_OP_PLUS_uxn_c_l85_c3_8666_return_output;

     -- BIN_OP_PLUS[uxn_c_l105_c3_b6cd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l105_c3_b6cd_left <= VAR_BIN_OP_PLUS_uxn_c_l105_c3_b6cd_left;
     BIN_OP_PLUS_uxn_c_l105_c3_b6cd_right <= VAR_BIN_OP_PLUS_uxn_c_l105_c3_b6cd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l105_c3_b6cd_return_output := BIN_OP_PLUS_uxn_c_l105_c3_b6cd_return_output;

     -- BIN_OP_MINUS[uxn_c_l89_c43_bfa1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l89_c43_bfa1_left <= VAR_BIN_OP_MINUS_uxn_c_l89_c43_bfa1_left;
     BIN_OP_MINUS_uxn_c_l89_c43_bfa1_right <= VAR_BIN_OP_MINUS_uxn_c_l89_c43_bfa1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l89_c43_bfa1_return_output := BIN_OP_MINUS_uxn_c_l89_c43_bfa1_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l75_c7_f957] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l75_c7_f957_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- BIN_OP_EQ[uxn_c_l83_c11_67ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l83_c11_67ad_left <= VAR_BIN_OP_EQ_uxn_c_l83_c11_67ad_left;
     BIN_OP_EQ_uxn_c_l83_c11_67ad_right <= VAR_BIN_OP_EQ_uxn_c_l83_c11_67ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l83_c11_67ad_return_output := BIN_OP_EQ_uxn_c_l83_c11_67ad_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_637c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_637c_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_b753_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_637c_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_b753_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_637c_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_b753_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_637c_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_b753_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_637c_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_b753_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_637c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_2e01_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_2e01_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_f957_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_2e01_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_f957_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_2e01_return_output;
     VAR_ins_MUX_uxn_c_l75_c7_f957_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_2e01_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c7_f957_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_2e01_return_output;
     VAR_pc_MUX_uxn_c_l75_c7_f957_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_2e01_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_67ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_67ad_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_87fa_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_67ad_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_87fa_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_67ad_return_output;
     VAR_ins_MUX_uxn_c_l83_c7_87fa_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_67ad_return_output;
     VAR_is_ins_done_MUX_uxn_c_l83_c7_87fa_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_67ad_return_output;
     VAR_pc_MUX_uxn_c_l83_c7_87fa_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_67ad_return_output;
     VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_phase := VAR_BIN_OP_MINUS_uxn_c_l89_c43_bfa1_return_output;
     VAR_step_cpu_phase_uxn_c_l105_c3_6554 := resize(VAR_BIN_OP_PLUS_uxn_c_l105_c3_b6cd_return_output, 8);
     VAR_pc_uxn_c_l85_c3_02b6 := resize(VAR_BIN_OP_PLUS_uxn_c_l85_c3_8666_return_output, 16);
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_b753_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_b753_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_f957_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l75_c7_f957_return_output;
     VAR_pc_MUX_uxn_c_l83_c7_87fa_iftrue := VAR_pc_uxn_c_l85_c3_02b6;
     VAR_printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg1 := resize(VAR_pc_uxn_c_l85_c3_02b6, 32);
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_4440_iffalse := VAR_step_cpu_phase_uxn_c_l105_c3_6554;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l75_c7_f957] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_return_output;

     -- ins_MUX[uxn_c_l83_c7_87fa] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l83_c7_87fa_cond <= VAR_ins_MUX_uxn_c_l83_c7_87fa_cond;
     ins_MUX_uxn_c_l83_c7_87fa_iftrue <= VAR_ins_MUX_uxn_c_l83_c7_87fa_iftrue;
     ins_MUX_uxn_c_l83_c7_87fa_iffalse <= VAR_ins_MUX_uxn_c_l83_c7_87fa_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l83_c7_87fa_return_output := ins_MUX_uxn_c_l83_c7_87fa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_b52c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_f957_return_output;
     VAR_printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_b52c_return_output;
     VAR_ins_MUX_uxn_c_l75_c7_f957_iffalse := VAR_ins_MUX_uxn_c_l83_c7_87fa_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l83_c7_87fa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_return_output;

     -- ins_MUX[uxn_c_l75_c7_f957] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l75_c7_f957_cond <= VAR_ins_MUX_uxn_c_l75_c7_f957_cond;
     ins_MUX_uxn_c_l75_c7_f957_iftrue <= VAR_ins_MUX_uxn_c_l75_c7_f957_iftrue;
     ins_MUX_uxn_c_l75_c7_f957_iffalse <= VAR_ins_MUX_uxn_c_l75_c7_f957_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l75_c7_f957_return_output := ins_MUX_uxn_c_l75_c7_f957_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l75_c1_0214] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_return_output;

     -- printf_uxn_c_l73_c3_ad1f[uxn_c_l73_c3_ad1f] LATENCY=0
     -- Clock enable
     printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_CLOCK_ENABLE <= VAR_printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_arg0 <= VAR_printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_arg0;
     printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_arg1 <= VAR_printf_uxn_c_l73_c3_ad1f_uxn_c_l73_c3_ad1f_arg1;
     -- Outputs

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_87fa_return_output;
     VAR_printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_0214_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_b753_iffalse := VAR_ins_MUX_uxn_c_l75_c7_f957_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l83_c1_1ecd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_return_output;

     -- printf_uxn_c_l81_c3_209e[uxn_c_l81_c3_209e] LATENCY=0
     -- Clock enable
     printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_CLOCK_ENABLE <= VAR_printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg0 <= VAR_printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg0;
     printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg1 <= VAR_printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg1;
     printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg2 <= VAR_printf_uxn_c_l81_c3_209e_uxn_c_l81_c3_209e_arg2;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l88_c1_9a59] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_return_output;

     -- ins_MUX[uxn_c_l68_c2_b753] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l68_c2_b753_cond <= VAR_ins_MUX_uxn_c_l68_c2_b753_cond;
     ins_MUX_uxn_c_l68_c2_b753_iftrue <= VAR_ins_MUX_uxn_c_l68_c2_b753_iftrue;
     ins_MUX_uxn_c_l68_c2_b753_iffalse <= VAR_ins_MUX_uxn_c_l68_c2_b753_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l68_c2_b753_return_output := ins_MUX_uxn_c_l68_c2_b753_return_output;

     -- Submodule level 4
     VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_return_output;
     VAR_printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_9a59_return_output;
     VAR_printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_1ecd_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l68_c2_b753_return_output;
     -- eval_opcode_phased[uxn_c_l89_c24_5faf] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l89_c24_5faf_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l89_c24_5faf_phase <= VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_phase;
     eval_opcode_phased_uxn_c_l89_c24_5faf_ins <= VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_ins;
     eval_opcode_phased_uxn_c_l89_c24_5faf_pc <= VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_pc;
     eval_opcode_phased_uxn_c_l89_c24_5faf_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_previous_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_return_output := eval_opcode_phased_uxn_c_l89_c24_5faf_return_output;

     -- printf_uxn_c_l86_c3_1d29[uxn_c_l86_c3_1d29] LATENCY=0
     -- Clock enable
     printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_CLOCK_ENABLE <= VAR_printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg0 <= VAR_printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg0;
     printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg1 <= VAR_printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg1;
     printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg2 <= VAR_printf_uxn_c_l86_c3_1d29_uxn_c_l86_c3_1d29_arg2;
     -- Outputs

     -- Submodule level 5
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_87fa_iffalse := VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_return_output;
     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d[uxn_c_l94_c31_3408] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l94_c31_3408_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_return_output.ram_value;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d[uxn_c_l90_c43_3fe9] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l90_c43_3fe9_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_return_output.pc;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d[uxn_c_l93_c33_a322] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l93_c33_a322_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_return_output.ram_addr;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l92_c34_f9e0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l92_c34_f9e0_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_return_output.is_ram_write;

     -- CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d[uxn_c_l97_c32_6af2] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l97_c32_6af2_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_return_output.vram_value;

     -- eval_opcode_result_MUX[uxn_c_l83_c7_87fa] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l83_c7_87fa_cond <= VAR_eval_opcode_result_MUX_uxn_c_l83_c7_87fa_cond;
     eval_opcode_result_MUX_uxn_c_l83_c7_87fa_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l83_c7_87fa_iftrue;
     eval_opcode_result_MUX_uxn_c_l83_c7_87fa_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l83_c7_87fa_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_87fa_return_output := eval_opcode_result_MUX_uxn_c_l83_c7_87fa_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d[uxn_c_l91_c33_f696] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l91_c33_f696_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_return_output.is_ram_read;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l98_c17_2063] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l98_c17_2063_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l95_c35_c87f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l95_c35_c87f_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l90_c8_d47d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l90_c8_d47d_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_return_output.is_pc_updated;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l96_c34_0db7] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l96_c34_0db7_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5faf_return_output.vram_address;

     -- Submodule level 6
     VAR_MUX_uxn_c_l90_c8_f99a_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l90_c43_3fe9_return_output;
     VAR_is_ins_done_MUX_uxn_c_l83_c7_87fa_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l98_c17_2063_return_output;
     VAR_MUX_uxn_c_l90_c8_f99a_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l90_c8_d47d_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_f957_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l83_c7_87fa_return_output;
     -- is_ins_done_MUX[uxn_c_l83_c7_87fa] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l83_c7_87fa_cond <= VAR_is_ins_done_MUX_uxn_c_l83_c7_87fa_cond;
     is_ins_done_MUX_uxn_c_l83_c7_87fa_iftrue <= VAR_is_ins_done_MUX_uxn_c_l83_c7_87fa_iftrue;
     is_ins_done_MUX_uxn_c_l83_c7_87fa_iffalse <= VAR_is_ins_done_MUX_uxn_c_l83_c7_87fa_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l83_c7_87fa_return_output := is_ins_done_MUX_uxn_c_l83_c7_87fa_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70[uxn_c_l83_c7_87fa] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l83_c7_87fa_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l91_c33_f696_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l92_c34_f9e0_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l93_c33_a322_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l94_c31_3408_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l95_c35_c87f_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l96_c34_0db7_return_output,
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l97_c32_6af2_return_output);

     -- eval_opcode_result_MUX[uxn_c_l75_c7_f957] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l75_c7_f957_cond <= VAR_eval_opcode_result_MUX_uxn_c_l75_c7_f957_cond;
     eval_opcode_result_MUX_uxn_c_l75_c7_f957_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l75_c7_f957_iftrue;
     eval_opcode_result_MUX_uxn_c_l75_c7_f957_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l75_c7_f957_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_f957_return_output := eval_opcode_result_MUX_uxn_c_l75_c7_f957_return_output;

     -- MUX[uxn_c_l90_c8_f99a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l90_c8_f99a_cond <= VAR_MUX_uxn_c_l90_c8_f99a_cond;
     MUX_uxn_c_l90_c8_f99a_iftrue <= VAR_MUX_uxn_c_l90_c8_f99a_iftrue;
     MUX_uxn_c_l90_c8_f99a_iffalse <= VAR_MUX_uxn_c_l90_c8_f99a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l90_c8_f99a_return_output := MUX_uxn_c_l90_c8_f99a_return_output;

     -- Submodule level 7
     VAR_pc_uxn_c_l90_c3_acd6 := VAR_MUX_uxn_c_l90_c8_f99a_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_87fa_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l83_c7_87fa_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_b753_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l75_c7_f957_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c7_f957_iffalse := VAR_is_ins_done_MUX_uxn_c_l83_c7_87fa_return_output;
     VAR_pc_MUX_uxn_c_l83_c7_87fa_iffalse := VAR_pc_uxn_c_l90_c3_acd6;
     VAR_printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg1 := resize(VAR_pc_uxn_c_l90_c3_acd6, 32);
     -- pc_MUX[uxn_c_l83_c7_87fa] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l83_c7_87fa_cond <= VAR_pc_MUX_uxn_c_l83_c7_87fa_cond;
     pc_MUX_uxn_c_l83_c7_87fa_iftrue <= VAR_pc_MUX_uxn_c_l83_c7_87fa_iftrue;
     pc_MUX_uxn_c_l83_c7_87fa_iffalse <= VAR_pc_MUX_uxn_c_l83_c7_87fa_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l83_c7_87fa_return_output := pc_MUX_uxn_c_l83_c7_87fa_return_output;

     -- eval_opcode_result_MUX[uxn_c_l68_c2_b753] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l68_c2_b753_cond <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_b753_cond;
     eval_opcode_result_MUX_uxn_c_l68_c2_b753_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_b753_iftrue;
     eval_opcode_result_MUX_uxn_c_l68_c2_b753_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_b753_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_b753_return_output := eval_opcode_result_MUX_uxn_c_l68_c2_b753_return_output;

     -- is_ins_done_MUX[uxn_c_l75_c7_f957] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l75_c7_f957_cond <= VAR_is_ins_done_MUX_uxn_c_l75_c7_f957_cond;
     is_ins_done_MUX_uxn_c_l75_c7_f957_iftrue <= VAR_is_ins_done_MUX_uxn_c_l75_c7_f957_iftrue;
     is_ins_done_MUX_uxn_c_l75_c7_f957_iffalse <= VAR_is_ins_done_MUX_uxn_c_l75_c7_f957_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l75_c7_f957_return_output := is_ins_done_MUX_uxn_c_l75_c7_f957_return_output;

     -- printf_uxn_c_l99_c3_03b5[uxn_c_l99_c3_03b5] LATENCY=0
     -- Clock enable
     printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_CLOCK_ENABLE <= VAR_printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg0 <= VAR_printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg0;
     printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg1 <= VAR_printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg1;
     printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg2 <= VAR_printf_uxn_c_l99_c3_03b5_uxn_c_l99_c3_03b5_arg2;
     -- Outputs

     -- cpu_step_result_MUX[uxn_c_l83_c7_87fa] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l83_c7_87fa_cond <= VAR_cpu_step_result_MUX_uxn_c_l83_c7_87fa_cond;
     cpu_step_result_MUX_uxn_c_l83_c7_87fa_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l83_c7_87fa_iftrue;
     cpu_step_result_MUX_uxn_c_l83_c7_87fa_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l83_c7_87fa_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_87fa_return_output := cpu_step_result_MUX_uxn_c_l83_c7_87fa_return_output;

     -- Submodule level 8
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_f957_iffalse := VAR_cpu_step_result_MUX_uxn_c_l83_c7_87fa_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l68_c2_b753_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_b753_iffalse := VAR_is_ins_done_MUX_uxn_c_l75_c7_f957_return_output;
     VAR_pc_MUX_uxn_c_l75_c7_f957_iffalse := VAR_pc_MUX_uxn_c_l83_c7_87fa_return_output;
     -- pc_MUX[uxn_c_l75_c7_f957] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l75_c7_f957_cond <= VAR_pc_MUX_uxn_c_l75_c7_f957_cond;
     pc_MUX_uxn_c_l75_c7_f957_iftrue <= VAR_pc_MUX_uxn_c_l75_c7_f957_iftrue;
     pc_MUX_uxn_c_l75_c7_f957_iffalse <= VAR_pc_MUX_uxn_c_l75_c7_f957_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l75_c7_f957_return_output := pc_MUX_uxn_c_l75_c7_f957_return_output;

     -- is_ins_done_MUX[uxn_c_l68_c2_b753] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l68_c2_b753_cond <= VAR_is_ins_done_MUX_uxn_c_l68_c2_b753_cond;
     is_ins_done_MUX_uxn_c_l68_c2_b753_iftrue <= VAR_is_ins_done_MUX_uxn_c_l68_c2_b753_iftrue;
     is_ins_done_MUX_uxn_c_l68_c2_b753_iffalse <= VAR_is_ins_done_MUX_uxn_c_l68_c2_b753_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l68_c2_b753_return_output := is_ins_done_MUX_uxn_c_l68_c2_b753_return_output;

     -- cpu_step_result_MUX[uxn_c_l75_c7_f957] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l75_c7_f957_cond <= VAR_cpu_step_result_MUX_uxn_c_l75_c7_f957_cond;
     cpu_step_result_MUX_uxn_c_l75_c7_f957_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l75_c7_f957_iftrue;
     cpu_step_result_MUX_uxn_c_l75_c7_f957_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l75_c7_f957_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_f957_return_output := cpu_step_result_MUX_uxn_c_l75_c7_f957_return_output;

     -- Submodule level 9
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_b753_iffalse := VAR_cpu_step_result_MUX_uxn_c_l75_c7_f957_return_output;
     VAR_BIN_OP_EQ_uxn_c_l102_c6_0096_left := VAR_is_ins_done_MUX_uxn_c_l68_c2_b753_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l68_c2_b753_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_b753_iffalse := VAR_pc_MUX_uxn_c_l75_c7_f957_return_output;
     -- BIN_OP_EQ[uxn_c_l102_c6_0096] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l102_c6_0096_left <= VAR_BIN_OP_EQ_uxn_c_l102_c6_0096_left;
     BIN_OP_EQ_uxn_c_l102_c6_0096_right <= VAR_BIN_OP_EQ_uxn_c_l102_c6_0096_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l102_c6_0096_return_output := BIN_OP_EQ_uxn_c_l102_c6_0096_return_output;

     -- pc_MUX[uxn_c_l68_c2_b753] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l68_c2_b753_cond <= VAR_pc_MUX_uxn_c_l68_c2_b753_cond;
     pc_MUX_uxn_c_l68_c2_b753_iftrue <= VAR_pc_MUX_uxn_c_l68_c2_b753_iftrue;
     pc_MUX_uxn_c_l68_c2_b753_iffalse <= VAR_pc_MUX_uxn_c_l68_c2_b753_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l68_c2_b753_return_output := pc_MUX_uxn_c_l68_c2_b753_return_output;

     -- cpu_step_result_MUX[uxn_c_l68_c2_b753] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l68_c2_b753_cond <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_b753_cond;
     cpu_step_result_MUX_uxn_c_l68_c2_b753_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_b753_iftrue;
     cpu_step_result_MUX_uxn_c_l68_c2_b753_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_b753_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_b753_return_output := cpu_step_result_MUX_uxn_c_l68_c2_b753_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_4440_cond := VAR_BIN_OP_EQ_uxn_c_l102_c6_0096_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l68_c2_b753_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l68_c2_b753_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l68_c2_b753_return_output;
     -- step_cpu_phase_MUX[uxn_c_l102_c2_4440] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l102_c2_4440_cond <= VAR_step_cpu_phase_MUX_uxn_c_l102_c2_4440_cond;
     step_cpu_phase_MUX_uxn_c_l102_c2_4440_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l102_c2_4440_iftrue;
     step_cpu_phase_MUX_uxn_c_l102_c2_4440_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l102_c2_4440_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_4440_return_output := step_cpu_phase_MUX_uxn_c_l102_c2_4440_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l102_c2_4440_return_output;
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
