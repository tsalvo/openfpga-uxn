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
-- Submodules: 30
entity step_cpu_0CLK_f7a7fef8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 use_vector : in unsigned(0 downto 0);
 vector : in unsigned(15 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_f7a7fef8;
architecture arch of step_cpu_0CLK_f7a7fef8 is
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
signal cpu_step_result : cpu_step_result_t := (
is_ram_write => to_unsigned(0, 1),
u16_addr => to_unsigned(0, 16),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
u8_value => to_unsigned(0, 8))
;
signal REG_COMB_pc : unsigned(15 downto 0);
signal REG_COMB_ins : unsigned(7 downto 0);
signal REG_COMB_step_cpu_phase : unsigned(7 downto 0);
signal REG_COMB_is_ins_done : unsigned(0 downto 0);
signal REG_COMB_is_waiting : unsigned(0 downto 0);
signal REG_COMB_cpu_step_result : cpu_step_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_c_l67_c8_0f53]
signal BIN_OP_AND_uxn_c_l67_c8_0f53_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l67_c8_0f53_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l67_c8_0f53_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l67_c8_6096]
signal MUX_uxn_c_l67_c8_6096_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l67_c8_6096_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l67_c8_6096_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l67_c8_6096_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l68_c15_d8c9]
signal MUX_uxn_c_l68_c15_d8c9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l68_c15_d8c9_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l68_c15_d8c9_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l68_c15_d8c9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l74_c6_77ba]
signal BIN_OP_EQ_uxn_c_l74_c6_77ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c6_77ba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c6_77ba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c7_6542]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l74_c2_1d80]
signal is_ins_done_MUX_uxn_c_l74_c2_1d80_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c2_1d80_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c2_1d80_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c2_1d80_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l74_c2_1d80]
signal ins_MUX_uxn_c_l74_c2_1d80_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l74_c2_1d80_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c2_1d80_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c2_1d80_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l74_c2_1d80]
signal pc_MUX_uxn_c_l74_c2_1d80_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l74_c2_1d80_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c2_1d80_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c2_1d80_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l74_c2_1d80]
signal cpu_step_result_MUX_uxn_c_l74_c2_1d80_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l74_c2_1d80_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l74_c2_1d80_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l74_c2_1d80_return_output : cpu_step_result_t;

-- is_waiting_MUX[uxn_c_l74_c2_1d80]
signal is_waiting_MUX_uxn_c_l74_c2_1d80_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l74_c2_1d80_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l74_c2_1d80_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l74_c2_1d80_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l81_c11_f256]
signal BIN_OP_EQ_uxn_c_l81_c11_f256_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c11_f256_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c11_f256_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l84_c1_60c7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l81_c7_6542]
signal is_ins_done_MUX_uxn_c_l81_c7_6542_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l81_c7_6542_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l81_c7_6542_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l81_c7_6542_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l81_c7_6542]
signal ins_MUX_uxn_c_l81_c7_6542_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l81_c7_6542_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l81_c7_6542_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l81_c7_6542_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l81_c7_6542]
signal pc_MUX_uxn_c_l81_c7_6542_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l81_c7_6542_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l81_c7_6542_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l81_c7_6542_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l81_c7_6542]
signal cpu_step_result_MUX_uxn_c_l81_c7_6542_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l81_c7_6542_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l81_c7_6542_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l81_c7_6542_return_output : cpu_step_result_t;

-- is_waiting_MUX[uxn_c_l81_c7_6542]
signal is_waiting_MUX_uxn_c_l81_c7_6542_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l81_c7_6542_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l81_c7_6542_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l81_c7_6542_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l82_c3_c62a]
signal BIN_OP_PLUS_uxn_c_l82_c3_c62a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_c62a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_c62a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l85_c9_44ce]
signal BIN_OP_EQ_uxn_c_l85_c9_44ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l85_c9_44ce_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l85_c9_44ce_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l85_c9_13a0]
signal MUX_uxn_c_l85_c9_13a0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l85_c9_13a0_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l85_c9_13a0_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l85_c9_13a0_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l86_c64_f2e3]
signal BIN_OP_MINUS_uxn_c_l86_c64_f2e3_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c64_f2e3_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c64_f2e3_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l86_c45_e82e]
signal eval_opcode_phased_uxn_c_l86_c45_e82e_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_e82e_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_e82e_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_e82e_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_e82e_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_e82e_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_e82e_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l87_c8_6e6b]
signal MUX_uxn_c_l87_c8_6e6b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l87_c8_6e6b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_6e6b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_6e6b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l99_c6_1c5b]
signal BIN_OP_OR_uxn_c_l99_c6_1c5b_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l99_c6_1c5b_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l99_c6_1c5b_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l99_c2_74c1]
signal step_cpu_phase_MUX_uxn_c_l99_c2_74c1_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_74c1_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_74c1_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_74c1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l102_c21_7493]
signal BIN_OP_EQ_uxn_c_l102_c21_7493_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c21_7493_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c21_7493_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l102_c37_7a03]
signal BIN_OP_PLUS_uxn_c_l102_c37_7a03_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c37_7a03_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c37_7a03_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l102_c21_007b]
signal MUX_uxn_c_l102_c21_007b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l102_c21_007b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l102_c21_007b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l102_c21_007b_return_output : unsigned(7 downto 0);

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228( ref_toks_0 : cpu_step_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base := ref_toks_0;
      base.u16_addr := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0( ref_toks_0 : unsigned;
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
      base.u16_addr := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_c_l67_c8_0f53
BIN_OP_AND_uxn_c_l67_c8_0f53 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l67_c8_0f53_left,
BIN_OP_AND_uxn_c_l67_c8_0f53_right,
BIN_OP_AND_uxn_c_l67_c8_0f53_return_output);

-- MUX_uxn_c_l67_c8_6096
MUX_uxn_c_l67_c8_6096 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l67_c8_6096_cond,
MUX_uxn_c_l67_c8_6096_iftrue,
MUX_uxn_c_l67_c8_6096_iffalse,
MUX_uxn_c_l67_c8_6096_return_output);

