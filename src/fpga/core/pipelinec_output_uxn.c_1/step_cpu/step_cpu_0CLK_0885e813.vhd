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
entity step_cpu_0CLK_0885e813 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ram_read_value : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_0885e813;
architecture arch of step_cpu_0CLK_0885e813 is
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
-- BIN_OP_EQ[uxn_c_l68_c6_5f02]
signal BIN_OP_EQ_uxn_c_l68_c6_5f02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_5f02_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_5f02_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_ebcd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l74_c7_31ac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l68_c2_062b]
signal is_ins_done_MUX_uxn_c_l68_c2_062b_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_062b_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_062b_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_062b_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l68_c2_062b]
signal pc_MUX_uxn_c_l68_c2_062b_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l68_c2_062b_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_062b_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_062b_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l68_c2_062b]
signal ins_MUX_uxn_c_l68_c2_062b_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l68_c2_062b_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_062b_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_062b_return_output : unsigned(7 downto 0);

-- eval_opcode_result_MUX[uxn_c_l68_c2_062b]
signal eval_opcode_result_MUX_uxn_c_l68_c2_062b_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l68_c2_062b_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_062b_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_062b_return_output : eval_opcode_result_t;

-- cpu_step_result_MUX[uxn_c_l68_c2_062b]
signal cpu_step_result_MUX_uxn_c_l68_c2_062b_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l68_c2_062b_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_062b_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_062b_return_output : cpu_step_result_t;

-- printf_uxn_c_l72_c3_6822[uxn_c_l72_c3_6822]
signal printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l74_c11_e0dd]
signal BIN_OP_EQ_uxn_c_l74_c11_e0dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c11_e0dd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c11_e0dd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l74_c1_b1db]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c7_d7d5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l74_c7_31ac]
signal is_ins_done_MUX_uxn_c_l74_c7_31ac_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c7_31ac_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c7_31ac_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c7_31ac_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l74_c7_31ac]
signal pc_MUX_uxn_c_l74_c7_31ac_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l74_c7_31ac_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c7_31ac_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c7_31ac_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l74_c7_31ac]
signal ins_MUX_uxn_c_l74_c7_31ac_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l74_c7_31ac_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c7_31ac_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c7_31ac_return_output : unsigned(7 downto 0);

-- eval_opcode_result_MUX[uxn_c_l74_c7_31ac]
signal eval_opcode_result_MUX_uxn_c_l74_c7_31ac_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l74_c7_31ac_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l74_c7_31ac_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l74_c7_31ac_return_output : eval_opcode_result_t;

-- cpu_step_result_MUX[uxn_c_l74_c7_31ac]
signal cpu_step_result_MUX_uxn_c_l74_c7_31ac_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l74_c7_31ac_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l74_c7_31ac_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l74_c7_31ac_return_output : cpu_step_result_t;

-- printf_uxn_c_l78_c3_f08f[uxn_c_l78_c3_f08f]
signal printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l80_c11_d717]
signal BIN_OP_EQ_uxn_c_l80_c11_d717_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l80_c11_d717_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l80_c11_d717_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_71c0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_3b5b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l80_c7_d7d5]
signal is_ins_done_MUX_uxn_c_l80_c7_d7d5_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l80_c7_d7d5_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l80_c7_d7d5_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l80_c7_d7d5_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l80_c7_d7d5]
signal pc_MUX_uxn_c_l80_c7_d7d5_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l80_c7_d7d5_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l80_c7_d7d5_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l80_c7_d7d5_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l80_c7_d7d5]
signal ins_MUX_uxn_c_l80_c7_d7d5_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l80_c7_d7d5_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l80_c7_d7d5_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l80_c7_d7d5_return_output : unsigned(7 downto 0);

-- eval_opcode_result_MUX[uxn_c_l80_c7_d7d5]
signal eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_return_output : eval_opcode_result_t;

-- cpu_step_result_MUX[uxn_c_l80_c7_d7d5]
signal cpu_step_result_MUX_uxn_c_l80_c7_d7d5_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l80_c7_d7d5_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l80_c7_d7d5_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l80_c7_d7d5_return_output : cpu_step_result_t;

-- BIN_OP_PLUS[uxn_c_l82_c3_e9ed]
signal BIN_OP_PLUS_uxn_c_l82_c3_e9ed_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_e9ed_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_e9ed_return_output : unsigned(16 downto 0);

-- printf_uxn_c_l83_c3_b5c7[uxn_c_l83_c3_b5c7]
signal printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg2 : unsigned(31 downto 0);

-- BIN_OP_MINUS[uxn_c_l86_c43_4c9d]
signal BIN_OP_MINUS_uxn_c_l86_c43_4c9d_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c43_4c9d_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c43_4c9d_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l86_c24_9dac]
signal eval_opcode_phased_uxn_c_l86_c24_9dac_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_9dac_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_9dac_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_9dac_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_9dac_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c24_9dac_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l87_c8_c7d3]
signal MUX_uxn_c_l87_c8_c7d3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l87_c8_c7d3_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_c7d3_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_c7d3_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l96_c3_34fd[uxn_c_l96_c3_34fd]
signal printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l99_c6_21df]
signal BIN_OP_EQ_uxn_c_l99_c6_21df_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c6_21df_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c6_21df_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l99_c2_95b1]
signal step_cpu_phase_MUX_uxn_c_l99_c2_95b1_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_95b1_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_95b1_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_95b1_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l102_c3_764d]
signal BIN_OP_PLUS_uxn_c_l102_c3_764d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c3_764d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c3_764d_return_output : unsigned(8 downto 0);

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
-- BIN_OP_EQ_uxn_c_l68_c6_5f02
BIN_OP_EQ_uxn_c_l68_c6_5f02 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l68_c6_5f02_left,
BIN_OP_EQ_uxn_c_l68_c6_5f02_right,
BIN_OP_EQ_uxn_c_l68_c6_5f02_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_return_output);

