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
-- BIN_OP_EQ[uxn_c_l68_c6_9313]
signal BIN_OP_EQ_uxn_c_l68_c6_9313_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_9313_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_9313_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_4827]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l75_c7_b177]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l68_c2_c327]
signal is_ins_done_MUX_uxn_c_l68_c2_c327_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_c327_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_c327_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_c327_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l68_c2_c327]
signal eval_opcode_result_MUX_uxn_c_l68_c2_c327_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l68_c2_c327_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_c327_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_c327_return_output : eval_opcode_result_t;

-- ins_MUX[uxn_c_l68_c2_c327]
signal ins_MUX_uxn_c_l68_c2_c327_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l68_c2_c327_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_c327_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_c327_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l68_c2_c327]
signal pc_MUX_uxn_c_l68_c2_c327_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l68_c2_c327_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_c327_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_c327_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l68_c2_c327]
signal cpu_step_result_MUX_uxn_c_l68_c2_c327_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l68_c2_c327_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_c327_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_c327_return_output : cpu_step_result_t;

-- printf_uxn_c_l73_c3_0d94[uxn_c_l73_c3_0d94]
signal printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c11_3080]
signal BIN_OP_EQ_uxn_c_l75_c11_3080_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c11_3080_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c11_3080_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l75_c1_716a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l83_c7_4375]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l75_c7_b177]
signal is_ins_done_MUX_uxn_c_l75_c7_b177_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c7_b177_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c7_b177_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c7_b177_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l75_c7_b177]
signal eval_opcode_result_MUX_uxn_c_l75_c7_b177_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l75_c7_b177_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l75_c7_b177_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l75_c7_b177_return_output : eval_opcode_result_t;

-- ins_MUX[uxn_c_l75_c7_b177]
signal ins_MUX_uxn_c_l75_c7_b177_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l75_c7_b177_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c7_b177_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c7_b177_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l75_c7_b177]
signal pc_MUX_uxn_c_l75_c7_b177_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l75_c7_b177_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c7_b177_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c7_b177_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l75_c7_b177]
signal cpu_step_result_MUX_uxn_c_l75_c7_b177_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l75_c7_b177_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c7_b177_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c7_b177_return_output : cpu_step_result_t;

-- printf_uxn_c_l81_c3_824b[uxn_c_l81_c3_824b]
signal printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l83_c11_def5]
signal BIN_OP_EQ_uxn_c_l83_c11_def5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l83_c11_def5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l83_c11_def5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l83_c1_61a4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l88_c1_2893]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l83_c7_4375]
signal is_ins_done_MUX_uxn_c_l83_c7_4375_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l83_c7_4375_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l83_c7_4375_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l83_c7_4375_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l83_c7_4375]
signal eval_opcode_result_MUX_uxn_c_l83_c7_4375_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l83_c7_4375_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l83_c7_4375_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l83_c7_4375_return_output : eval_opcode_result_t;

-- ins_MUX[uxn_c_l83_c7_4375]
signal ins_MUX_uxn_c_l83_c7_4375_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l83_c7_4375_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l83_c7_4375_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l83_c7_4375_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l83_c7_4375]
signal pc_MUX_uxn_c_l83_c7_4375_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l83_c7_4375_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l83_c7_4375_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l83_c7_4375_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l83_c7_4375]
signal cpu_step_result_MUX_uxn_c_l83_c7_4375_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l83_c7_4375_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l83_c7_4375_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l83_c7_4375_return_output : cpu_step_result_t;

-- BIN_OP_PLUS[uxn_c_l85_c3_4d2b]
signal BIN_OP_PLUS_uxn_c_l85_c3_4d2b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l85_c3_4d2b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l85_c3_4d2b_return_output : unsigned(16 downto 0);

-- printf_uxn_c_l86_c3_5ef0[uxn_c_l86_c3_5ef0]
signal printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg2 : unsigned(31 downto 0);

-- BIN_OP_MINUS[uxn_c_l89_c43_88aa]
signal BIN_OP_MINUS_uxn_c_l89_c43_88aa_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l89_c43_88aa_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l89_c43_88aa_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l89_c24_5222]
signal eval_opcode_phased_uxn_c_l89_c24_5222_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_5222_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_5222_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_5222_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_5222_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_5222_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l90_c8_18b9]
signal MUX_uxn_c_l90_c8_18b9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l90_c8_18b9_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l90_c8_18b9_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l90_c8_18b9_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l99_c3_ceb6[uxn_c_l99_c3_ceb6]
signal printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l102_c6_0ce1]
signal BIN_OP_EQ_uxn_c_l102_c6_0ce1_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c6_0ce1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c6_0ce1_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l102_c2_f9c4]
signal step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l105_c3_b7d6]
signal BIN_OP_PLUS_uxn_c_l105_c3_b7d6_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l105_c3_b7d6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l105_c3_b7d6_return_output : unsigned(8 downto 0);

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
-- BIN_OP_EQ_uxn_c_l68_c6_9313
BIN_OP_EQ_uxn_c_l68_c6_9313 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l68_c6_9313_left,
BIN_OP_EQ_uxn_c_l68_c6_9313_right,
BIN_OP_EQ_uxn_c_l68_c6_9313_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_return_output);