-- MUX_uxn_c_l68_c15_d8c9
MUX_uxn_c_l68_c15_d8c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l68_c15_d8c9_cond,
MUX_uxn_c_l68_c15_d8c9_iftrue,
MUX_uxn_c_l68_c15_d8c9_iffalse,
MUX_uxn_c_l68_c15_d8c9_return_output);

-- BIN_OP_EQ_uxn_c_l74_c6_77ba
BIN_OP_EQ_uxn_c_l74_c6_77ba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l74_c6_77ba_left,
BIN_OP_EQ_uxn_c_l74_c6_77ba_right,
BIN_OP_EQ_uxn_c_l74_c6_77ba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_return_output);

-- is_ins_done_MUX_uxn_c_l74_c2_1d80
is_ins_done_MUX_uxn_c_l74_c2_1d80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l74_c2_1d80_cond,
is_ins_done_MUX_uxn_c_l74_c2_1d80_iftrue,
is_ins_done_MUX_uxn_c_l74_c2_1d80_iffalse,
is_ins_done_MUX_uxn_c_l74_c2_1d80_return_output);

-- ins_MUX_uxn_c_l74_c2_1d80
ins_MUX_uxn_c_l74_c2_1d80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l74_c2_1d80_cond,
ins_MUX_uxn_c_l74_c2_1d80_iftrue,
ins_MUX_uxn_c_l74_c2_1d80_iffalse,
ins_MUX_uxn_c_l74_c2_1d80_return_output);

-- pc_MUX_uxn_c_l74_c2_1d80
pc_MUX_uxn_c_l74_c2_1d80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l74_c2_1d80_cond,
pc_MUX_uxn_c_l74_c2_1d80_iftrue,
pc_MUX_uxn_c_l74_c2_1d80_iffalse,
pc_MUX_uxn_c_l74_c2_1d80_return_output);

-- cpu_step_result_MUX_uxn_c_l74_c2_1d80
cpu_step_result_MUX_uxn_c_l74_c2_1d80 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l74_c2_1d80_cond,
cpu_step_result_MUX_uxn_c_l74_c2_1d80_iftrue,
cpu_step_result_MUX_uxn_c_l74_c2_1d80_iffalse,
cpu_step_result_MUX_uxn_c_l74_c2_1d80_return_output);

-- is_waiting_MUX_uxn_c_l74_c2_1d80
is_waiting_MUX_uxn_c_l74_c2_1d80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l74_c2_1d80_cond,
is_waiting_MUX_uxn_c_l74_c2_1d80_iftrue,
is_waiting_MUX_uxn_c_l74_c2_1d80_iffalse,
is_waiting_MUX_uxn_c_l74_c2_1d80_return_output);

-- BIN_OP_EQ_uxn_c_l81_c11_f256
BIN_OP_EQ_uxn_c_l81_c11_f256 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l81_c11_f256_left,
BIN_OP_EQ_uxn_c_l81_c11_f256_right,
BIN_OP_EQ_uxn_c_l81_c11_f256_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_return_output);

-- is_ins_done_MUX_uxn_c_l81_c7_6542
is_ins_done_MUX_uxn_c_l81_c7_6542 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l81_c7_6542_cond,
is_ins_done_MUX_uxn_c_l81_c7_6542_iftrue,
is_ins_done_MUX_uxn_c_l81_c7_6542_iffalse,
is_ins_done_MUX_uxn_c_l81_c7_6542_return_output);

-- ins_MUX_uxn_c_l81_c7_6542
ins_MUX_uxn_c_l81_c7_6542 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l81_c7_6542_cond,
ins_MUX_uxn_c_l81_c7_6542_iftrue,
ins_MUX_uxn_c_l81_c7_6542_iffalse,
ins_MUX_uxn_c_l81_c7_6542_return_output);

-- pc_MUX_uxn_c_l81_c7_6542
pc_MUX_uxn_c_l81_c7_6542 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l81_c7_6542_cond,
pc_MUX_uxn_c_l81_c7_6542_iftrue,
pc_MUX_uxn_c_l81_c7_6542_iffalse,
pc_MUX_uxn_c_l81_c7_6542_return_output);

