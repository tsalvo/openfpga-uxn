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
entity step_cpu_0CLK_cedd1265 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 use_vector : in unsigned(0 downto 0);
 vector : in unsigned(15 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_cedd1265;
architecture arch of step_cpu_0CLK_cedd1265 is
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
signal REG_COMB_eval_opcode_result : eval_opcode_result_t;
signal REG_COMB_cpu_step_result : cpu_step_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_c_l68_c8_f909]
signal BIN_OP_AND_uxn_c_l68_c8_f909_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l68_c8_f909_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l68_c8_f909_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l68_c8_1cee]
signal MUX_uxn_c_l68_c8_1cee_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l68_c8_1cee_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l68_c8_1cee_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l68_c8_1cee_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l69_c15_abaf]
signal MUX_uxn_c_l69_c15_abaf_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_abaf_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_abaf_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_abaf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c6_b0da]
signal BIN_OP_EQ_uxn_c_l75_c6_b0da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c6_b0da_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c6_b0da_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c7_2ddf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l75_c2_c3f5]
signal is_ins_done_MUX_uxn_c_l75_c2_c3f5_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_c3f5_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_c3f5_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_c3f5_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l75_c2_c3f5]
signal eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_return_output : eval_opcode_result_t;

-- is_waiting_MUX[uxn_c_l75_c2_c3f5]
signal is_waiting_MUX_uxn_c_l75_c2_c3f5_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_c3f5_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_c3f5_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_c3f5_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l75_c2_c3f5]
signal pc_MUX_uxn_c_l75_c2_c3f5_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l75_c2_c3f5_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c2_c3f5_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c2_c3f5_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l75_c2_c3f5]
signal cpu_step_result_MUX_uxn_c_l75_c2_c3f5_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l75_c2_c3f5_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c2_c3f5_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c2_c3f5_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l75_c2_c3f5]
signal ins_MUX_uxn_c_l75_c2_c3f5_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l75_c2_c3f5_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c2_c3f5_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c2_c3f5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l82_c11_3471]
signal BIN_OP_EQ_uxn_c_l82_c11_3471_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c11_3471_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c11_3471_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_d8bb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l82_c7_2ddf]
signal is_ins_done_MUX_uxn_c_l82_c7_2ddf_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_2ddf_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_2ddf_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_2ddf_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l82_c7_2ddf]
signal eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_return_output : eval_opcode_result_t;

-- is_waiting_MUX[uxn_c_l82_c7_2ddf]
signal is_waiting_MUX_uxn_c_l82_c7_2ddf_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_2ddf_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_2ddf_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_2ddf_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l82_c7_2ddf]
signal pc_MUX_uxn_c_l82_c7_2ddf_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l82_c7_2ddf_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l82_c7_2ddf_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l82_c7_2ddf_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l82_c7_2ddf]
signal cpu_step_result_MUX_uxn_c_l82_c7_2ddf_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l82_c7_2ddf_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l82_c7_2ddf_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l82_c7_2ddf_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l82_c7_2ddf]
signal ins_MUX_uxn_c_l82_c7_2ddf_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l82_c7_2ddf_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l82_c7_2ddf_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l82_c7_2ddf_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l83_c3_af12]
signal BIN_OP_PLUS_uxn_c_l83_c3_af12_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l83_c3_af12_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l83_c3_af12_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l86_c9_01e8]
signal BIN_OP_EQ_uxn_c_l86_c9_01e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l86_c9_01e8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l86_c9_01e8_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l86_c9_7297]
signal MUX_uxn_c_l86_c9_7297_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l86_c9_7297_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l86_c9_7297_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l86_c9_7297_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l87_c43_6b21]
signal BIN_OP_MINUS_uxn_c_l87_c43_6b21_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l87_c43_6b21_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l87_c43_6b21_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l87_c24_1525]
signal eval_opcode_phased_uxn_c_l87_c24_1525_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_1525_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_1525_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_1525_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_1525_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_1525_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_1525_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l88_c8_2f08]
signal MUX_uxn_c_l88_c8_2f08_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l88_c8_2f08_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l88_c8_2f08_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l88_c8_2f08_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l100_c6_e1f9]
signal BIN_OP_OR_uxn_c_l100_c6_e1f9_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l100_c6_e1f9_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l100_c6_e1f9_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l100_c2_42f5]
signal step_cpu_phase_MUX_uxn_c_l100_c2_42f5_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l100_c2_42f5_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l100_c2_42f5_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l100_c2_42f5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l103_c21_be02]
signal BIN_OP_EQ_uxn_c_l103_c21_be02_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l103_c21_be02_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l103_c21_be02_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l103_c37_2740]
signal BIN_OP_PLUS_uxn_c_l103_c37_2740_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l103_c37_2740_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l103_c37_2740_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l103_c21_5bc7]
signal MUX_uxn_c_l103_c21_5bc7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l103_c21_5bc7_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l103_c21_5bc7_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l103_c21_5bc7_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_c_l68_c8_f909
BIN_OP_AND_uxn_c_l68_c8_f909 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l68_c8_f909_left,
BIN_OP_AND_uxn_c_l68_c8_f909_right,
BIN_OP_AND_uxn_c_l68_c8_f909_return_output);