-- is_ins_done_MUX_uxn_c_l68_c2_c327
is_ins_done_MUX_uxn_c_l68_c2_c327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l68_c2_c327_cond,
is_ins_done_MUX_uxn_c_l68_c2_c327_iftrue,
is_ins_done_MUX_uxn_c_l68_c2_c327_iffalse,
is_ins_done_MUX_uxn_c_l68_c2_c327_return_output);

-- eval_opcode_result_MUX_uxn_c_l68_c2_c327
eval_opcode_result_MUX_uxn_c_l68_c2_c327 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l68_c2_c327_cond,
eval_opcode_result_MUX_uxn_c_l68_c2_c327_iftrue,
eval_opcode_result_MUX_uxn_c_l68_c2_c327_iffalse,
eval_opcode_result_MUX_uxn_c_l68_c2_c327_return_output);

-- ins_MUX_uxn_c_l68_c2_c327
ins_MUX_uxn_c_l68_c2_c327 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l68_c2_c327_cond,
ins_MUX_uxn_c_l68_c2_c327_iftrue,
ins_MUX_uxn_c_l68_c2_c327_iffalse,
ins_MUX_uxn_c_l68_c2_c327_return_output);

-- pc_MUX_uxn_c_l68_c2_c327
pc_MUX_uxn_c_l68_c2_c327 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l68_c2_c327_cond,
pc_MUX_uxn_c_l68_c2_c327_iftrue,
pc_MUX_uxn_c_l68_c2_c327_iffalse,
pc_MUX_uxn_c_l68_c2_c327_return_output);

-- cpu_step_result_MUX_uxn_c_l68_c2_c327
cpu_step_result_MUX_uxn_c_l68_c2_c327 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l68_c2_c327_cond,
cpu_step_result_MUX_uxn_c_l68_c2_c327_iftrue,
cpu_step_result_MUX_uxn_c_l68_c2_c327_iffalse,
cpu_step_result_MUX_uxn_c_l68_c2_c327_return_output);

-- printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94
printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94 : entity work.printf_uxn_c_l73_c3_0d94_0CLK_de264c78 port map (
printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_CLOCK_ENABLE,
printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_arg0,
printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_arg1);

-- BIN_OP_EQ_uxn_c_l75_c11_3080
BIN_OP_EQ_uxn_c_l75_c11_3080 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c11_3080_left,
BIN_OP_EQ_uxn_c_l75_c11_3080_right,
BIN_OP_EQ_uxn_c_l75_c11_3080_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_return_output);

-- is_ins_done_MUX_uxn_c_l75_c7_b177
is_ins_done_MUX_uxn_c_l75_c7_b177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l75_c7_b177_cond,
is_ins_done_MUX_uxn_c_l75_c7_b177_iftrue,
is_ins_done_MUX_uxn_c_l75_c7_b177_iffalse,
is_ins_done_MUX_uxn_c_l75_c7_b177_return_output);

-- eval_opcode_result_MUX_uxn_c_l75_c7_b177
eval_opcode_result_MUX_uxn_c_l75_c7_b177 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l75_c7_b177_cond,
eval_opcode_result_MUX_uxn_c_l75_c7_b177_iftrue,
eval_opcode_result_MUX_uxn_c_l75_c7_b177_iffalse,
eval_opcode_result_MUX_uxn_c_l75_c7_b177_return_output);

-- ins_MUX_uxn_c_l75_c7_b177
ins_MUX_uxn_c_l75_c7_b177 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l75_c7_b177_cond,
ins_MUX_uxn_c_l75_c7_b177_iftrue,
ins_MUX_uxn_c_l75_c7_b177_iffalse,
ins_MUX_uxn_c_l75_c7_b177_return_output);

-- pc_MUX_uxn_c_l75_c7_b177
pc_MUX_uxn_c_l75_c7_b177 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l75_c7_b177_cond,
pc_MUX_uxn_c_l75_c7_b177_iftrue,
pc_MUX_uxn_c_l75_c7_b177_iffalse,
pc_MUX_uxn_c_l75_c7_b177_return_output);

-- cpu_step_result_MUX_uxn_c_l75_c7_b177
cpu_step_result_MUX_uxn_c_l75_c7_b177 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l75_c7_b177_cond,
cpu_step_result_MUX_uxn_c_l75_c7_b177_iftrue,
cpu_step_result_MUX_uxn_c_l75_c7_b177_iffalse,
cpu_step_result_MUX_uxn_c_l75_c7_b177_return_output);

-- printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b
printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b : entity work.printf_uxn_c_l81_c3_824b_0CLK_de264c78 port map (
printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_CLOCK_ENABLE,
printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg0,
printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg1,
printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg2);

-- BIN_OP_EQ_uxn_c_l83_c11_def5
BIN_OP_EQ_uxn_c_l83_c11_def5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l83_c11_def5_left,
BIN_OP_EQ_uxn_c_l83_c11_def5_right,
BIN_OP_EQ_uxn_c_l83_c11_def5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_return_output);

-- is_ins_done_MUX_uxn_c_l83_c7_4375
is_ins_done_MUX_uxn_c_l83_c7_4375 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l83_c7_4375_cond,
is_ins_done_MUX_uxn_c_l83_c7_4375_iftrue,
is_ins_done_MUX_uxn_c_l83_c7_4375_iffalse,
is_ins_done_MUX_uxn_c_l83_c7_4375_return_output);

