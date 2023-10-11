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
entity step_cpu_0CLK_f508a836 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ram_read_value : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_f508a836;
architecture arch of step_cpu_0CLK_f508a836 is
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
-- BIN_OP_EQ[uxn_c_l67_c6_32aa]
signal BIN_OP_EQ_uxn_c_l67_c6_32aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l67_c6_32aa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l67_c6_32aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l67_c1_8202]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l73_c7_b770]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l67_c2_d913]
signal cpu_step_result_MUX_uxn_c_l67_c2_d913_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l67_c2_d913_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l67_c2_d913_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l67_c2_d913_return_output : cpu_step_result_t;

-- pc_MUX[uxn_c_l67_c2_d913]
signal pc_MUX_uxn_c_l67_c2_d913_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l67_c2_d913_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l67_c2_d913_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l67_c2_d913_return_output : unsigned(15 downto 0);

-- is_ins_done_MUX[uxn_c_l67_c2_d913]
signal is_ins_done_MUX_uxn_c_l67_c2_d913_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l67_c2_d913_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l67_c2_d913_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l67_c2_d913_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l67_c2_d913]
signal ins_MUX_uxn_c_l67_c2_d913_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l67_c2_d913_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l67_c2_d913_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l67_c2_d913_return_output : unsigned(7 downto 0);

-- eval_opcode_result_MUX[uxn_c_l67_c2_d913]
signal eval_opcode_result_MUX_uxn_c_l67_c2_d913_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l67_c2_d913_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l67_c2_d913_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l67_c2_d913_return_output : eval_opcode_result_t;

-- printf_uxn_c_l71_c3_5aaf[uxn_c_l71_c3_5aaf]
signal printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l73_c11_9d58]
signal BIN_OP_EQ_uxn_c_l73_c11_9d58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l73_c11_9d58_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l73_c11_9d58_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l73_c1_8afe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l77_c7_b1a8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l73_c7_b770]
signal cpu_step_result_MUX_uxn_c_l73_c7_b770_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l73_c7_b770_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l73_c7_b770_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l73_c7_b770_return_output : cpu_step_result_t;

-- pc_MUX[uxn_c_l73_c7_b770]
signal pc_MUX_uxn_c_l73_c7_b770_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l73_c7_b770_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l73_c7_b770_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l73_c7_b770_return_output : unsigned(15 downto 0);

-- is_ins_done_MUX[uxn_c_l73_c7_b770]
signal is_ins_done_MUX_uxn_c_l73_c7_b770_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l73_c7_b770_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l73_c7_b770_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l73_c7_b770_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l73_c7_b770]
signal ins_MUX_uxn_c_l73_c7_b770_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l73_c7_b770_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l73_c7_b770_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l73_c7_b770_return_output : unsigned(7 downto 0);

-- eval_opcode_result_MUX[uxn_c_l73_c7_b770]
signal eval_opcode_result_MUX_uxn_c_l73_c7_b770_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l73_c7_b770_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l73_c7_b770_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l73_c7_b770_return_output : eval_opcode_result_t;

-- printf_uxn_c_l75_c3_aa99[uxn_c_l75_c3_aa99]
signal printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l77_c11_7791]
signal BIN_OP_EQ_uxn_c_l77_c11_7791_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l77_c11_7791_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l77_c11_7791_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l77_c1_43d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c1_c88a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l77_c7_b1a8]
signal cpu_step_result_MUX_uxn_c_l77_c7_b1a8_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l77_c7_b1a8_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l77_c7_b1a8_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l77_c7_b1a8_return_output : cpu_step_result_t;

-- pc_MUX[uxn_c_l77_c7_b1a8]
signal pc_MUX_uxn_c_l77_c7_b1a8_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l77_c7_b1a8_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l77_c7_b1a8_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l77_c7_b1a8_return_output : unsigned(15 downto 0);

-- is_ins_done_MUX[uxn_c_l77_c7_b1a8]
signal is_ins_done_MUX_uxn_c_l77_c7_b1a8_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_b1a8_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_b1a8_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_b1a8_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l77_c7_b1a8]
signal ins_MUX_uxn_c_l77_c7_b1a8_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l77_c7_b1a8_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l77_c7_b1a8_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l77_c7_b1a8_return_output : unsigned(7 downto 0);

-- eval_opcode_result_MUX[uxn_c_l77_c7_b1a8]
signal eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_return_output : eval_opcode_result_t;

-- BIN_OP_PLUS[uxn_c_l79_c3_c28d]
signal BIN_OP_PLUS_uxn_c_l79_c3_c28d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l79_c3_c28d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l79_c3_c28d_return_output : unsigned(16 downto 0);

-- printf_uxn_c_l80_c3_3855[uxn_c_l80_c3_3855]
signal printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg2 : unsigned(31 downto 0);

