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
entity step_cpu_0CLK_d875878c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 use_vector : in unsigned(0 downto 0);
 vector : in unsigned(15 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_d875878c;
architecture arch of step_cpu_0CLK_d875878c is
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
-- BIN_OP_AND[uxn_c_l68_c8_6690]
signal BIN_OP_AND_uxn_c_l68_c8_6690_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l68_c8_6690_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l68_c8_6690_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l68_c8_6fb1]
signal MUX_uxn_c_l68_c8_6fb1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l68_c8_6fb1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l68_c8_6fb1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l68_c8_6fb1_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l69_c15_1d78]
signal MUX_uxn_c_l69_c15_1d78_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_1d78_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_1d78_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_1d78_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c6_3b46]
signal BIN_OP_EQ_uxn_c_l75_c6_3b46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c6_3b46_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c6_3b46_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c7_ed23]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l75_c2_cb37]
signal is_ins_done_MUX_uxn_c_l75_c2_cb37_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_cb37_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_cb37_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_cb37_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l75_c2_cb37]
signal ins_MUX_uxn_c_l75_c2_cb37_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l75_c2_cb37_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c2_cb37_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c2_cb37_return_output : unsigned(7 downto 0);

-- cpu_step_result_MUX[uxn_c_l75_c2_cb37]
signal cpu_step_result_MUX_uxn_c_l75_c2_cb37_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l75_c2_cb37_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c2_cb37_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c2_cb37_return_output : cpu_step_result_t;

-- is_waiting_MUX[uxn_c_l75_c2_cb37]
signal is_waiting_MUX_uxn_c_l75_c2_cb37_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_cb37_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_cb37_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_cb37_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l75_c2_cb37]
signal pc_MUX_uxn_c_l75_c2_cb37_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l75_c2_cb37_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c2_cb37_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c2_cb37_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l82_c11_e54c]
signal BIN_OP_EQ_uxn_c_l82_c11_e54c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c11_e54c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c11_e54c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_75f7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l82_c7_ed23]
signal is_ins_done_MUX_uxn_c_l82_c7_ed23_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_ed23_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_ed23_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_ed23_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l82_c7_ed23]
signal ins_MUX_uxn_c_l82_c7_ed23_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l82_c7_ed23_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l82_c7_ed23_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l82_c7_ed23_return_output : unsigned(7 downto 0);

-- cpu_step_result_MUX[uxn_c_l82_c7_ed23]
signal cpu_step_result_MUX_uxn_c_l82_c7_ed23_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l82_c7_ed23_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l82_c7_ed23_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l82_c7_ed23_return_output : cpu_step_result_t;

-- is_waiting_MUX[uxn_c_l82_c7_ed23]
signal is_waiting_MUX_uxn_c_l82_c7_ed23_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_ed23_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_ed23_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_ed23_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l82_c7_ed23]
signal pc_MUX_uxn_c_l82_c7_ed23_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l82_c7_ed23_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l82_c7_ed23_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l82_c7_ed23_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l83_c3_243d]
signal BIN_OP_PLUS_uxn_c_l83_c3_243d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l83_c3_243d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l83_c3_243d_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l86_c9_c5aa]
signal BIN_OP_EQ_uxn_c_l86_c9_c5aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l86_c9_c5aa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l86_c9_c5aa_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l86_c9_38e0]
signal MUX_uxn_c_l86_c9_38e0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l86_c9_38e0_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l86_c9_38e0_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l86_c9_38e0_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l87_c64_e034]
signal BIN_OP_MINUS_uxn_c_l87_c64_e034_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l87_c64_e034_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l87_c64_e034_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l87_c45_0d5a]
signal eval_opcode_phased_uxn_c_l87_c45_0d5a_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_0d5a_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_0d5a_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_0d5a_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_0d5a_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_0d5a_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l88_c8_5a24]
signal MUX_uxn_c_l88_c8_5a24_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l88_c8_5a24_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l88_c8_5a24_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l88_c8_5a24_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l100_c6_c27e]
signal BIN_OP_OR_uxn_c_l100_c6_c27e_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l100_c6_c27e_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l100_c6_c27e_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l100_c2_d521]
signal step_cpu_phase_MUX_uxn_c_l100_c2_d521_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l100_c2_d521_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l100_c2_d521_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l100_c2_d521_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l103_c21_40ce]
signal BIN_OP_EQ_uxn_c_l103_c21_40ce_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l103_c21_40ce_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l103_c21_40ce_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l103_c37_4467]
signal BIN_OP_PLUS_uxn_c_l103_c37_4467_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l103_c37_4467_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l103_c37_4467_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l103_c21_e375]
signal MUX_uxn_c_l103_c21_e375_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l103_c21_e375_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l103_c21_e375_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l103_c21_e375_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_c_l68_c8_6690
BIN_OP_AND_uxn_c_l68_c8_6690 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l68_c8_6690_left,
BIN_OP_AND_uxn_c_l68_c8_6690_right,
BIN_OP_AND_uxn_c_l68_c8_6690_return_output);