-- cpu_step_result_MUX_uxn_c_l81_c7_6542
cpu_step_result_MUX_uxn_c_l81_c7_6542 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l81_c7_6542_cond,
cpu_step_result_MUX_uxn_c_l81_c7_6542_iftrue,
cpu_step_result_MUX_uxn_c_l81_c7_6542_iffalse,
cpu_step_result_MUX_uxn_c_l81_c7_6542_return_output);

-- is_waiting_MUX_uxn_c_l81_c7_6542
is_waiting_MUX_uxn_c_l81_c7_6542 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l81_c7_6542_cond,
is_waiting_MUX_uxn_c_l81_c7_6542_iftrue,
is_waiting_MUX_uxn_c_l81_c7_6542_iffalse,
is_waiting_MUX_uxn_c_l81_c7_6542_return_output);

-- BIN_OP_PLUS_uxn_c_l82_c3_c62a
BIN_OP_PLUS_uxn_c_l82_c3_c62a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l82_c3_c62a_left,
BIN_OP_PLUS_uxn_c_l82_c3_c62a_right,
BIN_OP_PLUS_uxn_c_l82_c3_c62a_return_output);

-- BIN_OP_EQ_uxn_c_l85_c9_44ce
BIN_OP_EQ_uxn_c_l85_c9_44ce : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l85_c9_44ce_left,
BIN_OP_EQ_uxn_c_l85_c9_44ce_right,
BIN_OP_EQ_uxn_c_l85_c9_44ce_return_output);

-- MUX_uxn_c_l85_c9_13a0
MUX_uxn_c_l85_c9_13a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l85_c9_13a0_cond,
MUX_uxn_c_l85_c9_13a0_iftrue,
MUX_uxn_c_l85_c9_13a0_iffalse,
MUX_uxn_c_l85_c9_13a0_return_output);

-- BIN_OP_MINUS_uxn_c_l86_c64_f2e3
BIN_OP_MINUS_uxn_c_l86_c64_f2e3 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l86_c64_f2e3_left,
BIN_OP_MINUS_uxn_c_l86_c64_f2e3_right,
BIN_OP_MINUS_uxn_c_l86_c64_f2e3_return_output);

-- eval_opcode_phased_uxn_c_l86_c45_e82e
eval_opcode_phased_uxn_c_l86_c45_e82e : entity work.eval_opcode_phased_0CLK_628ac356 port map (
clk,
eval_opcode_phased_uxn_c_l86_c45_e82e_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l86_c45_e82e_phase,
eval_opcode_phased_uxn_c_l86_c45_e82e_ins,
eval_opcode_phased_uxn_c_l86_c45_e82e_pc,
eval_opcode_phased_uxn_c_l86_c45_e82e_previous_ram_read,
eval_opcode_phased_uxn_c_l86_c45_e82e_previous_device_ram_read,
eval_opcode_phased_uxn_c_l86_c45_e82e_return_output);

-- MUX_uxn_c_l87_c8_6e6b
MUX_uxn_c_l87_c8_6e6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l87_c8_6e6b_cond,
MUX_uxn_c_l87_c8_6e6b_iftrue,
MUX_uxn_c_l87_c8_6e6b_iffalse,
MUX_uxn_c_l87_c8_6e6b_return_output);

-- BIN_OP_OR_uxn_c_l99_c6_1c5b
BIN_OP_OR_uxn_c_l99_c6_1c5b : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l99_c6_1c5b_left,
BIN_OP_OR_uxn_c_l99_c6_1c5b_right,
BIN_OP_OR_uxn_c_l99_c6_1c5b_return_output);

-- step_cpu_phase_MUX_uxn_c_l99_c2_74c1
step_cpu_phase_MUX_uxn_c_l99_c2_74c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l99_c2_74c1_cond,
step_cpu_phase_MUX_uxn_c_l99_c2_74c1_iftrue,
step_cpu_phase_MUX_uxn_c_l99_c2_74c1_iffalse,
step_cpu_phase_MUX_uxn_c_l99_c2_74c1_return_output);

-- BIN_OP_EQ_uxn_c_l102_c21_7493
BIN_OP_EQ_uxn_c_l102_c21_7493 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l102_c21_7493_left,
BIN_OP_EQ_uxn_c_l102_c21_7493_right,
BIN_OP_EQ_uxn_c_l102_c21_7493_return_output);

-- BIN_OP_PLUS_uxn_c_l102_c37_7a03
BIN_OP_PLUS_uxn_c_l102_c37_7a03 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l102_c37_7a03_left,
BIN_OP_PLUS_uxn_c_l102_c37_7a03_right,
BIN_OP_PLUS_uxn_c_l102_c37_7a03_return_output);