-- BIN_OP_MINUS[uxn_c_l83_c43_7c2a]
signal BIN_OP_MINUS_uxn_c_l83_c43_7c2a_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l83_c43_7c2a_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l83_c43_7c2a_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l83_c24_9c84]
signal eval_opcode_phased_uxn_c_l83_c24_9c84_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l83_c24_9c84_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l83_c24_9c84_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l83_c24_9c84_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l83_c24_9c84_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l83_c24_9c84_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l84_c8_2d92]
signal MUX_uxn_c_l84_c8_2d92_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l84_c8_2d92_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l84_c8_2d92_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l84_c8_2d92_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l92_c3_a1f6[uxn_c_l92_c3_a1f6]
signal printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l95_c6_9168]
signal BIN_OP_EQ_uxn_c_l95_c6_9168_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l95_c6_9168_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l95_c6_9168_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l95_c2_baed]
signal step_cpu_phase_MUX_uxn_c_l95_c2_baed_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l95_c2_baed_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l95_c2_baed_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l95_c2_baed_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l98_c3_ef02]
signal BIN_OP_PLUS_uxn_c_l98_c3_ef02_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l98_c3_ef02_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l98_c3_ef02_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_01a8( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base.is_ram_write := ref_toks_0;
      base.ram_address := ref_toks_1;
      base.ram_value := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.vram_address := ref_toks_4;
      base.vram_value := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_c_l67_c6_32aa
BIN_OP_EQ_uxn_c_l67_c6_32aa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l67_c6_32aa_left,
BIN_OP_EQ_uxn_c_l67_c6_32aa_right,
BIN_OP_EQ_uxn_c_l67_c6_32aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202
TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770
FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_return_output);

-- cpu_step_result_MUX_uxn_c_l67_c2_d913
cpu_step_result_MUX_uxn_c_l67_c2_d913 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l67_c2_d913_cond,
cpu_step_result_MUX_uxn_c_l67_c2_d913_iftrue,
cpu_step_result_MUX_uxn_c_l67_c2_d913_iffalse,
cpu_step_result_MUX_uxn_c_l67_c2_d913_return_output);

-- pc_MUX_uxn_c_l67_c2_d913
pc_MUX_uxn_c_l67_c2_d913 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l67_c2_d913_cond,
pc_MUX_uxn_c_l67_c2_d913_iftrue,
pc_MUX_uxn_c_l67_c2_d913_iffalse,
pc_MUX_uxn_c_l67_c2_d913_return_output);

-- is_ins_done_MUX_uxn_c_l67_c2_d913
is_ins_done_MUX_uxn_c_l67_c2_d913 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l67_c2_d913_cond,
is_ins_done_MUX_uxn_c_l67_c2_d913_iftrue,
is_ins_done_MUX_uxn_c_l67_c2_d913_iffalse,
is_ins_done_MUX_uxn_c_l67_c2_d913_return_output);

-- ins_MUX_uxn_c_l67_c2_d913
ins_MUX_uxn_c_l67_c2_d913 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l67_c2_d913_cond,
ins_MUX_uxn_c_l67_c2_d913_iftrue,
ins_MUX_uxn_c_l67_c2_d913_iffalse,
ins_MUX_uxn_c_l67_c2_d913_return_output);

-- eval_opcode_result_MUX_uxn_c_l67_c2_d913
eval_opcode_result_MUX_uxn_c_l67_c2_d913 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l67_c2_d913_cond,
eval_opcode_result_MUX_uxn_c_l67_c2_d913_iftrue,
eval_opcode_result_MUX_uxn_c_l67_c2_d913_iffalse,
eval_opcode_result_MUX_uxn_c_l67_c2_d913_return_output);

-- printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf
printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf : entity work.printf_uxn_c_l71_c3_5aaf_0CLK_de264c78 port map (
printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_CLOCK_ENABLE,
printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_arg0,
printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_arg1);

-- BIN_OP_EQ_uxn_c_l73_c11_9d58
BIN_OP_EQ_uxn_c_l73_c11_9d58 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l73_c11_9d58_left,
BIN_OP_EQ_uxn_c_l73_c11_9d58_right,
BIN_OP_EQ_uxn_c_l73_c11_9d58_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe
TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_return_output);

-- cpu_step_result_MUX_uxn_c_l73_c7_b770
cpu_step_result_MUX_uxn_c_l73_c7_b770 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l73_c7_b770_cond,
cpu_step_result_MUX_uxn_c_l73_c7_b770_iftrue,
cpu_step_result_MUX_uxn_c_l73_c7_b770_iffalse,
cpu_step_result_MUX_uxn_c_l73_c7_b770_return_output);

-- pc_MUX_uxn_c_l73_c7_b770
pc_MUX_uxn_c_l73_c7_b770 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l73_c7_b770_cond,
pc_MUX_uxn_c_l73_c7_b770_iftrue,
pc_MUX_uxn_c_l73_c7_b770_iffalse,
pc_MUX_uxn_c_l73_c7_b770_return_output);

-- is_ins_done_MUX_uxn_c_l73_c7_b770
is_ins_done_MUX_uxn_c_l73_c7_b770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l73_c7_b770_cond,
is_ins_done_MUX_uxn_c_l73_c7_b770_iftrue,
is_ins_done_MUX_uxn_c_l73_c7_b770_iffalse,
is_ins_done_MUX_uxn_c_l73_c7_b770_return_output);

-- ins_MUX_uxn_c_l73_c7_b770
ins_MUX_uxn_c_l73_c7_b770 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l73_c7_b770_cond,
ins_MUX_uxn_c_l73_c7_b770_iftrue,
ins_MUX_uxn_c_l73_c7_b770_iffalse,
ins_MUX_uxn_c_l73_c7_b770_return_output);

-- eval_opcode_result_MUX_uxn_c_l73_c7_b770
eval_opcode_result_MUX_uxn_c_l73_c7_b770 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l73_c7_b770_cond,
eval_opcode_result_MUX_uxn_c_l73_c7_b770_iftrue,
eval_opcode_result_MUX_uxn_c_l73_c7_b770_iffalse,
eval_opcode_result_MUX_uxn_c_l73_c7_b770_return_output);

-- printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99
printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99 : entity work.printf_uxn_c_l75_c3_aa99_0CLK_de264c78 port map (
printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_CLOCK_ENABLE,
printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg0,
printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg1,
printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg2);