-- MUX_uxn_c_l68_c8_6fb1
MUX_uxn_c_l68_c8_6fb1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l68_c8_6fb1_cond,
MUX_uxn_c_l68_c8_6fb1_iftrue,
MUX_uxn_c_l68_c8_6fb1_iffalse,
MUX_uxn_c_l68_c8_6fb1_return_output);

-- MUX_uxn_c_l69_c15_1d78
MUX_uxn_c_l69_c15_1d78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l69_c15_1d78_cond,
MUX_uxn_c_l69_c15_1d78_iftrue,
MUX_uxn_c_l69_c15_1d78_iffalse,
MUX_uxn_c_l69_c15_1d78_return_output);

-- BIN_OP_EQ_uxn_c_l75_c6_3b46
BIN_OP_EQ_uxn_c_l75_c6_3b46 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c6_3b46_left,
BIN_OP_EQ_uxn_c_l75_c6_3b46_right,
BIN_OP_EQ_uxn_c_l75_c6_3b46_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_return_output);

-- is_ins_done_MUX_uxn_c_l75_c2_cb37
is_ins_done_MUX_uxn_c_l75_c2_cb37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l75_c2_cb37_cond,
is_ins_done_MUX_uxn_c_l75_c2_cb37_iftrue,
is_ins_done_MUX_uxn_c_l75_c2_cb37_iffalse,
is_ins_done_MUX_uxn_c_l75_c2_cb37_return_output);

-- ins_MUX_uxn_c_l75_c2_cb37
ins_MUX_uxn_c_l75_c2_cb37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l75_c2_cb37_cond,
ins_MUX_uxn_c_l75_c2_cb37_iftrue,
ins_MUX_uxn_c_l75_c2_cb37_iffalse,
ins_MUX_uxn_c_l75_c2_cb37_return_output);

-- cpu_step_result_MUX_uxn_c_l75_c2_cb37
cpu_step_result_MUX_uxn_c_l75_c2_cb37 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l75_c2_cb37_cond,
cpu_step_result_MUX_uxn_c_l75_c2_cb37_iftrue,
cpu_step_result_MUX_uxn_c_l75_c2_cb37_iffalse,
cpu_step_result_MUX_uxn_c_l75_c2_cb37_return_output);

-- is_waiting_MUX_uxn_c_l75_c2_cb37
is_waiting_MUX_uxn_c_l75_c2_cb37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l75_c2_cb37_cond,
is_waiting_MUX_uxn_c_l75_c2_cb37_iftrue,
is_waiting_MUX_uxn_c_l75_c2_cb37_iffalse,
is_waiting_MUX_uxn_c_l75_c2_cb37_return_output);

-- pc_MUX_uxn_c_l75_c2_cb37
pc_MUX_uxn_c_l75_c2_cb37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l75_c2_cb37_cond,
pc_MUX_uxn_c_l75_c2_cb37_iftrue,
pc_MUX_uxn_c_l75_c2_cb37_iffalse,
pc_MUX_uxn_c_l75_c2_cb37_return_output);

-- BIN_OP_EQ_uxn_c_l82_c11_e54c
BIN_OP_EQ_uxn_c_l82_c11_e54c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l82_c11_e54c_left,
BIN_OP_EQ_uxn_c_l82_c11_e54c_right,
BIN_OP_EQ_uxn_c_l82_c11_e54c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_return_output);

-- is_ins_done_MUX_uxn_c_l82_c7_ed23
is_ins_done_MUX_uxn_c_l82_c7_ed23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l82_c7_ed23_cond,
is_ins_done_MUX_uxn_c_l82_c7_ed23_iftrue,
is_ins_done_MUX_uxn_c_l82_c7_ed23_iffalse,
is_ins_done_MUX_uxn_c_l82_c7_ed23_return_output);

-- ins_MUX_uxn_c_l82_c7_ed23
ins_MUX_uxn_c_l82_c7_ed23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l82_c7_ed23_cond,
ins_MUX_uxn_c_l82_c7_ed23_iftrue,
ins_MUX_uxn_c_l82_c7_ed23_iffalse,
ins_MUX_uxn_c_l82_c7_ed23_return_output);

-- cpu_step_result_MUX_uxn_c_l82_c7_ed23
cpu_step_result_MUX_uxn_c_l82_c7_ed23 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l82_c7_ed23_cond,
cpu_step_result_MUX_uxn_c_l82_c7_ed23_iftrue,
cpu_step_result_MUX_uxn_c_l82_c7_ed23_iffalse,
cpu_step_result_MUX_uxn_c_l82_c7_ed23_return_output);