-- is_ins_done_MUX_uxn_c_l68_c2_062b
is_ins_done_MUX_uxn_c_l68_c2_062b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l68_c2_062b_cond,
is_ins_done_MUX_uxn_c_l68_c2_062b_iftrue,
is_ins_done_MUX_uxn_c_l68_c2_062b_iffalse,
is_ins_done_MUX_uxn_c_l68_c2_062b_return_output);

-- pc_MUX_uxn_c_l68_c2_062b
pc_MUX_uxn_c_l68_c2_062b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l68_c2_062b_cond,
pc_MUX_uxn_c_l68_c2_062b_iftrue,
pc_MUX_uxn_c_l68_c2_062b_iffalse,
pc_MUX_uxn_c_l68_c2_062b_return_output);

-- ins_MUX_uxn_c_l68_c2_062b
ins_MUX_uxn_c_l68_c2_062b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l68_c2_062b_cond,
ins_MUX_uxn_c_l68_c2_062b_iftrue,
ins_MUX_uxn_c_l68_c2_062b_iffalse,
ins_MUX_uxn_c_l68_c2_062b_return_output);

-- eval_opcode_result_MUX_uxn_c_l68_c2_062b
eval_opcode_result_MUX_uxn_c_l68_c2_062b : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l68_c2_062b_cond,
eval_opcode_result_MUX_uxn_c_l68_c2_062b_iftrue,
eval_opcode_result_MUX_uxn_c_l68_c2_062b_iffalse,
eval_opcode_result_MUX_uxn_c_l68_c2_062b_return_output);

-- cpu_step_result_MUX_uxn_c_l68_c2_062b
cpu_step_result_MUX_uxn_c_l68_c2_062b : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l68_c2_062b_cond,
cpu_step_result_MUX_uxn_c_l68_c2_062b_iftrue,
cpu_step_result_MUX_uxn_c_l68_c2_062b_iffalse,
cpu_step_result_MUX_uxn_c_l68_c2_062b_return_output);

-- printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822
printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822 : entity work.printf_uxn_c_l72_c3_6822_0CLK_de264c78 port map (
printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_CLOCK_ENABLE,
printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_arg0,
printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_arg1);

-- BIN_OP_EQ_uxn_c_l74_c11_e0dd
BIN_OP_EQ_uxn_c_l74_c11_e0dd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l74_c11_e0dd_left,
BIN_OP_EQ_uxn_c_l74_c11_e0dd_right,
BIN_OP_EQ_uxn_c_l74_c11_e0dd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_return_output);

-- is_ins_done_MUX_uxn_c_l74_c7_31ac
is_ins_done_MUX_uxn_c_l74_c7_31ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l74_c7_31ac_cond,
is_ins_done_MUX_uxn_c_l74_c7_31ac_iftrue,
is_ins_done_MUX_uxn_c_l74_c7_31ac_iffalse,
is_ins_done_MUX_uxn_c_l74_c7_31ac_return_output);

-- pc_MUX_uxn_c_l74_c7_31ac
pc_MUX_uxn_c_l74_c7_31ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l74_c7_31ac_cond,
pc_MUX_uxn_c_l74_c7_31ac_iftrue,
pc_MUX_uxn_c_l74_c7_31ac_iffalse,
pc_MUX_uxn_c_l74_c7_31ac_return_output);

-- ins_MUX_uxn_c_l74_c7_31ac
ins_MUX_uxn_c_l74_c7_31ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l74_c7_31ac_cond,
ins_MUX_uxn_c_l74_c7_31ac_iftrue,
ins_MUX_uxn_c_l74_c7_31ac_iffalse,
ins_MUX_uxn_c_l74_c7_31ac_return_output);

-- eval_opcode_result_MUX_uxn_c_l74_c7_31ac
eval_opcode_result_MUX_uxn_c_l74_c7_31ac : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l74_c7_31ac_cond,
eval_opcode_result_MUX_uxn_c_l74_c7_31ac_iftrue,
eval_opcode_result_MUX_uxn_c_l74_c7_31ac_iffalse,
eval_opcode_result_MUX_uxn_c_l74_c7_31ac_return_output);

-- cpu_step_result_MUX_uxn_c_l74_c7_31ac
cpu_step_result_MUX_uxn_c_l74_c7_31ac : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l74_c7_31ac_cond,
cpu_step_result_MUX_uxn_c_l74_c7_31ac_iftrue,
cpu_step_result_MUX_uxn_c_l74_c7_31ac_iffalse,
cpu_step_result_MUX_uxn_c_l74_c7_31ac_return_output);

-- printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f
printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f : entity work.printf_uxn_c_l78_c3_f08f_0CLK_de264c78 port map (
printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_CLOCK_ENABLE,
printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg0,
printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg1,
printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg2);