-- MUX_uxn_c_l68_c8_1cee
MUX_uxn_c_l68_c8_1cee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l68_c8_1cee_cond,
MUX_uxn_c_l68_c8_1cee_iftrue,
MUX_uxn_c_l68_c8_1cee_iffalse,
MUX_uxn_c_l68_c8_1cee_return_output);

-- MUX_uxn_c_l69_c15_abaf
MUX_uxn_c_l69_c15_abaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l69_c15_abaf_cond,
MUX_uxn_c_l69_c15_abaf_iftrue,
MUX_uxn_c_l69_c15_abaf_iffalse,
MUX_uxn_c_l69_c15_abaf_return_output);

-- BIN_OP_EQ_uxn_c_l75_c6_b0da
BIN_OP_EQ_uxn_c_l75_c6_b0da : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c6_b0da_left,
BIN_OP_EQ_uxn_c_l75_c6_b0da_right,
BIN_OP_EQ_uxn_c_l75_c6_b0da_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_return_output);

-- is_ins_done_MUX_uxn_c_l75_c2_c3f5
is_ins_done_MUX_uxn_c_l75_c2_c3f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l75_c2_c3f5_cond,
is_ins_done_MUX_uxn_c_l75_c2_c3f5_iftrue,
is_ins_done_MUX_uxn_c_l75_c2_c3f5_iffalse,
is_ins_done_MUX_uxn_c_l75_c2_c3f5_return_output);

-- eval_opcode_result_MUX_uxn_c_l75_c2_c3f5
eval_opcode_result_MUX_uxn_c_l75_c2_c3f5 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_cond,
eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_iftrue,
eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_iffalse,
eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_return_output);

-- is_waiting_MUX_uxn_c_l75_c2_c3f5
is_waiting_MUX_uxn_c_l75_c2_c3f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l75_c2_c3f5_cond,
is_waiting_MUX_uxn_c_l75_c2_c3f5_iftrue,
is_waiting_MUX_uxn_c_l75_c2_c3f5_iffalse,
is_waiting_MUX_uxn_c_l75_c2_c3f5_return_output);

-- pc_MUX_uxn_c_l75_c2_c3f5
pc_MUX_uxn_c_l75_c2_c3f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l75_c2_c3f5_cond,
pc_MUX_uxn_c_l75_c2_c3f5_iftrue,
pc_MUX_uxn_c_l75_c2_c3f5_iffalse,
pc_MUX_uxn_c_l75_c2_c3f5_return_output);

-- cpu_step_result_MUX_uxn_c_l75_c2_c3f5
cpu_step_result_MUX_uxn_c_l75_c2_c3f5 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l75_c2_c3f5_cond,
cpu_step_result_MUX_uxn_c_l75_c2_c3f5_iftrue,
cpu_step_result_MUX_uxn_c_l75_c2_c3f5_iffalse,
cpu_step_result_MUX_uxn_c_l75_c2_c3f5_return_output);

-- ins_MUX_uxn_c_l75_c2_c3f5
ins_MUX_uxn_c_l75_c2_c3f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l75_c2_c3f5_cond,
ins_MUX_uxn_c_l75_c2_c3f5_iftrue,
ins_MUX_uxn_c_l75_c2_c3f5_iffalse,
ins_MUX_uxn_c_l75_c2_c3f5_return_output);

-- BIN_OP_EQ_uxn_c_l82_c11_3471
BIN_OP_EQ_uxn_c_l82_c11_3471 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l82_c11_3471_left,
BIN_OP_EQ_uxn_c_l82_c11_3471_right,
BIN_OP_EQ_uxn_c_l82_c11_3471_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_return_output);

-- is_ins_done_MUX_uxn_c_l82_c7_2ddf
is_ins_done_MUX_uxn_c_l82_c7_2ddf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l82_c7_2ddf_cond,
is_ins_done_MUX_uxn_c_l82_c7_2ddf_iftrue,
is_ins_done_MUX_uxn_c_l82_c7_2ddf_iffalse,
is_ins_done_MUX_uxn_c_l82_c7_2ddf_return_output);

-- eval_opcode_result_MUX_uxn_c_l82_c7_2ddf
eval_opcode_result_MUX_uxn_c_l82_c7_2ddf : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_cond,
eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_iftrue,
eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_iffalse,
eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_return_output);

-- is_waiting_MUX_uxn_c_l82_c7_2ddf
is_waiting_MUX_uxn_c_l82_c7_2ddf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l82_c7_2ddf_cond,
is_waiting_MUX_uxn_c_l82_c7_2ddf_iftrue,
is_waiting_MUX_uxn_c_l82_c7_2ddf_iffalse,
is_waiting_MUX_uxn_c_l82_c7_2ddf_return_output);

-- pc_MUX_uxn_c_l82_c7_2ddf
pc_MUX_uxn_c_l82_c7_2ddf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l82_c7_2ddf_cond,
pc_MUX_uxn_c_l82_c7_2ddf_iftrue,
pc_MUX_uxn_c_l82_c7_2ddf_iffalse,
pc_MUX_uxn_c_l82_c7_2ddf_return_output);