-- MUX_uxn_c_l102_c21_007b
MUX_uxn_c_l102_c21_007b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l102_c21_007b_cond,
MUX_uxn_c_l102_c21_007b_iftrue,
MUX_uxn_c_l102_c21_007b_iffalse,
MUX_uxn_c_l102_c21_007b_return_output);



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
 cpu_step_result,
 -- All submodule outputs
 BIN_OP_AND_uxn_c_l67_c8_0f53_return_output,
 MUX_uxn_c_l67_c8_6096_return_output,
 MUX_uxn_c_l68_c15_d8c9_return_output,
 BIN_OP_EQ_uxn_c_l74_c6_77ba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_return_output,
 is_ins_done_MUX_uxn_c_l74_c2_1d80_return_output,
 ins_MUX_uxn_c_l74_c2_1d80_return_output,
 pc_MUX_uxn_c_l74_c2_1d80_return_output,
 cpu_step_result_MUX_uxn_c_l74_c2_1d80_return_output,
 is_waiting_MUX_uxn_c_l74_c2_1d80_return_output,
 BIN_OP_EQ_uxn_c_l81_c11_f256_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_return_output,
 is_ins_done_MUX_uxn_c_l81_c7_6542_return_output,
 ins_MUX_uxn_c_l81_c7_6542_return_output,
 pc_MUX_uxn_c_l81_c7_6542_return_output,
 cpu_step_result_MUX_uxn_c_l81_c7_6542_return_output,
 is_waiting_MUX_uxn_c_l81_c7_6542_return_output,
 BIN_OP_PLUS_uxn_c_l82_c3_c62a_return_output,
 BIN_OP_EQ_uxn_c_l85_c9_44ce_return_output,
 MUX_uxn_c_l85_c9_13a0_return_output,
 BIN_OP_MINUS_uxn_c_l86_c64_f2e3_return_output,
 eval_opcode_phased_uxn_c_l86_c45_e82e_return_output,
 MUX_uxn_c_l87_c8_6e6b_return_output,
 BIN_OP_OR_uxn_c_l99_c6_1c5b_return_output,
 step_cpu_phase_MUX_uxn_c_l99_c2_74c1_return_output,
 BIN_OP_EQ_uxn_c_l102_c21_7493_return_output,
 BIN_OP_PLUS_uxn_c_l102_c37_7a03_return_output,
 MUX_uxn_c_l102_c21_007b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l67_c8_6096_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l67_c8_0f53_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l67_c8_0f53_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l67_c8_0f53_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l67_c8_6096_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l67_c8_6096_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l67_c8_6096_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c15_d8c9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l68_c15_d8c9_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l68_c15_d8c9_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l68_c15_d8c9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_77ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_77ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_77ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_1d80_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_1d80_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_6542_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_1d80_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_1d80_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_1d80_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_1d80_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_6542_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_1d80_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_1d80_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_1d80_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_1d80_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_6542_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_1d80_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_1d80_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c2_1d80_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l74_c2_1d80_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c2_1d80_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l81_c7_6542_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c2_1d80_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c2_1d80_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_1d80_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_1d80_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_6542_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_1d80_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_1d80_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_f256_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_f256_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_f256_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_6542_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_6542_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_6542_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_6542_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_6542_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_6542_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_6542_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l82_c3_b070 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_6542_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_6542_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l81_c7_6542_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l81_c7_6542_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l81_c7_6542_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l81_c7_6542_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_6542_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_6542_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_6542_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_c62a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_c62a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_c62a_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_13a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l85_c9_44ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l85_c9_44ce_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l85_c9_44ce_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_13a0_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_13a0_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_13a0_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_result : eval_opcode_result_t;
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c64_f2e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c64_f2e3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c64_f2e3_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l87_c8_6e6b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_5ed8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_6e6b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_6e6b_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_6e6b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l88_c34_09af_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l90_c35_34e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l91_c38_8f17_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l92_c40_134d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l93_c41_f51e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l94_c30_ee6b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l95_c16_1958_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l96_c17_82dc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l99_c6_1c5b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l99_c6_1c5b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l99_c6_1c5b_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_74c1_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l100_c3_37f0 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_74c1_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_74c1_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_74c1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_007b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c21_7493_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c21_7493_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c21_7493_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_007b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_007b_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c37_7a03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c37_7a03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c37_7a03_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_007b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l89_l87_DUPLICATE_c0e2_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_pc : unsigned(15 downto 0);
variable REG_VAR_ins : unsigned(7 downto 0);
variable REG_VAR_step_cpu_phase : unsigned(7 downto 0);
variable REG_VAR_is_ins_done : unsigned(0 downto 0);
variable REG_VAR_is_waiting : unsigned(0 downto 0);
variable REG_VAR_cpu_step_result : cpu_step_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_pc := pc;
  REG_VAR_ins := ins;
  REG_VAR_step_cpu_phase := step_cpu_phase;
  REG_VAR_is_ins_done := is_ins_done;
  REG_VAR_is_waiting := is_waiting;
  REG_VAR_cpu_step_result := cpu_step_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l81_c11_f256_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l102_c21_007b_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_iftrue := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l100_c3_37f0 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_74c1_iftrue := VAR_step_cpu_phase_uxn_c_l100_c3_37f0;
     VAR_BIN_OP_MINUS_uxn_c_l86_c64_f2e3_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l74_c6_77ba_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l85_c9_44ce_right := to_unsigned(2, 2);
     VAR_is_ins_done_MUX_uxn_c_l74_c2_1d80_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_c62a_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l102_c37_7a03_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l68_c15_d8c9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l102_c21_7493_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_iffalse := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l81_c7_6542_iftrue := cpu_step_result;
     VAR_MUX_uxn_c_l85_c9_13a0_iffalse := ins;
     VAR_ins_MUX_uxn_c_l74_c2_1d80_iftrue := ins;
     VAR_ins_MUX_uxn_c_l81_c7_6542_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l81_c7_6542_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l67_c8_0f53_right := is_waiting;
     VAR_MUX_uxn_c_l68_c15_d8c9_iffalse := is_waiting;
     VAR_MUX_uxn_c_l67_c8_6096_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l85_c9_13a0_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l74_c6_77ba_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l81_c11_f256_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l85_c9_44ce_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l86_c64_f2e3_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l102_c37_7a03_left := step_cpu_phase;
     VAR_BIN_OP_AND_uxn_c_l67_c8_0f53_left := VAR_use_vector;
     VAR_MUX_uxn_c_l68_c15_d8c9_cond := VAR_use_vector;
     VAR_MUX_uxn_c_l67_c8_6096_iftrue := VAR_vector;
     -- BIN_OP_EQ[uxn_c_l74_c6_77ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l74_c6_77ba_left <= VAR_BIN_OP_EQ_uxn_c_l74_c6_77ba_left;
     BIN_OP_EQ_uxn_c_l74_c6_77ba_right <= VAR_BIN_OP_EQ_uxn_c_l74_c6_77ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l74_c6_77ba_return_output := BIN_OP_EQ_uxn_c_l74_c6_77ba_return_output;

     -- BIN_OP_EQ[uxn_c_l85_c9_44ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l85_c9_44ce_left <= VAR_BIN_OP_EQ_uxn_c_l85_c9_44ce_left;
     BIN_OP_EQ_uxn_c_l85_c9_44ce_right <= VAR_BIN_OP_EQ_uxn_c_l85_c9_44ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l85_c9_44ce_return_output := BIN_OP_EQ_uxn_c_l85_c9_44ce_return_output;

     -- BIN_OP_EQ[uxn_c_l81_c11_f256] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l81_c11_f256_left <= VAR_BIN_OP_EQ_uxn_c_l81_c11_f256_left;
     BIN_OP_EQ_uxn_c_l81_c11_f256_right <= VAR_BIN_OP_EQ_uxn_c_l81_c11_f256_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l81_c11_f256_return_output := BIN_OP_EQ_uxn_c_l81_c11_f256_return_output;

     -- BIN_OP_AND[uxn_c_l67_c8_0f53] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l67_c8_0f53_left <= VAR_BIN_OP_AND_uxn_c_l67_c8_0f53_left;
     BIN_OP_AND_uxn_c_l67_c8_0f53_right <= VAR_BIN_OP_AND_uxn_c_l67_c8_0f53_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l67_c8_0f53_return_output := BIN_OP_AND_uxn_c_l67_c8_0f53_return_output;

     -- BIN_OP_MINUS[uxn_c_l86_c64_f2e3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l86_c64_f2e3_left <= VAR_BIN_OP_MINUS_uxn_c_l86_c64_f2e3_left;
     BIN_OP_MINUS_uxn_c_l86_c64_f2e3_right <= VAR_BIN_OP_MINUS_uxn_c_l86_c64_f2e3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l86_c64_f2e3_return_output := BIN_OP_MINUS_uxn_c_l86_c64_f2e3_return_output;

     -- MUX[uxn_c_l68_c15_d8c9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l68_c15_d8c9_cond <= VAR_MUX_uxn_c_l68_c15_d8c9_cond;
     MUX_uxn_c_l68_c15_d8c9_iftrue <= VAR_MUX_uxn_c_l68_c15_d8c9_iftrue;
     MUX_uxn_c_l68_c15_d8c9_iffalse <= VAR_MUX_uxn_c_l68_c15_d8c9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l68_c15_d8c9_return_output := MUX_uxn_c_l68_c15_d8c9_return_output;

     -- BIN_OP_PLUS[uxn_c_l102_c37_7a03] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l102_c37_7a03_left <= VAR_BIN_OP_PLUS_uxn_c_l102_c37_7a03_left;
     BIN_OP_PLUS_uxn_c_l102_c37_7a03_right <= VAR_BIN_OP_PLUS_uxn_c_l102_c37_7a03_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l102_c37_7a03_return_output := BIN_OP_PLUS_uxn_c_l102_c37_7a03_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l67_c8_6096_cond := VAR_BIN_OP_AND_uxn_c_l67_c8_0f53_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_77ba_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l74_c2_1d80_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_77ba_return_output;
     VAR_ins_MUX_uxn_c_l74_c2_1d80_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_77ba_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c2_1d80_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_77ba_return_output;
     VAR_is_waiting_MUX_uxn_c_l74_c2_1d80_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_77ba_return_output;
     VAR_pc_MUX_uxn_c_l74_c2_1d80_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_77ba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_f256_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l81_c7_6542_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_f256_return_output;
     VAR_ins_MUX_uxn_c_l81_c7_6542_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_f256_return_output;
     VAR_is_ins_done_MUX_uxn_c_l81_c7_6542_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_f256_return_output;
     VAR_is_waiting_MUX_uxn_c_l81_c7_6542_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_f256_return_output;
     VAR_pc_MUX_uxn_c_l81_c7_6542_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_f256_return_output;
     VAR_MUX_uxn_c_l85_c9_13a0_cond := VAR_BIN_OP_EQ_uxn_c_l85_c9_44ce_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_phase := VAR_BIN_OP_MINUS_uxn_c_l86_c64_f2e3_return_output;
     VAR_MUX_uxn_c_l102_c21_007b_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l102_c37_7a03_return_output, 8);
     VAR_is_waiting_MUX_uxn_c_l74_c2_1d80_iftrue := VAR_MUX_uxn_c_l68_c15_d8c9_return_output;
     VAR_is_waiting_MUX_uxn_c_l81_c7_6542_iftrue := VAR_MUX_uxn_c_l68_c15_d8c9_return_output;
     -- MUX[uxn_c_l85_c9_13a0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l85_c9_13a0_cond <= VAR_MUX_uxn_c_l85_c9_13a0_cond;
     MUX_uxn_c_l85_c9_13a0_iftrue <= VAR_MUX_uxn_c_l85_c9_13a0_iftrue;
     MUX_uxn_c_l85_c9_13a0_iffalse <= VAR_MUX_uxn_c_l85_c9_13a0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l85_c9_13a0_return_output := MUX_uxn_c_l85_c9_13a0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c7_6542] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_return_output;

     -- MUX[uxn_c_l67_c8_6096] LATENCY=0
     -- Inputs
     MUX_uxn_c_l67_c8_6096_cond <= VAR_MUX_uxn_c_l67_c8_6096_cond;
     MUX_uxn_c_l67_c8_6096_iftrue <= VAR_MUX_uxn_c_l67_c8_6096_iftrue;
     MUX_uxn_c_l67_c8_6096_iffalse <= VAR_MUX_uxn_c_l67_c8_6096_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l67_c8_6096_return_output := MUX_uxn_c_l67_c8_6096_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_6542_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_c62a_left := VAR_MUX_uxn_c_l67_c8_6096_return_output;
     VAR_MUX_uxn_c_l87_c8_6e6b_iffalse := VAR_MUX_uxn_c_l67_c8_6096_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_pc := VAR_MUX_uxn_c_l67_c8_6096_return_output;
     VAR_pc_MUX_uxn_c_l74_c2_1d80_iftrue := VAR_MUX_uxn_c_l67_c8_6096_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_ins := VAR_MUX_uxn_c_l85_c9_13a0_return_output;
     VAR_ins_MUX_uxn_c_l81_c7_6542_iffalse := VAR_MUX_uxn_c_l85_c9_13a0_return_output;
     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228[uxn_c_l74_c2_1d80] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l74_c2_1d80_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228(
     cpu_step_result,
     VAR_MUX_uxn_c_l67_c8_6096_return_output,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- BIN_OP_PLUS[uxn_c_l82_c3_c62a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l82_c3_c62a_left <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_c62a_left;
     BIN_OP_PLUS_uxn_c_l82_c3_c62a_right <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_c62a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_c62a_return_output := BIN_OP_PLUS_uxn_c_l82_c3_c62a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l84_c1_60c7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_return_output;

     -- ins_MUX[uxn_c_l81_c7_6542] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l81_c7_6542_cond <= VAR_ins_MUX_uxn_c_l81_c7_6542_cond;
     ins_MUX_uxn_c_l81_c7_6542_iftrue <= VAR_ins_MUX_uxn_c_l81_c7_6542_iftrue;
     ins_MUX_uxn_c_l81_c7_6542_iffalse <= VAR_ins_MUX_uxn_c_l81_c7_6542_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l81_c7_6542_return_output := ins_MUX_uxn_c_l81_c7_6542_return_output;

     -- Submodule level 3
     VAR_pc_uxn_c_l82_c3_b070 := resize(VAR_BIN_OP_PLUS_uxn_c_l82_c3_c62a_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_60c7_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l74_c2_1d80_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l74_c2_1d80_return_output;
     VAR_ins_MUX_uxn_c_l74_c2_1d80_iffalse := VAR_ins_MUX_uxn_c_l81_c7_6542_return_output;
     VAR_pc_MUX_uxn_c_l81_c7_6542_iftrue := VAR_pc_uxn_c_l82_c3_b070;
     -- eval_opcode_phased[uxn_c_l86_c45_e82e] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l86_c45_e82e_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l86_c45_e82e_phase <= VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_phase;
     eval_opcode_phased_uxn_c_l86_c45_e82e_ins <= VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_ins;
     eval_opcode_phased_uxn_c_l86_c45_e82e_pc <= VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_pc;
     eval_opcode_phased_uxn_c_l86_c45_e82e_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_previous_ram_read;
     eval_opcode_phased_uxn_c_l86_c45_e82e_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_return_output := eval_opcode_phased_uxn_c_l86_c45_e82e_return_output;

     -- ins_MUX[uxn_c_l74_c2_1d80] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l74_c2_1d80_cond <= VAR_ins_MUX_uxn_c_l74_c2_1d80_cond;
     ins_MUX_uxn_c_l74_c2_1d80_iftrue <= VAR_ins_MUX_uxn_c_l74_c2_1d80_iftrue;
     ins_MUX_uxn_c_l74_c2_1d80_iffalse <= VAR_ins_MUX_uxn_c_l74_c2_1d80_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l74_c2_1d80_return_output := ins_MUX_uxn_c_l74_c2_1d80_return_output;

     -- Submodule level 4
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l74_c2_1d80_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l90_c35_34e9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l90_c35_34e9_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l93_c41_f51e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l93_c41_f51e_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l89_l87_DUPLICATE_c0e2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l89_l87_DUPLICATE_c0e2_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_return_output.u16_value;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l92_c40_134d] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l92_c40_134d_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_return_output.device_ram_address;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l94_c30_ee6b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l94_c30_ee6b_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l95_c16_1958] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l95_c16_1958_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l96_c17_82dc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l96_c17_82dc_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l88_c34_09af] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l88_c34_09af_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l91_c38_8f17] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l91_c38_8f17_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l87_c8_5ed8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_5ed8_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_e82e_return_output.is_pc_updated;

     -- Submodule level 5
     VAR_MUX_uxn_c_l87_c8_6e6b_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l89_l87_DUPLICATE_c0e2_return_output;
     VAR_is_ins_done_MUX_uxn_c_l81_c7_6542_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l96_c17_82dc_return_output;
     VAR_MUX_uxn_c_l87_c8_6e6b_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_5ed8_return_output;
     VAR_is_waiting_MUX_uxn_c_l81_c7_6542_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l95_c16_1958_return_output;
     -- is_ins_done_MUX[uxn_c_l81_c7_6542] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l81_c7_6542_cond <= VAR_is_ins_done_MUX_uxn_c_l81_c7_6542_cond;
     is_ins_done_MUX_uxn_c_l81_c7_6542_iftrue <= VAR_is_ins_done_MUX_uxn_c_l81_c7_6542_iftrue;
     is_ins_done_MUX_uxn_c_l81_c7_6542_iffalse <= VAR_is_ins_done_MUX_uxn_c_l81_c7_6542_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l81_c7_6542_return_output := is_ins_done_MUX_uxn_c_l81_c7_6542_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0[uxn_c_l81_c7_6542] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l81_c7_6542_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l88_c34_09af_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l89_l87_DUPLICATE_c0e2_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l90_c35_34e9_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l91_c38_8f17_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l92_c40_134d_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l93_c41_f51e_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l94_c30_ee6b_return_output);

     -- is_waiting_MUX[uxn_c_l81_c7_6542] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l81_c7_6542_cond <= VAR_is_waiting_MUX_uxn_c_l81_c7_6542_cond;
     is_waiting_MUX_uxn_c_l81_c7_6542_iftrue <= VAR_is_waiting_MUX_uxn_c_l81_c7_6542_iftrue;
     is_waiting_MUX_uxn_c_l81_c7_6542_iffalse <= VAR_is_waiting_MUX_uxn_c_l81_c7_6542_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l81_c7_6542_return_output := is_waiting_MUX_uxn_c_l81_c7_6542_return_output;

     -- MUX[uxn_c_l87_c8_6e6b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l87_c8_6e6b_cond <= VAR_MUX_uxn_c_l87_c8_6e6b_cond;
     MUX_uxn_c_l87_c8_6e6b_iftrue <= VAR_MUX_uxn_c_l87_c8_6e6b_iftrue;
     MUX_uxn_c_l87_c8_6e6b_iffalse <= VAR_MUX_uxn_c_l87_c8_6e6b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l87_c8_6e6b_return_output := MUX_uxn_c_l87_c8_6e6b_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l81_c7_6542_iffalse := VAR_MUX_uxn_c_l87_c8_6e6b_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l81_c7_6542_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l81_c7_6542_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c2_1d80_iffalse := VAR_is_ins_done_MUX_uxn_c_l81_c7_6542_return_output;
     VAR_is_waiting_MUX_uxn_c_l74_c2_1d80_iffalse := VAR_is_waiting_MUX_uxn_c_l81_c7_6542_return_output;
     -- is_waiting_MUX[uxn_c_l74_c2_1d80] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l74_c2_1d80_cond <= VAR_is_waiting_MUX_uxn_c_l74_c2_1d80_cond;
     is_waiting_MUX_uxn_c_l74_c2_1d80_iftrue <= VAR_is_waiting_MUX_uxn_c_l74_c2_1d80_iftrue;
     is_waiting_MUX_uxn_c_l74_c2_1d80_iffalse <= VAR_is_waiting_MUX_uxn_c_l74_c2_1d80_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l74_c2_1d80_return_output := is_waiting_MUX_uxn_c_l74_c2_1d80_return_output;

     -- pc_MUX[uxn_c_l81_c7_6542] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l81_c7_6542_cond <= VAR_pc_MUX_uxn_c_l81_c7_6542_cond;
     pc_MUX_uxn_c_l81_c7_6542_iftrue <= VAR_pc_MUX_uxn_c_l81_c7_6542_iftrue;
     pc_MUX_uxn_c_l81_c7_6542_iffalse <= VAR_pc_MUX_uxn_c_l81_c7_6542_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l81_c7_6542_return_output := pc_MUX_uxn_c_l81_c7_6542_return_output;

     -- is_ins_done_MUX[uxn_c_l74_c2_1d80] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l74_c2_1d80_cond <= VAR_is_ins_done_MUX_uxn_c_l74_c2_1d80_cond;
     is_ins_done_MUX_uxn_c_l74_c2_1d80_iftrue <= VAR_is_ins_done_MUX_uxn_c_l74_c2_1d80_iftrue;
     is_ins_done_MUX_uxn_c_l74_c2_1d80_iffalse <= VAR_is_ins_done_MUX_uxn_c_l74_c2_1d80_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l74_c2_1d80_return_output := is_ins_done_MUX_uxn_c_l74_c2_1d80_return_output;

     -- cpu_step_result_MUX[uxn_c_l81_c7_6542] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l81_c7_6542_cond <= VAR_cpu_step_result_MUX_uxn_c_l81_c7_6542_cond;
     cpu_step_result_MUX_uxn_c_l81_c7_6542_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l81_c7_6542_iftrue;
     cpu_step_result_MUX_uxn_c_l81_c7_6542_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l81_c7_6542_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l81_c7_6542_return_output := cpu_step_result_MUX_uxn_c_l81_c7_6542_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l74_c2_1d80_iffalse := VAR_cpu_step_result_MUX_uxn_c_l81_c7_6542_return_output;
     VAR_BIN_OP_OR_uxn_c_l99_c6_1c5b_left := VAR_is_ins_done_MUX_uxn_c_l74_c2_1d80_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l74_c2_1d80_return_output;
     VAR_BIN_OP_OR_uxn_c_l99_c6_1c5b_right := VAR_is_waiting_MUX_uxn_c_l74_c2_1d80_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l74_c2_1d80_return_output;
     VAR_pc_MUX_uxn_c_l74_c2_1d80_iffalse := VAR_pc_MUX_uxn_c_l81_c7_6542_return_output;
     -- cpu_step_result_MUX[uxn_c_l74_c2_1d80] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l74_c2_1d80_cond <= VAR_cpu_step_result_MUX_uxn_c_l74_c2_1d80_cond;
     cpu_step_result_MUX_uxn_c_l74_c2_1d80_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l74_c2_1d80_iftrue;
     cpu_step_result_MUX_uxn_c_l74_c2_1d80_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l74_c2_1d80_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l74_c2_1d80_return_output := cpu_step_result_MUX_uxn_c_l74_c2_1d80_return_output;

     -- BIN_OP_OR[uxn_c_l99_c6_1c5b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l99_c6_1c5b_left <= VAR_BIN_OP_OR_uxn_c_l99_c6_1c5b_left;
     BIN_OP_OR_uxn_c_l99_c6_1c5b_right <= VAR_BIN_OP_OR_uxn_c_l99_c6_1c5b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l99_c6_1c5b_return_output := BIN_OP_OR_uxn_c_l99_c6_1c5b_return_output;

     -- pc_MUX[uxn_c_l74_c2_1d80] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l74_c2_1d80_cond <= VAR_pc_MUX_uxn_c_l74_c2_1d80_cond;
     pc_MUX_uxn_c_l74_c2_1d80_iftrue <= VAR_pc_MUX_uxn_c_l74_c2_1d80_iftrue;
     pc_MUX_uxn_c_l74_c2_1d80_iffalse <= VAR_pc_MUX_uxn_c_l74_c2_1d80_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l74_c2_1d80_return_output := pc_MUX_uxn_c_l74_c2_1d80_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_74c1_cond := VAR_BIN_OP_OR_uxn_c_l99_c6_1c5b_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l74_c2_1d80_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l74_c2_1d80_return_output;
     VAR_BIN_OP_EQ_uxn_c_l102_c21_7493_left := VAR_pc_MUX_uxn_c_l74_c2_1d80_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l74_c2_1d80_return_output;
     -- BIN_OP_EQ[uxn_c_l102_c21_7493] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l102_c21_7493_left <= VAR_BIN_OP_EQ_uxn_c_l102_c21_7493_left;
     BIN_OP_EQ_uxn_c_l102_c21_7493_right <= VAR_BIN_OP_EQ_uxn_c_l102_c21_7493_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l102_c21_7493_return_output := BIN_OP_EQ_uxn_c_l102_c21_7493_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l102_c21_007b_cond := VAR_BIN_OP_EQ_uxn_c_l102_c21_7493_return_output;
     -- MUX[uxn_c_l102_c21_007b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l102_c21_007b_cond <= VAR_MUX_uxn_c_l102_c21_007b_cond;
     MUX_uxn_c_l102_c21_007b_iftrue <= VAR_MUX_uxn_c_l102_c21_007b_iftrue;
     MUX_uxn_c_l102_c21_007b_iffalse <= VAR_MUX_uxn_c_l102_c21_007b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l102_c21_007b_return_output := MUX_uxn_c_l102_c21_007b_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_74c1_iffalse := VAR_MUX_uxn_c_l102_c21_007b_return_output;
     -- step_cpu_phase_MUX[uxn_c_l99_c2_74c1] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l99_c2_74c1_cond <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_74c1_cond;
     step_cpu_phase_MUX_uxn_c_l99_c2_74c1_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_74c1_iftrue;
     step_cpu_phase_MUX_uxn_c_l99_c2_74c1_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_74c1_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_74c1_return_output := step_cpu_phase_MUX_uxn_c_l99_c2_74c1_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l99_c2_74c1_return_output;
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
     cpu_step_result <= REG_COMB_cpu_step_result;
 end if;
 end if;
end process;

end arch;