-- BIN_OP_EQ_uxn_c_l80_c11_d717
BIN_OP_EQ_uxn_c_l80_c11_d717 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l80_c11_d717_left,
BIN_OP_EQ_uxn_c_l80_c11_d717_right,
BIN_OP_EQ_uxn_c_l80_c11_d717_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_return_output);

-- is_ins_done_MUX_uxn_c_l80_c7_d7d5
is_ins_done_MUX_uxn_c_l80_c7_d7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l80_c7_d7d5_cond,
is_ins_done_MUX_uxn_c_l80_c7_d7d5_iftrue,
is_ins_done_MUX_uxn_c_l80_c7_d7d5_iffalse,
is_ins_done_MUX_uxn_c_l80_c7_d7d5_return_output);

-- pc_MUX_uxn_c_l80_c7_d7d5
pc_MUX_uxn_c_l80_c7_d7d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l80_c7_d7d5_cond,
pc_MUX_uxn_c_l80_c7_d7d5_iftrue,
pc_MUX_uxn_c_l80_c7_d7d5_iffalse,
pc_MUX_uxn_c_l80_c7_d7d5_return_output);

-- ins_MUX_uxn_c_l80_c7_d7d5
ins_MUX_uxn_c_l80_c7_d7d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l80_c7_d7d5_cond,
ins_MUX_uxn_c_l80_c7_d7d5_iftrue,
ins_MUX_uxn_c_l80_c7_d7d5_iffalse,
ins_MUX_uxn_c_l80_c7_d7d5_return_output);

-- eval_opcode_result_MUX_uxn_c_l80_c7_d7d5
eval_opcode_result_MUX_uxn_c_l80_c7_d7d5 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_cond,
eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_iftrue,
eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_iffalse,
eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_return_output);

-- cpu_step_result_MUX_uxn_c_l80_c7_d7d5
cpu_step_result_MUX_uxn_c_l80_c7_d7d5 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l80_c7_d7d5_cond,
cpu_step_result_MUX_uxn_c_l80_c7_d7d5_iftrue,
cpu_step_result_MUX_uxn_c_l80_c7_d7d5_iffalse,
cpu_step_result_MUX_uxn_c_l80_c7_d7d5_return_output);

-- BIN_OP_PLUS_uxn_c_l82_c3_e9ed
BIN_OP_PLUS_uxn_c_l82_c3_e9ed : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l82_c3_e9ed_left,
BIN_OP_PLUS_uxn_c_l82_c3_e9ed_right,
BIN_OP_PLUS_uxn_c_l82_c3_e9ed_return_output);

-- printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7
printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7 : entity work.printf_uxn_c_l83_c3_b5c7_0CLK_de264c78 port map (
printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_CLOCK_ENABLE,
printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg0,
printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg1,
printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg2);

-- BIN_OP_MINUS_uxn_c_l86_c43_4c9d
BIN_OP_MINUS_uxn_c_l86_c43_4c9d : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l86_c43_4c9d_left,
BIN_OP_MINUS_uxn_c_l86_c43_4c9d_right,
BIN_OP_MINUS_uxn_c_l86_c43_4c9d_return_output);

-- eval_opcode_phased_uxn_c_l86_c24_9dac
eval_opcode_phased_uxn_c_l86_c24_9dac : entity work.eval_opcode_phased_0CLK_9a3ffac5 port map (
clk,
eval_opcode_phased_uxn_c_l86_c24_9dac_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l86_c24_9dac_phase,
eval_opcode_phased_uxn_c_l86_c24_9dac_ins,
eval_opcode_phased_uxn_c_l86_c24_9dac_pc,
eval_opcode_phased_uxn_c_l86_c24_9dac_previous_ram_read,
eval_opcode_phased_uxn_c_l86_c24_9dac_return_output);

-- MUX_uxn_c_l87_c8_c7d3
MUX_uxn_c_l87_c8_c7d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l87_c8_c7d3_cond,
MUX_uxn_c_l87_c8_c7d3_iftrue,
MUX_uxn_c_l87_c8_c7d3_iffalse,
MUX_uxn_c_l87_c8_c7d3_return_output);

-- printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd
printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd : entity work.printf_uxn_c_l96_c3_34fd_0CLK_de264c78 port map (
printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_CLOCK_ENABLE,
printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg0,
printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg1,
printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg2);

-- BIN_OP_EQ_uxn_c_l99_c6_21df
BIN_OP_EQ_uxn_c_l99_c6_21df : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l99_c6_21df_left,
BIN_OP_EQ_uxn_c_l99_c6_21df_right,
BIN_OP_EQ_uxn_c_l99_c6_21df_return_output);

-- step_cpu_phase_MUX_uxn_c_l99_c2_95b1
step_cpu_phase_MUX_uxn_c_l99_c2_95b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l99_c2_95b1_cond,
step_cpu_phase_MUX_uxn_c_l99_c2_95b1_iftrue,
step_cpu_phase_MUX_uxn_c_l99_c2_95b1_iffalse,
step_cpu_phase_MUX_uxn_c_l99_c2_95b1_return_output);