-- cpu_step_result_MUX_uxn_c_l82_c7_2ddf
cpu_step_result_MUX_uxn_c_l82_c7_2ddf : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l82_c7_2ddf_cond,
cpu_step_result_MUX_uxn_c_l82_c7_2ddf_iftrue,
cpu_step_result_MUX_uxn_c_l82_c7_2ddf_iffalse,
cpu_step_result_MUX_uxn_c_l82_c7_2ddf_return_output);

-- ins_MUX_uxn_c_l82_c7_2ddf
ins_MUX_uxn_c_l82_c7_2ddf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l82_c7_2ddf_cond,
ins_MUX_uxn_c_l82_c7_2ddf_iftrue,
ins_MUX_uxn_c_l82_c7_2ddf_iffalse,
ins_MUX_uxn_c_l82_c7_2ddf_return_output);

-- BIN_OP_PLUS_uxn_c_l83_c3_af12
BIN_OP_PLUS_uxn_c_l83_c3_af12 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l83_c3_af12_left,
BIN_OP_PLUS_uxn_c_l83_c3_af12_right,
BIN_OP_PLUS_uxn_c_l83_c3_af12_return_output);

-- BIN_OP_EQ_uxn_c_l86_c9_01e8
BIN_OP_EQ_uxn_c_l86_c9_01e8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l86_c9_01e8_left,
BIN_OP_EQ_uxn_c_l86_c9_01e8_right,
BIN_OP_EQ_uxn_c_l86_c9_01e8_return_output);

-- MUX_uxn_c_l86_c9_7297
MUX_uxn_c_l86_c9_7297 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l86_c9_7297_cond,
MUX_uxn_c_l86_c9_7297_iftrue,
MUX_uxn_c_l86_c9_7297_iffalse,
MUX_uxn_c_l86_c9_7297_return_output);

-- BIN_OP_MINUS_uxn_c_l87_c43_6b21
BIN_OP_MINUS_uxn_c_l87_c43_6b21 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l87_c43_6b21_left,
BIN_OP_MINUS_uxn_c_l87_c43_6b21_right,
BIN_OP_MINUS_uxn_c_l87_c43_6b21_return_output);

-- eval_opcode_phased_uxn_c_l87_c24_1525
eval_opcode_phased_uxn_c_l87_c24_1525 : entity work.eval_opcode_phased_0CLK_57fefb52 port map (
clk,
eval_opcode_phased_uxn_c_l87_c24_1525_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l87_c24_1525_phase,
eval_opcode_phased_uxn_c_l87_c24_1525_ins,
eval_opcode_phased_uxn_c_l87_c24_1525_pc,
eval_opcode_phased_uxn_c_l87_c24_1525_previous_ram_read,
eval_opcode_phased_uxn_c_l87_c24_1525_previous_device_ram_read,
eval_opcode_phased_uxn_c_l87_c24_1525_return_output);

-- MUX_uxn_c_l88_c8_2f08
MUX_uxn_c_l88_c8_2f08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l88_c8_2f08_cond,
MUX_uxn_c_l88_c8_2f08_iftrue,
MUX_uxn_c_l88_c8_2f08_iffalse,
MUX_uxn_c_l88_c8_2f08_return_output);

-- BIN_OP_OR_uxn_c_l100_c6_e1f9
BIN_OP_OR_uxn_c_l100_c6_e1f9 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l100_c6_e1f9_left,
BIN_OP_OR_uxn_c_l100_c6_e1f9_right,
BIN_OP_OR_uxn_c_l100_c6_e1f9_return_output);

-- step_cpu_phase_MUX_uxn_c_l100_c2_42f5
step_cpu_phase_MUX_uxn_c_l100_c2_42f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l100_c2_42f5_cond,
step_cpu_phase_MUX_uxn_c_l100_c2_42f5_iftrue,
step_cpu_phase_MUX_uxn_c_l100_c2_42f5_iffalse,
step_cpu_phase_MUX_uxn_c_l100_c2_42f5_return_output);

-- BIN_OP_EQ_uxn_c_l103_c21_be02
BIN_OP_EQ_uxn_c_l103_c21_be02 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l103_c21_be02_left,
BIN_OP_EQ_uxn_c_l103_c21_be02_right,
BIN_OP_EQ_uxn_c_l103_c21_be02_return_output);

-- BIN_OP_PLUS_uxn_c_l103_c37_2740
BIN_OP_PLUS_uxn_c_l103_c37_2740 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l103_c37_2740_left,
BIN_OP_PLUS_uxn_c_l103_c37_2740_right,
BIN_OP_PLUS_uxn_c_l103_c37_2740_return_output);

