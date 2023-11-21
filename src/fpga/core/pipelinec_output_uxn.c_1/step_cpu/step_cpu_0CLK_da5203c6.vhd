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
-- Submodules: 32
entity step_cpu_0CLK_da5203c6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(15 downto 0);
 use_vector : in unsigned(0 downto 0);
 vector : in unsigned(15 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_da5203c6;
architecture arch of step_cpu_0CLK_da5203c6 is
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
signal eval_opcode_result : eval_opcode_result_t := eval_opcode_result_t_NULL;
signal cpu_step_result : cpu_step_result_t := (
is_ram_write => to_unsigned(0, 1),
u16_value => to_unsigned(0, 16),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 24),
is_device_ram_write => to_unsigned(0, 1),
is_device_ram_16bit => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
u8_value => to_unsigned(0, 8))
;
signal REG_COMB_pc : unsigned(15 downto 0);
signal REG_COMB_ins : unsigned(7 downto 0);
signal REG_COMB_step_cpu_phase : unsigned(7 downto 0);
signal REG_COMB_is_ins_done : unsigned(0 downto 0);
signal REG_COMB_is_waiting : unsigned(0 downto 0);
signal REG_COMB_eval_opcode_result : eval_opcode_result_t;
signal REG_COMB_cpu_step_result : cpu_step_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_c_l68_c8_7a56]
signal BIN_OP_AND_uxn_c_l68_c8_7a56_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l68_c8_7a56_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l68_c8_7a56_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l68_c8_a1ee]
signal MUX_uxn_c_l68_c8_a1ee_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l68_c8_a1ee_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l68_c8_a1ee_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l68_c8_a1ee_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l69_c15_efce]
signal MUX_uxn_c_l69_c15_efce_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_efce_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_efce_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_efce_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c6_e148]
signal BIN_OP_EQ_uxn_c_l75_c6_e148_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c6_e148_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c6_e148_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c7_d442]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l75_c2_cacf]
signal ins_MUX_uxn_c_l75_c2_cacf_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l75_c2_cacf_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c2_cacf_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c2_cacf_return_output : unsigned(7 downto 0);

-- is_waiting_MUX[uxn_c_l75_c2_cacf]
signal is_waiting_MUX_uxn_c_l75_c2_cacf_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_cacf_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_cacf_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_cacf_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l75_c2_cacf]
signal eval_opcode_result_MUX_uxn_c_l75_c2_cacf_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l75_c2_cacf_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l75_c2_cacf_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l75_c2_cacf_return_output : eval_opcode_result_t;

-- pc_MUX[uxn_c_l75_c2_cacf]
signal pc_MUX_uxn_c_l75_c2_cacf_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l75_c2_cacf_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c2_cacf_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c2_cacf_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l75_c2_cacf]
signal cpu_step_result_MUX_uxn_c_l75_c2_cacf_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l75_c2_cacf_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c2_cacf_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c2_cacf_return_output : cpu_step_result_t;

-- is_ins_done_MUX[uxn_c_l75_c2_cacf]
signal is_ins_done_MUX_uxn_c_l75_c2_cacf_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_cacf_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_cacf_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_cacf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l82_c11_0e17]
signal BIN_OP_EQ_uxn_c_l82_c11_0e17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c11_0e17_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c11_0e17_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_2302]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l82_c7_d442]
signal ins_MUX_uxn_c_l82_c7_d442_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l82_c7_d442_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l82_c7_d442_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l82_c7_d442_return_output : unsigned(7 downto 0);

-- is_waiting_MUX[uxn_c_l82_c7_d442]
signal is_waiting_MUX_uxn_c_l82_c7_d442_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_d442_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_d442_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_d442_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l82_c7_d442]
signal eval_opcode_result_MUX_uxn_c_l82_c7_d442_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l82_c7_d442_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l82_c7_d442_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l82_c7_d442_return_output : eval_opcode_result_t;

-- pc_MUX[uxn_c_l82_c7_d442]
signal pc_MUX_uxn_c_l82_c7_d442_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l82_c7_d442_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l82_c7_d442_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l82_c7_d442_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l82_c7_d442]
signal cpu_step_result_MUX_uxn_c_l82_c7_d442_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l82_c7_d442_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l82_c7_d442_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l82_c7_d442_return_output : cpu_step_result_t;

-- is_ins_done_MUX[uxn_c_l82_c7_d442]
signal is_ins_done_MUX_uxn_c_l82_c7_d442_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_d442_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_d442_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_d442_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l83_c3_c571]
signal BIN_OP_PLUS_uxn_c_l83_c3_c571_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l83_c3_c571_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l83_c3_c571_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l86_c9_b62e]
signal BIN_OP_EQ_uxn_c_l86_c9_b62e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l86_c9_b62e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l86_c9_b62e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l86_c9_cc66]
signal MUX_uxn_c_l86_c9_cc66_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l86_c9_cc66_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l86_c9_cc66_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l86_c9_cc66_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l87_c43_dd79]
signal BIN_OP_MINUS_uxn_c_l87_c43_dd79_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l87_c43_dd79_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l87_c43_dd79_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l87_c24_c670]
signal eval_opcode_phased_uxn_c_l87_c24_c670_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_c670_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_c670_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_c670_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_c670_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_c670_previous_device_ram_read : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_c670_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l88_c8_0aa0]
signal MUX_uxn_c_l88_c8_0aa0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l88_c8_0aa0_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l88_c8_0aa0_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l88_c8_0aa0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l102_c6_66b2]
signal BIN_OP_OR_uxn_c_l102_c6_66b2_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l102_c6_66b2_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l102_c6_66b2_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l102_c2_e929]
signal step_cpu_phase_MUX_uxn_c_l102_c2_e929_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l102_c2_e929_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l102_c2_e929_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l102_c2_e929_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l105_c21_e812]
signal BIN_OP_EQ_uxn_c_l105_c21_e812_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l105_c21_e812_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l105_c21_e812_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l105_c37_8db4]
signal BIN_OP_PLUS_uxn_c_l105_c37_8db4_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l105_c37_8db4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l105_c37_8db4_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l105_c21_2fd5]
signal MUX_uxn_c_l105_c21_2fd5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l105_c21_2fd5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l105_c21_2fd5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l105_c21_2fd5_return_output : unsigned(7 downto 0);

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b280( ref_toks_0 : cpu_step_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d39f( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base.is_ram_write := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.vram_address := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.is_device_ram_16bit := ref_toks_7;
      base.u8_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_c_l68_c8_7a56
BIN_OP_AND_uxn_c_l68_c8_7a56 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l68_c8_7a56_left,
BIN_OP_AND_uxn_c_l68_c8_7a56_right,
BIN_OP_AND_uxn_c_l68_c8_7a56_return_output);

-- MUX_uxn_c_l68_c8_a1ee
MUX_uxn_c_l68_c8_a1ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l68_c8_a1ee_cond,
MUX_uxn_c_l68_c8_a1ee_iftrue,
MUX_uxn_c_l68_c8_a1ee_iffalse,
MUX_uxn_c_l68_c8_a1ee_return_output);

