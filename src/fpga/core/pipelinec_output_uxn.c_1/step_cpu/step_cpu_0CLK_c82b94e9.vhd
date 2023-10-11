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
entity step_cpu_0CLK_c82b94e9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ram_read_value : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_c82b94e9;
architecture arch of step_cpu_0CLK_c82b94e9 is
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
is_ram_write => to_unsigned(0, 1),
ram_address => to_unsigned(0, 16),
ram_value => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
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
-- BIN_OP_EQ[uxn_c_l66_c6_5261]
signal BIN_OP_EQ_uxn_c_l66_c6_5261_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l66_c6_5261_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l66_c6_5261_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l66_c1_932d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l72_c7_1bb5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l66_c2_bad8]
signal pc_MUX_uxn_c_l66_c2_bad8_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l66_c2_bad8_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l66_c2_bad8_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l66_c2_bad8_return_output : unsigned(15 downto 0);

-- eval_opcode_result_MUX[uxn_c_l66_c2_bad8]
signal eval_opcode_result_MUX_uxn_c_l66_c2_bad8_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l66_c2_bad8_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l66_c2_bad8_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l66_c2_bad8_return_output : eval_opcode_result_t;

-- cpu_step_result_MUX[uxn_c_l66_c2_bad8]
signal cpu_step_result_MUX_uxn_c_l66_c2_bad8_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l66_c2_bad8_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l66_c2_bad8_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l66_c2_bad8_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l66_c2_bad8]
signal ins_MUX_uxn_c_l66_c2_bad8_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l66_c2_bad8_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l66_c2_bad8_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l66_c2_bad8_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l66_c2_bad8]
signal is_ins_done_MUX_uxn_c_l66_c2_bad8_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l66_c2_bad8_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l66_c2_bad8_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l66_c2_bad8_return_output : unsigned(0 downto 0);

-- printf_uxn_c_l70_c3_5b79[uxn_c_l70_c3_5b79]
signal printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l72_c11_9629]
signal BIN_OP_EQ_uxn_c_l72_c11_9629_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l72_c11_9629_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l72_c11_9629_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l72_c1_93c3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l76_c7_2e10]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l72_c7_1bb5]
signal pc_MUX_uxn_c_l72_c7_1bb5_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l72_c7_1bb5_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l72_c7_1bb5_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l72_c7_1bb5_return_output : unsigned(15 downto 0);

-- eval_opcode_result_MUX[uxn_c_l72_c7_1bb5]
signal eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_return_output : eval_opcode_result_t;

-- cpu_step_result_MUX[uxn_c_l72_c7_1bb5]
signal cpu_step_result_MUX_uxn_c_l72_c7_1bb5_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l72_c7_1bb5_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l72_c7_1bb5_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l72_c7_1bb5_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l72_c7_1bb5]
signal ins_MUX_uxn_c_l72_c7_1bb5_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l72_c7_1bb5_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l72_c7_1bb5_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l72_c7_1bb5_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l72_c7_1bb5]
signal is_ins_done_MUX_uxn_c_l72_c7_1bb5_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l72_c7_1bb5_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l72_c7_1bb5_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l72_c7_1bb5_return_output : unsigned(0 downto 0);

-- printf_uxn_c_l74_c3_6aed[uxn_c_l74_c3_6aed]
signal printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l76_c11_2133]
signal BIN_OP_EQ_uxn_c_l76_c11_2133_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l76_c11_2133_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l76_c11_2133_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l76_c1_cea3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c1_88c1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l76_c7_2e10]
signal pc_MUX_uxn_c_l76_c7_2e10_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l76_c7_2e10_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l76_c7_2e10_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l76_c7_2e10_return_output : unsigned(15 downto 0);

-- eval_opcode_result_MUX[uxn_c_l76_c7_2e10]
signal eval_opcode_result_MUX_uxn_c_l76_c7_2e10_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l76_c7_2e10_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l76_c7_2e10_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l76_c7_2e10_return_output : eval_opcode_result_t;

-- cpu_step_result_MUX[uxn_c_l76_c7_2e10]
signal cpu_step_result_MUX_uxn_c_l76_c7_2e10_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l76_c7_2e10_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l76_c7_2e10_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l76_c7_2e10_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l76_c7_2e10]
signal ins_MUX_uxn_c_l76_c7_2e10_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l76_c7_2e10_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l76_c7_2e10_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l76_c7_2e10_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l76_c7_2e10]
signal is_ins_done_MUX_uxn_c_l76_c7_2e10_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l76_c7_2e10_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l76_c7_2e10_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l76_c7_2e10_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l78_c3_071f]
signal BIN_OP_PLUS_uxn_c_l78_c3_071f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_071f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_071f_return_output : unsigned(16 downto 0);

-- printf_uxn_c_l79_c3_fb36[uxn_c_l79_c3_fb36]
signal printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg2 : unsigned(31 downto 0);