-- BIN_OP_EQ_uxn_c_l77_c11_7791
BIN_OP_EQ_uxn_c_l77_c11_7791 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l77_c11_7791_left,
BIN_OP_EQ_uxn_c_l77_c11_7791_right,
BIN_OP_EQ_uxn_c_l77_c11_7791_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4
TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_return_output);

-- cpu_step_result_MUX_uxn_c_l77_c7_b1a8
cpu_step_result_MUX_uxn_c_l77_c7_b1a8 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l77_c7_b1a8_cond,
cpu_step_result_MUX_uxn_c_l77_c7_b1a8_iftrue,
cpu_step_result_MUX_uxn_c_l77_c7_b1a8_iffalse,
cpu_step_result_MUX_uxn_c_l77_c7_b1a8_return_output);

-- pc_MUX_uxn_c_l77_c7_b1a8
pc_MUX_uxn_c_l77_c7_b1a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l77_c7_b1a8_cond,
pc_MUX_uxn_c_l77_c7_b1a8_iftrue,
pc_MUX_uxn_c_l77_c7_b1a8_iffalse,
pc_MUX_uxn_c_l77_c7_b1a8_return_output);

-- is_ins_done_MUX_uxn_c_l77_c7_b1a8
is_ins_done_MUX_uxn_c_l77_c7_b1a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l77_c7_b1a8_cond,
is_ins_done_MUX_uxn_c_l77_c7_b1a8_iftrue,
is_ins_done_MUX_uxn_c_l77_c7_b1a8_iffalse,
is_ins_done_MUX_uxn_c_l77_c7_b1a8_return_output);

-- ins_MUX_uxn_c_l77_c7_b1a8
ins_MUX_uxn_c_l77_c7_b1a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l77_c7_b1a8_cond,
ins_MUX_uxn_c_l77_c7_b1a8_iftrue,
ins_MUX_uxn_c_l77_c7_b1a8_iffalse,
ins_MUX_uxn_c_l77_c7_b1a8_return_output);

-- eval_opcode_result_MUX_uxn_c_l77_c7_b1a8
eval_opcode_result_MUX_uxn_c_l77_c7_b1a8 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_cond,
eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_iftrue,
eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_iffalse,
eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_return_output);

-- BIN_OP_PLUS_uxn_c_l79_c3_c28d
BIN_OP_PLUS_uxn_c_l79_c3_c28d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l79_c3_c28d_left,
BIN_OP_PLUS_uxn_c_l79_c3_c28d_right,
BIN_OP_PLUS_uxn_c_l79_c3_c28d_return_output);

-- printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855
printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855 : entity work.printf_uxn_c_l80_c3_3855_0CLK_de264c78 port map (
printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_CLOCK_ENABLE,
printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg0,
printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg1,
printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg2);

-- BIN_OP_MINUS_uxn_c_l83_c43_7c2a
BIN_OP_MINUS_uxn_c_l83_c43_7c2a : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l83_c43_7c2a_left,
BIN_OP_MINUS_uxn_c_l83_c43_7c2a_right,
BIN_OP_MINUS_uxn_c_l83_c43_7c2a_return_output);

-- eval_opcode_phased_uxn_c_l83_c24_9c84
eval_opcode_phased_uxn_c_l83_c24_9c84 : entity work.eval_opcode_phased_0CLK_d5dcc70e port map (
clk,
eval_opcode_phased_uxn_c_l83_c24_9c84_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l83_c24_9c84_phase,
eval_opcode_phased_uxn_c_l83_c24_9c84_ins,
eval_opcode_phased_uxn_c_l83_c24_9c84_pc,
eval_opcode_phased_uxn_c_l83_c24_9c84_previous_ram_read,
eval_opcode_phased_uxn_c_l83_c24_9c84_return_output);

-- MUX_uxn_c_l84_c8_2d92
MUX_uxn_c_l84_c8_2d92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l84_c8_2d92_cond,
MUX_uxn_c_l84_c8_2d92_iftrue,
MUX_uxn_c_l84_c8_2d92_iffalse,
MUX_uxn_c_l84_c8_2d92_return_output);

-- printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6
printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6 : entity work.printf_uxn_c_l92_c3_a1f6_0CLK_de264c78 port map (
printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_CLOCK_ENABLE,
printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg0,
printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg1,
printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg2);

-- BIN_OP_EQ_uxn_c_l95_c6_9168
BIN_OP_EQ_uxn_c_l95_c6_9168 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l95_c6_9168_left,
BIN_OP_EQ_uxn_c_l95_c6_9168_right,
BIN_OP_EQ_uxn_c_l95_c6_9168_return_output);

-- step_cpu_phase_MUX_uxn_c_l95_c2_baed
step_cpu_phase_MUX_uxn_c_l95_c2_baed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l95_c2_baed_cond,
step_cpu_phase_MUX_uxn_c_l95_c2_baed_iftrue,
step_cpu_phase_MUX_uxn_c_l95_c2_baed_iffalse,
step_cpu_phase_MUX_uxn_c_l95_c2_baed_return_output);