-- is_waiting_MUX_uxn_c_l82_c7_ed23
is_waiting_MUX_uxn_c_l82_c7_ed23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l82_c7_ed23_cond,
is_waiting_MUX_uxn_c_l82_c7_ed23_iftrue,
is_waiting_MUX_uxn_c_l82_c7_ed23_iffalse,
is_waiting_MUX_uxn_c_l82_c7_ed23_return_output);

-- pc_MUX_uxn_c_l82_c7_ed23
pc_MUX_uxn_c_l82_c7_ed23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l82_c7_ed23_cond,
pc_MUX_uxn_c_l82_c7_ed23_iftrue,
pc_MUX_uxn_c_l82_c7_ed23_iffalse,
pc_MUX_uxn_c_l82_c7_ed23_return_output);

-- BIN_OP_PLUS_uxn_c_l83_c3_243d
BIN_OP_PLUS_uxn_c_l83_c3_243d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l83_c3_243d_left,
BIN_OP_PLUS_uxn_c_l83_c3_243d_right,
BIN_OP_PLUS_uxn_c_l83_c3_243d_return_output);

-- BIN_OP_EQ_uxn_c_l86_c9_c5aa
BIN_OP_EQ_uxn_c_l86_c9_c5aa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l86_c9_c5aa_left,
BIN_OP_EQ_uxn_c_l86_c9_c5aa_right,
BIN_OP_EQ_uxn_c_l86_c9_c5aa_return_output);

-- MUX_uxn_c_l86_c9_38e0
MUX_uxn_c_l86_c9_38e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l86_c9_38e0_cond,
MUX_uxn_c_l86_c9_38e0_iftrue,
MUX_uxn_c_l86_c9_38e0_iffalse,
MUX_uxn_c_l86_c9_38e0_return_output);

-- BIN_OP_MINUS_uxn_c_l87_c64_e034
BIN_OP_MINUS_uxn_c_l87_c64_e034 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l87_c64_e034_left,
BIN_OP_MINUS_uxn_c_l87_c64_e034_right,
BIN_OP_MINUS_uxn_c_l87_c64_e034_return_output);

-- eval_opcode_phased_uxn_c_l87_c45_0d5a
eval_opcode_phased_uxn_c_l87_c45_0d5a : entity work.eval_opcode_phased_0CLK_f065ddc4 port map (
clk,
eval_opcode_phased_uxn_c_l87_c45_0d5a_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l87_c45_0d5a_phase,
eval_opcode_phased_uxn_c_l87_c45_0d5a_ins,
eval_opcode_phased_uxn_c_l87_c45_0d5a_pc,
eval_opcode_phased_uxn_c_l87_c45_0d5a_previous_ram_read,
eval_opcode_phased_uxn_c_l87_c45_0d5a_previous_device_ram_read,
eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output);

-- MUX_uxn_c_l88_c8_5a24
MUX_uxn_c_l88_c8_5a24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l88_c8_5a24_cond,
MUX_uxn_c_l88_c8_5a24_iftrue,
MUX_uxn_c_l88_c8_5a24_iffalse,
MUX_uxn_c_l88_c8_5a24_return_output);

-- BIN_OP_OR_uxn_c_l100_c6_c27e
BIN_OP_OR_uxn_c_l100_c6_c27e : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l100_c6_c27e_left,
BIN_OP_OR_uxn_c_l100_c6_c27e_right,
BIN_OP_OR_uxn_c_l100_c6_c27e_return_output);

-- step_cpu_phase_MUX_uxn_c_l100_c2_d521
step_cpu_phase_MUX_uxn_c_l100_c2_d521 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l100_c2_d521_cond,
step_cpu_phase_MUX_uxn_c_l100_c2_d521_iftrue,
step_cpu_phase_MUX_uxn_c_l100_c2_d521_iffalse,
step_cpu_phase_MUX_uxn_c_l100_c2_d521_return_output);

-- BIN_OP_EQ_uxn_c_l103_c21_40ce
BIN_OP_EQ_uxn_c_l103_c21_40ce : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l103_c21_40ce_left,
BIN_OP_EQ_uxn_c_l103_c21_40ce_right,
BIN_OP_EQ_uxn_c_l103_c21_40ce_return_output);

-- BIN_OP_PLUS_uxn_c_l103_c37_4467
BIN_OP_PLUS_uxn_c_l103_c37_4467 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l103_c37_4467_left,
BIN_OP_PLUS_uxn_c_l103_c37_4467_right,
BIN_OP_PLUS_uxn_c_l103_c37_4467_return_output);