-- BIN_OP_MINUS[uxn_c_l82_c43_b89f]
signal BIN_OP_MINUS_uxn_c_l82_c43_b89f_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l82_c43_b89f_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l82_c43_b89f_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l82_c24_aa02]
signal eval_opcode_phased_uxn_c_l82_c24_aa02_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_aa02_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_aa02_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_aa02_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_aa02_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_aa02_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l83_c8_870c]
signal MUX_uxn_c_l83_c8_870c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l83_c8_870c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l83_c8_870c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l83_c8_870c_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l92_c3_fad3[uxn_c_l92_c3_fad3]
signal printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l95_c6_e7ae]
signal BIN_OP_EQ_uxn_c_l95_c6_e7ae_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l95_c6_e7ae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l95_c6_e7ae_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l95_c2_21a5]
signal step_cpu_phase_MUX_uxn_c_l95_c2_21a5_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l95_c2_21a5_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l95_c2_21a5_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l95_c2_21a5_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l98_c3_b1e1]
signal BIN_OP_PLUS_uxn_c_l98_c3_b1e1_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l98_c3_b1e1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l98_c3_b1e1_return_output : unsigned(8 downto 0);

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a( ref_toks_0 : cpu_step_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base := ref_toks_0;
      base.ram_address := ref_toks_1;
      base.is_ram_write := ref_toks_2;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247( ref_toks_0 : cpu_step_result_t;
 ref_toks_1 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base := ref_toks_0;
      base.ram_address := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a6e5( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base.is_ram_write := ref_toks_0;
      base.ram_address := ref_toks_1;
      base.ram_value := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.vram_write_layer := ref_toks_4;
      base.vram_address := ref_toks_5;
      base.vram_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_c_l66_c6_5261
BIN_OP_EQ_uxn_c_l66_c6_5261 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l66_c6_5261_left,
BIN_OP_EQ_uxn_c_l66_c6_5261_right,
BIN_OP_EQ_uxn_c_l66_c6_5261_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d
TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_return_output);

-- pc_MUX_uxn_c_l66_c2_bad8
pc_MUX_uxn_c_l66_c2_bad8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l66_c2_bad8_cond,
pc_MUX_uxn_c_l66_c2_bad8_iftrue,
pc_MUX_uxn_c_l66_c2_bad8_iffalse,
pc_MUX_uxn_c_l66_c2_bad8_return_output);

-- eval_opcode_result_MUX_uxn_c_l66_c2_bad8
eval_opcode_result_MUX_uxn_c_l66_c2_bad8 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l66_c2_bad8_cond,
eval_opcode_result_MUX_uxn_c_l66_c2_bad8_iftrue,
eval_opcode_result_MUX_uxn_c_l66_c2_bad8_iffalse,
eval_opcode_result_MUX_uxn_c_l66_c2_bad8_return_output);

-- cpu_step_result_MUX_uxn_c_l66_c2_bad8
cpu_step_result_MUX_uxn_c_l66_c2_bad8 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l66_c2_bad8_cond,
cpu_step_result_MUX_uxn_c_l66_c2_bad8_iftrue,
cpu_step_result_MUX_uxn_c_l66_c2_bad8_iffalse,
cpu_step_result_MUX_uxn_c_l66_c2_bad8_return_output);

-- ins_MUX_uxn_c_l66_c2_bad8
ins_MUX_uxn_c_l66_c2_bad8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l66_c2_bad8_cond,
ins_MUX_uxn_c_l66_c2_bad8_iftrue,
ins_MUX_uxn_c_l66_c2_bad8_iffalse,
ins_MUX_uxn_c_l66_c2_bad8_return_output);

-- is_ins_done_MUX_uxn_c_l66_c2_bad8
is_ins_done_MUX_uxn_c_l66_c2_bad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l66_c2_bad8_cond,
is_ins_done_MUX_uxn_c_l66_c2_bad8_iftrue,
is_ins_done_MUX_uxn_c_l66_c2_bad8_iffalse,
is_ins_done_MUX_uxn_c_l66_c2_bad8_return_output);

-- printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79
printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79 : entity work.printf_uxn_c_l70_c3_5b79_0CLK_de264c78 port map (
printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_CLOCK_ENABLE,
printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_arg0,
printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_arg1);

-- BIN_OP_EQ_uxn_c_l72_c11_9629
BIN_OP_EQ_uxn_c_l72_c11_9629 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l72_c11_9629_left,
BIN_OP_EQ_uxn_c_l72_c11_9629_right,
BIN_OP_EQ_uxn_c_l72_c11_9629_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3
TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10
FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_return_output);

-- pc_MUX_uxn_c_l72_c7_1bb5
pc_MUX_uxn_c_l72_c7_1bb5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l72_c7_1bb5_cond,
pc_MUX_uxn_c_l72_c7_1bb5_iftrue,
pc_MUX_uxn_c_l72_c7_1bb5_iffalse,
pc_MUX_uxn_c_l72_c7_1bb5_return_output);

-- eval_opcode_result_MUX_uxn_c_l72_c7_1bb5
eval_opcode_result_MUX_uxn_c_l72_c7_1bb5 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_cond,
eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_iftrue,
eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_iffalse,
eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_return_output);

-- cpu_step_result_MUX_uxn_c_l72_c7_1bb5
cpu_step_result_MUX_uxn_c_l72_c7_1bb5 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l72_c7_1bb5_cond,
cpu_step_result_MUX_uxn_c_l72_c7_1bb5_iftrue,
cpu_step_result_MUX_uxn_c_l72_c7_1bb5_iffalse,
cpu_step_result_MUX_uxn_c_l72_c7_1bb5_return_output);

-- ins_MUX_uxn_c_l72_c7_1bb5
ins_MUX_uxn_c_l72_c7_1bb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l72_c7_1bb5_cond,
ins_MUX_uxn_c_l72_c7_1bb5_iftrue,
ins_MUX_uxn_c_l72_c7_1bb5_iffalse,
ins_MUX_uxn_c_l72_c7_1bb5_return_output);

-- is_ins_done_MUX_uxn_c_l72_c7_1bb5
is_ins_done_MUX_uxn_c_l72_c7_1bb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l72_c7_1bb5_cond,
is_ins_done_MUX_uxn_c_l72_c7_1bb5_iftrue,
is_ins_done_MUX_uxn_c_l72_c7_1bb5_iffalse,
is_ins_done_MUX_uxn_c_l72_c7_1bb5_return_output);

-- printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed
printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed : entity work.printf_uxn_c_l74_c3_6aed_0CLK_de264c78 port map (
printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_CLOCK_ENABLE,
printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg0,
printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg1,
printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg2);