-- BIN_OP_PLUS_uxn_c_l102_c3_764d
BIN_OP_PLUS_uxn_c_l102_c3_764d : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l102_c3_764d_left,
BIN_OP_PLUS_uxn_c_l102_c3_764d_right,
BIN_OP_PLUS_uxn_c_l102_c3_764d_return_output);



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
 BIN_OP_EQ_uxn_c_l68_c6_5f02_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_return_output,
 is_ins_done_MUX_uxn_c_l68_c2_062b_return_output,
 pc_MUX_uxn_c_l68_c2_062b_return_output,
 ins_MUX_uxn_c_l68_c2_062b_return_output,
 eval_opcode_result_MUX_uxn_c_l68_c2_062b_return_output,
 cpu_step_result_MUX_uxn_c_l68_c2_062b_return_output,
 BIN_OP_EQ_uxn_c_l74_c11_e0dd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_return_output,
 is_ins_done_MUX_uxn_c_l74_c7_31ac_return_output,
 pc_MUX_uxn_c_l74_c7_31ac_return_output,
 ins_MUX_uxn_c_l74_c7_31ac_return_output,
 eval_opcode_result_MUX_uxn_c_l74_c7_31ac_return_output,
 cpu_step_result_MUX_uxn_c_l74_c7_31ac_return_output,
 BIN_OP_EQ_uxn_c_l80_c11_d717_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_return_output,
 is_ins_done_MUX_uxn_c_l80_c7_d7d5_return_output,
 pc_MUX_uxn_c_l80_c7_d7d5_return_output,
 ins_MUX_uxn_c_l80_c7_d7d5_return_output,
 eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_return_output,
 cpu_step_result_MUX_uxn_c_l80_c7_d7d5_return_output,
 BIN_OP_PLUS_uxn_c_l82_c3_e9ed_return_output,
 BIN_OP_MINUS_uxn_c_l86_c43_4c9d_return_output,
 eval_opcode_phased_uxn_c_l86_c24_9dac_return_output,
 MUX_uxn_c_l87_c8_c7d3_return_output,
 BIN_OP_EQ_uxn_c_l99_c6_21df_return_output,
 step_cpu_phase_MUX_uxn_c_l99_c2_95b1_return_output,
 BIN_OP_PLUS_uxn_c_l102_c3_764d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_ram_read_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_5f02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_5f02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_5f02_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_062b_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_062b_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_31ac_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_062b_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_062b_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_062b_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_062b_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_31ac_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_062b_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_062b_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_062b_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_062b_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_31ac_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_062b_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_062b_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_062b_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_062b_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_31ac_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_062b_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_062b_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_062b_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_062b_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_062b_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_31ac_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_062b_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_062b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c11_e0dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c11_e0dd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c11_e0dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_31ac_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_31ac_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_d7d5_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c7_31ac_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_31ac_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_31ac_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_d7d5_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c7_31ac_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_31ac_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_31ac_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_d7d5_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c7_31ac_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_31ac_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_31ac_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l74_c7_31ac_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_31ac_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l74_c7_31ac_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_31ac_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_d7d5_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c7_31ac_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l80_c11_d717_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l80_c11_d717_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l80_c11_d717_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_d7d5_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_d7d5_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_d7d5_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_d7d5_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l82_c3_9367 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_d7d5_iffalse : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l87_c3_9c42 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_d7d5_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_d7d5_iftrue : unsigned(7 downto 0);
 variable VAR_ins_uxn_c_l81_c3_2924 : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_d7d5_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_d7d5_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_d7d5_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_d7d5_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l80_c7_d7d5_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l80_c7_d7d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_e9ed_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_e9ed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_e9ed_return_output : unsigned(16 downto 0);
 variable VAR_printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg2 : unsigned(31 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c43_4c9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c43_4c9d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c43_4c9d_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l87_c8_c7d3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_c7d3_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_c7d3_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_d1e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l87_c43_a4b4_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_c7d3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l88_c33_5fa9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_883f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l90_c33_7081_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l91_c31_8c6b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l92_c35_d310_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l93_c34_a07d_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l94_c32_80db_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l95_c17_ef83_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c6_21df_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c6_21df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c6_21df_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_95b1_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l100_c3_f4bc : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_95b1_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l102_c3_5bda : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_95b1_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_95b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c3_764d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c3_764d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c3_764d_return_output : unsigned(8 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_iffalse := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l68_c2_062b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l102_c3_764d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l68_c6_5f02_right := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l100_c3_f4bc := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_95b1_iftrue := VAR_step_cpu_phase_uxn_c_l100_c3_f4bc;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l74_c11_e0dd_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_e9ed_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l99_c6_21df_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l80_c11_d717_right := to_unsigned(2, 2);
     VAR_BIN_OP_MINUS_uxn_c_l86_c43_4c9d_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_iffalse := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l74_c7_31ac_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ram_read_value := ram_read_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_iftrue := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_d7d5_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_062b_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_31ac_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_iftrue := eval_opcode_result;
     VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_ins := ins;
     VAR_ins_MUX_uxn_c_l68_c2_062b_iftrue := ins;
     VAR_ins_MUX_uxn_c_l74_c7_31ac_iftrue := ins;
     VAR_ins_MUX_uxn_c_l80_c7_d7d5_iffalse := ins;
     VAR_printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg2 := resize(ins, 32);
     VAR_printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg2 := resize(ins, 32);
     VAR_is_ins_done_MUX_uxn_c_l80_c7_d7d5_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_e9ed_left := pc;
     VAR_MUX_uxn_c_l87_c8_c7d3_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_pc := pc;
     VAR_pc_MUX_uxn_c_l68_c2_062b_iftrue := pc;
     VAR_pc_MUX_uxn_c_l74_c7_31ac_iftrue := pc;
     VAR_printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_arg1 := resize(pc, 32);
     VAR_printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg1 := resize(pc, 32);
     VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_previous_ram_read := VAR_ram_read_value;
     VAR_ins_uxn_c_l81_c3_2924 := VAR_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l68_c6_5f02_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l74_c11_e0dd_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l80_c11_d717_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l86_c43_4c9d_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l102_c3_764d_left := step_cpu_phase;
     VAR_printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg0 := resize(step_cpu_phase, 32);
     VAR_ins_MUX_uxn_c_l80_c7_d7d5_iftrue := VAR_ins_uxn_c_l81_c3_2924;
     VAR_printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg2 := resize(VAR_ins_uxn_c_l81_c3_2924, 32);
     -- BIN_OP_MINUS[uxn_c_l86_c43_4c9d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l86_c43_4c9d_left <= VAR_BIN_OP_MINUS_uxn_c_l86_c43_4c9d_left;
     BIN_OP_MINUS_uxn_c_l86_c43_4c9d_right <= VAR_BIN_OP_MINUS_uxn_c_l86_c43_4c9d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l86_c43_4c9d_return_output := BIN_OP_MINUS_uxn_c_l86_c43_4c9d_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l74_c7_31ac] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l74_c7_31ac_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l68_c2_062b] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_062b_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- BIN_OP_EQ[uxn_c_l80_c11_d717] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l80_c11_d717_left <= VAR_BIN_OP_EQ_uxn_c_l80_c11_d717_left;
     BIN_OP_EQ_uxn_c_l80_c11_d717_right <= VAR_BIN_OP_EQ_uxn_c_l80_c11_d717_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l80_c11_d717_return_output := BIN_OP_EQ_uxn_c_l80_c11_d717_return_output;

     -- BIN_OP_PLUS[uxn_c_l82_c3_e9ed] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l82_c3_e9ed_left <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_e9ed_left;
     BIN_OP_PLUS_uxn_c_l82_c3_e9ed_right <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_e9ed_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_e9ed_return_output := BIN_OP_PLUS_uxn_c_l82_c3_e9ed_return_output;

     -- BIN_OP_EQ[uxn_c_l68_c6_5f02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l68_c6_5f02_left <= VAR_BIN_OP_EQ_uxn_c_l68_c6_5f02_left;
     BIN_OP_EQ_uxn_c_l68_c6_5f02_right <= VAR_BIN_OP_EQ_uxn_c_l68_c6_5f02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l68_c6_5f02_return_output := BIN_OP_EQ_uxn_c_l68_c6_5f02_return_output;

     -- BIN_OP_PLUS[uxn_c_l102_c3_764d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l102_c3_764d_left <= VAR_BIN_OP_PLUS_uxn_c_l102_c3_764d_left;
     BIN_OP_PLUS_uxn_c_l102_c3_764d_right <= VAR_BIN_OP_PLUS_uxn_c_l102_c3_764d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l102_c3_764d_return_output := BIN_OP_PLUS_uxn_c_l102_c3_764d_return_output;

     -- BIN_OP_EQ[uxn_c_l74_c11_e0dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l74_c11_e0dd_left <= VAR_BIN_OP_EQ_uxn_c_l74_c11_e0dd_left;
     BIN_OP_EQ_uxn_c_l74_c11_e0dd_right <= VAR_BIN_OP_EQ_uxn_c_l74_c11_e0dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l74_c11_e0dd_return_output := BIN_OP_EQ_uxn_c_l74_c11_e0dd_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_5f02_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_5f02_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_062b_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_5f02_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_062b_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_5f02_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_062b_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_5f02_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_062b_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_5f02_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_062b_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_5f02_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_e0dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_e0dd_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_31ac_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_e0dd_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_31ac_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_e0dd_return_output;
     VAR_ins_MUX_uxn_c_l74_c7_31ac_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_e0dd_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c7_31ac_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_e0dd_return_output;
     VAR_pc_MUX_uxn_c_l74_c7_31ac_cond := VAR_BIN_OP_EQ_uxn_c_l74_c11_e0dd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_d717_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_d717_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_d7d5_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_d717_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_d717_return_output;
     VAR_ins_MUX_uxn_c_l80_c7_d7d5_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_d717_return_output;
     VAR_is_ins_done_MUX_uxn_c_l80_c7_d7d5_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_d717_return_output;
     VAR_pc_MUX_uxn_c_l80_c7_d7d5_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_d717_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_phase := VAR_BIN_OP_MINUS_uxn_c_l86_c43_4c9d_return_output;
     VAR_step_cpu_phase_uxn_c_l102_c3_5bda := resize(VAR_BIN_OP_PLUS_uxn_c_l102_c3_764d_return_output, 8);
     VAR_pc_uxn_c_l82_c3_9367 := resize(VAR_BIN_OP_PLUS_uxn_c_l82_c3_e9ed_return_output, 16);
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_062b_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_062b_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_31ac_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l74_c7_31ac_return_output;
     VAR_pc_MUX_uxn_c_l80_c7_d7d5_iftrue := VAR_pc_uxn_c_l82_c3_9367;
     VAR_printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg1 := resize(VAR_pc_uxn_c_l82_c3_9367, 32);
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_95b1_iffalse := VAR_step_cpu_phase_uxn_c_l102_c3_5bda;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_ebcd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_return_output;

     -- ins_MUX[uxn_c_l80_c7_d7d5] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l80_c7_d7d5_cond <= VAR_ins_MUX_uxn_c_l80_c7_d7d5_cond;
     ins_MUX_uxn_c_l80_c7_d7d5_iftrue <= VAR_ins_MUX_uxn_c_l80_c7_d7d5_iftrue;
     ins_MUX_uxn_c_l80_c7_d7d5_iffalse <= VAR_ins_MUX_uxn_c_l80_c7_d7d5_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l80_c7_d7d5_return_output := ins_MUX_uxn_c_l80_c7_d7d5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l74_c7_31ac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c7_31ac_return_output;
     VAR_printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_ebcd_return_output;
     VAR_ins_MUX_uxn_c_l74_c7_31ac_iffalse := VAR_ins_MUX_uxn_c_l80_c7_d7d5_return_output;
     -- ins_MUX[uxn_c_l74_c7_31ac] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l74_c7_31ac_cond <= VAR_ins_MUX_uxn_c_l74_c7_31ac_cond;
     ins_MUX_uxn_c_l74_c7_31ac_iftrue <= VAR_ins_MUX_uxn_c_l74_c7_31ac_iftrue;
     ins_MUX_uxn_c_l74_c7_31ac_iffalse <= VAR_ins_MUX_uxn_c_l74_c7_31ac_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l74_c7_31ac_return_output := ins_MUX_uxn_c_l74_c7_31ac_return_output;

     -- printf_uxn_c_l72_c3_6822[uxn_c_l72_c3_6822] LATENCY=0
     -- Clock enable
     printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_CLOCK_ENABLE <= VAR_printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_arg0 <= VAR_printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_arg0;
     printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_arg1 <= VAR_printf_uxn_c_l72_c3_6822_uxn_c_l72_c3_6822_arg1;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c7_d7d5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l74_c1_b1db] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_d7d5_return_output;
     VAR_printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_b1db_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_062b_iffalse := VAR_ins_MUX_uxn_c_l74_c7_31ac_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_71c0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_return_output;

     -- ins_MUX[uxn_c_l68_c2_062b] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l68_c2_062b_cond <= VAR_ins_MUX_uxn_c_l68_c2_062b_cond;
     ins_MUX_uxn_c_l68_c2_062b_iftrue <= VAR_ins_MUX_uxn_c_l68_c2_062b_iftrue;
     ins_MUX_uxn_c_l68_c2_062b_iffalse <= VAR_ins_MUX_uxn_c_l68_c2_062b_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l68_c2_062b_return_output := ins_MUX_uxn_c_l68_c2_062b_return_output;

     -- printf_uxn_c_l78_c3_f08f[uxn_c_l78_c3_f08f] LATENCY=0
     -- Clock enable
     printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_CLOCK_ENABLE <= VAR_printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg0 <= VAR_printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg0;
     printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg1 <= VAR_printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg1;
     printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg2 <= VAR_printf_uxn_c_l78_c3_f08f_uxn_c_l78_c3_f08f_arg2;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_3b5b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_return_output;

     -- Submodule level 4
     VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_return_output;
     VAR_printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3b5b_return_output;
     VAR_printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_71c0_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l68_c2_062b_return_output;
     -- printf_uxn_c_l83_c3_b5c7[uxn_c_l83_c3_b5c7] LATENCY=0
     -- Clock enable
     printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_CLOCK_ENABLE <= VAR_printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg0 <= VAR_printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg0;
     printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg1 <= VAR_printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg1;
     printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg2 <= VAR_printf_uxn_c_l83_c3_b5c7_uxn_c_l83_c3_b5c7_arg2;
     -- Outputs

     -- eval_opcode_phased[uxn_c_l86_c24_9dac] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l86_c24_9dac_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l86_c24_9dac_phase <= VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_phase;
     eval_opcode_phased_uxn_c_l86_c24_9dac_ins <= VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_ins;
     eval_opcode_phased_uxn_c_l86_c24_9dac_pc <= VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_pc;
     eval_opcode_phased_uxn_c_l86_c24_9dac_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_previous_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_return_output := eval_opcode_phased_uxn_c_l86_c24_9dac_return_output;

     -- Submodule level 5
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_iffalse := VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d[uxn_c_l88_c33_5fa9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l88_c33_5fa9_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_return_output.is_ram_read;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l89_c34_883f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_883f_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l87_c8_d1e9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_d1e9_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_return_output.is_pc_updated;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d[uxn_c_l91_c31_8c6b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l91_c31_8c6b_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_return_output.ram_value;

     -- CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d[uxn_c_l94_c32_80db] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l94_c32_80db_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_return_output.vram_value;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l93_c34_a07d] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l93_c34_a07d_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l95_c17_ef83] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l95_c17_ef83_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l92_c35_d310] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l92_c35_d310_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_return_output.is_vram_write;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d[uxn_c_l90_c33_7081] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l90_c33_7081_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_return_output.ram_addr;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d[uxn_c_l87_c43_a4b4] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l87_c43_a4b4_return_output := VAR_eval_opcode_phased_uxn_c_l86_c24_9dac_return_output.pc;

     -- eval_opcode_result_MUX[uxn_c_l80_c7_d7d5] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_cond <= VAR_eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_cond;
     eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_iftrue;
     eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_return_output := eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l87_c8_c7d3_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l87_c43_a4b4_return_output;
     VAR_is_ins_done_MUX_uxn_c_l80_c7_d7d5_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l95_c17_ef83_return_output;
     VAR_MUX_uxn_c_l87_c8_c7d3_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_d1e9_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_31ac_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l80_c7_d7d5_return_output;
     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70[uxn_c_l80_c7_d7d5] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l80_c7_d7d5_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l88_c33_5fa9_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_883f_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l90_c33_7081_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l91_c31_8c6b_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l92_c35_d310_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l93_c34_a07d_return_output,
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l94_c32_80db_return_output);

     -- is_ins_done_MUX[uxn_c_l80_c7_d7d5] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l80_c7_d7d5_cond <= VAR_is_ins_done_MUX_uxn_c_l80_c7_d7d5_cond;
     is_ins_done_MUX_uxn_c_l80_c7_d7d5_iftrue <= VAR_is_ins_done_MUX_uxn_c_l80_c7_d7d5_iftrue;
     is_ins_done_MUX_uxn_c_l80_c7_d7d5_iffalse <= VAR_is_ins_done_MUX_uxn_c_l80_c7_d7d5_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l80_c7_d7d5_return_output := is_ins_done_MUX_uxn_c_l80_c7_d7d5_return_output;

     -- eval_opcode_result_MUX[uxn_c_l74_c7_31ac] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l74_c7_31ac_cond <= VAR_eval_opcode_result_MUX_uxn_c_l74_c7_31ac_cond;
     eval_opcode_result_MUX_uxn_c_l74_c7_31ac_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l74_c7_31ac_iftrue;
     eval_opcode_result_MUX_uxn_c_l74_c7_31ac_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l74_c7_31ac_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l74_c7_31ac_return_output := eval_opcode_result_MUX_uxn_c_l74_c7_31ac_return_output;

     -- MUX[uxn_c_l87_c8_c7d3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l87_c8_c7d3_cond <= VAR_MUX_uxn_c_l87_c8_c7d3_cond;
     MUX_uxn_c_l87_c8_c7d3_iftrue <= VAR_MUX_uxn_c_l87_c8_c7d3_iftrue;
     MUX_uxn_c_l87_c8_c7d3_iffalse <= VAR_MUX_uxn_c_l87_c8_c7d3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l87_c8_c7d3_return_output := MUX_uxn_c_l87_c8_c7d3_return_output;

     -- Submodule level 7
     VAR_pc_uxn_c_l87_c3_9c42 := VAR_MUX_uxn_c_l87_c8_c7d3_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_d7d5_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l80_c7_d7d5_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_062b_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l74_c7_31ac_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c7_31ac_iffalse := VAR_is_ins_done_MUX_uxn_c_l80_c7_d7d5_return_output;
     VAR_pc_MUX_uxn_c_l80_c7_d7d5_iffalse := VAR_pc_uxn_c_l87_c3_9c42;
     VAR_printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg1 := resize(VAR_pc_uxn_c_l87_c3_9c42, 32);
     -- is_ins_done_MUX[uxn_c_l74_c7_31ac] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l74_c7_31ac_cond <= VAR_is_ins_done_MUX_uxn_c_l74_c7_31ac_cond;
     is_ins_done_MUX_uxn_c_l74_c7_31ac_iftrue <= VAR_is_ins_done_MUX_uxn_c_l74_c7_31ac_iftrue;
     is_ins_done_MUX_uxn_c_l74_c7_31ac_iffalse <= VAR_is_ins_done_MUX_uxn_c_l74_c7_31ac_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l74_c7_31ac_return_output := is_ins_done_MUX_uxn_c_l74_c7_31ac_return_output;

     -- eval_opcode_result_MUX[uxn_c_l68_c2_062b] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l68_c2_062b_cond <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_062b_cond;
     eval_opcode_result_MUX_uxn_c_l68_c2_062b_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_062b_iftrue;
     eval_opcode_result_MUX_uxn_c_l68_c2_062b_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_062b_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_062b_return_output := eval_opcode_result_MUX_uxn_c_l68_c2_062b_return_output;

     -- pc_MUX[uxn_c_l80_c7_d7d5] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l80_c7_d7d5_cond <= VAR_pc_MUX_uxn_c_l80_c7_d7d5_cond;
     pc_MUX_uxn_c_l80_c7_d7d5_iftrue <= VAR_pc_MUX_uxn_c_l80_c7_d7d5_iftrue;
     pc_MUX_uxn_c_l80_c7_d7d5_iffalse <= VAR_pc_MUX_uxn_c_l80_c7_d7d5_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l80_c7_d7d5_return_output := pc_MUX_uxn_c_l80_c7_d7d5_return_output;

     -- printf_uxn_c_l96_c3_34fd[uxn_c_l96_c3_34fd] LATENCY=0
     -- Clock enable
     printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_CLOCK_ENABLE <= VAR_printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg0 <= VAR_printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg0;
     printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg1 <= VAR_printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg1;
     printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg2 <= VAR_printf_uxn_c_l96_c3_34fd_uxn_c_l96_c3_34fd_arg2;
     -- Outputs

     -- cpu_step_result_MUX[uxn_c_l80_c7_d7d5] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l80_c7_d7d5_cond <= VAR_cpu_step_result_MUX_uxn_c_l80_c7_d7d5_cond;
     cpu_step_result_MUX_uxn_c_l80_c7_d7d5_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l80_c7_d7d5_iftrue;
     cpu_step_result_MUX_uxn_c_l80_c7_d7d5_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l80_c7_d7d5_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l80_c7_d7d5_return_output := cpu_step_result_MUX_uxn_c_l80_c7_d7d5_return_output;

     -- Submodule level 8
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_31ac_iffalse := VAR_cpu_step_result_MUX_uxn_c_l80_c7_d7d5_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l68_c2_062b_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_062b_iffalse := VAR_is_ins_done_MUX_uxn_c_l74_c7_31ac_return_output;
     VAR_pc_MUX_uxn_c_l74_c7_31ac_iffalse := VAR_pc_MUX_uxn_c_l80_c7_d7d5_return_output;
     -- is_ins_done_MUX[uxn_c_l68_c2_062b] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l68_c2_062b_cond <= VAR_is_ins_done_MUX_uxn_c_l68_c2_062b_cond;
     is_ins_done_MUX_uxn_c_l68_c2_062b_iftrue <= VAR_is_ins_done_MUX_uxn_c_l68_c2_062b_iftrue;
     is_ins_done_MUX_uxn_c_l68_c2_062b_iffalse <= VAR_is_ins_done_MUX_uxn_c_l68_c2_062b_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l68_c2_062b_return_output := is_ins_done_MUX_uxn_c_l68_c2_062b_return_output;

     -- pc_MUX[uxn_c_l74_c7_31ac] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l74_c7_31ac_cond <= VAR_pc_MUX_uxn_c_l74_c7_31ac_cond;
     pc_MUX_uxn_c_l74_c7_31ac_iftrue <= VAR_pc_MUX_uxn_c_l74_c7_31ac_iftrue;
     pc_MUX_uxn_c_l74_c7_31ac_iffalse <= VAR_pc_MUX_uxn_c_l74_c7_31ac_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l74_c7_31ac_return_output := pc_MUX_uxn_c_l74_c7_31ac_return_output;

     -- cpu_step_result_MUX[uxn_c_l74_c7_31ac] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l74_c7_31ac_cond <= VAR_cpu_step_result_MUX_uxn_c_l74_c7_31ac_cond;
     cpu_step_result_MUX_uxn_c_l74_c7_31ac_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l74_c7_31ac_iftrue;
     cpu_step_result_MUX_uxn_c_l74_c7_31ac_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l74_c7_31ac_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l74_c7_31ac_return_output := cpu_step_result_MUX_uxn_c_l74_c7_31ac_return_output;

     -- Submodule level 9
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_062b_iffalse := VAR_cpu_step_result_MUX_uxn_c_l74_c7_31ac_return_output;
     VAR_BIN_OP_EQ_uxn_c_l99_c6_21df_left := VAR_is_ins_done_MUX_uxn_c_l68_c2_062b_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l68_c2_062b_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_062b_iffalse := VAR_pc_MUX_uxn_c_l74_c7_31ac_return_output;
     -- pc_MUX[uxn_c_l68_c2_062b] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l68_c2_062b_cond <= VAR_pc_MUX_uxn_c_l68_c2_062b_cond;
     pc_MUX_uxn_c_l68_c2_062b_iftrue <= VAR_pc_MUX_uxn_c_l68_c2_062b_iftrue;
     pc_MUX_uxn_c_l68_c2_062b_iffalse <= VAR_pc_MUX_uxn_c_l68_c2_062b_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l68_c2_062b_return_output := pc_MUX_uxn_c_l68_c2_062b_return_output;

     -- BIN_OP_EQ[uxn_c_l99_c6_21df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l99_c6_21df_left <= VAR_BIN_OP_EQ_uxn_c_l99_c6_21df_left;
     BIN_OP_EQ_uxn_c_l99_c6_21df_right <= VAR_BIN_OP_EQ_uxn_c_l99_c6_21df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l99_c6_21df_return_output := BIN_OP_EQ_uxn_c_l99_c6_21df_return_output;

     -- cpu_step_result_MUX[uxn_c_l68_c2_062b] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l68_c2_062b_cond <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_062b_cond;
     cpu_step_result_MUX_uxn_c_l68_c2_062b_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_062b_iftrue;
     cpu_step_result_MUX_uxn_c_l68_c2_062b_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_062b_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_062b_return_output := cpu_step_result_MUX_uxn_c_l68_c2_062b_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_95b1_cond := VAR_BIN_OP_EQ_uxn_c_l99_c6_21df_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l68_c2_062b_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l68_c2_062b_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l68_c2_062b_return_output;
     -- step_cpu_phase_MUX[uxn_c_l99_c2_95b1] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l99_c2_95b1_cond <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_95b1_cond;
     step_cpu_phase_MUX_uxn_c_l99_c2_95b1_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_95b1_iftrue;
     step_cpu_phase_MUX_uxn_c_l99_c2_95b1_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_95b1_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_95b1_return_output := step_cpu_phase_MUX_uxn_c_l99_c2_95b1_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l99_c2_95b1_return_output;
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