-- MUX_uxn_c_l103_c21_e375
MUX_uxn_c_l103_c21_e375 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l103_c21_e375_cond,
MUX_uxn_c_l103_c21_e375_iftrue,
MUX_uxn_c_l103_c21_e375_iffalse,
MUX_uxn_c_l103_c21_e375_return_output);



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
 BIN_OP_AND_uxn_c_l68_c8_6690_return_output,
 MUX_uxn_c_l68_c8_6fb1_return_output,
 MUX_uxn_c_l69_c15_1d78_return_output,
 BIN_OP_EQ_uxn_c_l75_c6_3b46_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_return_output,
 is_ins_done_MUX_uxn_c_l75_c2_cb37_return_output,
 ins_MUX_uxn_c_l75_c2_cb37_return_output,
 cpu_step_result_MUX_uxn_c_l75_c2_cb37_return_output,
 is_waiting_MUX_uxn_c_l75_c2_cb37_return_output,
 pc_MUX_uxn_c_l75_c2_cb37_return_output,
 BIN_OP_EQ_uxn_c_l82_c11_e54c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_return_output,
 is_ins_done_MUX_uxn_c_l82_c7_ed23_return_output,
 ins_MUX_uxn_c_l82_c7_ed23_return_output,
 cpu_step_result_MUX_uxn_c_l82_c7_ed23_return_output,
 is_waiting_MUX_uxn_c_l82_c7_ed23_return_output,
 pc_MUX_uxn_c_l82_c7_ed23_return_output,
 BIN_OP_PLUS_uxn_c_l83_c3_243d_return_output,
 BIN_OP_EQ_uxn_c_l86_c9_c5aa_return_output,
 MUX_uxn_c_l86_c9_38e0_return_output,
 BIN_OP_MINUS_uxn_c_l87_c64_e034_return_output,
 eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output,
 MUX_uxn_c_l88_c8_5a24_return_output,
 BIN_OP_OR_uxn_c_l100_c6_c27e_return_output,
 step_cpu_phase_MUX_uxn_c_l100_c2_d521_return_output,
 BIN_OP_EQ_uxn_c_l103_c21_40ce_return_output,
 BIN_OP_PLUS_uxn_c_l103_c37_4467_return_output,
 MUX_uxn_c_l103_c21_e375_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_6fb1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_6690_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_6690_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_6690_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_6fb1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_6fb1_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_6fb1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_1d78_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_1d78_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_1d78_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_1d78_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_3b46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_3b46_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_3b46_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_cb37_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_cb37_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_ed23_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_cb37_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_cb37_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_cb37_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_cb37_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_ed23_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_cb37_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_cb37_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_cb37_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l75_c2_cb37_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_cb37_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_ed23_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_cb37_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_cb37_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_cb37_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_cb37_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_ed23_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_cb37_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_cb37_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_cb37_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_cb37_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_ed23_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_cb37_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_cb37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_e54c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_e54c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_e54c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_ed23_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_ed23_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_ed23_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_ed23_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_ed23_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_ed23_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_ed23_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_ed23_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l82_c7_ed23_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_ed23_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_ed23_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_ed23_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_ed23_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_ed23_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l83_c3_54e3 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_ed23_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_ed23_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_243d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_243d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_243d_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_38e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_c5aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_c5aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_c5aa_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_38e0_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_38e0_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_38e0_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_result : eval_opcode_result_t;
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c64_e034_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c64_e034_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c64_e034_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l88_c8_5a24_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_9a18_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_5a24_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_5a24_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_5a24_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_2fe7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_7900_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_d222_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l93_c40_4b73_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l94_c41_a97d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l95_c30_92e9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l96_c16_c870_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l97_c17_6eac_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l100_c6_c27e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l100_c6_c27e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l100_c6_c27e_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_d521_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l101_c3_6560 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_d521_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_d521_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_d521_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_e375_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l103_c21_40ce_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l103_c21_40ce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l103_c21_40ce_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_e375_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_e375_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l103_c37_4467_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l103_c37_4467_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l103_c37_4467_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_e375_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_69a6_return_output : unsigned(15 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_243d_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l69_c15_1d78_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l103_c21_40ce_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l86_c9_c5aa_right := to_unsigned(2, 2);
     VAR_MUX_uxn_c_l103_c21_e375_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_iftrue := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l101_c3_6560 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_d521_iftrue := VAR_step_cpu_phase_uxn_c_l101_c3_6560;
     VAR_BIN_OP_MINUS_uxn_c_l87_c64_e034_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_c_l103_c37_4467_right := to_unsigned(1, 1);
     VAR_is_ins_done_MUX_uxn_c_l75_c2_cb37_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l75_c6_3b46_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l82_c11_e54c_right := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_iffalse := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_ed23_iftrue := cpu_step_result;
     VAR_MUX_uxn_c_l86_c9_38e0_iffalse := ins;
     VAR_ins_MUX_uxn_c_l75_c2_cb37_iftrue := ins;
     VAR_ins_MUX_uxn_c_l82_c7_ed23_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_ed23_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l68_c8_6690_right := is_waiting;
     VAR_MUX_uxn_c_l69_c15_1d78_iffalse := is_waiting;
     VAR_MUX_uxn_c_l68_c8_6fb1_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l86_c9_38e0_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l75_c6_3b46_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l82_c11_e54c_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l86_c9_c5aa_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l87_c64_e034_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l103_c37_4467_left := step_cpu_phase;
     VAR_BIN_OP_AND_uxn_c_l68_c8_6690_left := VAR_use_vector;
     VAR_MUX_uxn_c_l69_c15_1d78_cond := VAR_use_vector;
     VAR_MUX_uxn_c_l68_c8_6fb1_iftrue := VAR_vector;
     -- BIN_OP_EQ[uxn_c_l82_c11_e54c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l82_c11_e54c_left <= VAR_BIN_OP_EQ_uxn_c_l82_c11_e54c_left;
     BIN_OP_EQ_uxn_c_l82_c11_e54c_right <= VAR_BIN_OP_EQ_uxn_c_l82_c11_e54c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l82_c11_e54c_return_output := BIN_OP_EQ_uxn_c_l82_c11_e54c_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c6_3b46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c6_3b46_left <= VAR_BIN_OP_EQ_uxn_c_l75_c6_3b46_left;
     BIN_OP_EQ_uxn_c_l75_c6_3b46_right <= VAR_BIN_OP_EQ_uxn_c_l75_c6_3b46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c6_3b46_return_output := BIN_OP_EQ_uxn_c_l75_c6_3b46_return_output;

     -- BIN_OP_PLUS[uxn_c_l103_c37_4467] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l103_c37_4467_left <= VAR_BIN_OP_PLUS_uxn_c_l103_c37_4467_left;
     BIN_OP_PLUS_uxn_c_l103_c37_4467_right <= VAR_BIN_OP_PLUS_uxn_c_l103_c37_4467_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l103_c37_4467_return_output := BIN_OP_PLUS_uxn_c_l103_c37_4467_return_output;

     -- BIN_OP_MINUS[uxn_c_l87_c64_e034] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l87_c64_e034_left <= VAR_BIN_OP_MINUS_uxn_c_l87_c64_e034_left;
     BIN_OP_MINUS_uxn_c_l87_c64_e034_right <= VAR_BIN_OP_MINUS_uxn_c_l87_c64_e034_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l87_c64_e034_return_output := BIN_OP_MINUS_uxn_c_l87_c64_e034_return_output;

     -- MUX[uxn_c_l69_c15_1d78] LATENCY=0
     -- Inputs
     MUX_uxn_c_l69_c15_1d78_cond <= VAR_MUX_uxn_c_l69_c15_1d78_cond;
     MUX_uxn_c_l69_c15_1d78_iftrue <= VAR_MUX_uxn_c_l69_c15_1d78_iftrue;
     MUX_uxn_c_l69_c15_1d78_iffalse <= VAR_MUX_uxn_c_l69_c15_1d78_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l69_c15_1d78_return_output := MUX_uxn_c_l69_c15_1d78_return_output;

     -- BIN_OP_EQ[uxn_c_l86_c9_c5aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l86_c9_c5aa_left <= VAR_BIN_OP_EQ_uxn_c_l86_c9_c5aa_left;
     BIN_OP_EQ_uxn_c_l86_c9_c5aa_right <= VAR_BIN_OP_EQ_uxn_c_l86_c9_c5aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l86_c9_c5aa_return_output := BIN_OP_EQ_uxn_c_l86_c9_c5aa_return_output;

     -- BIN_OP_AND[uxn_c_l68_c8_6690] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l68_c8_6690_left <= VAR_BIN_OP_AND_uxn_c_l68_c8_6690_left;
     BIN_OP_AND_uxn_c_l68_c8_6690_right <= VAR_BIN_OP_AND_uxn_c_l68_c8_6690_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l68_c8_6690_return_output := BIN_OP_AND_uxn_c_l68_c8_6690_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l68_c8_6fb1_cond := VAR_BIN_OP_AND_uxn_c_l68_c8_6690_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_3b46_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_cb37_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_3b46_return_output;
     VAR_ins_MUX_uxn_c_l75_c2_cb37_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_3b46_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c2_cb37_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_3b46_return_output;
     VAR_is_waiting_MUX_uxn_c_l75_c2_cb37_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_3b46_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_cb37_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_3b46_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_e54c_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_ed23_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_e54c_return_output;
     VAR_ins_MUX_uxn_c_l82_c7_ed23_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_e54c_return_output;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_ed23_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_e54c_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_ed23_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_e54c_return_output;
     VAR_pc_MUX_uxn_c_l82_c7_ed23_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_e54c_return_output;
     VAR_MUX_uxn_c_l86_c9_38e0_cond := VAR_BIN_OP_EQ_uxn_c_l86_c9_c5aa_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_phase := VAR_BIN_OP_MINUS_uxn_c_l87_c64_e034_return_output;
     VAR_MUX_uxn_c_l103_c21_e375_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l103_c37_4467_return_output, 8);
     VAR_is_waiting_MUX_uxn_c_l75_c2_cb37_iftrue := VAR_MUX_uxn_c_l69_c15_1d78_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_ed23_iftrue := VAR_MUX_uxn_c_l69_c15_1d78_return_output;
     -- MUX[uxn_c_l68_c8_6fb1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l68_c8_6fb1_cond <= VAR_MUX_uxn_c_l68_c8_6fb1_cond;
     MUX_uxn_c_l68_c8_6fb1_iftrue <= VAR_MUX_uxn_c_l68_c8_6fb1_iftrue;
     MUX_uxn_c_l68_c8_6fb1_iffalse <= VAR_MUX_uxn_c_l68_c8_6fb1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l68_c8_6fb1_return_output := MUX_uxn_c_l68_c8_6fb1_return_output;

     -- MUX[uxn_c_l86_c9_38e0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l86_c9_38e0_cond <= VAR_MUX_uxn_c_l86_c9_38e0_cond;
     MUX_uxn_c_l86_c9_38e0_iftrue <= VAR_MUX_uxn_c_l86_c9_38e0_iftrue;
     MUX_uxn_c_l86_c9_38e0_iffalse <= VAR_MUX_uxn_c_l86_c9_38e0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l86_c9_38e0_return_output := MUX_uxn_c_l86_c9_38e0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c7_ed23] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_ed23_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_243d_left := VAR_MUX_uxn_c_l68_c8_6fb1_return_output;
     VAR_MUX_uxn_c_l88_c8_5a24_iffalse := VAR_MUX_uxn_c_l68_c8_6fb1_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_pc := VAR_MUX_uxn_c_l68_c8_6fb1_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_cb37_iftrue := VAR_MUX_uxn_c_l68_c8_6fb1_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_ins := VAR_MUX_uxn_c_l86_c9_38e0_return_output;
     VAR_ins_MUX_uxn_c_l82_c7_ed23_iffalse := VAR_MUX_uxn_c_l86_c9_38e0_return_output;
     -- BIN_OP_PLUS[uxn_c_l83_c3_243d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l83_c3_243d_left <= VAR_BIN_OP_PLUS_uxn_c_l83_c3_243d_left;
     BIN_OP_PLUS_uxn_c_l83_c3_243d_right <= VAR_BIN_OP_PLUS_uxn_c_l83_c3_243d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_243d_return_output := BIN_OP_PLUS_uxn_c_l83_c3_243d_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228[uxn_c_l75_c2_cb37] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l75_c2_cb37_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228(
     cpu_step_result,
     VAR_MUX_uxn_c_l68_c8_6fb1_return_output,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- ins_MUX[uxn_c_l82_c7_ed23] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l82_c7_ed23_cond <= VAR_ins_MUX_uxn_c_l82_c7_ed23_cond;
     ins_MUX_uxn_c_l82_c7_ed23_iftrue <= VAR_ins_MUX_uxn_c_l82_c7_ed23_iftrue;
     ins_MUX_uxn_c_l82_c7_ed23_iffalse <= VAR_ins_MUX_uxn_c_l82_c7_ed23_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l82_c7_ed23_return_output := ins_MUX_uxn_c_l82_c7_ed23_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_75f7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_return_output;

     -- Submodule level 3
     VAR_pc_uxn_c_l83_c3_54e3 := resize(VAR_BIN_OP_PLUS_uxn_c_l83_c3_243d_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_75f7_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_cb37_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l75_c2_cb37_return_output;
     VAR_ins_MUX_uxn_c_l75_c2_cb37_iffalse := VAR_ins_MUX_uxn_c_l82_c7_ed23_return_output;
     VAR_pc_MUX_uxn_c_l82_c7_ed23_iftrue := VAR_pc_uxn_c_l83_c3_54e3;
     -- ins_MUX[uxn_c_l75_c2_cb37] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l75_c2_cb37_cond <= VAR_ins_MUX_uxn_c_l75_c2_cb37_cond;
     ins_MUX_uxn_c_l75_c2_cb37_iftrue <= VAR_ins_MUX_uxn_c_l75_c2_cb37_iftrue;
     ins_MUX_uxn_c_l75_c2_cb37_iffalse <= VAR_ins_MUX_uxn_c_l75_c2_cb37_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l75_c2_cb37_return_output := ins_MUX_uxn_c_l75_c2_cb37_return_output;

     -- eval_opcode_phased[uxn_c_l87_c45_0d5a] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l87_c45_0d5a_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l87_c45_0d5a_phase <= VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_phase;
     eval_opcode_phased_uxn_c_l87_c45_0d5a_ins <= VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_ins;
     eval_opcode_phased_uxn_c_l87_c45_0d5a_pc <= VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_pc;
     eval_opcode_phased_uxn_c_l87_c45_0d5a_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_previous_ram_read;
     eval_opcode_phased_uxn_c_l87_c45_0d5a_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output := eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output;

     -- Submodule level 4
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l75_c2_cb37_return_output;
     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l95_c30_92e9] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l95_c30_92e9_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output.u8_value;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_69a6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_69a6_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l89_c34_2fe7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_2fe7_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l97_c17_6eac] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l97_c17_6eac_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output.is_opc_done;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l93_c40_4b73] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l93_c40_4b73_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l92_c38_d222] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_d222_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l88_c8_9a18] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_9a18_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l91_c35_7900] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_7900_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l96_c16_c870] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l96_c16_c870_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l94_c41_a97d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l94_c41_a97d_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_0d5a_return_output.is_device_ram_write;

     -- Submodule level 5
     VAR_MUX_uxn_c_l88_c8_5a24_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_69a6_return_output;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_ed23_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l97_c17_6eac_return_output;
     VAR_MUX_uxn_c_l88_c8_5a24_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_9a18_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_ed23_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l96_c16_c870_return_output;
     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0[uxn_c_l82_c7_ed23] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l82_c7_ed23_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_2fe7_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_69a6_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_7900_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_d222_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l93_c40_4b73_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l94_c41_a97d_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l95_c30_92e9_return_output);

     -- is_ins_done_MUX[uxn_c_l82_c7_ed23] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l82_c7_ed23_cond <= VAR_is_ins_done_MUX_uxn_c_l82_c7_ed23_cond;
     is_ins_done_MUX_uxn_c_l82_c7_ed23_iftrue <= VAR_is_ins_done_MUX_uxn_c_l82_c7_ed23_iftrue;
     is_ins_done_MUX_uxn_c_l82_c7_ed23_iffalse <= VAR_is_ins_done_MUX_uxn_c_l82_c7_ed23_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l82_c7_ed23_return_output := is_ins_done_MUX_uxn_c_l82_c7_ed23_return_output;

     -- MUX[uxn_c_l88_c8_5a24] LATENCY=0
     -- Inputs
     MUX_uxn_c_l88_c8_5a24_cond <= VAR_MUX_uxn_c_l88_c8_5a24_cond;
     MUX_uxn_c_l88_c8_5a24_iftrue <= VAR_MUX_uxn_c_l88_c8_5a24_iftrue;
     MUX_uxn_c_l88_c8_5a24_iffalse <= VAR_MUX_uxn_c_l88_c8_5a24_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l88_c8_5a24_return_output := MUX_uxn_c_l88_c8_5a24_return_output;

     -- is_waiting_MUX[uxn_c_l82_c7_ed23] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l82_c7_ed23_cond <= VAR_is_waiting_MUX_uxn_c_l82_c7_ed23_cond;
     is_waiting_MUX_uxn_c_l82_c7_ed23_iftrue <= VAR_is_waiting_MUX_uxn_c_l82_c7_ed23_iftrue;
     is_waiting_MUX_uxn_c_l82_c7_ed23_iffalse <= VAR_is_waiting_MUX_uxn_c_l82_c7_ed23_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l82_c7_ed23_return_output := is_waiting_MUX_uxn_c_l82_c7_ed23_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l82_c7_ed23_iffalse := VAR_MUX_uxn_c_l88_c8_5a24_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_ed23_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l82_c7_ed23_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c2_cb37_iffalse := VAR_is_ins_done_MUX_uxn_c_l82_c7_ed23_return_output;
     VAR_is_waiting_MUX_uxn_c_l75_c2_cb37_iffalse := VAR_is_waiting_MUX_uxn_c_l82_c7_ed23_return_output;
     -- is_ins_done_MUX[uxn_c_l75_c2_cb37] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l75_c2_cb37_cond <= VAR_is_ins_done_MUX_uxn_c_l75_c2_cb37_cond;
     is_ins_done_MUX_uxn_c_l75_c2_cb37_iftrue <= VAR_is_ins_done_MUX_uxn_c_l75_c2_cb37_iftrue;
     is_ins_done_MUX_uxn_c_l75_c2_cb37_iffalse <= VAR_is_ins_done_MUX_uxn_c_l75_c2_cb37_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l75_c2_cb37_return_output := is_ins_done_MUX_uxn_c_l75_c2_cb37_return_output;

     -- cpu_step_result_MUX[uxn_c_l82_c7_ed23] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l82_c7_ed23_cond <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_ed23_cond;
     cpu_step_result_MUX_uxn_c_l82_c7_ed23_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_ed23_iftrue;
     cpu_step_result_MUX_uxn_c_l82_c7_ed23_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_ed23_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_ed23_return_output := cpu_step_result_MUX_uxn_c_l82_c7_ed23_return_output;

     -- pc_MUX[uxn_c_l82_c7_ed23] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l82_c7_ed23_cond <= VAR_pc_MUX_uxn_c_l82_c7_ed23_cond;
     pc_MUX_uxn_c_l82_c7_ed23_iftrue <= VAR_pc_MUX_uxn_c_l82_c7_ed23_iftrue;
     pc_MUX_uxn_c_l82_c7_ed23_iffalse <= VAR_pc_MUX_uxn_c_l82_c7_ed23_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l82_c7_ed23_return_output := pc_MUX_uxn_c_l82_c7_ed23_return_output;

     -- is_waiting_MUX[uxn_c_l75_c2_cb37] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l75_c2_cb37_cond <= VAR_is_waiting_MUX_uxn_c_l75_c2_cb37_cond;
     is_waiting_MUX_uxn_c_l75_c2_cb37_iftrue <= VAR_is_waiting_MUX_uxn_c_l75_c2_cb37_iftrue;
     is_waiting_MUX_uxn_c_l75_c2_cb37_iffalse <= VAR_is_waiting_MUX_uxn_c_l75_c2_cb37_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l75_c2_cb37_return_output := is_waiting_MUX_uxn_c_l75_c2_cb37_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_cb37_iffalse := VAR_cpu_step_result_MUX_uxn_c_l82_c7_ed23_return_output;
     VAR_BIN_OP_OR_uxn_c_l100_c6_c27e_left := VAR_is_ins_done_MUX_uxn_c_l75_c2_cb37_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l75_c2_cb37_return_output;
     VAR_BIN_OP_OR_uxn_c_l100_c6_c27e_right := VAR_is_waiting_MUX_uxn_c_l75_c2_cb37_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l75_c2_cb37_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_cb37_iffalse := VAR_pc_MUX_uxn_c_l82_c7_ed23_return_output;
     -- BIN_OP_OR[uxn_c_l100_c6_c27e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l100_c6_c27e_left <= VAR_BIN_OP_OR_uxn_c_l100_c6_c27e_left;
     BIN_OP_OR_uxn_c_l100_c6_c27e_right <= VAR_BIN_OP_OR_uxn_c_l100_c6_c27e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l100_c6_c27e_return_output := BIN_OP_OR_uxn_c_l100_c6_c27e_return_output;

     -- cpu_step_result_MUX[uxn_c_l75_c2_cb37] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l75_c2_cb37_cond <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_cb37_cond;
     cpu_step_result_MUX_uxn_c_l75_c2_cb37_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_cb37_iftrue;
     cpu_step_result_MUX_uxn_c_l75_c2_cb37_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_cb37_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_cb37_return_output := cpu_step_result_MUX_uxn_c_l75_c2_cb37_return_output;

     -- pc_MUX[uxn_c_l75_c2_cb37] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l75_c2_cb37_cond <= VAR_pc_MUX_uxn_c_l75_c2_cb37_cond;
     pc_MUX_uxn_c_l75_c2_cb37_iftrue <= VAR_pc_MUX_uxn_c_l75_c2_cb37_iftrue;
     pc_MUX_uxn_c_l75_c2_cb37_iffalse <= VAR_pc_MUX_uxn_c_l75_c2_cb37_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l75_c2_cb37_return_output := pc_MUX_uxn_c_l75_c2_cb37_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_d521_cond := VAR_BIN_OP_OR_uxn_c_l100_c6_c27e_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l75_c2_cb37_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l75_c2_cb37_return_output;
     VAR_BIN_OP_EQ_uxn_c_l103_c21_40ce_left := VAR_pc_MUX_uxn_c_l75_c2_cb37_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l75_c2_cb37_return_output;
     -- BIN_OP_EQ[uxn_c_l103_c21_40ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l103_c21_40ce_left <= VAR_BIN_OP_EQ_uxn_c_l103_c21_40ce_left;
     BIN_OP_EQ_uxn_c_l103_c21_40ce_right <= VAR_BIN_OP_EQ_uxn_c_l103_c21_40ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l103_c21_40ce_return_output := BIN_OP_EQ_uxn_c_l103_c21_40ce_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l103_c21_e375_cond := VAR_BIN_OP_EQ_uxn_c_l103_c21_40ce_return_output;
     -- MUX[uxn_c_l103_c21_e375] LATENCY=0
     -- Inputs
     MUX_uxn_c_l103_c21_e375_cond <= VAR_MUX_uxn_c_l103_c21_e375_cond;
     MUX_uxn_c_l103_c21_e375_iftrue <= VAR_MUX_uxn_c_l103_c21_e375_iftrue;
     MUX_uxn_c_l103_c21_e375_iffalse <= VAR_MUX_uxn_c_l103_c21_e375_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l103_c21_e375_return_output := MUX_uxn_c_l103_c21_e375_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_d521_iffalse := VAR_MUX_uxn_c_l103_c21_e375_return_output;
     -- step_cpu_phase_MUX[uxn_c_l100_c2_d521] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l100_c2_d521_cond <= VAR_step_cpu_phase_MUX_uxn_c_l100_c2_d521_cond;
     step_cpu_phase_MUX_uxn_c_l100_c2_d521_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l100_c2_d521_iftrue;
     step_cpu_phase_MUX_uxn_c_l100_c2_d521_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l100_c2_d521_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_d521_return_output := step_cpu_phase_MUX_uxn_c_l100_c2_d521_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l100_c2_d521_return_output;
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