-- BIN_OP_EQ_uxn_c_l76_c11_2133
BIN_OP_EQ_uxn_c_l76_c11_2133 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l76_c11_2133_left,
BIN_OP_EQ_uxn_c_l76_c11_2133_right,
BIN_OP_EQ_uxn_c_l76_c11_2133_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3
TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_return_output);

-- pc_MUX_uxn_c_l76_c7_2e10
pc_MUX_uxn_c_l76_c7_2e10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l76_c7_2e10_cond,
pc_MUX_uxn_c_l76_c7_2e10_iftrue,
pc_MUX_uxn_c_l76_c7_2e10_iffalse,
pc_MUX_uxn_c_l76_c7_2e10_return_output);

-- eval_opcode_result_MUX_uxn_c_l76_c7_2e10
eval_opcode_result_MUX_uxn_c_l76_c7_2e10 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l76_c7_2e10_cond,
eval_opcode_result_MUX_uxn_c_l76_c7_2e10_iftrue,
eval_opcode_result_MUX_uxn_c_l76_c7_2e10_iffalse,
eval_opcode_result_MUX_uxn_c_l76_c7_2e10_return_output);

-- cpu_step_result_MUX_uxn_c_l76_c7_2e10
cpu_step_result_MUX_uxn_c_l76_c7_2e10 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l76_c7_2e10_cond,
cpu_step_result_MUX_uxn_c_l76_c7_2e10_iftrue,
cpu_step_result_MUX_uxn_c_l76_c7_2e10_iffalse,
cpu_step_result_MUX_uxn_c_l76_c7_2e10_return_output);

-- ins_MUX_uxn_c_l76_c7_2e10
ins_MUX_uxn_c_l76_c7_2e10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l76_c7_2e10_cond,
ins_MUX_uxn_c_l76_c7_2e10_iftrue,
ins_MUX_uxn_c_l76_c7_2e10_iffalse,
ins_MUX_uxn_c_l76_c7_2e10_return_output);

-- is_ins_done_MUX_uxn_c_l76_c7_2e10
is_ins_done_MUX_uxn_c_l76_c7_2e10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l76_c7_2e10_cond,
is_ins_done_MUX_uxn_c_l76_c7_2e10_iftrue,
is_ins_done_MUX_uxn_c_l76_c7_2e10_iffalse,
is_ins_done_MUX_uxn_c_l76_c7_2e10_return_output);

-- BIN_OP_PLUS_uxn_c_l78_c3_071f
BIN_OP_PLUS_uxn_c_l78_c3_071f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l78_c3_071f_left,
BIN_OP_PLUS_uxn_c_l78_c3_071f_right,
BIN_OP_PLUS_uxn_c_l78_c3_071f_return_output);

-- printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36
printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36 : entity work.printf_uxn_c_l79_c3_fb36_0CLK_de264c78 port map (
printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_CLOCK_ENABLE,
printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg0,
printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg1,
printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg2);

-- BIN_OP_MINUS_uxn_c_l82_c43_b89f
BIN_OP_MINUS_uxn_c_l82_c43_b89f : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l82_c43_b89f_left,
BIN_OP_MINUS_uxn_c_l82_c43_b89f_right,
BIN_OP_MINUS_uxn_c_l82_c43_b89f_return_output);

-- eval_opcode_phased_uxn_c_l82_c24_aa02
eval_opcode_phased_uxn_c_l82_c24_aa02 : entity work.eval_opcode_phased_0CLK_e60a0b8b port map (
clk,
eval_opcode_phased_uxn_c_l82_c24_aa02_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l82_c24_aa02_phase,
eval_opcode_phased_uxn_c_l82_c24_aa02_ins,
eval_opcode_phased_uxn_c_l82_c24_aa02_pc,
eval_opcode_phased_uxn_c_l82_c24_aa02_previous_ram_read,
eval_opcode_phased_uxn_c_l82_c24_aa02_return_output);

-- MUX_uxn_c_l83_c8_870c
MUX_uxn_c_l83_c8_870c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l83_c8_870c_cond,
MUX_uxn_c_l83_c8_870c_iftrue,
MUX_uxn_c_l83_c8_870c_iffalse,
MUX_uxn_c_l83_c8_870c_return_output);

-- printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3
printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3 : entity work.printf_uxn_c_l92_c3_fad3_0CLK_de264c78 port map (
printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_CLOCK_ENABLE,
printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg0,
printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg1,
printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg2);

-- BIN_OP_EQ_uxn_c_l95_c6_e7ae
BIN_OP_EQ_uxn_c_l95_c6_e7ae : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l95_c6_e7ae_left,
BIN_OP_EQ_uxn_c_l95_c6_e7ae_right,
BIN_OP_EQ_uxn_c_l95_c6_e7ae_return_output);

-- step_cpu_phase_MUX_uxn_c_l95_c2_21a5
step_cpu_phase_MUX_uxn_c_l95_c2_21a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l95_c2_21a5_cond,
step_cpu_phase_MUX_uxn_c_l95_c2_21a5_iftrue,
step_cpu_phase_MUX_uxn_c_l95_c2_21a5_iffalse,
step_cpu_phase_MUX_uxn_c_l95_c2_21a5_return_output);