-- MUX_uxn_c_l69_c15_efce
MUX_uxn_c_l69_c15_efce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l69_c15_efce_cond,
MUX_uxn_c_l69_c15_efce_iftrue,
MUX_uxn_c_l69_c15_efce_iffalse,
MUX_uxn_c_l69_c15_efce_return_output);

-- BIN_OP_EQ_uxn_c_l75_c6_e148
BIN_OP_EQ_uxn_c_l75_c6_e148 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c6_e148_left,
BIN_OP_EQ_uxn_c_l75_c6_e148_right,
BIN_OP_EQ_uxn_c_l75_c6_e148_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_return_output);

-- ins_MUX_uxn_c_l75_c2_cacf
ins_MUX_uxn_c_l75_c2_cacf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l75_c2_cacf_cond,
ins_MUX_uxn_c_l75_c2_cacf_iftrue,
ins_MUX_uxn_c_l75_c2_cacf_iffalse,
ins_MUX_uxn_c_l75_c2_cacf_return_output);

-- is_waiting_MUX_uxn_c_l75_c2_cacf
is_waiting_MUX_uxn_c_l75_c2_cacf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l75_c2_cacf_cond,
is_waiting_MUX_uxn_c_l75_c2_cacf_iftrue,
is_waiting_MUX_uxn_c_l75_c2_cacf_iffalse,
is_waiting_MUX_uxn_c_l75_c2_cacf_return_output);

-- eval_opcode_result_MUX_uxn_c_l75_c2_cacf
eval_opcode_result_MUX_uxn_c_l75_c2_cacf : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l75_c2_cacf_cond,
eval_opcode_result_MUX_uxn_c_l75_c2_cacf_iftrue,
eval_opcode_result_MUX_uxn_c_l75_c2_cacf_iffalse,
eval_opcode_result_MUX_uxn_c_l75_c2_cacf_return_output);

-- pc_MUX_uxn_c_l75_c2_cacf
pc_MUX_uxn_c_l75_c2_cacf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l75_c2_cacf_cond,
pc_MUX_uxn_c_l75_c2_cacf_iftrue,
pc_MUX_uxn_c_l75_c2_cacf_iffalse,
pc_MUX_uxn_c_l75_c2_cacf_return_output);

-- cpu_step_result_MUX_uxn_c_l75_c2_cacf
cpu_step_result_MUX_uxn_c_l75_c2_cacf : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l75_c2_cacf_cond,
cpu_step_result_MUX_uxn_c_l75_c2_cacf_iftrue,
cpu_step_result_MUX_uxn_c_l75_c2_cacf_iffalse,
cpu_step_result_MUX_uxn_c_l75_c2_cacf_return_output);

-- is_ins_done_MUX_uxn_c_l75_c2_cacf
is_ins_done_MUX_uxn_c_l75_c2_cacf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l75_c2_cacf_cond,
is_ins_done_MUX_uxn_c_l75_c2_cacf_iftrue,
is_ins_done_MUX_uxn_c_l75_c2_cacf_iffalse,
is_ins_done_MUX_uxn_c_l75_c2_cacf_return_output);

-- BIN_OP_EQ_uxn_c_l82_c11_0e17
BIN_OP_EQ_uxn_c_l82_c11_0e17 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l82_c11_0e17_left,
BIN_OP_EQ_uxn_c_l82_c11_0e17_right,
BIN_OP_EQ_uxn_c_l82_c11_0e17_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_return_output);

-- ins_MUX_uxn_c_l82_c7_d442
ins_MUX_uxn_c_l82_c7_d442 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l82_c7_d442_cond,
ins_MUX_uxn_c_l82_c7_d442_iftrue,
ins_MUX_uxn_c_l82_c7_d442_iffalse,
ins_MUX_uxn_c_l82_c7_d442_return_output);

-- is_waiting_MUX_uxn_c_l82_c7_d442
is_waiting_MUX_uxn_c_l82_c7_d442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l82_c7_d442_cond,
is_waiting_MUX_uxn_c_l82_c7_d442_iftrue,
is_waiting_MUX_uxn_c_l82_c7_d442_iffalse,
is_waiting_MUX_uxn_c_l82_c7_d442_return_output);