-- MUX_uxn_c_l103_c21_5bc7
MUX_uxn_c_l103_c21_5bc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l103_c21_5bc7_cond,
MUX_uxn_c_l103_c21_5bc7_iftrue,
MUX_uxn_c_l103_c21_5bc7_iffalse,
MUX_uxn_c_l103_c21_5bc7_return_output);



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
 BIN_OP_AND_uxn_c_l68_c8_f909_return_output,
 MUX_uxn_c_l68_c8_1cee_return_output,
 MUX_uxn_c_l69_c15_abaf_return_output,
 BIN_OP_EQ_uxn_c_l75_c6_b0da_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_return_output,
 is_ins_done_MUX_uxn_c_l75_c2_c3f5_return_output,
 eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_return_output,
 is_waiting_MUX_uxn_c_l75_c2_c3f5_return_output,
 pc_MUX_uxn_c_l75_c2_c3f5_return_output,
 cpu_step_result_MUX_uxn_c_l75_c2_c3f5_return_output,
 ins_MUX_uxn_c_l75_c2_c3f5_return_output,
 BIN_OP_EQ_uxn_c_l82_c11_3471_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_return_output,
 is_ins_done_MUX_uxn_c_l82_c7_2ddf_return_output,
 eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_return_output,
 is_waiting_MUX_uxn_c_l82_c7_2ddf_return_output,
 pc_MUX_uxn_c_l82_c7_2ddf_return_output,
 cpu_step_result_MUX_uxn_c_l82_c7_2ddf_return_output,
 ins_MUX_uxn_c_l82_c7_2ddf_return_output,
 BIN_OP_PLUS_uxn_c_l83_c3_af12_return_output,
 BIN_OP_EQ_uxn_c_l86_c9_01e8_return_output,
 MUX_uxn_c_l86_c9_7297_return_output,
 BIN_OP_MINUS_uxn_c_l87_c43_6b21_return_output,
 eval_opcode_phased_uxn_c_l87_c24_1525_return_output,
 MUX_uxn_c_l88_c8_2f08_return_output,
 BIN_OP_OR_uxn_c_l100_c6_e1f9_return_output,
 step_cpu_phase_MUX_uxn_c_l100_c2_42f5_return_output,
 BIN_OP_EQ_uxn_c_l103_c21_be02_return_output,
 BIN_OP_PLUS_uxn_c_l103_c37_2740_return_output,
 MUX_uxn_c_l103_c21_5bc7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_1cee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_f909_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_f909_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_f909_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_1cee_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_1cee_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_1cee_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_abaf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_abaf_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_abaf_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_abaf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_b0da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_b0da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_b0da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_c3f5_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_c3f5_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_2ddf_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_c3f5_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_c3f5_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_c3f5_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_c3f5_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_2ddf_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_c3f5_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_c3f5_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_c3f5_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_c3f5_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_2ddf_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_c3f5_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_c3f5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_c3f5_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l75_c2_c3f5_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_c3f5_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_2ddf_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_c3f5_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_c3f5_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_c3f5_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_c3f5_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_2ddf_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_c3f5_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_c3f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_3471_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_3471_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_3471_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_2ddf_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_2ddf_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_2ddf_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_2ddf_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_2ddf_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_2ddf_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_2ddf_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l83_c3_bb0c : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_2ddf_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_2ddf_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_2ddf_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_2ddf_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l82_c7_2ddf_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_2ddf_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_2ddf_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_2ddf_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_2ddf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_af12_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_af12_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_af12_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_7297_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_01e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_01e8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_01e8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_7297_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_7297_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_7297_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_1525_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_1525_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_1525_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_1525_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_1525_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c43_6b21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c43_6b21_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c43_6b21_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_1525_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_1525_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l88_c8_2f08_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_d1fd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_2f08_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_2f08_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_2f08_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_b313_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_9703_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_b511_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l93_c40_aaa1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l94_c41_01da_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l95_c30_16b1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l96_c16_c35e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l97_c17_7bc3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l100_c6_e1f9_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l100_c6_e1f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l100_c6_e1f9_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_42f5_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l101_c3_ebe3 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_42f5_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_42f5_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_42f5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_5bc7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l103_c21_be02_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l103_c21_be02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l103_c21_be02_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_5bc7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_5bc7_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l103_c37_2740_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l103_c37_2740_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l103_c37_2740_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_5bc7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_5012_return_output : unsigned(15 downto 0);
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
     VAR_MUX_uxn_c_l69_c15_abaf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l86_c9_01e8_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_iftrue := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l75_c2_c3f5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l103_c21_be02_right := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l101_c3_ebe3 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_42f5_iftrue := VAR_step_cpu_phase_uxn_c_l101_c3_ebe3;
     VAR_MUX_uxn_c_l103_c21_5bc7_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_MINUS_uxn_c_l87_c43_6b21_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l75_c6_b0da_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l103_c37_2740_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_af12_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l82_c11_3471_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_iffalse := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_2ddf_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_iftrue := eval_opcode_result;
     VAR_MUX_uxn_c_l86_c9_7297_iffalse := ins;
     VAR_ins_MUX_uxn_c_l75_c2_c3f5_iftrue := ins;
     VAR_ins_MUX_uxn_c_l82_c7_2ddf_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_2ddf_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l68_c8_f909_right := is_waiting;
     VAR_MUX_uxn_c_l69_c15_abaf_iffalse := is_waiting;
     VAR_MUX_uxn_c_l68_c8_1cee_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l87_c24_1525_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l86_c9_7297_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l87_c24_1525_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l75_c6_b0da_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l82_c11_3471_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l86_c9_01e8_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l87_c43_6b21_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l103_c37_2740_left := step_cpu_phase;
     VAR_BIN_OP_AND_uxn_c_l68_c8_f909_left := VAR_use_vector;
     VAR_MUX_uxn_c_l69_c15_abaf_cond := VAR_use_vector;
     VAR_MUX_uxn_c_l68_c8_1cee_iftrue := VAR_vector;
     -- BIN_OP_EQ[uxn_c_l86_c9_01e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l86_c9_01e8_left <= VAR_BIN_OP_EQ_uxn_c_l86_c9_01e8_left;
     BIN_OP_EQ_uxn_c_l86_c9_01e8_right <= VAR_BIN_OP_EQ_uxn_c_l86_c9_01e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l86_c9_01e8_return_output := BIN_OP_EQ_uxn_c_l86_c9_01e8_return_output;

     -- BIN_OP_EQ[uxn_c_l82_c11_3471] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l82_c11_3471_left <= VAR_BIN_OP_EQ_uxn_c_l82_c11_3471_left;
     BIN_OP_EQ_uxn_c_l82_c11_3471_right <= VAR_BIN_OP_EQ_uxn_c_l82_c11_3471_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l82_c11_3471_return_output := BIN_OP_EQ_uxn_c_l82_c11_3471_return_output;

     -- BIN_OP_PLUS[uxn_c_l103_c37_2740] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l103_c37_2740_left <= VAR_BIN_OP_PLUS_uxn_c_l103_c37_2740_left;
     BIN_OP_PLUS_uxn_c_l103_c37_2740_right <= VAR_BIN_OP_PLUS_uxn_c_l103_c37_2740_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l103_c37_2740_return_output := BIN_OP_PLUS_uxn_c_l103_c37_2740_return_output;

     -- MUX[uxn_c_l69_c15_abaf] LATENCY=0
     -- Inputs
     MUX_uxn_c_l69_c15_abaf_cond <= VAR_MUX_uxn_c_l69_c15_abaf_cond;
     MUX_uxn_c_l69_c15_abaf_iftrue <= VAR_MUX_uxn_c_l69_c15_abaf_iftrue;
     MUX_uxn_c_l69_c15_abaf_iffalse <= VAR_MUX_uxn_c_l69_c15_abaf_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l69_c15_abaf_return_output := MUX_uxn_c_l69_c15_abaf_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c6_b0da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c6_b0da_left <= VAR_BIN_OP_EQ_uxn_c_l75_c6_b0da_left;
     BIN_OP_EQ_uxn_c_l75_c6_b0da_right <= VAR_BIN_OP_EQ_uxn_c_l75_c6_b0da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c6_b0da_return_output := BIN_OP_EQ_uxn_c_l75_c6_b0da_return_output;

     -- BIN_OP_MINUS[uxn_c_l87_c43_6b21] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l87_c43_6b21_left <= VAR_BIN_OP_MINUS_uxn_c_l87_c43_6b21_left;
     BIN_OP_MINUS_uxn_c_l87_c43_6b21_right <= VAR_BIN_OP_MINUS_uxn_c_l87_c43_6b21_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l87_c43_6b21_return_output := BIN_OP_MINUS_uxn_c_l87_c43_6b21_return_output;

     -- BIN_OP_AND[uxn_c_l68_c8_f909] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l68_c8_f909_left <= VAR_BIN_OP_AND_uxn_c_l68_c8_f909_left;
     BIN_OP_AND_uxn_c_l68_c8_f909_right <= VAR_BIN_OP_AND_uxn_c_l68_c8_f909_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l68_c8_f909_return_output := BIN_OP_AND_uxn_c_l68_c8_f909_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l68_c8_1cee_cond := VAR_BIN_OP_AND_uxn_c_l68_c8_f909_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_b0da_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_c3f5_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_b0da_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_b0da_return_output;
     VAR_ins_MUX_uxn_c_l75_c2_c3f5_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_b0da_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c2_c3f5_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_b0da_return_output;
     VAR_is_waiting_MUX_uxn_c_l75_c2_c3f5_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_b0da_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_c3f5_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_b0da_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_3471_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_2ddf_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_3471_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_3471_return_output;
     VAR_ins_MUX_uxn_c_l82_c7_2ddf_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_3471_return_output;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_2ddf_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_3471_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_2ddf_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_3471_return_output;
     VAR_pc_MUX_uxn_c_l82_c7_2ddf_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_3471_return_output;
     VAR_MUX_uxn_c_l86_c9_7297_cond := VAR_BIN_OP_EQ_uxn_c_l86_c9_01e8_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c24_1525_phase := VAR_BIN_OP_MINUS_uxn_c_l87_c43_6b21_return_output;
     VAR_MUX_uxn_c_l103_c21_5bc7_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l103_c37_2740_return_output, 8);
     VAR_is_waiting_MUX_uxn_c_l75_c2_c3f5_iftrue := VAR_MUX_uxn_c_l69_c15_abaf_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_2ddf_iftrue := VAR_MUX_uxn_c_l69_c15_abaf_return_output;
     -- MUX[uxn_c_l68_c8_1cee] LATENCY=0
     -- Inputs
     MUX_uxn_c_l68_c8_1cee_cond <= VAR_MUX_uxn_c_l68_c8_1cee_cond;
     MUX_uxn_c_l68_c8_1cee_iftrue <= VAR_MUX_uxn_c_l68_c8_1cee_iftrue;
     MUX_uxn_c_l68_c8_1cee_iffalse <= VAR_MUX_uxn_c_l68_c8_1cee_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l68_c8_1cee_return_output := MUX_uxn_c_l68_c8_1cee_return_output;

     -- MUX[uxn_c_l86_c9_7297] LATENCY=0
     -- Inputs
     MUX_uxn_c_l86_c9_7297_cond <= VAR_MUX_uxn_c_l86_c9_7297_cond;
     MUX_uxn_c_l86_c9_7297_iftrue <= VAR_MUX_uxn_c_l86_c9_7297_iftrue;
     MUX_uxn_c_l86_c9_7297_iffalse <= VAR_MUX_uxn_c_l86_c9_7297_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l86_c9_7297_return_output := MUX_uxn_c_l86_c9_7297_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c7_2ddf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2ddf_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_af12_left := VAR_MUX_uxn_c_l68_c8_1cee_return_output;
     VAR_MUX_uxn_c_l88_c8_2f08_iffalse := VAR_MUX_uxn_c_l68_c8_1cee_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c24_1525_pc := VAR_MUX_uxn_c_l68_c8_1cee_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_c3f5_iftrue := VAR_MUX_uxn_c_l68_c8_1cee_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c24_1525_ins := VAR_MUX_uxn_c_l86_c9_7297_return_output;
     VAR_ins_MUX_uxn_c_l82_c7_2ddf_iffalse := VAR_MUX_uxn_c_l86_c9_7297_return_output;
     -- ins_MUX[uxn_c_l82_c7_2ddf] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l82_c7_2ddf_cond <= VAR_ins_MUX_uxn_c_l82_c7_2ddf_cond;
     ins_MUX_uxn_c_l82_c7_2ddf_iftrue <= VAR_ins_MUX_uxn_c_l82_c7_2ddf_iftrue;
     ins_MUX_uxn_c_l82_c7_2ddf_iffalse <= VAR_ins_MUX_uxn_c_l82_c7_2ddf_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l82_c7_2ddf_return_output := ins_MUX_uxn_c_l82_c7_2ddf_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228[uxn_c_l75_c2_c3f5] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l75_c2_c3f5_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228(
     cpu_step_result,
     VAR_MUX_uxn_c_l68_c8_1cee_return_output,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_d8bb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_return_output;

     -- BIN_OP_PLUS[uxn_c_l83_c3_af12] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l83_c3_af12_left <= VAR_BIN_OP_PLUS_uxn_c_l83_c3_af12_left;
     BIN_OP_PLUS_uxn_c_l83_c3_af12_right <= VAR_BIN_OP_PLUS_uxn_c_l83_c3_af12_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_af12_return_output := BIN_OP_PLUS_uxn_c_l83_c3_af12_return_output;

     -- Submodule level 3
     VAR_pc_uxn_c_l83_c3_bb0c := resize(VAR_BIN_OP_PLUS_uxn_c_l83_c3_af12_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l87_c24_1525_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_d8bb_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_c3f5_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l75_c2_c3f5_return_output;
     VAR_ins_MUX_uxn_c_l75_c2_c3f5_iffalse := VAR_ins_MUX_uxn_c_l82_c7_2ddf_return_output;
     VAR_pc_MUX_uxn_c_l82_c7_2ddf_iftrue := VAR_pc_uxn_c_l83_c3_bb0c;
     -- ins_MUX[uxn_c_l75_c2_c3f5] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l75_c2_c3f5_cond <= VAR_ins_MUX_uxn_c_l75_c2_c3f5_cond;
     ins_MUX_uxn_c_l75_c2_c3f5_iftrue <= VAR_ins_MUX_uxn_c_l75_c2_c3f5_iftrue;
     ins_MUX_uxn_c_l75_c2_c3f5_iffalse <= VAR_ins_MUX_uxn_c_l75_c2_c3f5_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l75_c2_c3f5_return_output := ins_MUX_uxn_c_l75_c2_c3f5_return_output;

     -- eval_opcode_phased[uxn_c_l87_c24_1525] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l87_c24_1525_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l87_c24_1525_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l87_c24_1525_phase <= VAR_eval_opcode_phased_uxn_c_l87_c24_1525_phase;
     eval_opcode_phased_uxn_c_l87_c24_1525_ins <= VAR_eval_opcode_phased_uxn_c_l87_c24_1525_ins;
     eval_opcode_phased_uxn_c_l87_c24_1525_pc <= VAR_eval_opcode_phased_uxn_c_l87_c24_1525_pc;
     eval_opcode_phased_uxn_c_l87_c24_1525_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l87_c24_1525_previous_ram_read;
     eval_opcode_phased_uxn_c_l87_c24_1525_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l87_c24_1525_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l87_c24_1525_return_output := eval_opcode_phased_uxn_c_l87_c24_1525_return_output;

     -- Submodule level 4
     VAR_eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_iffalse := VAR_eval_opcode_phased_uxn_c_l87_c24_1525_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l75_c2_c3f5_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l97_c17_7bc3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l97_c17_7bc3_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_1525_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l91_c35_9703] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_9703_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_1525_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l88_c8_d1fd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_d1fd_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_1525_return_output.is_pc_updated;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_5012 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_5012_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_1525_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l89_c34_b313] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_b313_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_1525_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l95_c30_16b1] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l95_c30_16b1_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_1525_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l96_c16_c35e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l96_c16_c35e_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_1525_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l92_c38_b511] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_b511_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_1525_return_output.vram_write_layer;

     -- eval_opcode_result_MUX[uxn_c_l82_c7_2ddf] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_cond <= VAR_eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_cond;
     eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_iftrue;
     eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_return_output := eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l94_c41_01da] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l94_c41_01da_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_1525_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l93_c40_aaa1] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l93_c40_aaa1_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_1525_return_output.device_ram_address;

     -- Submodule level 5
     VAR_MUX_uxn_c_l88_c8_2f08_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_5012_return_output;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_2ddf_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l97_c17_7bc3_return_output;
     VAR_MUX_uxn_c_l88_c8_2f08_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_d1fd_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_2ddf_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l96_c16_c35e_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l82_c7_2ddf_return_output;
     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0[uxn_c_l82_c7_2ddf] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l82_c7_2ddf_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_b313_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_5012_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_9703_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_b511_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l93_c40_aaa1_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l94_c41_01da_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l95_c30_16b1_return_output);

     -- is_ins_done_MUX[uxn_c_l82_c7_2ddf] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l82_c7_2ddf_cond <= VAR_is_ins_done_MUX_uxn_c_l82_c7_2ddf_cond;
     is_ins_done_MUX_uxn_c_l82_c7_2ddf_iftrue <= VAR_is_ins_done_MUX_uxn_c_l82_c7_2ddf_iftrue;
     is_ins_done_MUX_uxn_c_l82_c7_2ddf_iffalse <= VAR_is_ins_done_MUX_uxn_c_l82_c7_2ddf_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l82_c7_2ddf_return_output := is_ins_done_MUX_uxn_c_l82_c7_2ddf_return_output;

     -- MUX[uxn_c_l88_c8_2f08] LATENCY=0
     -- Inputs
     MUX_uxn_c_l88_c8_2f08_cond <= VAR_MUX_uxn_c_l88_c8_2f08_cond;
     MUX_uxn_c_l88_c8_2f08_iftrue <= VAR_MUX_uxn_c_l88_c8_2f08_iftrue;
     MUX_uxn_c_l88_c8_2f08_iffalse <= VAR_MUX_uxn_c_l88_c8_2f08_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l88_c8_2f08_return_output := MUX_uxn_c_l88_c8_2f08_return_output;

     -- eval_opcode_result_MUX[uxn_c_l75_c2_c3f5] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_cond <= VAR_eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_cond;
     eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_iftrue;
     eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_return_output := eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_return_output;

     -- is_waiting_MUX[uxn_c_l82_c7_2ddf] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l82_c7_2ddf_cond <= VAR_is_waiting_MUX_uxn_c_l82_c7_2ddf_cond;
     is_waiting_MUX_uxn_c_l82_c7_2ddf_iftrue <= VAR_is_waiting_MUX_uxn_c_l82_c7_2ddf_iftrue;
     is_waiting_MUX_uxn_c_l82_c7_2ddf_iffalse <= VAR_is_waiting_MUX_uxn_c_l82_c7_2ddf_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l82_c7_2ddf_return_output := is_waiting_MUX_uxn_c_l82_c7_2ddf_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l82_c7_2ddf_iffalse := VAR_MUX_uxn_c_l88_c8_2f08_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_2ddf_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l82_c7_2ddf_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l75_c2_c3f5_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c2_c3f5_iffalse := VAR_is_ins_done_MUX_uxn_c_l82_c7_2ddf_return_output;
     VAR_is_waiting_MUX_uxn_c_l75_c2_c3f5_iffalse := VAR_is_waiting_MUX_uxn_c_l82_c7_2ddf_return_output;
     -- cpu_step_result_MUX[uxn_c_l82_c7_2ddf] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l82_c7_2ddf_cond <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_2ddf_cond;
     cpu_step_result_MUX_uxn_c_l82_c7_2ddf_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_2ddf_iftrue;
     cpu_step_result_MUX_uxn_c_l82_c7_2ddf_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_2ddf_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_2ddf_return_output := cpu_step_result_MUX_uxn_c_l82_c7_2ddf_return_output;

     -- is_ins_done_MUX[uxn_c_l75_c2_c3f5] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l75_c2_c3f5_cond <= VAR_is_ins_done_MUX_uxn_c_l75_c2_c3f5_cond;
     is_ins_done_MUX_uxn_c_l75_c2_c3f5_iftrue <= VAR_is_ins_done_MUX_uxn_c_l75_c2_c3f5_iftrue;
     is_ins_done_MUX_uxn_c_l75_c2_c3f5_iffalse <= VAR_is_ins_done_MUX_uxn_c_l75_c2_c3f5_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l75_c2_c3f5_return_output := is_ins_done_MUX_uxn_c_l75_c2_c3f5_return_output;

     -- is_waiting_MUX[uxn_c_l75_c2_c3f5] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l75_c2_c3f5_cond <= VAR_is_waiting_MUX_uxn_c_l75_c2_c3f5_cond;
     is_waiting_MUX_uxn_c_l75_c2_c3f5_iftrue <= VAR_is_waiting_MUX_uxn_c_l75_c2_c3f5_iftrue;
     is_waiting_MUX_uxn_c_l75_c2_c3f5_iffalse <= VAR_is_waiting_MUX_uxn_c_l75_c2_c3f5_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l75_c2_c3f5_return_output := is_waiting_MUX_uxn_c_l75_c2_c3f5_return_output;

     -- pc_MUX[uxn_c_l82_c7_2ddf] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l82_c7_2ddf_cond <= VAR_pc_MUX_uxn_c_l82_c7_2ddf_cond;
     pc_MUX_uxn_c_l82_c7_2ddf_iftrue <= VAR_pc_MUX_uxn_c_l82_c7_2ddf_iftrue;
     pc_MUX_uxn_c_l82_c7_2ddf_iffalse <= VAR_pc_MUX_uxn_c_l82_c7_2ddf_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l82_c7_2ddf_return_output := pc_MUX_uxn_c_l82_c7_2ddf_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_c3f5_iffalse := VAR_cpu_step_result_MUX_uxn_c_l82_c7_2ddf_return_output;
     VAR_BIN_OP_OR_uxn_c_l100_c6_e1f9_left := VAR_is_ins_done_MUX_uxn_c_l75_c2_c3f5_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l75_c2_c3f5_return_output;
     VAR_BIN_OP_OR_uxn_c_l100_c6_e1f9_right := VAR_is_waiting_MUX_uxn_c_l75_c2_c3f5_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l75_c2_c3f5_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_c3f5_iffalse := VAR_pc_MUX_uxn_c_l82_c7_2ddf_return_output;
     -- cpu_step_result_MUX[uxn_c_l75_c2_c3f5] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l75_c2_c3f5_cond <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_c3f5_cond;
     cpu_step_result_MUX_uxn_c_l75_c2_c3f5_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_c3f5_iftrue;
     cpu_step_result_MUX_uxn_c_l75_c2_c3f5_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_c3f5_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_c3f5_return_output := cpu_step_result_MUX_uxn_c_l75_c2_c3f5_return_output;

     -- pc_MUX[uxn_c_l75_c2_c3f5] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l75_c2_c3f5_cond <= VAR_pc_MUX_uxn_c_l75_c2_c3f5_cond;
     pc_MUX_uxn_c_l75_c2_c3f5_iftrue <= VAR_pc_MUX_uxn_c_l75_c2_c3f5_iftrue;
     pc_MUX_uxn_c_l75_c2_c3f5_iffalse <= VAR_pc_MUX_uxn_c_l75_c2_c3f5_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l75_c2_c3f5_return_output := pc_MUX_uxn_c_l75_c2_c3f5_return_output;

     -- BIN_OP_OR[uxn_c_l100_c6_e1f9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l100_c6_e1f9_left <= VAR_BIN_OP_OR_uxn_c_l100_c6_e1f9_left;
     BIN_OP_OR_uxn_c_l100_c6_e1f9_right <= VAR_BIN_OP_OR_uxn_c_l100_c6_e1f9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l100_c6_e1f9_return_output := BIN_OP_OR_uxn_c_l100_c6_e1f9_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_42f5_cond := VAR_BIN_OP_OR_uxn_c_l100_c6_e1f9_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l75_c2_c3f5_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l75_c2_c3f5_return_output;
     VAR_BIN_OP_EQ_uxn_c_l103_c21_be02_left := VAR_pc_MUX_uxn_c_l75_c2_c3f5_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l75_c2_c3f5_return_output;
     -- BIN_OP_EQ[uxn_c_l103_c21_be02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l103_c21_be02_left <= VAR_BIN_OP_EQ_uxn_c_l103_c21_be02_left;
     BIN_OP_EQ_uxn_c_l103_c21_be02_right <= VAR_BIN_OP_EQ_uxn_c_l103_c21_be02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l103_c21_be02_return_output := BIN_OP_EQ_uxn_c_l103_c21_be02_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l103_c21_5bc7_cond := VAR_BIN_OP_EQ_uxn_c_l103_c21_be02_return_output;
     -- MUX[uxn_c_l103_c21_5bc7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l103_c21_5bc7_cond <= VAR_MUX_uxn_c_l103_c21_5bc7_cond;
     MUX_uxn_c_l103_c21_5bc7_iftrue <= VAR_MUX_uxn_c_l103_c21_5bc7_iftrue;
     MUX_uxn_c_l103_c21_5bc7_iffalse <= VAR_MUX_uxn_c_l103_c21_5bc7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l103_c21_5bc7_return_output := MUX_uxn_c_l103_c21_5bc7_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_42f5_iffalse := VAR_MUX_uxn_c_l103_c21_5bc7_return_output;
     -- step_cpu_phase_MUX[uxn_c_l100_c2_42f5] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l100_c2_42f5_cond <= VAR_step_cpu_phase_MUX_uxn_c_l100_c2_42f5_cond;
     step_cpu_phase_MUX_uxn_c_l100_c2_42f5_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l100_c2_42f5_iftrue;
     step_cpu_phase_MUX_uxn_c_l100_c2_42f5_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l100_c2_42f5_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_42f5_return_output := step_cpu_phase_MUX_uxn_c_l100_c2_42f5_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l100_c2_42f5_return_output;
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