-- BIN_OP_PLUS_uxn_c_l98_c3_b1e1
BIN_OP_PLUS_uxn_c_l98_c3_b1e1 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l98_c3_b1e1_left,
BIN_OP_PLUS_uxn_c_l98_c3_b1e1_right,
BIN_OP_PLUS_uxn_c_l98_c3_b1e1_return_output);



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
 BIN_OP_EQ_uxn_c_l66_c6_5261_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_return_output,
 pc_MUX_uxn_c_l66_c2_bad8_return_output,
 eval_opcode_result_MUX_uxn_c_l66_c2_bad8_return_output,
 cpu_step_result_MUX_uxn_c_l66_c2_bad8_return_output,
 ins_MUX_uxn_c_l66_c2_bad8_return_output,
 is_ins_done_MUX_uxn_c_l66_c2_bad8_return_output,
 BIN_OP_EQ_uxn_c_l72_c11_9629_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_return_output,
 pc_MUX_uxn_c_l72_c7_1bb5_return_output,
 eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_return_output,
 cpu_step_result_MUX_uxn_c_l72_c7_1bb5_return_output,
 ins_MUX_uxn_c_l72_c7_1bb5_return_output,
 is_ins_done_MUX_uxn_c_l72_c7_1bb5_return_output,
 BIN_OP_EQ_uxn_c_l76_c11_2133_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_return_output,
 pc_MUX_uxn_c_l76_c7_2e10_return_output,
 eval_opcode_result_MUX_uxn_c_l76_c7_2e10_return_output,
 cpu_step_result_MUX_uxn_c_l76_c7_2e10_return_output,
 ins_MUX_uxn_c_l76_c7_2e10_return_output,
 is_ins_done_MUX_uxn_c_l76_c7_2e10_return_output,
 BIN_OP_PLUS_uxn_c_l78_c3_071f_return_output,
 BIN_OP_MINUS_uxn_c_l82_c43_b89f_return_output,
 eval_opcode_phased_uxn_c_l82_c24_aa02_return_output,
 MUX_uxn_c_l83_c8_870c_return_output,
 BIN_OP_EQ_uxn_c_l95_c6_e7ae_return_output,
 step_cpu_phase_MUX_uxn_c_l95_c2_21a5_return_output,
 BIN_OP_PLUS_uxn_c_l98_c3_b1e1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_ram_read_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l66_c6_5261_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l66_c6_5261_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l66_c6_5261_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l66_c2_bad8_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l66_c2_bad8_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l72_c7_1bb5_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l66_c2_bad8_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l66_c2_bad8_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l66_c2_bad8_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l66_c2_bad8_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l66_c2_bad8_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l66_c2_bad8_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l66_c2_bad8_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a_uxn_c_l66_c2_bad8_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l66_c2_bad8_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l72_c7_1bb5_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l66_c2_bad8_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l66_c2_bad8_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l66_c2_bad8_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l66_c2_bad8_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l72_c7_1bb5_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l66_c2_bad8_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l66_c2_bad8_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l66_c2_bad8_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l66_c2_bad8_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l72_c7_1bb5_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l66_c2_bad8_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l66_c2_bad8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l72_c11_9629_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l72_c11_9629_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l72_c11_9629_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l72_c7_1bb5_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l72_c7_1bb5_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l76_c7_2e10_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l72_c7_1bb5_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2e10_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l72_c7_1bb5_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247_uxn_c_l72_c7_1bb5_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l72_c7_1bb5_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l76_c7_2e10_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l72_c7_1bb5_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l72_c7_1bb5_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l72_c7_1bb5_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l76_c7_2e10_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l72_c7_1bb5_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l72_c7_1bb5_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l72_c7_1bb5_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l76_c7_2e10_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l72_c7_1bb5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l76_c11_2133_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l76_c11_2133_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l76_c11_2133_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l76_c7_2e10_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l78_c3_2442 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l76_c7_2e10_iffalse : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l83_c3_c96a : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l76_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2e10_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2e10_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l76_c7_2e10_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l76_c7_2e10_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a6e5_uxn_c_l76_c7_2e10_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l76_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l76_c7_2e10_iftrue : unsigned(7 downto 0);
 variable VAR_ins_uxn_c_l77_c3_1b7c : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l76_c7_2e10_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l76_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l76_c7_2e10_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l76_c7_2e10_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l76_c7_2e10_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_071f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_071f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_071f_return_output : unsigned(16 downto 0);
 variable VAR_printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg2 : unsigned(31 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_b89f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_b89f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_b89f_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l83_c8_870c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_870c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_870c_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_854b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l83_c43_2381_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_870c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_ea42_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l85_c33_3525_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l86_c31_ceaa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l87_c35_017c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l88_c38_00eb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l89_c34_7fc2_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l90_c32_439d_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l91_c17_c799_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l95_c6_e7ae_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l95_c6_e7ae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l95_c6_e7ae_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_21a5_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l96_c3_8a8a : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_21a5_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l98_c3_efac : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_21a5_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_21a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l98_c3_b1e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l98_c3_b1e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l98_c3_b1e1_return_output : unsigned(8 downto 0);
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
     VAR_BIN_OP_EQ_uxn_c_l72_c11_9629_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l66_c6_5261_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l95_c6_e7ae_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l76_c11_2133_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_071f_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_b89f_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_c_l98_c3_b1e1_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_iftrue := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l66_c2_bad8_iftrue := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l96_c3_8a8a := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_21a5_iftrue := VAR_step_cpu_phase_uxn_c_l96_c3_8a8a;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ram_read_value := ram_read_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_iftrue := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l76_c7_2e10_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l66_c2_bad8_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2e10_iftrue := eval_opcode_result;
     VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_ins := ins;
     VAR_ins_MUX_uxn_c_l66_c2_bad8_iftrue := ins;
     VAR_ins_MUX_uxn_c_l72_c7_1bb5_iftrue := ins;
     VAR_ins_MUX_uxn_c_l76_c7_2e10_iffalse := ins;
     VAR_printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg2 := resize(ins, 32);
     VAR_printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg2 := resize(ins, 32);
     VAR_is_ins_done_MUX_uxn_c_l72_c7_1bb5_iftrue := is_ins_done;
     VAR_is_ins_done_MUX_uxn_c_l76_c7_2e10_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_071f_left := pc;
     VAR_MUX_uxn_c_l83_c8_870c_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_pc := pc;
     VAR_pc_MUX_uxn_c_l66_c2_bad8_iftrue := pc;
     VAR_pc_MUX_uxn_c_l72_c7_1bb5_iftrue := pc;
     VAR_printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_arg1 := resize(pc, 32);
     VAR_printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg1 := resize(pc, 32);
     VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_previous_ram_read := VAR_ram_read_value;
     VAR_ins_uxn_c_l77_c3_1b7c := VAR_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l66_c6_5261_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l72_c11_9629_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l76_c11_2133_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_b89f_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l98_c3_b1e1_left := step_cpu_phase;
     VAR_printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg0 := resize(step_cpu_phase, 32);
     VAR_ins_MUX_uxn_c_l76_c7_2e10_iftrue := VAR_ins_uxn_c_l77_c3_1b7c;
     VAR_printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg2 := resize(VAR_ins_uxn_c_l77_c3_1b7c, 32);
     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a[uxn_c_l66_c2_bad8] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a_uxn_c_l66_c2_bad8_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a(
     cpu_step_result,
     pc,
     to_unsigned(0, 1));

     -- BIN_OP_PLUS[uxn_c_l78_c3_071f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l78_c3_071f_left <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_071f_left;
     BIN_OP_PLUS_uxn_c_l78_c3_071f_right <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_071f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_071f_return_output := BIN_OP_PLUS_uxn_c_l78_c3_071f_return_output;

     -- BIN_OP_MINUS[uxn_c_l82_c43_b89f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l82_c43_b89f_left <= VAR_BIN_OP_MINUS_uxn_c_l82_c43_b89f_left;
     BIN_OP_MINUS_uxn_c_l82_c43_b89f_right <= VAR_BIN_OP_MINUS_uxn_c_l82_c43_b89f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_b89f_return_output := BIN_OP_MINUS_uxn_c_l82_c43_b89f_return_output;

     -- BIN_OP_EQ[uxn_c_l66_c6_5261] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l66_c6_5261_left <= VAR_BIN_OP_EQ_uxn_c_l66_c6_5261_left;
     BIN_OP_EQ_uxn_c_l66_c6_5261_right <= VAR_BIN_OP_EQ_uxn_c_l66_c6_5261_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l66_c6_5261_return_output := BIN_OP_EQ_uxn_c_l66_c6_5261_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247[uxn_c_l72_c7_1bb5] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247_uxn_c_l72_c7_1bb5_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247(
     cpu_step_result,
     pc);

     -- BIN_OP_EQ[uxn_c_l72_c11_9629] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l72_c11_9629_left <= VAR_BIN_OP_EQ_uxn_c_l72_c11_9629_left;
     BIN_OP_EQ_uxn_c_l72_c11_9629_right <= VAR_BIN_OP_EQ_uxn_c_l72_c11_9629_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l72_c11_9629_return_output := BIN_OP_EQ_uxn_c_l72_c11_9629_return_output;

     -- BIN_OP_PLUS[uxn_c_l98_c3_b1e1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l98_c3_b1e1_left <= VAR_BIN_OP_PLUS_uxn_c_l98_c3_b1e1_left;
     BIN_OP_PLUS_uxn_c_l98_c3_b1e1_right <= VAR_BIN_OP_PLUS_uxn_c_l98_c3_b1e1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l98_c3_b1e1_return_output := BIN_OP_PLUS_uxn_c_l98_c3_b1e1_return_output;

     -- BIN_OP_EQ[uxn_c_l76_c11_2133] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l76_c11_2133_left <= VAR_BIN_OP_EQ_uxn_c_l76_c11_2133_left;
     BIN_OP_EQ_uxn_c_l76_c11_2133_right <= VAR_BIN_OP_EQ_uxn_c_l76_c11_2133_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l76_c11_2133_return_output := BIN_OP_EQ_uxn_c_l76_c11_2133_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_cond := VAR_BIN_OP_EQ_uxn_c_l66_c6_5261_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_cond := VAR_BIN_OP_EQ_uxn_c_l66_c6_5261_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l66_c2_bad8_cond := VAR_BIN_OP_EQ_uxn_c_l66_c6_5261_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l66_c2_bad8_cond := VAR_BIN_OP_EQ_uxn_c_l66_c6_5261_return_output;
     VAR_ins_MUX_uxn_c_l66_c2_bad8_cond := VAR_BIN_OP_EQ_uxn_c_l66_c6_5261_return_output;
     VAR_is_ins_done_MUX_uxn_c_l66_c2_bad8_cond := VAR_BIN_OP_EQ_uxn_c_l66_c6_5261_return_output;
     VAR_pc_MUX_uxn_c_l66_c2_bad8_cond := VAR_BIN_OP_EQ_uxn_c_l66_c6_5261_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_9629_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_9629_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l72_c7_1bb5_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_9629_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_9629_return_output;
     VAR_ins_MUX_uxn_c_l72_c7_1bb5_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_9629_return_output;
     VAR_is_ins_done_MUX_uxn_c_l72_c7_1bb5_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_9629_return_output;
     VAR_pc_MUX_uxn_c_l72_c7_1bb5_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_9629_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_2133_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_2133_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l76_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_2133_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_2133_return_output;
     VAR_ins_MUX_uxn_c_l76_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_2133_return_output;
     VAR_is_ins_done_MUX_uxn_c_l76_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_2133_return_output;
     VAR_pc_MUX_uxn_c_l76_c7_2e10_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_2133_return_output;
     VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_phase := VAR_BIN_OP_MINUS_uxn_c_l82_c43_b89f_return_output;
     VAR_pc_uxn_c_l78_c3_2442 := resize(VAR_BIN_OP_PLUS_uxn_c_l78_c3_071f_return_output, 16);
     VAR_step_cpu_phase_uxn_c_l98_c3_efac := resize(VAR_BIN_OP_PLUS_uxn_c_l98_c3_b1e1_return_output, 8);
     VAR_cpu_step_result_MUX_uxn_c_l72_c7_1bb5_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247_uxn_c_l72_c7_1bb5_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l66_c2_bad8_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a_uxn_c_l66_c2_bad8_return_output;
     VAR_pc_MUX_uxn_c_l76_c7_2e10_iftrue := VAR_pc_uxn_c_l78_c3_2442;
     VAR_printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg1 := resize(VAR_pc_uxn_c_l78_c3_2442, 32);
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_21a5_iffalse := VAR_step_cpu_phase_uxn_c_l98_c3_efac;
     -- ins_MUX[uxn_c_l76_c7_2e10] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l76_c7_2e10_cond <= VAR_ins_MUX_uxn_c_l76_c7_2e10_cond;
     ins_MUX_uxn_c_l76_c7_2e10_iftrue <= VAR_ins_MUX_uxn_c_l76_c7_2e10_iftrue;
     ins_MUX_uxn_c_l76_c7_2e10_iffalse <= VAR_ins_MUX_uxn_c_l76_c7_2e10_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l76_c7_2e10_return_output := ins_MUX_uxn_c_l76_c7_2e10_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l66_c1_932d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l72_c7_1bb5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_1bb5_return_output;
     VAR_printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l66_c1_932d_return_output;
     VAR_ins_MUX_uxn_c_l72_c7_1bb5_iffalse := VAR_ins_MUX_uxn_c_l76_c7_2e10_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l76_c7_2e10] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_return_output;

     -- ins_MUX[uxn_c_l72_c7_1bb5] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l72_c7_1bb5_cond <= VAR_ins_MUX_uxn_c_l72_c7_1bb5_cond;
     ins_MUX_uxn_c_l72_c7_1bb5_iftrue <= VAR_ins_MUX_uxn_c_l72_c7_1bb5_iftrue;
     ins_MUX_uxn_c_l72_c7_1bb5_iffalse <= VAR_ins_MUX_uxn_c_l72_c7_1bb5_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l72_c7_1bb5_return_output := ins_MUX_uxn_c_l72_c7_1bb5_return_output;

     -- printf_uxn_c_l70_c3_5b79[uxn_c_l70_c3_5b79] LATENCY=0
     -- Clock enable
     printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_CLOCK_ENABLE <= VAR_printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_arg0 <= VAR_printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_arg0;
     printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_arg1 <= VAR_printf_uxn_c_l70_c3_5b79_uxn_c_l70_c3_5b79_arg1;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l72_c1_93c3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2e10_return_output;
     VAR_printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_93c3_return_output;
     VAR_ins_MUX_uxn_c_l66_c2_bad8_iffalse := VAR_ins_MUX_uxn_c_l72_c7_1bb5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c1_88c1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_return_output;

     -- ins_MUX[uxn_c_l66_c2_bad8] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l66_c2_bad8_cond <= VAR_ins_MUX_uxn_c_l66_c2_bad8_cond;
     ins_MUX_uxn_c_l66_c2_bad8_iftrue <= VAR_ins_MUX_uxn_c_l66_c2_bad8_iftrue;
     ins_MUX_uxn_c_l66_c2_bad8_iffalse <= VAR_ins_MUX_uxn_c_l66_c2_bad8_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l66_c2_bad8_return_output := ins_MUX_uxn_c_l66_c2_bad8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l76_c1_cea3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_return_output;

     -- printf_uxn_c_l74_c3_6aed[uxn_c_l74_c3_6aed] LATENCY=0
     -- Clock enable
     printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_CLOCK_ENABLE <= VAR_printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg0 <= VAR_printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg0;
     printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg1 <= VAR_printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg1;
     printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg2 <= VAR_printf_uxn_c_l74_c3_6aed_uxn_c_l74_c3_6aed_arg2;
     -- Outputs

     -- Submodule level 4
     VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_return_output;
     VAR_printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_88c1_return_output;
     VAR_printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l76_c1_cea3_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l66_c2_bad8_return_output;
     -- printf_uxn_c_l79_c3_fb36[uxn_c_l79_c3_fb36] LATENCY=0
     -- Clock enable
     printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_CLOCK_ENABLE <= VAR_printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg0 <= VAR_printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg0;
     printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg1 <= VAR_printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg1;
     printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg2 <= VAR_printf_uxn_c_l79_c3_fb36_uxn_c_l79_c3_fb36_arg2;
     -- Outputs

     -- eval_opcode_phased[uxn_c_l82_c24_aa02] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l82_c24_aa02_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l82_c24_aa02_phase <= VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_phase;
     eval_opcode_phased_uxn_c_l82_c24_aa02_ins <= VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_ins;
     eval_opcode_phased_uxn_c_l82_c24_aa02_pc <= VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_pc;
     eval_opcode_phased_uxn_c_l82_c24_aa02_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_previous_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_return_output := eval_opcode_phased_uxn_c_l82_c24_aa02_return_output;

     -- Submodule level 5
     VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2e10_iffalse := VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l88_c38_00eb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l88_c38_00eb_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_return_output.vram_write_layer;

     -- CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d[uxn_c_l90_c32_439d] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l90_c32_439d_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_return_output.vram_value;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d[uxn_c_l86_c31_ceaa] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l86_c31_ceaa_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l91_c17_c799] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l91_c17_c799_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_return_output.is_opc_done;

     -- eval_opcode_result_MUX[uxn_c_l76_c7_2e10] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l76_c7_2e10_cond <= VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2e10_cond;
     eval_opcode_result_MUX_uxn_c_l76_c7_2e10_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2e10_iftrue;
     eval_opcode_result_MUX_uxn_c_l76_c7_2e10_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2e10_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2e10_return_output := eval_opcode_result_MUX_uxn_c_l76_c7_2e10_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l87_c35_017c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l87_c35_017c_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_return_output.is_vram_write;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l89_c34_7fc2] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l89_c34_7fc2_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l83_c8_854b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_854b_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_return_output.is_pc_updated;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d[uxn_c_l85_c33_3525] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l85_c33_3525_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_return_output.ram_addr;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l84_c34_ea42] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_ea42_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_return_output.is_ram_write;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d[uxn_c_l83_c43_2381] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l83_c43_2381_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_aa02_return_output.pc;

     -- Submodule level 6
     VAR_MUX_uxn_c_l83_c8_870c_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l83_c43_2381_return_output;
     VAR_is_ins_done_MUX_uxn_c_l76_c7_2e10_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l91_c17_c799_return_output;
     VAR_MUX_uxn_c_l83_c8_870c_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_854b_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2e10_return_output;
     -- is_ins_done_MUX[uxn_c_l76_c7_2e10] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l76_c7_2e10_cond <= VAR_is_ins_done_MUX_uxn_c_l76_c7_2e10_cond;
     is_ins_done_MUX_uxn_c_l76_c7_2e10_iftrue <= VAR_is_ins_done_MUX_uxn_c_l76_c7_2e10_iftrue;
     is_ins_done_MUX_uxn_c_l76_c7_2e10_iffalse <= VAR_is_ins_done_MUX_uxn_c_l76_c7_2e10_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l76_c7_2e10_return_output := is_ins_done_MUX_uxn_c_l76_c7_2e10_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a6e5[uxn_c_l76_c7_2e10] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a6e5_uxn_c_l76_c7_2e10_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a6e5(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_ea42_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l85_c33_3525_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l86_c31_ceaa_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l87_c35_017c_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l88_c38_00eb_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l89_c34_7fc2_return_output,
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l90_c32_439d_return_output);

     -- eval_opcode_result_MUX[uxn_c_l72_c7_1bb5] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_cond <= VAR_eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_cond;
     eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_iftrue;
     eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_return_output := eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_return_output;

     -- MUX[uxn_c_l83_c8_870c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l83_c8_870c_cond <= VAR_MUX_uxn_c_l83_c8_870c_cond;
     MUX_uxn_c_l83_c8_870c_iftrue <= VAR_MUX_uxn_c_l83_c8_870c_iftrue;
     MUX_uxn_c_l83_c8_870c_iffalse <= VAR_MUX_uxn_c_l83_c8_870c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l83_c8_870c_return_output := MUX_uxn_c_l83_c8_870c_return_output;

     -- Submodule level 7
     VAR_pc_uxn_c_l83_c3_c96a := VAR_MUX_uxn_c_l83_c8_870c_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l76_c7_2e10_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a6e5_uxn_c_l76_c7_2e10_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l66_c2_bad8_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l72_c7_1bb5_return_output;
     VAR_is_ins_done_MUX_uxn_c_l72_c7_1bb5_iffalse := VAR_is_ins_done_MUX_uxn_c_l76_c7_2e10_return_output;
     VAR_pc_MUX_uxn_c_l76_c7_2e10_iffalse := VAR_pc_uxn_c_l83_c3_c96a;
     VAR_printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg1 := resize(VAR_pc_uxn_c_l83_c3_c96a, 32);
     -- eval_opcode_result_MUX[uxn_c_l66_c2_bad8] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l66_c2_bad8_cond <= VAR_eval_opcode_result_MUX_uxn_c_l66_c2_bad8_cond;
     eval_opcode_result_MUX_uxn_c_l66_c2_bad8_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l66_c2_bad8_iftrue;
     eval_opcode_result_MUX_uxn_c_l66_c2_bad8_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l66_c2_bad8_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l66_c2_bad8_return_output := eval_opcode_result_MUX_uxn_c_l66_c2_bad8_return_output;

     -- is_ins_done_MUX[uxn_c_l72_c7_1bb5] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l72_c7_1bb5_cond <= VAR_is_ins_done_MUX_uxn_c_l72_c7_1bb5_cond;
     is_ins_done_MUX_uxn_c_l72_c7_1bb5_iftrue <= VAR_is_ins_done_MUX_uxn_c_l72_c7_1bb5_iftrue;
     is_ins_done_MUX_uxn_c_l72_c7_1bb5_iffalse <= VAR_is_ins_done_MUX_uxn_c_l72_c7_1bb5_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l72_c7_1bb5_return_output := is_ins_done_MUX_uxn_c_l72_c7_1bb5_return_output;

     -- printf_uxn_c_l92_c3_fad3[uxn_c_l92_c3_fad3] LATENCY=0
     -- Clock enable
     printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_CLOCK_ENABLE <= VAR_printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg0 <= VAR_printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg0;
     printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg1 <= VAR_printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg1;
     printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg2 <= VAR_printf_uxn_c_l92_c3_fad3_uxn_c_l92_c3_fad3_arg2;
     -- Outputs

     -- cpu_step_result_MUX[uxn_c_l76_c7_2e10] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l76_c7_2e10_cond <= VAR_cpu_step_result_MUX_uxn_c_l76_c7_2e10_cond;
     cpu_step_result_MUX_uxn_c_l76_c7_2e10_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l76_c7_2e10_iftrue;
     cpu_step_result_MUX_uxn_c_l76_c7_2e10_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l76_c7_2e10_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l76_c7_2e10_return_output := cpu_step_result_MUX_uxn_c_l76_c7_2e10_return_output;

     -- pc_MUX[uxn_c_l76_c7_2e10] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l76_c7_2e10_cond <= VAR_pc_MUX_uxn_c_l76_c7_2e10_cond;
     pc_MUX_uxn_c_l76_c7_2e10_iftrue <= VAR_pc_MUX_uxn_c_l76_c7_2e10_iftrue;
     pc_MUX_uxn_c_l76_c7_2e10_iffalse <= VAR_pc_MUX_uxn_c_l76_c7_2e10_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l76_c7_2e10_return_output := pc_MUX_uxn_c_l76_c7_2e10_return_output;

     -- Submodule level 8
     VAR_cpu_step_result_MUX_uxn_c_l72_c7_1bb5_iffalse := VAR_cpu_step_result_MUX_uxn_c_l76_c7_2e10_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l66_c2_bad8_return_output;
     VAR_is_ins_done_MUX_uxn_c_l66_c2_bad8_iffalse := VAR_is_ins_done_MUX_uxn_c_l72_c7_1bb5_return_output;
     VAR_pc_MUX_uxn_c_l72_c7_1bb5_iffalse := VAR_pc_MUX_uxn_c_l76_c7_2e10_return_output;
     -- is_ins_done_MUX[uxn_c_l66_c2_bad8] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l66_c2_bad8_cond <= VAR_is_ins_done_MUX_uxn_c_l66_c2_bad8_cond;
     is_ins_done_MUX_uxn_c_l66_c2_bad8_iftrue <= VAR_is_ins_done_MUX_uxn_c_l66_c2_bad8_iftrue;
     is_ins_done_MUX_uxn_c_l66_c2_bad8_iffalse <= VAR_is_ins_done_MUX_uxn_c_l66_c2_bad8_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l66_c2_bad8_return_output := is_ins_done_MUX_uxn_c_l66_c2_bad8_return_output;

     -- pc_MUX[uxn_c_l72_c7_1bb5] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l72_c7_1bb5_cond <= VAR_pc_MUX_uxn_c_l72_c7_1bb5_cond;
     pc_MUX_uxn_c_l72_c7_1bb5_iftrue <= VAR_pc_MUX_uxn_c_l72_c7_1bb5_iftrue;
     pc_MUX_uxn_c_l72_c7_1bb5_iffalse <= VAR_pc_MUX_uxn_c_l72_c7_1bb5_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l72_c7_1bb5_return_output := pc_MUX_uxn_c_l72_c7_1bb5_return_output;

     -- cpu_step_result_MUX[uxn_c_l72_c7_1bb5] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l72_c7_1bb5_cond <= VAR_cpu_step_result_MUX_uxn_c_l72_c7_1bb5_cond;
     cpu_step_result_MUX_uxn_c_l72_c7_1bb5_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l72_c7_1bb5_iftrue;
     cpu_step_result_MUX_uxn_c_l72_c7_1bb5_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l72_c7_1bb5_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l72_c7_1bb5_return_output := cpu_step_result_MUX_uxn_c_l72_c7_1bb5_return_output;

     -- Submodule level 9
     VAR_cpu_step_result_MUX_uxn_c_l66_c2_bad8_iffalse := VAR_cpu_step_result_MUX_uxn_c_l72_c7_1bb5_return_output;
     VAR_BIN_OP_EQ_uxn_c_l95_c6_e7ae_left := VAR_is_ins_done_MUX_uxn_c_l66_c2_bad8_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l66_c2_bad8_return_output;
     VAR_pc_MUX_uxn_c_l66_c2_bad8_iffalse := VAR_pc_MUX_uxn_c_l72_c7_1bb5_return_output;
     -- pc_MUX[uxn_c_l66_c2_bad8] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l66_c2_bad8_cond <= VAR_pc_MUX_uxn_c_l66_c2_bad8_cond;
     pc_MUX_uxn_c_l66_c2_bad8_iftrue <= VAR_pc_MUX_uxn_c_l66_c2_bad8_iftrue;
     pc_MUX_uxn_c_l66_c2_bad8_iffalse <= VAR_pc_MUX_uxn_c_l66_c2_bad8_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l66_c2_bad8_return_output := pc_MUX_uxn_c_l66_c2_bad8_return_output;

     -- BIN_OP_EQ[uxn_c_l95_c6_e7ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l95_c6_e7ae_left <= VAR_BIN_OP_EQ_uxn_c_l95_c6_e7ae_left;
     BIN_OP_EQ_uxn_c_l95_c6_e7ae_right <= VAR_BIN_OP_EQ_uxn_c_l95_c6_e7ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l95_c6_e7ae_return_output := BIN_OP_EQ_uxn_c_l95_c6_e7ae_return_output;

     -- cpu_step_result_MUX[uxn_c_l66_c2_bad8] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l66_c2_bad8_cond <= VAR_cpu_step_result_MUX_uxn_c_l66_c2_bad8_cond;
     cpu_step_result_MUX_uxn_c_l66_c2_bad8_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l66_c2_bad8_iftrue;
     cpu_step_result_MUX_uxn_c_l66_c2_bad8_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l66_c2_bad8_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l66_c2_bad8_return_output := cpu_step_result_MUX_uxn_c_l66_c2_bad8_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_21a5_cond := VAR_BIN_OP_EQ_uxn_c_l95_c6_e7ae_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l66_c2_bad8_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l66_c2_bad8_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l66_c2_bad8_return_output;
     -- step_cpu_phase_MUX[uxn_c_l95_c2_21a5] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l95_c2_21a5_cond <= VAR_step_cpu_phase_MUX_uxn_c_l95_c2_21a5_cond;
     step_cpu_phase_MUX_uxn_c_l95_c2_21a5_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l95_c2_21a5_iftrue;
     step_cpu_phase_MUX_uxn_c_l95_c2_21a5_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l95_c2_21a5_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_21a5_return_output := step_cpu_phase_MUX_uxn_c_l95_c2_21a5_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l95_c2_21a5_return_output;
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