-- eval_opcode_result_MUX_uxn_c_l82_c7_d442
eval_opcode_result_MUX_uxn_c_l82_c7_d442 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l82_c7_d442_cond,
eval_opcode_result_MUX_uxn_c_l82_c7_d442_iftrue,
eval_opcode_result_MUX_uxn_c_l82_c7_d442_iffalse,
eval_opcode_result_MUX_uxn_c_l82_c7_d442_return_output);

-- pc_MUX_uxn_c_l82_c7_d442
pc_MUX_uxn_c_l82_c7_d442 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l82_c7_d442_cond,
pc_MUX_uxn_c_l82_c7_d442_iftrue,
pc_MUX_uxn_c_l82_c7_d442_iffalse,
pc_MUX_uxn_c_l82_c7_d442_return_output);

-- cpu_step_result_MUX_uxn_c_l82_c7_d442
cpu_step_result_MUX_uxn_c_l82_c7_d442 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l82_c7_d442_cond,
cpu_step_result_MUX_uxn_c_l82_c7_d442_iftrue,
cpu_step_result_MUX_uxn_c_l82_c7_d442_iffalse,
cpu_step_result_MUX_uxn_c_l82_c7_d442_return_output);

-- is_ins_done_MUX_uxn_c_l82_c7_d442
is_ins_done_MUX_uxn_c_l82_c7_d442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l82_c7_d442_cond,
is_ins_done_MUX_uxn_c_l82_c7_d442_iftrue,
is_ins_done_MUX_uxn_c_l82_c7_d442_iffalse,
is_ins_done_MUX_uxn_c_l82_c7_d442_return_output);

-- BIN_OP_PLUS_uxn_c_l83_c3_c571
BIN_OP_PLUS_uxn_c_l83_c3_c571 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l83_c3_c571_left,
BIN_OP_PLUS_uxn_c_l83_c3_c571_right,
BIN_OP_PLUS_uxn_c_l83_c3_c571_return_output);

-- BIN_OP_EQ_uxn_c_l86_c9_b62e
BIN_OP_EQ_uxn_c_l86_c9_b62e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l86_c9_b62e_left,
BIN_OP_EQ_uxn_c_l86_c9_b62e_right,
BIN_OP_EQ_uxn_c_l86_c9_b62e_return_output);

-- MUX_uxn_c_l86_c9_cc66
MUX_uxn_c_l86_c9_cc66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l86_c9_cc66_cond,
MUX_uxn_c_l86_c9_cc66_iftrue,
MUX_uxn_c_l86_c9_cc66_iffalse,
MUX_uxn_c_l86_c9_cc66_return_output);

-- BIN_OP_MINUS_uxn_c_l87_c43_dd79
BIN_OP_MINUS_uxn_c_l87_c43_dd79 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l87_c43_dd79_left,
BIN_OP_MINUS_uxn_c_l87_c43_dd79_right,
BIN_OP_MINUS_uxn_c_l87_c43_dd79_return_output);

-- eval_opcode_phased_uxn_c_l87_c24_c670
eval_opcode_phased_uxn_c_l87_c24_c670 : entity work.eval_opcode_phased_0CLK_08affe97 port map (
clk,
eval_opcode_phased_uxn_c_l87_c24_c670_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l87_c24_c670_phase,
eval_opcode_phased_uxn_c_l87_c24_c670_ins,
eval_opcode_phased_uxn_c_l87_c24_c670_pc,
eval_opcode_phased_uxn_c_l87_c24_c670_previous_ram_read,
eval_opcode_phased_uxn_c_l87_c24_c670_previous_device_ram_read,
eval_opcode_phased_uxn_c_l87_c24_c670_return_output);

-- MUX_uxn_c_l88_c8_0aa0
MUX_uxn_c_l88_c8_0aa0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l88_c8_0aa0_cond,
MUX_uxn_c_l88_c8_0aa0_iftrue,
MUX_uxn_c_l88_c8_0aa0_iffalse,
MUX_uxn_c_l88_c8_0aa0_return_output);

-- BIN_OP_OR_uxn_c_l102_c6_66b2
BIN_OP_OR_uxn_c_l102_c6_66b2 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l102_c6_66b2_left,
BIN_OP_OR_uxn_c_l102_c6_66b2_right,
BIN_OP_OR_uxn_c_l102_c6_66b2_return_output);

-- step_cpu_phase_MUX_uxn_c_l102_c2_e929
step_cpu_phase_MUX_uxn_c_l102_c2_e929 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l102_c2_e929_cond,
step_cpu_phase_MUX_uxn_c_l102_c2_e929_iftrue,
step_cpu_phase_MUX_uxn_c_l102_c2_e929_iffalse,
step_cpu_phase_MUX_uxn_c_l102_c2_e929_return_output);

-- BIN_OP_EQ_uxn_c_l105_c21_e812
BIN_OP_EQ_uxn_c_l105_c21_e812 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l105_c21_e812_left,
BIN_OP_EQ_uxn_c_l105_c21_e812_right,
BIN_OP_EQ_uxn_c_l105_c21_e812_return_output);

-- BIN_OP_PLUS_uxn_c_l105_c37_8db4
BIN_OP_PLUS_uxn_c_l105_c37_8db4 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l105_c37_8db4_left,
BIN_OP_PLUS_uxn_c_l105_c37_8db4_right,
BIN_OP_PLUS_uxn_c_l105_c37_8db4_return_output);