-- eval_opcode_result_MUX_uxn_c_l83_c7_4375
eval_opcode_result_MUX_uxn_c_l83_c7_4375 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l83_c7_4375_cond,
eval_opcode_result_MUX_uxn_c_l83_c7_4375_iftrue,
eval_opcode_result_MUX_uxn_c_l83_c7_4375_iffalse,
eval_opcode_result_MUX_uxn_c_l83_c7_4375_return_output);

-- ins_MUX_uxn_c_l83_c7_4375
ins_MUX_uxn_c_l83_c7_4375 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l83_c7_4375_cond,
ins_MUX_uxn_c_l83_c7_4375_iftrue,
ins_MUX_uxn_c_l83_c7_4375_iffalse,
ins_MUX_uxn_c_l83_c7_4375_return_output);

-- pc_MUX_uxn_c_l83_c7_4375
pc_MUX_uxn_c_l83_c7_4375 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l83_c7_4375_cond,
pc_MUX_uxn_c_l83_c7_4375_iftrue,
pc_MUX_uxn_c_l83_c7_4375_iffalse,
pc_MUX_uxn_c_l83_c7_4375_return_output);

-- cpu_step_result_MUX_uxn_c_l83_c7_4375
cpu_step_result_MUX_uxn_c_l83_c7_4375 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l83_c7_4375_cond,
cpu_step_result_MUX_uxn_c_l83_c7_4375_iftrue,
cpu_step_result_MUX_uxn_c_l83_c7_4375_iffalse,
cpu_step_result_MUX_uxn_c_l83_c7_4375_return_output);

-- BIN_OP_PLUS_uxn_c_l85_c3_4d2b
BIN_OP_PLUS_uxn_c_l85_c3_4d2b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l85_c3_4d2b_left,
BIN_OP_PLUS_uxn_c_l85_c3_4d2b_right,
BIN_OP_PLUS_uxn_c_l85_c3_4d2b_return_output);

-- printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0
printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0 : entity work.printf_uxn_c_l86_c3_5ef0_0CLK_de264c78 port map (
printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_CLOCK_ENABLE,
printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg0,
printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg1,
printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg2);

-- BIN_OP_MINUS_uxn_c_l89_c43_88aa
BIN_OP_MINUS_uxn_c_l89_c43_88aa : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l89_c43_88aa_left,
BIN_OP_MINUS_uxn_c_l89_c43_88aa_right,
BIN_OP_MINUS_uxn_c_l89_c43_88aa_return_output);

-- eval_opcode_phased_uxn_c_l89_c24_5222
eval_opcode_phased_uxn_c_l89_c24_5222 : entity work.eval_opcode_phased_0CLK_50a1998d port map (
clk,
eval_opcode_phased_uxn_c_l89_c24_5222_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l89_c24_5222_phase,
eval_opcode_phased_uxn_c_l89_c24_5222_ins,
eval_opcode_phased_uxn_c_l89_c24_5222_pc,
eval_opcode_phased_uxn_c_l89_c24_5222_previous_ram_read,
eval_opcode_phased_uxn_c_l89_c24_5222_return_output);

-- MUX_uxn_c_l90_c8_18b9
MUX_uxn_c_l90_c8_18b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l90_c8_18b9_cond,
MUX_uxn_c_l90_c8_18b9_iftrue,
MUX_uxn_c_l90_c8_18b9_iffalse,
MUX_uxn_c_l90_c8_18b9_return_output);

-- printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6
printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6 : entity work.printf_uxn_c_l99_c3_ceb6_0CLK_de264c78 port map (
printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_CLOCK_ENABLE,
printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg0,
printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg1,
printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg2);

-- BIN_OP_EQ_uxn_c_l102_c6_0ce1
BIN_OP_EQ_uxn_c_l102_c6_0ce1 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l102_c6_0ce1_left,
BIN_OP_EQ_uxn_c_l102_c6_0ce1_right,
BIN_OP_EQ_uxn_c_l102_c6_0ce1_return_output);

-- step_cpu_phase_MUX_uxn_c_l102_c2_f9c4
step_cpu_phase_MUX_uxn_c_l102_c2_f9c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_cond,
step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_iftrue,
step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_iffalse,
step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_return_output);