-- BIN_OP_PLUS_uxn_c_l98_c3_ef02
BIN_OP_PLUS_uxn_c_l98_c3_ef02 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l98_c3_ef02_left,
BIN_OP_PLUS_uxn_c_l98_c3_ef02_right,
BIN_OP_PLUS_uxn_c_l98_c3_ef02_return_output);



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
 BIN_OP_EQ_uxn_c_l67_c6_32aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_return_output,
 cpu_step_result_MUX_uxn_c_l67_c2_d913_return_output,
 pc_MUX_uxn_c_l67_c2_d913_return_output,
 is_ins_done_MUX_uxn_c_l67_c2_d913_return_output,
 ins_MUX_uxn_c_l67_c2_d913_return_output,
 eval_opcode_result_MUX_uxn_c_l67_c2_d913_return_output,
 BIN_OP_EQ_uxn_c_l73_c11_9d58_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_return_output,
 cpu_step_result_MUX_uxn_c_l73_c7_b770_return_output,
 pc_MUX_uxn_c_l73_c7_b770_return_output,
 is_ins_done_MUX_uxn_c_l73_c7_b770_return_output,
 ins_MUX_uxn_c_l73_c7_b770_return_output,
 eval_opcode_result_MUX_uxn_c_l73_c7_b770_return_output,
 BIN_OP_EQ_uxn_c_l77_c11_7791_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_return_output,
 cpu_step_result_MUX_uxn_c_l77_c7_b1a8_return_output,
 pc_MUX_uxn_c_l77_c7_b1a8_return_output,
 is_ins_done_MUX_uxn_c_l77_c7_b1a8_return_output,
 ins_MUX_uxn_c_l77_c7_b1a8_return_output,
 eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_return_output,
 BIN_OP_PLUS_uxn_c_l79_c3_c28d_return_output,
 BIN_OP_MINUS_uxn_c_l83_c43_7c2a_return_output,
 eval_opcode_phased_uxn_c_l83_c24_9c84_return_output,
 MUX_uxn_c_l84_c8_2d92_return_output,
 BIN_OP_EQ_uxn_c_l95_c6_9168_return_output,
 step_cpu_phase_MUX_uxn_c_l95_c2_baed_return_output,
 BIN_OP_PLUS_uxn_c_l98_c3_ef02_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_ram_read_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l67_c6_32aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l67_c6_32aa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l67_c6_32aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l67_c2_d913_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a_uxn_c_l67_c2_d913_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l67_c2_d913_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l73_c7_b770_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l67_c2_d913_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l67_c2_d913_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l67_c2_d913_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l67_c2_d913_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c7_b770_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l67_c2_d913_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l67_c2_d913_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l67_c2_d913_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l67_c2_d913_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c7_b770_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l67_c2_d913_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l67_c2_d913_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l67_c2_d913_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l67_c2_d913_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c7_b770_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l67_c2_d913_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l67_c2_d913_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l67_c2_d913_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l67_c2_d913_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c7_b770_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l67_c2_d913_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l67_c2_d913_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l73_c11_9d58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l73_c11_9d58_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l73_c11_9d58_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l73_c7_b770_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247_uxn_c_l73_c7_b770_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l73_c7_b770_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_b1a8_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l73_c7_b770_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c7_b770_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c7_b770_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_b1a8_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c7_b770_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c7_b770_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c7_b770_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_b1a8_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c7_b770_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c7_b770_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c7_b770_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_b1a8_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c7_b770_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c7_b770_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c7_b770_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c7_b770_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_7791_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_7791_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_7791_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_b1a8_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_b1a8_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_01a8_uxn_c_l77_c7_b1a8_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_b1a8_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_b1a8_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l79_c3_7d72 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_b1a8_iffalse : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l84_c3_6713 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_b1a8_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_b1a8_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_b1a8_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_b1a8_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_b1a8_iftrue : unsigned(7 downto 0);
 variable VAR_ins_uxn_c_l78_c3_d32c : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_b1a8_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_b1a8_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l79_c3_c28d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l79_c3_c28d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l79_c3_c28d_return_output : unsigned(16 downto 0);
 variable VAR_printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg2 : unsigned(31 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l83_c43_7c2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l83_c43_7c2a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l83_c43_7c2a_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l84_c8_2d92_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l84_c8_2d92_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l84_c8_2d92_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l84_c8_27a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l84_c43_0dcd_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l84_c8_2d92_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l85_c34_b1a9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l86_c33_2f84_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l87_c31_16d7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l88_c35_bcc7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l89_c34_746c_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l90_c32_f4ae_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l91_c17_663b_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l95_c6_9168_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l95_c6_9168_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l95_c6_9168_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_baed_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l96_c3_fe33 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_baed_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l98_c3_4d16 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_baed_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_baed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l98_c3_ef02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l98_c3_ef02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l98_c3_ef02_return_output : unsigned(8 downto 0);
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
     VAR_BIN_OP_EQ_uxn_c_l67_c6_32aa_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l95_c6_9168_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l98_c3_ef02_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l77_c11_7791_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l79_c3_c28d_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_iftrue := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l67_c2_d913_iftrue := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l96_c3_fe33 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_baed_iftrue := VAR_step_cpu_phase_uxn_c_l96_c3_fe33;
     VAR_BIN_OP_EQ_uxn_c_l73_c11_9d58_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l83_c43_7c2a_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ram_read_value := ram_read_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_iftrue := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_b1a8_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l67_c2_d913_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l73_c7_b770_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_iftrue := eval_opcode_result;
     VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_ins := ins;
     VAR_ins_MUX_uxn_c_l67_c2_d913_iftrue := ins;
     VAR_ins_MUX_uxn_c_l73_c7_b770_iftrue := ins;
     VAR_ins_MUX_uxn_c_l77_c7_b1a8_iffalse := ins;
     VAR_printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg2 := resize(ins, 32);
     VAR_printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg2 := resize(ins, 32);
     VAR_is_ins_done_MUX_uxn_c_l73_c7_b770_iftrue := is_ins_done;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_b1a8_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l79_c3_c28d_left := pc;
     VAR_MUX_uxn_c_l84_c8_2d92_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_pc := pc;
     VAR_pc_MUX_uxn_c_l67_c2_d913_iftrue := pc;
     VAR_pc_MUX_uxn_c_l73_c7_b770_iftrue := pc;
     VAR_printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_arg1 := resize(pc, 32);
     VAR_printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg1 := resize(pc, 32);
     VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_previous_ram_read := VAR_ram_read_value;
     VAR_ins_uxn_c_l78_c3_d32c := VAR_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l67_c6_32aa_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l73_c11_9d58_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l77_c11_7791_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l83_c43_7c2a_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l98_c3_ef02_left := step_cpu_phase;
     VAR_printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg0 := resize(step_cpu_phase, 32);
     VAR_ins_MUX_uxn_c_l77_c7_b1a8_iftrue := VAR_ins_uxn_c_l78_c3_d32c;
     VAR_printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg2 := resize(VAR_ins_uxn_c_l78_c3_d32c, 32);
     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247[uxn_c_l73_c7_b770] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247_uxn_c_l73_c7_b770_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247(
     cpu_step_result,
     pc);

     -- BIN_OP_EQ[uxn_c_l73_c11_9d58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l73_c11_9d58_left <= VAR_BIN_OP_EQ_uxn_c_l73_c11_9d58_left;
     BIN_OP_EQ_uxn_c_l73_c11_9d58_right <= VAR_BIN_OP_EQ_uxn_c_l73_c11_9d58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l73_c11_9d58_return_output := BIN_OP_EQ_uxn_c_l73_c11_9d58_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a[uxn_c_l67_c2_d913] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a_uxn_c_l67_c2_d913_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a(
     cpu_step_result,
     pc,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_c_l77_c11_7791] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l77_c11_7791_left <= VAR_BIN_OP_EQ_uxn_c_l77_c11_7791_left;
     BIN_OP_EQ_uxn_c_l77_c11_7791_right <= VAR_BIN_OP_EQ_uxn_c_l77_c11_7791_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l77_c11_7791_return_output := BIN_OP_EQ_uxn_c_l77_c11_7791_return_output;

     -- BIN_OP_PLUS[uxn_c_l79_c3_c28d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l79_c3_c28d_left <= VAR_BIN_OP_PLUS_uxn_c_l79_c3_c28d_left;
     BIN_OP_PLUS_uxn_c_l79_c3_c28d_right <= VAR_BIN_OP_PLUS_uxn_c_l79_c3_c28d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l79_c3_c28d_return_output := BIN_OP_PLUS_uxn_c_l79_c3_c28d_return_output;

     -- BIN_OP_EQ[uxn_c_l67_c6_32aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l67_c6_32aa_left <= VAR_BIN_OP_EQ_uxn_c_l67_c6_32aa_left;
     BIN_OP_EQ_uxn_c_l67_c6_32aa_right <= VAR_BIN_OP_EQ_uxn_c_l67_c6_32aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l67_c6_32aa_return_output := BIN_OP_EQ_uxn_c_l67_c6_32aa_return_output;

     -- BIN_OP_MINUS[uxn_c_l83_c43_7c2a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l83_c43_7c2a_left <= VAR_BIN_OP_MINUS_uxn_c_l83_c43_7c2a_left;
     BIN_OP_MINUS_uxn_c_l83_c43_7c2a_right <= VAR_BIN_OP_MINUS_uxn_c_l83_c43_7c2a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l83_c43_7c2a_return_output := BIN_OP_MINUS_uxn_c_l83_c43_7c2a_return_output;

     -- BIN_OP_PLUS[uxn_c_l98_c3_ef02] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l98_c3_ef02_left <= VAR_BIN_OP_PLUS_uxn_c_l98_c3_ef02_left;
     BIN_OP_PLUS_uxn_c_l98_c3_ef02_right <= VAR_BIN_OP_PLUS_uxn_c_l98_c3_ef02_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l98_c3_ef02_return_output := BIN_OP_PLUS_uxn_c_l98_c3_ef02_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_cond := VAR_BIN_OP_EQ_uxn_c_l67_c6_32aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_cond := VAR_BIN_OP_EQ_uxn_c_l67_c6_32aa_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l67_c2_d913_cond := VAR_BIN_OP_EQ_uxn_c_l67_c6_32aa_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l67_c2_d913_cond := VAR_BIN_OP_EQ_uxn_c_l67_c6_32aa_return_output;
     VAR_ins_MUX_uxn_c_l67_c2_d913_cond := VAR_BIN_OP_EQ_uxn_c_l67_c6_32aa_return_output;
     VAR_is_ins_done_MUX_uxn_c_l67_c2_d913_cond := VAR_BIN_OP_EQ_uxn_c_l67_c6_32aa_return_output;
     VAR_pc_MUX_uxn_c_l67_c2_d913_cond := VAR_BIN_OP_EQ_uxn_c_l67_c6_32aa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_9d58_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_9d58_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l73_c7_b770_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_9d58_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l73_c7_b770_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_9d58_return_output;
     VAR_ins_MUX_uxn_c_l73_c7_b770_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_9d58_return_output;
     VAR_is_ins_done_MUX_uxn_c_l73_c7_b770_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_9d58_return_output;
     VAR_pc_MUX_uxn_c_l73_c7_b770_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_9d58_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_7791_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_7791_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_b1a8_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_7791_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_7791_return_output;
     VAR_ins_MUX_uxn_c_l77_c7_b1a8_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_7791_return_output;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_b1a8_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_7791_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_b1a8_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_7791_return_output;
     VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_phase := VAR_BIN_OP_MINUS_uxn_c_l83_c43_7c2a_return_output;
     VAR_pc_uxn_c_l79_c3_7d72 := resize(VAR_BIN_OP_PLUS_uxn_c_l79_c3_c28d_return_output, 16);
     VAR_step_cpu_phase_uxn_c_l98_c3_4d16 := resize(VAR_BIN_OP_PLUS_uxn_c_l98_c3_ef02_return_output, 8);
     VAR_cpu_step_result_MUX_uxn_c_l73_c7_b770_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247_uxn_c_l73_c7_b770_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l67_c2_d913_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a_uxn_c_l67_c2_d913_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_b1a8_iftrue := VAR_pc_uxn_c_l79_c3_7d72;
     VAR_printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg1 := resize(VAR_pc_uxn_c_l79_c3_7d72, 32);
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_baed_iffalse := VAR_step_cpu_phase_uxn_c_l98_c3_4d16;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l73_c7_b770] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_return_output;

     -- ins_MUX[uxn_c_l77_c7_b1a8] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l77_c7_b1a8_cond <= VAR_ins_MUX_uxn_c_l77_c7_b1a8_cond;
     ins_MUX_uxn_c_l77_c7_b1a8_iftrue <= VAR_ins_MUX_uxn_c_l77_c7_b1a8_iftrue;
     ins_MUX_uxn_c_l77_c7_b1a8_iffalse <= VAR_ins_MUX_uxn_c_l77_c7_b1a8_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l77_c7_b1a8_return_output := ins_MUX_uxn_c_l77_c7_b1a8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l67_c1_8202] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_b770_return_output;
     VAR_printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_8202_return_output;
     VAR_ins_MUX_uxn_c_l73_c7_b770_iffalse := VAR_ins_MUX_uxn_c_l77_c7_b1a8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l77_c7_b1a8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_return_output;

     -- printf_uxn_c_l71_c3_5aaf[uxn_c_l71_c3_5aaf] LATENCY=0
     -- Clock enable
     printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_CLOCK_ENABLE <= VAR_printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_arg0 <= VAR_printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_arg0;
     printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_arg1 <= VAR_printf_uxn_c_l71_c3_5aaf_uxn_c_l71_c3_5aaf_arg1;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l73_c1_8afe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_return_output;

     -- ins_MUX[uxn_c_l73_c7_b770] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l73_c7_b770_cond <= VAR_ins_MUX_uxn_c_l73_c7_b770_cond;
     ins_MUX_uxn_c_l73_c7_b770_iftrue <= VAR_ins_MUX_uxn_c_l73_c7_b770_iftrue;
     ins_MUX_uxn_c_l73_c7_b770_iffalse <= VAR_ins_MUX_uxn_c_l73_c7_b770_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l73_c7_b770_return_output := ins_MUX_uxn_c_l73_c7_b770_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_b1a8_return_output;
     VAR_printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_8afe_return_output;
     VAR_ins_MUX_uxn_c_l67_c2_d913_iffalse := VAR_ins_MUX_uxn_c_l73_c7_b770_return_output;
     -- printf_uxn_c_l75_c3_aa99[uxn_c_l75_c3_aa99] LATENCY=0
     -- Clock enable
     printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_CLOCK_ENABLE <= VAR_printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg0 <= VAR_printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg0;
     printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg1 <= VAR_printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg1;
     printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg2 <= VAR_printf_uxn_c_l75_c3_aa99_uxn_c_l75_c3_aa99_arg2;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c1_c88a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l77_c1_43d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_return_output;

     -- ins_MUX[uxn_c_l67_c2_d913] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l67_c2_d913_cond <= VAR_ins_MUX_uxn_c_l67_c2_d913_cond;
     ins_MUX_uxn_c_l67_c2_d913_iftrue <= VAR_ins_MUX_uxn_c_l67_c2_d913_iftrue;
     ins_MUX_uxn_c_l67_c2_d913_iffalse <= VAR_ins_MUX_uxn_c_l67_c2_d913_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l67_c2_d913_return_output := ins_MUX_uxn_c_l67_c2_d913_return_output;

     -- Submodule level 4
     VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_return_output;
     VAR_printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_c88a_return_output;
     VAR_printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_43d4_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l67_c2_d913_return_output;
     -- printf_uxn_c_l80_c3_3855[uxn_c_l80_c3_3855] LATENCY=0
     -- Clock enable
     printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_CLOCK_ENABLE <= VAR_printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg0 <= VAR_printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg0;
     printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg1 <= VAR_printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg1;
     printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg2 <= VAR_printf_uxn_c_l80_c3_3855_uxn_c_l80_c3_3855_arg2;
     -- Outputs

     -- eval_opcode_phased[uxn_c_l83_c24_9c84] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l83_c24_9c84_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l83_c24_9c84_phase <= VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_phase;
     eval_opcode_phased_uxn_c_l83_c24_9c84_ins <= VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_ins;
     eval_opcode_phased_uxn_c_l83_c24_9c84_pc <= VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_pc;
     eval_opcode_phased_uxn_c_l83_c24_9c84_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_previous_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_return_output := eval_opcode_phased_uxn_c_l83_c24_9c84_return_output;

     -- Submodule level 5
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_iffalse := VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_return_output;
     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d[uxn_c_l87_c31_16d7] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l87_c31_16d7_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_return_output.ram_value;

     -- CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d[uxn_c_l90_c32_f4ae] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l90_c32_f4ae_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l88_c35_bcc7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l88_c35_bcc7_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l91_c17_663b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l91_c17_663b_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l85_c34_b1a9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l85_c34_b1a9_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l84_c8_27a7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l84_c8_27a7_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_return_output.is_pc_updated;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l89_c34_746c] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l89_c34_746c_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_return_output.vram_address;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d[uxn_c_l86_c33_2f84] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l86_c33_2f84_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_return_output.ram_addr;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d[uxn_c_l84_c43_0dcd] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l84_c43_0dcd_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_9c84_return_output.pc;

     -- eval_opcode_result_MUX[uxn_c_l77_c7_b1a8] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_cond <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_cond;
     eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_iftrue;
     eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_return_output := eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l84_c8_2d92_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l84_c43_0dcd_return_output;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_b1a8_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l91_c17_663b_return_output;
     VAR_MUX_uxn_c_l84_c8_2d92_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l84_c8_27a7_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l73_c7_b770_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l77_c7_b1a8_return_output;
     -- eval_opcode_result_MUX[uxn_c_l73_c7_b770] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l73_c7_b770_cond <= VAR_eval_opcode_result_MUX_uxn_c_l73_c7_b770_cond;
     eval_opcode_result_MUX_uxn_c_l73_c7_b770_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l73_c7_b770_iftrue;
     eval_opcode_result_MUX_uxn_c_l73_c7_b770_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l73_c7_b770_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l73_c7_b770_return_output := eval_opcode_result_MUX_uxn_c_l73_c7_b770_return_output;

     -- is_ins_done_MUX[uxn_c_l77_c7_b1a8] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l77_c7_b1a8_cond <= VAR_is_ins_done_MUX_uxn_c_l77_c7_b1a8_cond;
     is_ins_done_MUX_uxn_c_l77_c7_b1a8_iftrue <= VAR_is_ins_done_MUX_uxn_c_l77_c7_b1a8_iftrue;
     is_ins_done_MUX_uxn_c_l77_c7_b1a8_iffalse <= VAR_is_ins_done_MUX_uxn_c_l77_c7_b1a8_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l77_c7_b1a8_return_output := is_ins_done_MUX_uxn_c_l77_c7_b1a8_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_01a8[uxn_c_l77_c7_b1a8] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_01a8_uxn_c_l77_c7_b1a8_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_01a8(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l85_c34_b1a9_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l86_c33_2f84_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l87_c31_16d7_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l88_c35_bcc7_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l89_c34_746c_return_output,
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l90_c32_f4ae_return_output);

     -- MUX[uxn_c_l84_c8_2d92] LATENCY=0
     -- Inputs
     MUX_uxn_c_l84_c8_2d92_cond <= VAR_MUX_uxn_c_l84_c8_2d92_cond;
     MUX_uxn_c_l84_c8_2d92_iftrue <= VAR_MUX_uxn_c_l84_c8_2d92_iftrue;
     MUX_uxn_c_l84_c8_2d92_iffalse <= VAR_MUX_uxn_c_l84_c8_2d92_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l84_c8_2d92_return_output := MUX_uxn_c_l84_c8_2d92_return_output;

     -- Submodule level 7
     VAR_pc_uxn_c_l84_c3_6713 := VAR_MUX_uxn_c_l84_c8_2d92_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_b1a8_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_01a8_uxn_c_l77_c7_b1a8_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l67_c2_d913_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l73_c7_b770_return_output;
     VAR_is_ins_done_MUX_uxn_c_l73_c7_b770_iffalse := VAR_is_ins_done_MUX_uxn_c_l77_c7_b1a8_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_b1a8_iffalse := VAR_pc_uxn_c_l84_c3_6713;
     VAR_printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg1 := resize(VAR_pc_uxn_c_l84_c3_6713, 32);
     -- is_ins_done_MUX[uxn_c_l73_c7_b770] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l73_c7_b770_cond <= VAR_is_ins_done_MUX_uxn_c_l73_c7_b770_cond;
     is_ins_done_MUX_uxn_c_l73_c7_b770_iftrue <= VAR_is_ins_done_MUX_uxn_c_l73_c7_b770_iftrue;
     is_ins_done_MUX_uxn_c_l73_c7_b770_iffalse <= VAR_is_ins_done_MUX_uxn_c_l73_c7_b770_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l73_c7_b770_return_output := is_ins_done_MUX_uxn_c_l73_c7_b770_return_output;

     -- eval_opcode_result_MUX[uxn_c_l67_c2_d913] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l67_c2_d913_cond <= VAR_eval_opcode_result_MUX_uxn_c_l67_c2_d913_cond;
     eval_opcode_result_MUX_uxn_c_l67_c2_d913_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l67_c2_d913_iftrue;
     eval_opcode_result_MUX_uxn_c_l67_c2_d913_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l67_c2_d913_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l67_c2_d913_return_output := eval_opcode_result_MUX_uxn_c_l67_c2_d913_return_output;

     -- pc_MUX[uxn_c_l77_c7_b1a8] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l77_c7_b1a8_cond <= VAR_pc_MUX_uxn_c_l77_c7_b1a8_cond;
     pc_MUX_uxn_c_l77_c7_b1a8_iftrue <= VAR_pc_MUX_uxn_c_l77_c7_b1a8_iftrue;
     pc_MUX_uxn_c_l77_c7_b1a8_iffalse <= VAR_pc_MUX_uxn_c_l77_c7_b1a8_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l77_c7_b1a8_return_output := pc_MUX_uxn_c_l77_c7_b1a8_return_output;

     -- printf_uxn_c_l92_c3_a1f6[uxn_c_l92_c3_a1f6] LATENCY=0
     -- Clock enable
     printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_CLOCK_ENABLE <= VAR_printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg0 <= VAR_printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg0;
     printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg1 <= VAR_printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg1;
     printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg2 <= VAR_printf_uxn_c_l92_c3_a1f6_uxn_c_l92_c3_a1f6_arg2;
     -- Outputs

     -- cpu_step_result_MUX[uxn_c_l77_c7_b1a8] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l77_c7_b1a8_cond <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_b1a8_cond;
     cpu_step_result_MUX_uxn_c_l77_c7_b1a8_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_b1a8_iftrue;
     cpu_step_result_MUX_uxn_c_l77_c7_b1a8_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_b1a8_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_b1a8_return_output := cpu_step_result_MUX_uxn_c_l77_c7_b1a8_return_output;

     -- Submodule level 8
     VAR_cpu_step_result_MUX_uxn_c_l73_c7_b770_iffalse := VAR_cpu_step_result_MUX_uxn_c_l77_c7_b1a8_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l67_c2_d913_return_output;
     VAR_is_ins_done_MUX_uxn_c_l67_c2_d913_iffalse := VAR_is_ins_done_MUX_uxn_c_l73_c7_b770_return_output;
     VAR_pc_MUX_uxn_c_l73_c7_b770_iffalse := VAR_pc_MUX_uxn_c_l77_c7_b1a8_return_output;
     -- is_ins_done_MUX[uxn_c_l67_c2_d913] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l67_c2_d913_cond <= VAR_is_ins_done_MUX_uxn_c_l67_c2_d913_cond;
     is_ins_done_MUX_uxn_c_l67_c2_d913_iftrue <= VAR_is_ins_done_MUX_uxn_c_l67_c2_d913_iftrue;
     is_ins_done_MUX_uxn_c_l67_c2_d913_iffalse <= VAR_is_ins_done_MUX_uxn_c_l67_c2_d913_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l67_c2_d913_return_output := is_ins_done_MUX_uxn_c_l67_c2_d913_return_output;

     -- cpu_step_result_MUX[uxn_c_l73_c7_b770] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l73_c7_b770_cond <= VAR_cpu_step_result_MUX_uxn_c_l73_c7_b770_cond;
     cpu_step_result_MUX_uxn_c_l73_c7_b770_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l73_c7_b770_iftrue;
     cpu_step_result_MUX_uxn_c_l73_c7_b770_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l73_c7_b770_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l73_c7_b770_return_output := cpu_step_result_MUX_uxn_c_l73_c7_b770_return_output;

     -- pc_MUX[uxn_c_l73_c7_b770] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l73_c7_b770_cond <= VAR_pc_MUX_uxn_c_l73_c7_b770_cond;
     pc_MUX_uxn_c_l73_c7_b770_iftrue <= VAR_pc_MUX_uxn_c_l73_c7_b770_iftrue;
     pc_MUX_uxn_c_l73_c7_b770_iffalse <= VAR_pc_MUX_uxn_c_l73_c7_b770_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l73_c7_b770_return_output := pc_MUX_uxn_c_l73_c7_b770_return_output;

     -- Submodule level 9
     VAR_cpu_step_result_MUX_uxn_c_l67_c2_d913_iffalse := VAR_cpu_step_result_MUX_uxn_c_l73_c7_b770_return_output;
     VAR_BIN_OP_EQ_uxn_c_l95_c6_9168_left := VAR_is_ins_done_MUX_uxn_c_l67_c2_d913_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l67_c2_d913_return_output;
     VAR_pc_MUX_uxn_c_l67_c2_d913_iffalse := VAR_pc_MUX_uxn_c_l73_c7_b770_return_output;
     -- BIN_OP_EQ[uxn_c_l95_c6_9168] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l95_c6_9168_left <= VAR_BIN_OP_EQ_uxn_c_l95_c6_9168_left;
     BIN_OP_EQ_uxn_c_l95_c6_9168_right <= VAR_BIN_OP_EQ_uxn_c_l95_c6_9168_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l95_c6_9168_return_output := BIN_OP_EQ_uxn_c_l95_c6_9168_return_output;

     -- pc_MUX[uxn_c_l67_c2_d913] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l67_c2_d913_cond <= VAR_pc_MUX_uxn_c_l67_c2_d913_cond;
     pc_MUX_uxn_c_l67_c2_d913_iftrue <= VAR_pc_MUX_uxn_c_l67_c2_d913_iftrue;
     pc_MUX_uxn_c_l67_c2_d913_iffalse <= VAR_pc_MUX_uxn_c_l67_c2_d913_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l67_c2_d913_return_output := pc_MUX_uxn_c_l67_c2_d913_return_output;

     -- cpu_step_result_MUX[uxn_c_l67_c2_d913] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l67_c2_d913_cond <= VAR_cpu_step_result_MUX_uxn_c_l67_c2_d913_cond;
     cpu_step_result_MUX_uxn_c_l67_c2_d913_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l67_c2_d913_iftrue;
     cpu_step_result_MUX_uxn_c_l67_c2_d913_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l67_c2_d913_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l67_c2_d913_return_output := cpu_step_result_MUX_uxn_c_l67_c2_d913_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_baed_cond := VAR_BIN_OP_EQ_uxn_c_l95_c6_9168_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l67_c2_d913_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l67_c2_d913_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l67_c2_d913_return_output;
     -- step_cpu_phase_MUX[uxn_c_l95_c2_baed] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l95_c2_baed_cond <= VAR_step_cpu_phase_MUX_uxn_c_l95_c2_baed_cond;
     step_cpu_phase_MUX_uxn_c_l95_c2_baed_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l95_c2_baed_iftrue;
     step_cpu_phase_MUX_uxn_c_l95_c2_baed_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l95_c2_baed_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_baed_return_output := step_cpu_phase_MUX_uxn_c_l95_c2_baed_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l95_c2_baed_return_output;
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