-- MUX_uxn_c_l105_c21_2fd5
MUX_uxn_c_l105_c21_2fd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l105_c21_2fd5_cond,
MUX_uxn_c_l105_c21_2fd5_iftrue,
MUX_uxn_c_l105_c21_2fd5_iffalse,
MUX_uxn_c_l105_c21_2fd5_return_output);



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
 eval_opcode_result,
 cpu_step_result,
 -- All submodule outputs
 BIN_OP_AND_uxn_c_l68_c8_7a56_return_output,
 MUX_uxn_c_l68_c8_a1ee_return_output,
 MUX_uxn_c_l69_c15_efce_return_output,
 BIN_OP_EQ_uxn_c_l75_c6_e148_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_return_output,
 ins_MUX_uxn_c_l75_c2_cacf_return_output,
 is_waiting_MUX_uxn_c_l75_c2_cacf_return_output,
 eval_opcode_result_MUX_uxn_c_l75_c2_cacf_return_output,
 pc_MUX_uxn_c_l75_c2_cacf_return_output,
 cpu_step_result_MUX_uxn_c_l75_c2_cacf_return_output,
 is_ins_done_MUX_uxn_c_l75_c2_cacf_return_output,
 BIN_OP_EQ_uxn_c_l82_c11_0e17_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_return_output,
 ins_MUX_uxn_c_l82_c7_d442_return_output,
 is_waiting_MUX_uxn_c_l82_c7_d442_return_output,
 eval_opcode_result_MUX_uxn_c_l82_c7_d442_return_output,
 pc_MUX_uxn_c_l82_c7_d442_return_output,
 cpu_step_result_MUX_uxn_c_l82_c7_d442_return_output,
 is_ins_done_MUX_uxn_c_l82_c7_d442_return_output,
 BIN_OP_PLUS_uxn_c_l83_c3_c571_return_output,
 BIN_OP_EQ_uxn_c_l86_c9_b62e_return_output,
 MUX_uxn_c_l86_c9_cc66_return_output,
 BIN_OP_MINUS_uxn_c_l87_c43_dd79_return_output,
 eval_opcode_phased_uxn_c_l87_c24_c670_return_output,
 MUX_uxn_c_l88_c8_0aa0_return_output,
 BIN_OP_OR_uxn_c_l102_c6_66b2_return_output,
 step_cpu_phase_MUX_uxn_c_l102_c2_e929_return_output,
 BIN_OP_EQ_uxn_c_l105_c21_e812_return_output,
 BIN_OP_PLUS_uxn_c_l105_c37_8db4_return_output,
 MUX_uxn_c_l105_c21_2fd5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(15 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_a1ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_7a56_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_7a56_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_7a56_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_a1ee_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_a1ee_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_a1ee_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_efce_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_efce_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_efce_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_efce_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_e148_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_e148_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_e148_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_cacf_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_cacf_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_d442_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_cacf_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_cacf_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_cacf_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_cacf_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_d442_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_cacf_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_cacf_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c2_cacf_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c2_cacf_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l82_c7_d442_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c2_cacf_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c2_cacf_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_cacf_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_cacf_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_d442_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_cacf_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_cacf_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_cacf_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b280_uxn_c_l75_c2_cacf_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_cacf_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_d442_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_cacf_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_cacf_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_cacf_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_cacf_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_d442_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_cacf_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_cacf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_0e17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_0e17_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_0e17_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_d442_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_d442_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_d442_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_d442_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_d442_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_d442_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l82_c7_d442_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l82_c7_d442_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l82_c7_d442_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_d442_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l83_c3_6da0 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_d442_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_d442_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_d442_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_d442_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d39f_uxn_c_l82_c7_d442_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_d442_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_d442_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_d442_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_d442_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_c571_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_c571_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_c571_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_cc66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_b62e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_b62e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_b62e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_cc66_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_cc66_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_cc66_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_c670_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_c670_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_c670_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_c670_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_c670_previous_device_ram_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c43_dd79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c43_dd79_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c43_dd79_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_c670_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_c670_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l88_c8_0aa0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_a0a9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_0aa0_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_0aa0_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_0aa0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_6f08_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_fbcc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_64af_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l93_c34_1e44_return_output : unsigned(23 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l94_c40_9076_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l95_c41_d4dc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_16bit_d41d_uxn_c_l96_c41_e583_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l97_c30_b776_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l98_c16_6fdb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l99_c17_b723_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l102_c6_66b2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l102_c6_66b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l102_c6_66b2_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_e929_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l103_c3_dfc8 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_e929_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_e929_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_e929_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l105_c21_2fd5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l105_c21_e812_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l105_c21_e812_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l105_c21_e812_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l105_c21_2fd5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l105_c21_2fd5_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l105_c37_8db4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l105_c37_8db4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l105_c37_8db4_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l105_c21_2fd5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_02c2_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_pc : unsigned(15 downto 0);
variable REG_VAR_ins : unsigned(7 downto 0);
variable REG_VAR_step_cpu_phase : unsigned(7 downto 0);
variable REG_VAR_is_ins_done : unsigned(0 downto 0);
variable REG_VAR_is_waiting : unsigned(0 downto 0);
variable REG_VAR_eval_opcode_result : eval_opcode_result_t;
variable REG_VAR_cpu_step_result : cpu_step_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_pc := pc;
  REG_VAR_ins := ins;
  REG_VAR_step_cpu_phase := step_cpu_phase;
  REG_VAR_is_ins_done := is_ins_done;
  REG_VAR_is_waiting := is_waiting;
  REG_VAR_eval_opcode_result := eval_opcode_result;
  REG_VAR_cpu_step_result := cpu_step_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l86_c9_b62e_right := to_unsigned(2, 2);
     VAR_step_cpu_phase_uxn_c_l103_c3_dfc8 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_e929_iftrue := VAR_step_cpu_phase_uxn_c_l103_c3_dfc8;
     VAR_MUX_uxn_c_l69_c15_efce_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_c571_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l82_c11_0e17_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l87_c43_dd79_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l105_c21_e812_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l75_c6_e148_right := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l75_c2_cacf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l105_c37_8db4_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l105_c21_2fd5_iftrue := resize(to_unsigned(0, 1), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_iffalse := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_d442_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c2_cacf_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l82_c7_d442_iftrue := eval_opcode_result;
     VAR_MUX_uxn_c_l86_c9_cc66_iffalse := ins;
     VAR_ins_MUX_uxn_c_l75_c2_cacf_iftrue := ins;
     VAR_ins_MUX_uxn_c_l82_c7_d442_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_d442_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l68_c8_7a56_right := is_waiting;
     VAR_MUX_uxn_c_l69_c15_efce_iffalse := is_waiting;
     VAR_MUX_uxn_c_l68_c8_a1ee_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l87_c24_c670_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l86_c9_cc66_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l87_c24_c670_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l75_c6_e148_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l82_c11_0e17_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l86_c9_b62e_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l87_c43_dd79_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l105_c37_8db4_left := step_cpu_phase;
     VAR_BIN_OP_AND_uxn_c_l68_c8_7a56_left := VAR_use_vector;
     VAR_MUX_uxn_c_l69_c15_efce_cond := VAR_use_vector;
     VAR_MUX_uxn_c_l68_c8_a1ee_iftrue := VAR_vector;
     -- BIN_OP_EQ[uxn_c_l75_c6_e148] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c6_e148_left <= VAR_BIN_OP_EQ_uxn_c_l75_c6_e148_left;
     BIN_OP_EQ_uxn_c_l75_c6_e148_right <= VAR_BIN_OP_EQ_uxn_c_l75_c6_e148_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c6_e148_return_output := BIN_OP_EQ_uxn_c_l75_c6_e148_return_output;

     -- BIN_OP_AND[uxn_c_l68_c8_7a56] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l68_c8_7a56_left <= VAR_BIN_OP_AND_uxn_c_l68_c8_7a56_left;
     BIN_OP_AND_uxn_c_l68_c8_7a56_right <= VAR_BIN_OP_AND_uxn_c_l68_c8_7a56_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l68_c8_7a56_return_output := BIN_OP_AND_uxn_c_l68_c8_7a56_return_output;

     -- BIN_OP_EQ[uxn_c_l82_c11_0e17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l82_c11_0e17_left <= VAR_BIN_OP_EQ_uxn_c_l82_c11_0e17_left;
     BIN_OP_EQ_uxn_c_l82_c11_0e17_right <= VAR_BIN_OP_EQ_uxn_c_l82_c11_0e17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l82_c11_0e17_return_output := BIN_OP_EQ_uxn_c_l82_c11_0e17_return_output;

     -- BIN_OP_EQ[uxn_c_l86_c9_b62e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l86_c9_b62e_left <= VAR_BIN_OP_EQ_uxn_c_l86_c9_b62e_left;
     BIN_OP_EQ_uxn_c_l86_c9_b62e_right <= VAR_BIN_OP_EQ_uxn_c_l86_c9_b62e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l86_c9_b62e_return_output := BIN_OP_EQ_uxn_c_l86_c9_b62e_return_output;

     -- BIN_OP_PLUS[uxn_c_l105_c37_8db4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l105_c37_8db4_left <= VAR_BIN_OP_PLUS_uxn_c_l105_c37_8db4_left;
     BIN_OP_PLUS_uxn_c_l105_c37_8db4_right <= VAR_BIN_OP_PLUS_uxn_c_l105_c37_8db4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l105_c37_8db4_return_output := BIN_OP_PLUS_uxn_c_l105_c37_8db4_return_output;

     -- MUX[uxn_c_l69_c15_efce] LATENCY=0
     -- Inputs
     MUX_uxn_c_l69_c15_efce_cond <= VAR_MUX_uxn_c_l69_c15_efce_cond;
     MUX_uxn_c_l69_c15_efce_iftrue <= VAR_MUX_uxn_c_l69_c15_efce_iftrue;
     MUX_uxn_c_l69_c15_efce_iffalse <= VAR_MUX_uxn_c_l69_c15_efce_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l69_c15_efce_return_output := MUX_uxn_c_l69_c15_efce_return_output;

     -- BIN_OP_MINUS[uxn_c_l87_c43_dd79] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l87_c43_dd79_left <= VAR_BIN_OP_MINUS_uxn_c_l87_c43_dd79_left;
     BIN_OP_MINUS_uxn_c_l87_c43_dd79_right <= VAR_BIN_OP_MINUS_uxn_c_l87_c43_dd79_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l87_c43_dd79_return_output := BIN_OP_MINUS_uxn_c_l87_c43_dd79_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l68_c8_a1ee_cond := VAR_BIN_OP_AND_uxn_c_l68_c8_7a56_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_e148_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_cacf_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_e148_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c2_cacf_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_e148_return_output;
     VAR_ins_MUX_uxn_c_l75_c2_cacf_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_e148_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c2_cacf_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_e148_return_output;
     VAR_is_waiting_MUX_uxn_c_l75_c2_cacf_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_e148_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_cacf_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_e148_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_0e17_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_d442_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_0e17_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l82_c7_d442_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_0e17_return_output;
     VAR_ins_MUX_uxn_c_l82_c7_d442_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_0e17_return_output;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_d442_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_0e17_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_d442_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_0e17_return_output;
     VAR_pc_MUX_uxn_c_l82_c7_d442_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_0e17_return_output;
     VAR_MUX_uxn_c_l86_c9_cc66_cond := VAR_BIN_OP_EQ_uxn_c_l86_c9_b62e_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c24_c670_phase := VAR_BIN_OP_MINUS_uxn_c_l87_c43_dd79_return_output;
     VAR_MUX_uxn_c_l105_c21_2fd5_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l105_c37_8db4_return_output, 8);
     VAR_is_waiting_MUX_uxn_c_l75_c2_cacf_iftrue := VAR_MUX_uxn_c_l69_c15_efce_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_d442_iftrue := VAR_MUX_uxn_c_l69_c15_efce_return_output;
     -- MUX[uxn_c_l86_c9_cc66] LATENCY=0
     -- Inputs
     MUX_uxn_c_l86_c9_cc66_cond <= VAR_MUX_uxn_c_l86_c9_cc66_cond;
     MUX_uxn_c_l86_c9_cc66_iftrue <= VAR_MUX_uxn_c_l86_c9_cc66_iftrue;
     MUX_uxn_c_l86_c9_cc66_iffalse <= VAR_MUX_uxn_c_l86_c9_cc66_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l86_c9_cc66_return_output := MUX_uxn_c_l86_c9_cc66_return_output;

     -- MUX[uxn_c_l68_c8_a1ee] LATENCY=0
     -- Inputs
     MUX_uxn_c_l68_c8_a1ee_cond <= VAR_MUX_uxn_c_l68_c8_a1ee_cond;
     MUX_uxn_c_l68_c8_a1ee_iftrue <= VAR_MUX_uxn_c_l68_c8_a1ee_iftrue;
     MUX_uxn_c_l68_c8_a1ee_iffalse <= VAR_MUX_uxn_c_l68_c8_a1ee_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l68_c8_a1ee_return_output := MUX_uxn_c_l68_c8_a1ee_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c7_d442] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_d442_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_c571_left := VAR_MUX_uxn_c_l68_c8_a1ee_return_output;
     VAR_MUX_uxn_c_l88_c8_0aa0_iffalse := VAR_MUX_uxn_c_l68_c8_a1ee_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c24_c670_pc := VAR_MUX_uxn_c_l68_c8_a1ee_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_cacf_iftrue := VAR_MUX_uxn_c_l68_c8_a1ee_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c24_c670_ins := VAR_MUX_uxn_c_l86_c9_cc66_return_output;
     VAR_ins_MUX_uxn_c_l82_c7_d442_iffalse := VAR_MUX_uxn_c_l86_c9_cc66_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_2302] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_return_output;

     -- ins_MUX[uxn_c_l82_c7_d442] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l82_c7_d442_cond <= VAR_ins_MUX_uxn_c_l82_c7_d442_cond;
     ins_MUX_uxn_c_l82_c7_d442_iftrue <= VAR_ins_MUX_uxn_c_l82_c7_d442_iftrue;
     ins_MUX_uxn_c_l82_c7_d442_iffalse <= VAR_ins_MUX_uxn_c_l82_c7_d442_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l82_c7_d442_return_output := ins_MUX_uxn_c_l82_c7_d442_return_output;

     -- BIN_OP_PLUS[uxn_c_l83_c3_c571] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l83_c3_c571_left <= VAR_BIN_OP_PLUS_uxn_c_l83_c3_c571_left;
     BIN_OP_PLUS_uxn_c_l83_c3_c571_right <= VAR_BIN_OP_PLUS_uxn_c_l83_c3_c571_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_c571_return_output := BIN_OP_PLUS_uxn_c_l83_c3_c571_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b280[uxn_c_l75_c2_cacf] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b280_uxn_c_l75_c2_cacf_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b280(
     cpu_step_result,
     VAR_MUX_uxn_c_l68_c8_a1ee_return_output,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- Submodule level 3
     VAR_pc_uxn_c_l83_c3_6da0 := resize(VAR_BIN_OP_PLUS_uxn_c_l83_c3_c571_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l87_c24_c670_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2302_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_cacf_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b280_uxn_c_l75_c2_cacf_return_output;
     VAR_ins_MUX_uxn_c_l75_c2_cacf_iffalse := VAR_ins_MUX_uxn_c_l82_c7_d442_return_output;
     VAR_pc_MUX_uxn_c_l82_c7_d442_iftrue := VAR_pc_uxn_c_l83_c3_6da0;
     -- eval_opcode_phased[uxn_c_l87_c24_c670] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l87_c24_c670_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l87_c24_c670_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l87_c24_c670_phase <= VAR_eval_opcode_phased_uxn_c_l87_c24_c670_phase;
     eval_opcode_phased_uxn_c_l87_c24_c670_ins <= VAR_eval_opcode_phased_uxn_c_l87_c24_c670_ins;
     eval_opcode_phased_uxn_c_l87_c24_c670_pc <= VAR_eval_opcode_phased_uxn_c_l87_c24_c670_pc;
     eval_opcode_phased_uxn_c_l87_c24_c670_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l87_c24_c670_previous_ram_read;
     eval_opcode_phased_uxn_c_l87_c24_c670_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l87_c24_c670_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l87_c24_c670_return_output := eval_opcode_phased_uxn_c_l87_c24_c670_return_output;

     -- ins_MUX[uxn_c_l75_c2_cacf] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l75_c2_cacf_cond <= VAR_ins_MUX_uxn_c_l75_c2_cacf_cond;
     ins_MUX_uxn_c_l75_c2_cacf_iftrue <= VAR_ins_MUX_uxn_c_l75_c2_cacf_iftrue;
     ins_MUX_uxn_c_l75_c2_cacf_iffalse <= VAR_ins_MUX_uxn_c_l75_c2_cacf_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l75_c2_cacf_return_output := ins_MUX_uxn_c_l75_c2_cacf_return_output;

     -- Submodule level 4
     VAR_eval_opcode_result_MUX_uxn_c_l82_c7_d442_iffalse := VAR_eval_opcode_phased_uxn_c_l87_c24_c670_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l75_c2_cacf_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l95_c41_d4dc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l95_c41_d4dc_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_c670_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_02c2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_02c2_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_c670_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l98_c16_6fdb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l98_c16_6fdb_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_c670_return_output.is_waiting;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l94_c40_9076] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l94_c40_9076_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_c670_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l99_c17_b723] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l99_c17_b723_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_c670_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l88_c8_a0a9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_a0a9_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_c670_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l92_c38_64af] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_64af_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_c670_return_output.vram_write_layer;

     -- CONST_REF_RD_uint24_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l93_c34_1e44] LATENCY=0
     VAR_CONST_REF_RD_uint24_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l93_c34_1e44_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_c670_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l89_c34_6f08] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_6f08_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_c670_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_16bit_d41d[uxn_c_l96_c41_e583] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_16bit_d41d_uxn_c_l96_c41_e583_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_c670_return_output.is_device_ram_16bit;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l91_c35_fbcc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_fbcc_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_c670_return_output.is_vram_write;

     -- eval_opcode_result_MUX[uxn_c_l82_c7_d442] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l82_c7_d442_cond <= VAR_eval_opcode_result_MUX_uxn_c_l82_c7_d442_cond;
     eval_opcode_result_MUX_uxn_c_l82_c7_d442_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l82_c7_d442_iftrue;
     eval_opcode_result_MUX_uxn_c_l82_c7_d442_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l82_c7_d442_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l82_c7_d442_return_output := eval_opcode_result_MUX_uxn_c_l82_c7_d442_return_output;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l97_c30_b776] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l97_c30_b776_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_c670_return_output.u8_value;

     -- Submodule level 5
     VAR_MUX_uxn_c_l88_c8_0aa0_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_02c2_return_output;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_d442_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l99_c17_b723_return_output;
     VAR_MUX_uxn_c_l88_c8_0aa0_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_a0a9_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_d442_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l98_c16_6fdb_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c2_cacf_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l82_c7_d442_return_output;
     -- MUX[uxn_c_l88_c8_0aa0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l88_c8_0aa0_cond <= VAR_MUX_uxn_c_l88_c8_0aa0_cond;
     MUX_uxn_c_l88_c8_0aa0_iftrue <= VAR_MUX_uxn_c_l88_c8_0aa0_iftrue;
     MUX_uxn_c_l88_c8_0aa0_iffalse <= VAR_MUX_uxn_c_l88_c8_0aa0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l88_c8_0aa0_return_output := MUX_uxn_c_l88_c8_0aa0_return_output;

     -- is_ins_done_MUX[uxn_c_l82_c7_d442] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l82_c7_d442_cond <= VAR_is_ins_done_MUX_uxn_c_l82_c7_d442_cond;
     is_ins_done_MUX_uxn_c_l82_c7_d442_iftrue <= VAR_is_ins_done_MUX_uxn_c_l82_c7_d442_iftrue;
     is_ins_done_MUX_uxn_c_l82_c7_d442_iffalse <= VAR_is_ins_done_MUX_uxn_c_l82_c7_d442_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l82_c7_d442_return_output := is_ins_done_MUX_uxn_c_l82_c7_d442_return_output;

     -- is_waiting_MUX[uxn_c_l82_c7_d442] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l82_c7_d442_cond <= VAR_is_waiting_MUX_uxn_c_l82_c7_d442_cond;
     is_waiting_MUX_uxn_c_l82_c7_d442_iftrue <= VAR_is_waiting_MUX_uxn_c_l82_c7_d442_iftrue;
     is_waiting_MUX_uxn_c_l82_c7_d442_iffalse <= VAR_is_waiting_MUX_uxn_c_l82_c7_d442_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l82_c7_d442_return_output := is_waiting_MUX_uxn_c_l82_c7_d442_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d39f[uxn_c_l82_c7_d442] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d39f_uxn_c_l82_c7_d442_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d39f(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_6f08_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_02c2_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_fbcc_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_64af_return_output,
     VAR_CONST_REF_RD_uint24_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l93_c34_1e44_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l94_c40_9076_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l95_c41_d4dc_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_16bit_d41d_uxn_c_l96_c41_e583_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l97_c30_b776_return_output);

     -- eval_opcode_result_MUX[uxn_c_l75_c2_cacf] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l75_c2_cacf_cond <= VAR_eval_opcode_result_MUX_uxn_c_l75_c2_cacf_cond;
     eval_opcode_result_MUX_uxn_c_l75_c2_cacf_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l75_c2_cacf_iftrue;
     eval_opcode_result_MUX_uxn_c_l75_c2_cacf_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l75_c2_cacf_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l75_c2_cacf_return_output := eval_opcode_result_MUX_uxn_c_l75_c2_cacf_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l82_c7_d442_iffalse := VAR_MUX_uxn_c_l88_c8_0aa0_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_d442_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d39f_uxn_c_l82_c7_d442_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l75_c2_cacf_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c2_cacf_iffalse := VAR_is_ins_done_MUX_uxn_c_l82_c7_d442_return_output;
     VAR_is_waiting_MUX_uxn_c_l75_c2_cacf_iffalse := VAR_is_waiting_MUX_uxn_c_l82_c7_d442_return_output;
     -- is_waiting_MUX[uxn_c_l75_c2_cacf] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l75_c2_cacf_cond <= VAR_is_waiting_MUX_uxn_c_l75_c2_cacf_cond;
     is_waiting_MUX_uxn_c_l75_c2_cacf_iftrue <= VAR_is_waiting_MUX_uxn_c_l75_c2_cacf_iftrue;
     is_waiting_MUX_uxn_c_l75_c2_cacf_iffalse <= VAR_is_waiting_MUX_uxn_c_l75_c2_cacf_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l75_c2_cacf_return_output := is_waiting_MUX_uxn_c_l75_c2_cacf_return_output;

     -- pc_MUX[uxn_c_l82_c7_d442] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l82_c7_d442_cond <= VAR_pc_MUX_uxn_c_l82_c7_d442_cond;
     pc_MUX_uxn_c_l82_c7_d442_iftrue <= VAR_pc_MUX_uxn_c_l82_c7_d442_iftrue;
     pc_MUX_uxn_c_l82_c7_d442_iffalse <= VAR_pc_MUX_uxn_c_l82_c7_d442_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l82_c7_d442_return_output := pc_MUX_uxn_c_l82_c7_d442_return_output;

     -- cpu_step_result_MUX[uxn_c_l82_c7_d442] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l82_c7_d442_cond <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_d442_cond;
     cpu_step_result_MUX_uxn_c_l82_c7_d442_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_d442_iftrue;
     cpu_step_result_MUX_uxn_c_l82_c7_d442_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_d442_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_d442_return_output := cpu_step_result_MUX_uxn_c_l82_c7_d442_return_output;

     -- is_ins_done_MUX[uxn_c_l75_c2_cacf] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l75_c2_cacf_cond <= VAR_is_ins_done_MUX_uxn_c_l75_c2_cacf_cond;
     is_ins_done_MUX_uxn_c_l75_c2_cacf_iftrue <= VAR_is_ins_done_MUX_uxn_c_l75_c2_cacf_iftrue;
     is_ins_done_MUX_uxn_c_l75_c2_cacf_iffalse <= VAR_is_ins_done_MUX_uxn_c_l75_c2_cacf_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l75_c2_cacf_return_output := is_ins_done_MUX_uxn_c_l75_c2_cacf_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_cacf_iffalse := VAR_cpu_step_result_MUX_uxn_c_l82_c7_d442_return_output;
     VAR_BIN_OP_OR_uxn_c_l102_c6_66b2_left := VAR_is_ins_done_MUX_uxn_c_l75_c2_cacf_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l75_c2_cacf_return_output;
     VAR_BIN_OP_OR_uxn_c_l102_c6_66b2_right := VAR_is_waiting_MUX_uxn_c_l75_c2_cacf_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l75_c2_cacf_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_cacf_iffalse := VAR_pc_MUX_uxn_c_l82_c7_d442_return_output;
     -- BIN_OP_OR[uxn_c_l102_c6_66b2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l102_c6_66b2_left <= VAR_BIN_OP_OR_uxn_c_l102_c6_66b2_left;
     BIN_OP_OR_uxn_c_l102_c6_66b2_right <= VAR_BIN_OP_OR_uxn_c_l102_c6_66b2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l102_c6_66b2_return_output := BIN_OP_OR_uxn_c_l102_c6_66b2_return_output;

     -- cpu_step_result_MUX[uxn_c_l75_c2_cacf] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l75_c2_cacf_cond <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_cacf_cond;
     cpu_step_result_MUX_uxn_c_l75_c2_cacf_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_cacf_iftrue;
     cpu_step_result_MUX_uxn_c_l75_c2_cacf_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_cacf_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_cacf_return_output := cpu_step_result_MUX_uxn_c_l75_c2_cacf_return_output;

     -- pc_MUX[uxn_c_l75_c2_cacf] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l75_c2_cacf_cond <= VAR_pc_MUX_uxn_c_l75_c2_cacf_cond;
     pc_MUX_uxn_c_l75_c2_cacf_iftrue <= VAR_pc_MUX_uxn_c_l75_c2_cacf_iftrue;
     pc_MUX_uxn_c_l75_c2_cacf_iffalse <= VAR_pc_MUX_uxn_c_l75_c2_cacf_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l75_c2_cacf_return_output := pc_MUX_uxn_c_l75_c2_cacf_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_e929_cond := VAR_BIN_OP_OR_uxn_c_l102_c6_66b2_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l75_c2_cacf_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l75_c2_cacf_return_output;
     VAR_BIN_OP_EQ_uxn_c_l105_c21_e812_left := VAR_pc_MUX_uxn_c_l75_c2_cacf_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l75_c2_cacf_return_output;
     -- BIN_OP_EQ[uxn_c_l105_c21_e812] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l105_c21_e812_left <= VAR_BIN_OP_EQ_uxn_c_l105_c21_e812_left;
     BIN_OP_EQ_uxn_c_l105_c21_e812_right <= VAR_BIN_OP_EQ_uxn_c_l105_c21_e812_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l105_c21_e812_return_output := BIN_OP_EQ_uxn_c_l105_c21_e812_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l105_c21_2fd5_cond := VAR_BIN_OP_EQ_uxn_c_l105_c21_e812_return_output;
     -- MUX[uxn_c_l105_c21_2fd5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l105_c21_2fd5_cond <= VAR_MUX_uxn_c_l105_c21_2fd5_cond;
     MUX_uxn_c_l105_c21_2fd5_iftrue <= VAR_MUX_uxn_c_l105_c21_2fd5_iftrue;
     MUX_uxn_c_l105_c21_2fd5_iffalse <= VAR_MUX_uxn_c_l105_c21_2fd5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l105_c21_2fd5_return_output := MUX_uxn_c_l105_c21_2fd5_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_e929_iffalse := VAR_MUX_uxn_c_l105_c21_2fd5_return_output;
     -- step_cpu_phase_MUX[uxn_c_l102_c2_e929] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l102_c2_e929_cond <= VAR_step_cpu_phase_MUX_uxn_c_l102_c2_e929_cond;
     step_cpu_phase_MUX_uxn_c_l102_c2_e929_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l102_c2_e929_iftrue;
     step_cpu_phase_MUX_uxn_c_l102_c2_e929_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l102_c2_e929_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_e929_return_output := step_cpu_phase_MUX_uxn_c_l102_c2_e929_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l102_c2_e929_return_output;
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
     is_waiting <= REG_COMB_is_waiting;
     eval_opcode_result <= REG_COMB_eval_opcode_result;
     cpu_step_result <= REG_COMB_cpu_step_result;
 end if;
 end if;
end process;

end arch;