-- BIN_OP_PLUS_uxn_c_l105_c3_b7d6
BIN_OP_PLUS_uxn_c_l105_c3_b7d6 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l105_c3_b7d6_left,
BIN_OP_PLUS_uxn_c_l105_c3_b7d6_right,
BIN_OP_PLUS_uxn_c_l105_c3_b7d6_return_output);



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
 BIN_OP_EQ_uxn_c_l68_c6_9313_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_return_output,
 is_ins_done_MUX_uxn_c_l68_c2_c327_return_output,
 eval_opcode_result_MUX_uxn_c_l68_c2_c327_return_output,
 ins_MUX_uxn_c_l68_c2_c327_return_output,
 pc_MUX_uxn_c_l68_c2_c327_return_output,
 cpu_step_result_MUX_uxn_c_l68_c2_c327_return_output,
 BIN_OP_EQ_uxn_c_l75_c11_3080_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_return_output,
 is_ins_done_MUX_uxn_c_l75_c7_b177_return_output,
 eval_opcode_result_MUX_uxn_c_l75_c7_b177_return_output,
 ins_MUX_uxn_c_l75_c7_b177_return_output,
 pc_MUX_uxn_c_l75_c7_b177_return_output,
 cpu_step_result_MUX_uxn_c_l75_c7_b177_return_output,
 BIN_OP_EQ_uxn_c_l83_c11_def5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_return_output,
 is_ins_done_MUX_uxn_c_l83_c7_4375_return_output,
 eval_opcode_result_MUX_uxn_c_l83_c7_4375_return_output,
 ins_MUX_uxn_c_l83_c7_4375_return_output,
 pc_MUX_uxn_c_l83_c7_4375_return_output,
 cpu_step_result_MUX_uxn_c_l83_c7_4375_return_output,
 BIN_OP_PLUS_uxn_c_l85_c3_4d2b_return_output,
 BIN_OP_MINUS_uxn_c_l89_c43_88aa_return_output,
 eval_opcode_phased_uxn_c_l89_c24_5222_return_output,
 MUX_uxn_c_l90_c8_18b9_return_output,
 BIN_OP_EQ_uxn_c_l102_c6_0ce1_return_output,
 step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_return_output,
 BIN_OP_PLUS_uxn_c_l105_c3_b7d6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_ram_read_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_9313_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_9313_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_9313_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_c327_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_c327_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_b177_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_c327_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_c327_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_c327_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_c327_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_b177_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_c327_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_c327_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_c327_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_c327_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_b177_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_c327_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_c327_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_c327_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_c327_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_b177_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_c327_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_c327_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_c327_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_c327_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_c327_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_b177_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_c327_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_c327_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c11_3080_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c11_3080_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c11_3080_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_b177_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_b177_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_4375_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_b177_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_b177_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_b177_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_4375_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_b177_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_b177_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_b177_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_4375_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_b177_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_b177_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_b177_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_4375_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_b177_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_b177_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l75_c7_b177_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_b177_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_4375_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_b177_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l83_c11_def5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l83_c11_def5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l83_c11_def5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_4375_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_4375_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_4375_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_4375_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_4375_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_4375_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_4375_iftrue : unsigned(7 downto 0);
 variable VAR_ins_uxn_c_l84_c3_d57d : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_4375_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_4375_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_4375_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l85_c3_ecfc : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_4375_iffalse : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l90_c3_ab27 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_4375_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_4375_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_4375_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l83_c7_4375_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_4375_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l85_c3_4d2b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l85_c3_4d2b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l85_c3_4d2b_return_output : unsigned(16 downto 0);
 variable VAR_printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg2 : unsigned(31 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_5222_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_5222_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_5222_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_5222_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l89_c43_88aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l89_c43_88aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l89_c43_88aa_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_5222_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_5222_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l90_c8_18b9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l90_c8_18b9_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l90_c8_18b9_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l90_c8_90d6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l90_c43_66f7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l90_c8_18b9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l91_c33_f2c3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l92_c34_099a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l93_c33_49d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l94_c31_5459_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l95_c35_4116_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l96_c34_bb86_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l97_c32_b10a_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l98_c17_4d55_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c6_0ce1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c6_0ce1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c6_0ce1_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l103_c3_f45f : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l105_c3_1530 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l105_c3_b7d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l105_c3_b7d6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l105_c3_b7d6_return_output : unsigned(8 downto 0);
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l75_c11_3080_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l102_c6_0ce1_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l105_c3_b7d6_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l83_c11_def5_right := to_unsigned(2, 2);
     VAR_is_ins_done_MUX_uxn_c_l68_c2_c327_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l68_c6_9313_right := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l75_c7_b177_iftrue := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l103_c3_f45f := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_iftrue := VAR_step_cpu_phase_uxn_c_l103_c3_f45f;
     VAR_BIN_OP_MINUS_uxn_c_l89_c43_88aa_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_c_l85_c3_4d2b_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ram_read_value := ram_read_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_iftrue := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_4375_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_c327_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_b177_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_4375_iftrue := eval_opcode_result;
     VAR_eval_opcode_phased_uxn_c_l89_c24_5222_ins := ins;
     VAR_ins_MUX_uxn_c_l68_c2_c327_iftrue := ins;
     VAR_ins_MUX_uxn_c_l75_c7_b177_iftrue := ins;
     VAR_ins_MUX_uxn_c_l83_c7_4375_iffalse := ins;
     VAR_printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg2 := resize(ins, 32);
     VAR_printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg2 := resize(ins, 32);
     VAR_is_ins_done_MUX_uxn_c_l83_c7_4375_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l85_c3_4d2b_left := pc;
     VAR_MUX_uxn_c_l90_c8_18b9_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l89_c24_5222_pc := pc;
     VAR_pc_MUX_uxn_c_l68_c2_c327_iftrue := pc;
     VAR_pc_MUX_uxn_c_l75_c7_b177_iftrue := pc;
     VAR_printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_arg1 := resize(pc, 32);
     VAR_printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg1 := resize(pc, 32);
     VAR_eval_opcode_phased_uxn_c_l89_c24_5222_previous_ram_read := VAR_ram_read_value;
     VAR_ins_uxn_c_l84_c3_d57d := VAR_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l68_c6_9313_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l75_c11_3080_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l83_c11_def5_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l89_c43_88aa_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l105_c3_b7d6_left := step_cpu_phase;
     VAR_printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg0 := resize(step_cpu_phase, 32);
     VAR_ins_MUX_uxn_c_l83_c7_4375_iftrue := VAR_ins_uxn_c_l84_c3_d57d;
     VAR_printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg2 := resize(VAR_ins_uxn_c_l84_c3_d57d, 32);
     -- BIN_OP_MINUS[uxn_c_l89_c43_88aa] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l89_c43_88aa_left <= VAR_BIN_OP_MINUS_uxn_c_l89_c43_88aa_left;
     BIN_OP_MINUS_uxn_c_l89_c43_88aa_right <= VAR_BIN_OP_MINUS_uxn_c_l89_c43_88aa_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l89_c43_88aa_return_output := BIN_OP_MINUS_uxn_c_l89_c43_88aa_return_output;

     -- BIN_OP_PLUS[uxn_c_l85_c3_4d2b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l85_c3_4d2b_left <= VAR_BIN_OP_PLUS_uxn_c_l85_c3_4d2b_left;
     BIN_OP_PLUS_uxn_c_l85_c3_4d2b_right <= VAR_BIN_OP_PLUS_uxn_c_l85_c3_4d2b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l85_c3_4d2b_return_output := BIN_OP_PLUS_uxn_c_l85_c3_4d2b_return_output;

     -- BIN_OP_EQ[uxn_c_l83_c11_def5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l83_c11_def5_left <= VAR_BIN_OP_EQ_uxn_c_l83_c11_def5_left;
     BIN_OP_EQ_uxn_c_l83_c11_def5_right <= VAR_BIN_OP_EQ_uxn_c_l83_c11_def5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l83_c11_def5_return_output := BIN_OP_EQ_uxn_c_l83_c11_def5_return_output;

     -- BIN_OP_PLUS[uxn_c_l105_c3_b7d6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l105_c3_b7d6_left <= VAR_BIN_OP_PLUS_uxn_c_l105_c3_b7d6_left;
     BIN_OP_PLUS_uxn_c_l105_c3_b7d6_right <= VAR_BIN_OP_PLUS_uxn_c_l105_c3_b7d6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l105_c3_b7d6_return_output := BIN_OP_PLUS_uxn_c_l105_c3_b7d6_return_output;

     -- BIN_OP_EQ[uxn_c_l68_c6_9313] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l68_c6_9313_left <= VAR_BIN_OP_EQ_uxn_c_l68_c6_9313_left;
     BIN_OP_EQ_uxn_c_l68_c6_9313_right <= VAR_BIN_OP_EQ_uxn_c_l68_c6_9313_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l68_c6_9313_return_output := BIN_OP_EQ_uxn_c_l68_c6_9313_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c11_3080] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c11_3080_left <= VAR_BIN_OP_EQ_uxn_c_l75_c11_3080_left;
     BIN_OP_EQ_uxn_c_l75_c11_3080_right <= VAR_BIN_OP_EQ_uxn_c_l75_c11_3080_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c11_3080_return_output := BIN_OP_EQ_uxn_c_l75_c11_3080_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l68_c2_c327] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_c327_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l75_c7_b177] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l75_c7_b177_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_9313_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_9313_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_c327_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_9313_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_c327_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_9313_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_c327_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_9313_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_c327_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_9313_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_c327_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_9313_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_3080_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_3080_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_b177_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_3080_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_b177_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_3080_return_output;
     VAR_ins_MUX_uxn_c_l75_c7_b177_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_3080_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c7_b177_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_3080_return_output;
     VAR_pc_MUX_uxn_c_l75_c7_b177_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_3080_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_def5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_def5_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_4375_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_def5_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_4375_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_def5_return_output;
     VAR_ins_MUX_uxn_c_l83_c7_4375_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_def5_return_output;
     VAR_is_ins_done_MUX_uxn_c_l83_c7_4375_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_def5_return_output;
     VAR_pc_MUX_uxn_c_l83_c7_4375_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_def5_return_output;
     VAR_eval_opcode_phased_uxn_c_l89_c24_5222_phase := VAR_BIN_OP_MINUS_uxn_c_l89_c43_88aa_return_output;
     VAR_step_cpu_phase_uxn_c_l105_c3_1530 := resize(VAR_BIN_OP_PLUS_uxn_c_l105_c3_b7d6_return_output, 8);
     VAR_pc_uxn_c_l85_c3_ecfc := resize(VAR_BIN_OP_PLUS_uxn_c_l85_c3_4d2b_return_output, 16);
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_c327_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_c327_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_b177_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l75_c7_b177_return_output;
     VAR_pc_MUX_uxn_c_l83_c7_4375_iftrue := VAR_pc_uxn_c_l85_c3_ecfc;
     VAR_printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg1 := resize(VAR_pc_uxn_c_l85_c3_ecfc, 32);
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_iffalse := VAR_step_cpu_phase_uxn_c_l105_c3_1530;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_4827] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l75_c7_b177] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_return_output;

     -- ins_MUX[uxn_c_l83_c7_4375] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l83_c7_4375_cond <= VAR_ins_MUX_uxn_c_l83_c7_4375_cond;
     ins_MUX_uxn_c_l83_c7_4375_iftrue <= VAR_ins_MUX_uxn_c_l83_c7_4375_iftrue;
     ins_MUX_uxn_c_l83_c7_4375_iffalse <= VAR_ins_MUX_uxn_c_l83_c7_4375_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l83_c7_4375_return_output := ins_MUX_uxn_c_l83_c7_4375_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_b177_return_output;
     VAR_printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_4827_return_output;
     VAR_ins_MUX_uxn_c_l75_c7_b177_iffalse := VAR_ins_MUX_uxn_c_l83_c7_4375_return_output;
     -- ins_MUX[uxn_c_l75_c7_b177] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l75_c7_b177_cond <= VAR_ins_MUX_uxn_c_l75_c7_b177_cond;
     ins_MUX_uxn_c_l75_c7_b177_iftrue <= VAR_ins_MUX_uxn_c_l75_c7_b177_iftrue;
     ins_MUX_uxn_c_l75_c7_b177_iffalse <= VAR_ins_MUX_uxn_c_l75_c7_b177_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l75_c7_b177_return_output := ins_MUX_uxn_c_l75_c7_b177_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l75_c1_716a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_return_output;

     -- printf_uxn_c_l73_c3_0d94[uxn_c_l73_c3_0d94] LATENCY=0
     -- Clock enable
     printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_CLOCK_ENABLE <= VAR_printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_arg0 <= VAR_printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_arg0;
     printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_arg1 <= VAR_printf_uxn_c_l73_c3_0d94_uxn_c_l73_c3_0d94_arg1;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l83_c7_4375] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_4375_return_output;
     VAR_printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_716a_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_c327_iffalse := VAR_ins_MUX_uxn_c_l75_c7_b177_return_output;
     -- printf_uxn_c_l81_c3_824b[uxn_c_l81_c3_824b] LATENCY=0
     -- Clock enable
     printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_CLOCK_ENABLE <= VAR_printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg0 <= VAR_printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg0;
     printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg1 <= VAR_printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg1;
     printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg2 <= VAR_printf_uxn_c_l81_c3_824b_uxn_c_l81_c3_824b_arg2;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l83_c1_61a4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l88_c1_2893] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_return_output;

     -- ins_MUX[uxn_c_l68_c2_c327] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l68_c2_c327_cond <= VAR_ins_MUX_uxn_c_l68_c2_c327_cond;
     ins_MUX_uxn_c_l68_c2_c327_iftrue <= VAR_ins_MUX_uxn_c_l68_c2_c327_iftrue;
     ins_MUX_uxn_c_l68_c2_c327_iffalse <= VAR_ins_MUX_uxn_c_l68_c2_c327_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l68_c2_c327_return_output := ins_MUX_uxn_c_l68_c2_c327_return_output;

     -- Submodule level 4
     VAR_eval_opcode_phased_uxn_c_l89_c24_5222_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_return_output;
     VAR_printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_2893_return_output;
     VAR_printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_61a4_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l68_c2_c327_return_output;
     -- printf_uxn_c_l86_c3_5ef0[uxn_c_l86_c3_5ef0] LATENCY=0
     -- Clock enable
     printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_CLOCK_ENABLE <= VAR_printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg0 <= VAR_printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg0;
     printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg1 <= VAR_printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg1;
     printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg2 <= VAR_printf_uxn_c_l86_c3_5ef0_uxn_c_l86_c3_5ef0_arg2;
     -- Outputs

     -- eval_opcode_phased[uxn_c_l89_c24_5222] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l89_c24_5222_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l89_c24_5222_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l89_c24_5222_phase <= VAR_eval_opcode_phased_uxn_c_l89_c24_5222_phase;
     eval_opcode_phased_uxn_c_l89_c24_5222_ins <= VAR_eval_opcode_phased_uxn_c_l89_c24_5222_ins;
     eval_opcode_phased_uxn_c_l89_c24_5222_pc <= VAR_eval_opcode_phased_uxn_c_l89_c24_5222_pc;
     eval_opcode_phased_uxn_c_l89_c24_5222_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l89_c24_5222_previous_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l89_c24_5222_return_output := eval_opcode_phased_uxn_c_l89_c24_5222_return_output;

     -- Submodule level 5
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_4375_iffalse := VAR_eval_opcode_phased_uxn_c_l89_c24_5222_return_output;
     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l96_c34_bb86] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l96_c34_bb86_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5222_return_output.vram_address;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d[uxn_c_l90_c43_66f7] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l90_c43_66f7_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5222_return_output.pc;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d[uxn_c_l91_c33_f2c3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l91_c33_f2c3_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5222_return_output.is_ram_read;

     -- eval_opcode_result_MUX[uxn_c_l83_c7_4375] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l83_c7_4375_cond <= VAR_eval_opcode_result_MUX_uxn_c_l83_c7_4375_cond;
     eval_opcode_result_MUX_uxn_c_l83_c7_4375_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l83_c7_4375_iftrue;
     eval_opcode_result_MUX_uxn_c_l83_c7_4375_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l83_c7_4375_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_4375_return_output := eval_opcode_result_MUX_uxn_c_l83_c7_4375_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l92_c34_099a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l92_c34_099a_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5222_return_output.is_ram_write;

     -- CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d[uxn_c_l97_c32_b10a] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l97_c32_b10a_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5222_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l95_c35_4116] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l95_c35_4116_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5222_return_output.is_vram_write;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d[uxn_c_l93_c33_49d8] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l93_c33_49d8_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5222_return_output.ram_addr;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d[uxn_c_l94_c31_5459] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l94_c31_5459_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5222_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l98_c17_4d55] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l98_c17_4d55_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5222_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l90_c8_90d6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l90_c8_90d6_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_5222_return_output.is_pc_updated;

     -- Submodule level 6
     VAR_MUX_uxn_c_l90_c8_18b9_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l90_c43_66f7_return_output;
     VAR_is_ins_done_MUX_uxn_c_l83_c7_4375_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l98_c17_4d55_return_output;
     VAR_MUX_uxn_c_l90_c8_18b9_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l90_c8_90d6_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_b177_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l83_c7_4375_return_output;
     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70[uxn_c_l83_c7_4375] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l83_c7_4375_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l91_c33_f2c3_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l92_c34_099a_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l93_c33_49d8_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l94_c31_5459_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l95_c35_4116_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l96_c34_bb86_return_output,
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l97_c32_b10a_return_output);

     -- eval_opcode_result_MUX[uxn_c_l75_c7_b177] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l75_c7_b177_cond <= VAR_eval_opcode_result_MUX_uxn_c_l75_c7_b177_cond;
     eval_opcode_result_MUX_uxn_c_l75_c7_b177_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l75_c7_b177_iftrue;
     eval_opcode_result_MUX_uxn_c_l75_c7_b177_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l75_c7_b177_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_b177_return_output := eval_opcode_result_MUX_uxn_c_l75_c7_b177_return_output;

     -- is_ins_done_MUX[uxn_c_l83_c7_4375] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l83_c7_4375_cond <= VAR_is_ins_done_MUX_uxn_c_l83_c7_4375_cond;
     is_ins_done_MUX_uxn_c_l83_c7_4375_iftrue <= VAR_is_ins_done_MUX_uxn_c_l83_c7_4375_iftrue;
     is_ins_done_MUX_uxn_c_l83_c7_4375_iffalse <= VAR_is_ins_done_MUX_uxn_c_l83_c7_4375_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l83_c7_4375_return_output := is_ins_done_MUX_uxn_c_l83_c7_4375_return_output;

     -- MUX[uxn_c_l90_c8_18b9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l90_c8_18b9_cond <= VAR_MUX_uxn_c_l90_c8_18b9_cond;
     MUX_uxn_c_l90_c8_18b9_iftrue <= VAR_MUX_uxn_c_l90_c8_18b9_iftrue;
     MUX_uxn_c_l90_c8_18b9_iffalse <= VAR_MUX_uxn_c_l90_c8_18b9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l90_c8_18b9_return_output := MUX_uxn_c_l90_c8_18b9_return_output;

     -- Submodule level 7
     VAR_pc_uxn_c_l90_c3_ab27 := VAR_MUX_uxn_c_l90_c8_18b9_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_4375_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l83_c7_4375_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_c327_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l75_c7_b177_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c7_b177_iffalse := VAR_is_ins_done_MUX_uxn_c_l83_c7_4375_return_output;
     VAR_pc_MUX_uxn_c_l83_c7_4375_iffalse := VAR_pc_uxn_c_l90_c3_ab27;
     VAR_printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg1 := resize(VAR_pc_uxn_c_l90_c3_ab27, 32);
     -- printf_uxn_c_l99_c3_ceb6[uxn_c_l99_c3_ceb6] LATENCY=0
     -- Clock enable
     printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_CLOCK_ENABLE <= VAR_printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg0 <= VAR_printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg0;
     printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg1 <= VAR_printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg1;
     printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg2 <= VAR_printf_uxn_c_l99_c3_ceb6_uxn_c_l99_c3_ceb6_arg2;
     -- Outputs

     -- pc_MUX[uxn_c_l83_c7_4375] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l83_c7_4375_cond <= VAR_pc_MUX_uxn_c_l83_c7_4375_cond;
     pc_MUX_uxn_c_l83_c7_4375_iftrue <= VAR_pc_MUX_uxn_c_l83_c7_4375_iftrue;
     pc_MUX_uxn_c_l83_c7_4375_iffalse <= VAR_pc_MUX_uxn_c_l83_c7_4375_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l83_c7_4375_return_output := pc_MUX_uxn_c_l83_c7_4375_return_output;

     -- cpu_step_result_MUX[uxn_c_l83_c7_4375] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l83_c7_4375_cond <= VAR_cpu_step_result_MUX_uxn_c_l83_c7_4375_cond;
     cpu_step_result_MUX_uxn_c_l83_c7_4375_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l83_c7_4375_iftrue;
     cpu_step_result_MUX_uxn_c_l83_c7_4375_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l83_c7_4375_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_4375_return_output := cpu_step_result_MUX_uxn_c_l83_c7_4375_return_output;

     -- eval_opcode_result_MUX[uxn_c_l68_c2_c327] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l68_c2_c327_cond <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_c327_cond;
     eval_opcode_result_MUX_uxn_c_l68_c2_c327_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_c327_iftrue;
     eval_opcode_result_MUX_uxn_c_l68_c2_c327_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_c327_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_c327_return_output := eval_opcode_result_MUX_uxn_c_l68_c2_c327_return_output;

     -- is_ins_done_MUX[uxn_c_l75_c7_b177] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l75_c7_b177_cond <= VAR_is_ins_done_MUX_uxn_c_l75_c7_b177_cond;
     is_ins_done_MUX_uxn_c_l75_c7_b177_iftrue <= VAR_is_ins_done_MUX_uxn_c_l75_c7_b177_iftrue;
     is_ins_done_MUX_uxn_c_l75_c7_b177_iffalse <= VAR_is_ins_done_MUX_uxn_c_l75_c7_b177_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l75_c7_b177_return_output := is_ins_done_MUX_uxn_c_l75_c7_b177_return_output;

     -- Submodule level 8
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_b177_iffalse := VAR_cpu_step_result_MUX_uxn_c_l83_c7_4375_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l68_c2_c327_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_c327_iffalse := VAR_is_ins_done_MUX_uxn_c_l75_c7_b177_return_output;
     VAR_pc_MUX_uxn_c_l75_c7_b177_iffalse := VAR_pc_MUX_uxn_c_l83_c7_4375_return_output;
     -- is_ins_done_MUX[uxn_c_l68_c2_c327] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l68_c2_c327_cond <= VAR_is_ins_done_MUX_uxn_c_l68_c2_c327_cond;
     is_ins_done_MUX_uxn_c_l68_c2_c327_iftrue <= VAR_is_ins_done_MUX_uxn_c_l68_c2_c327_iftrue;
     is_ins_done_MUX_uxn_c_l68_c2_c327_iffalse <= VAR_is_ins_done_MUX_uxn_c_l68_c2_c327_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l68_c2_c327_return_output := is_ins_done_MUX_uxn_c_l68_c2_c327_return_output;

     -- pc_MUX[uxn_c_l75_c7_b177] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l75_c7_b177_cond <= VAR_pc_MUX_uxn_c_l75_c7_b177_cond;
     pc_MUX_uxn_c_l75_c7_b177_iftrue <= VAR_pc_MUX_uxn_c_l75_c7_b177_iftrue;
     pc_MUX_uxn_c_l75_c7_b177_iffalse <= VAR_pc_MUX_uxn_c_l75_c7_b177_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l75_c7_b177_return_output := pc_MUX_uxn_c_l75_c7_b177_return_output;

     -- cpu_step_result_MUX[uxn_c_l75_c7_b177] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l75_c7_b177_cond <= VAR_cpu_step_result_MUX_uxn_c_l75_c7_b177_cond;
     cpu_step_result_MUX_uxn_c_l75_c7_b177_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l75_c7_b177_iftrue;
     cpu_step_result_MUX_uxn_c_l75_c7_b177_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l75_c7_b177_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_b177_return_output := cpu_step_result_MUX_uxn_c_l75_c7_b177_return_output;

     -- Submodule level 9
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_c327_iffalse := VAR_cpu_step_result_MUX_uxn_c_l75_c7_b177_return_output;
     VAR_BIN_OP_EQ_uxn_c_l102_c6_0ce1_left := VAR_is_ins_done_MUX_uxn_c_l68_c2_c327_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l68_c2_c327_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_c327_iffalse := VAR_pc_MUX_uxn_c_l75_c7_b177_return_output;
     -- BIN_OP_EQ[uxn_c_l102_c6_0ce1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l102_c6_0ce1_left <= VAR_BIN_OP_EQ_uxn_c_l102_c6_0ce1_left;
     BIN_OP_EQ_uxn_c_l102_c6_0ce1_right <= VAR_BIN_OP_EQ_uxn_c_l102_c6_0ce1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l102_c6_0ce1_return_output := BIN_OP_EQ_uxn_c_l102_c6_0ce1_return_output;

     -- pc_MUX[uxn_c_l68_c2_c327] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l68_c2_c327_cond <= VAR_pc_MUX_uxn_c_l68_c2_c327_cond;
     pc_MUX_uxn_c_l68_c2_c327_iftrue <= VAR_pc_MUX_uxn_c_l68_c2_c327_iftrue;
     pc_MUX_uxn_c_l68_c2_c327_iffalse <= VAR_pc_MUX_uxn_c_l68_c2_c327_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l68_c2_c327_return_output := pc_MUX_uxn_c_l68_c2_c327_return_output;

     -- cpu_step_result_MUX[uxn_c_l68_c2_c327] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l68_c2_c327_cond <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_c327_cond;
     cpu_step_result_MUX_uxn_c_l68_c2_c327_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_c327_iftrue;
     cpu_step_result_MUX_uxn_c_l68_c2_c327_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_c327_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_c327_return_output := cpu_step_result_MUX_uxn_c_l68_c2_c327_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_cond := VAR_BIN_OP_EQ_uxn_c_l102_c6_0ce1_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l68_c2_c327_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l68_c2_c327_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l68_c2_c327_return_output;
     -- step_cpu_phase_MUX[uxn_c_l102_c2_f9c4] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_cond <= VAR_step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_cond;
     step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_iftrue;
     step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_return_output := step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l102_c2_f9c4_return_output;
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
