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
entity step_cpu_0CLK_c0bf3804 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 use_vector : in unsigned(0 downto 0);
 vector : in unsigned(15 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_c0bf3804;
architecture arch of step_cpu_0CLK_c0bf3804 is
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
-- BIN_OP_AND[uxn_c_l68_c8_9679]
signal BIN_OP_AND_uxn_c_l68_c8_9679_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l68_c8_9679_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l68_c8_9679_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l68_c8_b3c4]
signal MUX_uxn_c_l68_c8_b3c4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l68_c8_b3c4_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l68_c8_b3c4_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l68_c8_b3c4_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l69_c15_6efb]
signal MUX_uxn_c_l69_c15_6efb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_6efb_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_6efb_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_6efb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c6_1f5f]
signal BIN_OP_EQ_uxn_c_l75_c6_1f5f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c6_1f5f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c6_1f5f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c7_2f1f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l75_c2_4a47]
signal is_ins_done_MUX_uxn_c_l75_c2_4a47_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_4a47_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_4a47_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_4a47_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l75_c2_4a47]
signal ins_MUX_uxn_c_l75_c2_4a47_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l75_c2_4a47_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c2_4a47_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c2_4a47_return_output : unsigned(7 downto 0);

-- cpu_step_result_MUX[uxn_c_l75_c2_4a47]
signal cpu_step_result_MUX_uxn_c_l75_c2_4a47_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l75_c2_4a47_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c2_4a47_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c2_4a47_return_output : cpu_step_result_t;

-- is_waiting_MUX[uxn_c_l75_c2_4a47]
signal is_waiting_MUX_uxn_c_l75_c2_4a47_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_4a47_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_4a47_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_4a47_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l75_c2_4a47]
signal pc_MUX_uxn_c_l75_c2_4a47_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l75_c2_4a47_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c2_4a47_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c2_4a47_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l82_c11_9029]
signal BIN_OP_EQ_uxn_c_l82_c11_9029_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c11_9029_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c11_9029_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_a707]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l82_c7_2f1f]
signal is_ins_done_MUX_uxn_c_l82_c7_2f1f_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_2f1f_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_2f1f_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_2f1f_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l82_c7_2f1f]
signal ins_MUX_uxn_c_l82_c7_2f1f_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l82_c7_2f1f_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l82_c7_2f1f_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l82_c7_2f1f_return_output : unsigned(7 downto 0);

-- cpu_step_result_MUX[uxn_c_l82_c7_2f1f]
signal cpu_step_result_MUX_uxn_c_l82_c7_2f1f_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l82_c7_2f1f_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l82_c7_2f1f_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l82_c7_2f1f_return_output : cpu_step_result_t;

-- is_waiting_MUX[uxn_c_l82_c7_2f1f]
signal is_waiting_MUX_uxn_c_l82_c7_2f1f_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_2f1f_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_2f1f_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_2f1f_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l82_c7_2f1f]
signal pc_MUX_uxn_c_l82_c7_2f1f_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l82_c7_2f1f_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l82_c7_2f1f_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l82_c7_2f1f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l83_c3_6f49]
signal BIN_OP_PLUS_uxn_c_l83_c3_6f49_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l83_c3_6f49_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l83_c3_6f49_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l86_c9_6907]
signal BIN_OP_EQ_uxn_c_l86_c9_6907_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l86_c9_6907_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l86_c9_6907_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l86_c9_c581]
signal MUX_uxn_c_l86_c9_c581_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l86_c9_c581_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l86_c9_c581_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l86_c9_c581_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l87_c64_ccda]
signal BIN_OP_MINUS_uxn_c_l87_c64_ccda_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l87_c64_ccda_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l87_c64_ccda_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l87_c45_c96d]
signal eval_opcode_phased_uxn_c_l87_c45_c96d_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_c96d_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_c96d_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_c96d_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_c96d_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_c96d_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_c96d_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l88_c8_f0b2]
signal MUX_uxn_c_l88_c8_f0b2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l88_c8_f0b2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l88_c8_f0b2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l88_c8_f0b2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l100_c6_1629]
signal BIN_OP_OR_uxn_c_l100_c6_1629_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l100_c6_1629_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l100_c6_1629_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l100_c2_faa9]
signal step_cpu_phase_MUX_uxn_c_l100_c2_faa9_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l100_c2_faa9_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l100_c2_faa9_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l100_c2_faa9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l103_c21_1c4e]
signal BIN_OP_EQ_uxn_c_l103_c21_1c4e_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l103_c21_1c4e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l103_c21_1c4e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l103_c37_a99c]
signal BIN_OP_PLUS_uxn_c_l103_c37_a99c_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l103_c37_a99c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l103_c37_a99c_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l103_c21_65bb]
signal MUX_uxn_c_l103_c21_65bb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l103_c21_65bb_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l103_c21_65bb_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l103_c21_65bb_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_c_l68_c8_9679
BIN_OP_AND_uxn_c_l68_c8_9679 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l68_c8_9679_left,
BIN_OP_AND_uxn_c_l68_c8_9679_right,
BIN_OP_AND_uxn_c_l68_c8_9679_return_output);

-- MUX_uxn_c_l68_c8_b3c4
MUX_uxn_c_l68_c8_b3c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l68_c8_b3c4_cond,
MUX_uxn_c_l68_c8_b3c4_iftrue,
MUX_uxn_c_l68_c8_b3c4_iffalse,
MUX_uxn_c_l68_c8_b3c4_return_output);

-- MUX_uxn_c_l69_c15_6efb
MUX_uxn_c_l69_c15_6efb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l69_c15_6efb_cond,
MUX_uxn_c_l69_c15_6efb_iftrue,
MUX_uxn_c_l69_c15_6efb_iffalse,
MUX_uxn_c_l69_c15_6efb_return_output);

-- BIN_OP_EQ_uxn_c_l75_c6_1f5f
BIN_OP_EQ_uxn_c_l75_c6_1f5f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c6_1f5f_left,
BIN_OP_EQ_uxn_c_l75_c6_1f5f_right,
BIN_OP_EQ_uxn_c_l75_c6_1f5f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_return_output);

-- is_ins_done_MUX_uxn_c_l75_c2_4a47
is_ins_done_MUX_uxn_c_l75_c2_4a47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l75_c2_4a47_cond,
is_ins_done_MUX_uxn_c_l75_c2_4a47_iftrue,
is_ins_done_MUX_uxn_c_l75_c2_4a47_iffalse,
is_ins_done_MUX_uxn_c_l75_c2_4a47_return_output);

-- ins_MUX_uxn_c_l75_c2_4a47
ins_MUX_uxn_c_l75_c2_4a47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l75_c2_4a47_cond,
ins_MUX_uxn_c_l75_c2_4a47_iftrue,
ins_MUX_uxn_c_l75_c2_4a47_iffalse,
ins_MUX_uxn_c_l75_c2_4a47_return_output);

-- cpu_step_result_MUX_uxn_c_l75_c2_4a47
cpu_step_result_MUX_uxn_c_l75_c2_4a47 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l75_c2_4a47_cond,
cpu_step_result_MUX_uxn_c_l75_c2_4a47_iftrue,
cpu_step_result_MUX_uxn_c_l75_c2_4a47_iffalse,
cpu_step_result_MUX_uxn_c_l75_c2_4a47_return_output);

-- is_waiting_MUX_uxn_c_l75_c2_4a47
is_waiting_MUX_uxn_c_l75_c2_4a47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l75_c2_4a47_cond,
is_waiting_MUX_uxn_c_l75_c2_4a47_iftrue,
is_waiting_MUX_uxn_c_l75_c2_4a47_iffalse,
is_waiting_MUX_uxn_c_l75_c2_4a47_return_output);

-- pc_MUX_uxn_c_l75_c2_4a47
pc_MUX_uxn_c_l75_c2_4a47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l75_c2_4a47_cond,
pc_MUX_uxn_c_l75_c2_4a47_iftrue,
pc_MUX_uxn_c_l75_c2_4a47_iffalse,
pc_MUX_uxn_c_l75_c2_4a47_return_output);

-- BIN_OP_EQ_uxn_c_l82_c11_9029
BIN_OP_EQ_uxn_c_l82_c11_9029 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l82_c11_9029_left,
BIN_OP_EQ_uxn_c_l82_c11_9029_right,
BIN_OP_EQ_uxn_c_l82_c11_9029_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_return_output);

-- is_ins_done_MUX_uxn_c_l82_c7_2f1f
is_ins_done_MUX_uxn_c_l82_c7_2f1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l82_c7_2f1f_cond,
is_ins_done_MUX_uxn_c_l82_c7_2f1f_iftrue,
is_ins_done_MUX_uxn_c_l82_c7_2f1f_iffalse,
is_ins_done_MUX_uxn_c_l82_c7_2f1f_return_output);

-- ins_MUX_uxn_c_l82_c7_2f1f
ins_MUX_uxn_c_l82_c7_2f1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l82_c7_2f1f_cond,
ins_MUX_uxn_c_l82_c7_2f1f_iftrue,
ins_MUX_uxn_c_l82_c7_2f1f_iffalse,
ins_MUX_uxn_c_l82_c7_2f1f_return_output);

-- cpu_step_result_MUX_uxn_c_l82_c7_2f1f
cpu_step_result_MUX_uxn_c_l82_c7_2f1f : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l82_c7_2f1f_cond,
cpu_step_result_MUX_uxn_c_l82_c7_2f1f_iftrue,
cpu_step_result_MUX_uxn_c_l82_c7_2f1f_iffalse,
cpu_step_result_MUX_uxn_c_l82_c7_2f1f_return_output);

-- is_waiting_MUX_uxn_c_l82_c7_2f1f
is_waiting_MUX_uxn_c_l82_c7_2f1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l82_c7_2f1f_cond,
is_waiting_MUX_uxn_c_l82_c7_2f1f_iftrue,
is_waiting_MUX_uxn_c_l82_c7_2f1f_iffalse,
is_waiting_MUX_uxn_c_l82_c7_2f1f_return_output);

-- pc_MUX_uxn_c_l82_c7_2f1f
pc_MUX_uxn_c_l82_c7_2f1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l82_c7_2f1f_cond,
pc_MUX_uxn_c_l82_c7_2f1f_iftrue,
pc_MUX_uxn_c_l82_c7_2f1f_iffalse,
pc_MUX_uxn_c_l82_c7_2f1f_return_output);

-- BIN_OP_PLUS_uxn_c_l83_c3_6f49
BIN_OP_PLUS_uxn_c_l83_c3_6f49 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l83_c3_6f49_left,
BIN_OP_PLUS_uxn_c_l83_c3_6f49_right,
BIN_OP_PLUS_uxn_c_l83_c3_6f49_return_output);

-- BIN_OP_EQ_uxn_c_l86_c9_6907
BIN_OP_EQ_uxn_c_l86_c9_6907 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l86_c9_6907_left,
BIN_OP_EQ_uxn_c_l86_c9_6907_right,
BIN_OP_EQ_uxn_c_l86_c9_6907_return_output);

-- MUX_uxn_c_l86_c9_c581
MUX_uxn_c_l86_c9_c581 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l86_c9_c581_cond,
MUX_uxn_c_l86_c9_c581_iftrue,
MUX_uxn_c_l86_c9_c581_iffalse,
MUX_uxn_c_l86_c9_c581_return_output);

-- BIN_OP_MINUS_uxn_c_l87_c64_ccda
BIN_OP_MINUS_uxn_c_l87_c64_ccda : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l87_c64_ccda_left,
BIN_OP_MINUS_uxn_c_l87_c64_ccda_right,
BIN_OP_MINUS_uxn_c_l87_c64_ccda_return_output);

-- eval_opcode_phased_uxn_c_l87_c45_c96d
eval_opcode_phased_uxn_c_l87_c45_c96d : entity work.eval_opcode_phased_0CLK_17f7f827 port map (
clk,
eval_opcode_phased_uxn_c_l87_c45_c96d_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l87_c45_c96d_phase,
eval_opcode_phased_uxn_c_l87_c45_c96d_ins,
eval_opcode_phased_uxn_c_l87_c45_c96d_pc,
eval_opcode_phased_uxn_c_l87_c45_c96d_previous_ram_read,
eval_opcode_phased_uxn_c_l87_c45_c96d_previous_device_ram_read,
eval_opcode_phased_uxn_c_l87_c45_c96d_return_output);

-- MUX_uxn_c_l88_c8_f0b2
MUX_uxn_c_l88_c8_f0b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l88_c8_f0b2_cond,
MUX_uxn_c_l88_c8_f0b2_iftrue,
MUX_uxn_c_l88_c8_f0b2_iffalse,
MUX_uxn_c_l88_c8_f0b2_return_output);

-- BIN_OP_OR_uxn_c_l100_c6_1629
BIN_OP_OR_uxn_c_l100_c6_1629 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l100_c6_1629_left,
BIN_OP_OR_uxn_c_l100_c6_1629_right,
BIN_OP_OR_uxn_c_l100_c6_1629_return_output);

-- step_cpu_phase_MUX_uxn_c_l100_c2_faa9
step_cpu_phase_MUX_uxn_c_l100_c2_faa9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l100_c2_faa9_cond,
step_cpu_phase_MUX_uxn_c_l100_c2_faa9_iftrue,
step_cpu_phase_MUX_uxn_c_l100_c2_faa9_iffalse,
step_cpu_phase_MUX_uxn_c_l100_c2_faa9_return_output);

-- BIN_OP_EQ_uxn_c_l103_c21_1c4e
BIN_OP_EQ_uxn_c_l103_c21_1c4e : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l103_c21_1c4e_left,
BIN_OP_EQ_uxn_c_l103_c21_1c4e_right,
BIN_OP_EQ_uxn_c_l103_c21_1c4e_return_output);

-- BIN_OP_PLUS_uxn_c_l103_c37_a99c
BIN_OP_PLUS_uxn_c_l103_c37_a99c : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l103_c37_a99c_left,
BIN_OP_PLUS_uxn_c_l103_c37_a99c_right,
BIN_OP_PLUS_uxn_c_l103_c37_a99c_return_output);

-- MUX_uxn_c_l103_c21_65bb
MUX_uxn_c_l103_c21_65bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l103_c21_65bb_cond,
MUX_uxn_c_l103_c21_65bb_iftrue,
MUX_uxn_c_l103_c21_65bb_iffalse,
MUX_uxn_c_l103_c21_65bb_return_output);



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
 BIN_OP_AND_uxn_c_l68_c8_9679_return_output,
 MUX_uxn_c_l68_c8_b3c4_return_output,
 MUX_uxn_c_l69_c15_6efb_return_output,
 BIN_OP_EQ_uxn_c_l75_c6_1f5f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_return_output,
 is_ins_done_MUX_uxn_c_l75_c2_4a47_return_output,
 ins_MUX_uxn_c_l75_c2_4a47_return_output,
 cpu_step_result_MUX_uxn_c_l75_c2_4a47_return_output,
 is_waiting_MUX_uxn_c_l75_c2_4a47_return_output,
 pc_MUX_uxn_c_l75_c2_4a47_return_output,
 BIN_OP_EQ_uxn_c_l82_c11_9029_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_return_output,
 is_ins_done_MUX_uxn_c_l82_c7_2f1f_return_output,
 ins_MUX_uxn_c_l82_c7_2f1f_return_output,
 cpu_step_result_MUX_uxn_c_l82_c7_2f1f_return_output,
 is_waiting_MUX_uxn_c_l82_c7_2f1f_return_output,
 pc_MUX_uxn_c_l82_c7_2f1f_return_output,
 BIN_OP_PLUS_uxn_c_l83_c3_6f49_return_output,
 BIN_OP_EQ_uxn_c_l86_c9_6907_return_output,
 MUX_uxn_c_l86_c9_c581_return_output,
 BIN_OP_MINUS_uxn_c_l87_c64_ccda_return_output,
 eval_opcode_phased_uxn_c_l87_c45_c96d_return_output,
 MUX_uxn_c_l88_c8_f0b2_return_output,
 BIN_OP_OR_uxn_c_l100_c6_1629_return_output,
 step_cpu_phase_MUX_uxn_c_l100_c2_faa9_return_output,
 BIN_OP_EQ_uxn_c_l103_c21_1c4e_return_output,
 BIN_OP_PLUS_uxn_c_l103_c37_a99c_return_output,
 MUX_uxn_c_l103_c21_65bb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_b3c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_9679_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_9679_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_9679_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_b3c4_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_b3c4_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_b3c4_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_6efb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_6efb_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_6efb_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_6efb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_1f5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_1f5f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_1f5f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_4a47_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_4a47_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_2f1f_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_4a47_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_4a47_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_4a47_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_4a47_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_2f1f_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_4a47_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_4a47_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_4a47_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l75_c2_4a47_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_4a47_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_2f1f_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_4a47_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_4a47_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_4a47_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_4a47_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_2f1f_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_4a47_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_4a47_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_4a47_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_4a47_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_2f1f_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_4a47_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_4a47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_9029_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_9029_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_9029_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_2f1f_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_2f1f_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_2f1f_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_2f1f_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_2f1f_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_2f1f_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_2f1f_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_2f1f_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l82_c7_2f1f_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_2f1f_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_2f1f_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_2f1f_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_2f1f_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_2f1f_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l83_c3_2552 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_2f1f_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_2f1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_6f49_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_6f49_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_6f49_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_c581_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_6907_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_6907_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_6907_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_c581_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_c581_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_c581_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_result : eval_opcode_result_t;
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c64_ccda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c64_ccda_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c64_ccda_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l88_c8_f0b2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_7bc4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_f0b2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_f0b2_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_f0b2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_97b2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_b2b4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_81fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l93_c40_0f11_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l94_c41_bbed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l95_c30_4e9f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l96_c16_b6aa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l97_c17_9a7d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l100_c6_1629_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l100_c6_1629_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l100_c6_1629_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_faa9_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l101_c3_0b0d : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_faa9_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_faa9_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_faa9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_65bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l103_c21_1c4e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l103_c21_1c4e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l103_c21_1c4e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_65bb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_65bb_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l103_c37_a99c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l103_c37_a99c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l103_c37_a99c_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_65bb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l88_l90_DUPLICATE_6046_return_output : unsigned(15 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l82_c11_9029_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l103_c21_1c4e_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l103_c37_a99c_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l103_c21_65bb_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_MINUS_uxn_c_l87_c64_ccda_right := to_unsigned(2, 2);
     VAR_MUX_uxn_c_l69_c15_6efb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l75_c6_1f5f_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_6f49_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l86_c9_6907_right := to_unsigned(2, 2);
     VAR_step_cpu_phase_uxn_c_l101_c3_0b0d := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_faa9_iftrue := VAR_step_cpu_phase_uxn_c_l101_c3_0b0d;
     VAR_is_ins_done_MUX_uxn_c_l75_c2_4a47_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_iffalse := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_2f1f_iftrue := cpu_step_result;
     VAR_MUX_uxn_c_l86_c9_c581_iffalse := ins;
     VAR_ins_MUX_uxn_c_l75_c2_4a47_iftrue := ins;
     VAR_ins_MUX_uxn_c_l82_c7_2f1f_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_2f1f_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l68_c8_9679_right := is_waiting;
     VAR_MUX_uxn_c_l69_c15_6efb_iffalse := is_waiting;
     VAR_MUX_uxn_c_l68_c8_b3c4_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l86_c9_c581_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l75_c6_1f5f_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l82_c11_9029_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l86_c9_6907_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l87_c64_ccda_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l103_c37_a99c_left := step_cpu_phase;
     VAR_BIN_OP_AND_uxn_c_l68_c8_9679_left := VAR_use_vector;
     VAR_MUX_uxn_c_l69_c15_6efb_cond := VAR_use_vector;
     VAR_MUX_uxn_c_l68_c8_b3c4_iftrue := VAR_vector;
     -- BIN_OP_MINUS[uxn_c_l87_c64_ccda] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l87_c64_ccda_left <= VAR_BIN_OP_MINUS_uxn_c_l87_c64_ccda_left;
     BIN_OP_MINUS_uxn_c_l87_c64_ccda_right <= VAR_BIN_OP_MINUS_uxn_c_l87_c64_ccda_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l87_c64_ccda_return_output := BIN_OP_MINUS_uxn_c_l87_c64_ccda_return_output;

     -- BIN_OP_EQ[uxn_c_l82_c11_9029] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l82_c11_9029_left <= VAR_BIN_OP_EQ_uxn_c_l82_c11_9029_left;
     BIN_OP_EQ_uxn_c_l82_c11_9029_right <= VAR_BIN_OP_EQ_uxn_c_l82_c11_9029_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l82_c11_9029_return_output := BIN_OP_EQ_uxn_c_l82_c11_9029_return_output;

     -- BIN_OP_EQ[uxn_c_l86_c9_6907] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l86_c9_6907_left <= VAR_BIN_OP_EQ_uxn_c_l86_c9_6907_left;
     BIN_OP_EQ_uxn_c_l86_c9_6907_right <= VAR_BIN_OP_EQ_uxn_c_l86_c9_6907_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l86_c9_6907_return_output := BIN_OP_EQ_uxn_c_l86_c9_6907_return_output;

     -- BIN_OP_AND[uxn_c_l68_c8_9679] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l68_c8_9679_left <= VAR_BIN_OP_AND_uxn_c_l68_c8_9679_left;
     BIN_OP_AND_uxn_c_l68_c8_9679_right <= VAR_BIN_OP_AND_uxn_c_l68_c8_9679_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l68_c8_9679_return_output := BIN_OP_AND_uxn_c_l68_c8_9679_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c6_1f5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c6_1f5f_left <= VAR_BIN_OP_EQ_uxn_c_l75_c6_1f5f_left;
     BIN_OP_EQ_uxn_c_l75_c6_1f5f_right <= VAR_BIN_OP_EQ_uxn_c_l75_c6_1f5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c6_1f5f_return_output := BIN_OP_EQ_uxn_c_l75_c6_1f5f_return_output;

     -- MUX[uxn_c_l69_c15_6efb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l69_c15_6efb_cond <= VAR_MUX_uxn_c_l69_c15_6efb_cond;
     MUX_uxn_c_l69_c15_6efb_iftrue <= VAR_MUX_uxn_c_l69_c15_6efb_iftrue;
     MUX_uxn_c_l69_c15_6efb_iffalse <= VAR_MUX_uxn_c_l69_c15_6efb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l69_c15_6efb_return_output := MUX_uxn_c_l69_c15_6efb_return_output;

     -- BIN_OP_PLUS[uxn_c_l103_c37_a99c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l103_c37_a99c_left <= VAR_BIN_OP_PLUS_uxn_c_l103_c37_a99c_left;
     BIN_OP_PLUS_uxn_c_l103_c37_a99c_right <= VAR_BIN_OP_PLUS_uxn_c_l103_c37_a99c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l103_c37_a99c_return_output := BIN_OP_PLUS_uxn_c_l103_c37_a99c_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l68_c8_b3c4_cond := VAR_BIN_OP_AND_uxn_c_l68_c8_9679_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_1f5f_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_4a47_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_1f5f_return_output;
     VAR_ins_MUX_uxn_c_l75_c2_4a47_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_1f5f_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c2_4a47_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_1f5f_return_output;
     VAR_is_waiting_MUX_uxn_c_l75_c2_4a47_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_1f5f_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_4a47_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_1f5f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_9029_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_2f1f_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_9029_return_output;
     VAR_ins_MUX_uxn_c_l82_c7_2f1f_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_9029_return_output;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_2f1f_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_9029_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_2f1f_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_9029_return_output;
     VAR_pc_MUX_uxn_c_l82_c7_2f1f_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_9029_return_output;
     VAR_MUX_uxn_c_l86_c9_c581_cond := VAR_BIN_OP_EQ_uxn_c_l86_c9_6907_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_phase := VAR_BIN_OP_MINUS_uxn_c_l87_c64_ccda_return_output;
     VAR_MUX_uxn_c_l103_c21_65bb_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l103_c37_a99c_return_output, 8);
     VAR_is_waiting_MUX_uxn_c_l75_c2_4a47_iftrue := VAR_MUX_uxn_c_l69_c15_6efb_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_2f1f_iftrue := VAR_MUX_uxn_c_l69_c15_6efb_return_output;
     -- MUX[uxn_c_l68_c8_b3c4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l68_c8_b3c4_cond <= VAR_MUX_uxn_c_l68_c8_b3c4_cond;
     MUX_uxn_c_l68_c8_b3c4_iftrue <= VAR_MUX_uxn_c_l68_c8_b3c4_iftrue;
     MUX_uxn_c_l68_c8_b3c4_iffalse <= VAR_MUX_uxn_c_l68_c8_b3c4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l68_c8_b3c4_return_output := MUX_uxn_c_l68_c8_b3c4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c7_2f1f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_return_output;

     -- MUX[uxn_c_l86_c9_c581] LATENCY=0
     -- Inputs
     MUX_uxn_c_l86_c9_c581_cond <= VAR_MUX_uxn_c_l86_c9_c581_cond;
     MUX_uxn_c_l86_c9_c581_iftrue <= VAR_MUX_uxn_c_l86_c9_c581_iftrue;
     MUX_uxn_c_l86_c9_c581_iffalse <= VAR_MUX_uxn_c_l86_c9_c581_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l86_c9_c581_return_output := MUX_uxn_c_l86_c9_c581_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_2f1f_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_6f49_left := VAR_MUX_uxn_c_l68_c8_b3c4_return_output;
     VAR_MUX_uxn_c_l88_c8_f0b2_iffalse := VAR_MUX_uxn_c_l68_c8_b3c4_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_pc := VAR_MUX_uxn_c_l68_c8_b3c4_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_4a47_iftrue := VAR_MUX_uxn_c_l68_c8_b3c4_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_ins := VAR_MUX_uxn_c_l86_c9_c581_return_output;
     VAR_ins_MUX_uxn_c_l82_c7_2f1f_iffalse := VAR_MUX_uxn_c_l86_c9_c581_return_output;
     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228[uxn_c_l75_c2_4a47] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l75_c2_4a47_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228(
     cpu_step_result,
     VAR_MUX_uxn_c_l68_c8_b3c4_return_output,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- BIN_OP_PLUS[uxn_c_l83_c3_6f49] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l83_c3_6f49_left <= VAR_BIN_OP_PLUS_uxn_c_l83_c3_6f49_left;
     BIN_OP_PLUS_uxn_c_l83_c3_6f49_right <= VAR_BIN_OP_PLUS_uxn_c_l83_c3_6f49_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_6f49_return_output := BIN_OP_PLUS_uxn_c_l83_c3_6f49_return_output;

     -- ins_MUX[uxn_c_l82_c7_2f1f] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l82_c7_2f1f_cond <= VAR_ins_MUX_uxn_c_l82_c7_2f1f_cond;
     ins_MUX_uxn_c_l82_c7_2f1f_iftrue <= VAR_ins_MUX_uxn_c_l82_c7_2f1f_iftrue;
     ins_MUX_uxn_c_l82_c7_2f1f_iffalse <= VAR_ins_MUX_uxn_c_l82_c7_2f1f_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l82_c7_2f1f_return_output := ins_MUX_uxn_c_l82_c7_2f1f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_a707] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_return_output;

     -- Submodule level 3
     VAR_pc_uxn_c_l83_c3_2552 := resize(VAR_BIN_OP_PLUS_uxn_c_l83_c3_6f49_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_a707_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_4a47_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l75_c2_4a47_return_output;
     VAR_ins_MUX_uxn_c_l75_c2_4a47_iffalse := VAR_ins_MUX_uxn_c_l82_c7_2f1f_return_output;
     VAR_pc_MUX_uxn_c_l82_c7_2f1f_iftrue := VAR_pc_uxn_c_l83_c3_2552;
     -- ins_MUX[uxn_c_l75_c2_4a47] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l75_c2_4a47_cond <= VAR_ins_MUX_uxn_c_l75_c2_4a47_cond;
     ins_MUX_uxn_c_l75_c2_4a47_iftrue <= VAR_ins_MUX_uxn_c_l75_c2_4a47_iftrue;
     ins_MUX_uxn_c_l75_c2_4a47_iffalse <= VAR_ins_MUX_uxn_c_l75_c2_4a47_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l75_c2_4a47_return_output := ins_MUX_uxn_c_l75_c2_4a47_return_output;

     -- eval_opcode_phased[uxn_c_l87_c45_c96d] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l87_c45_c96d_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l87_c45_c96d_phase <= VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_phase;
     eval_opcode_phased_uxn_c_l87_c45_c96d_ins <= VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_ins;
     eval_opcode_phased_uxn_c_l87_c45_c96d_pc <= VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_pc;
     eval_opcode_phased_uxn_c_l87_c45_c96d_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_previous_ram_read;
     eval_opcode_phased_uxn_c_l87_c45_c96d_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_return_output := eval_opcode_phased_uxn_c_l87_c45_c96d_return_output;

     -- Submodule level 4
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l75_c2_4a47_return_output;
     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l93_c40_0f11] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l93_c40_0f11_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l92_c38_81fb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_81fb_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l88_c8_7bc4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_7bc4_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l89_c34_97b2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_97b2_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l95_c30_4e9f] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l95_c30_4e9f_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l97_c17_9a7d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l97_c17_9a7d_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l96_c16_b6aa] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l96_c16_b6aa_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l91_c35_b2b4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_b2b4_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_return_output.is_vram_write;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l88_l90_DUPLICATE_6046 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l88_l90_DUPLICATE_6046_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l94_c41_bbed] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l94_c41_bbed_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_c96d_return_output.is_device_ram_write;

     -- Submodule level 5
     VAR_MUX_uxn_c_l88_c8_f0b2_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l88_l90_DUPLICATE_6046_return_output;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_2f1f_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l97_c17_9a7d_return_output;
     VAR_MUX_uxn_c_l88_c8_f0b2_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_7bc4_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_2f1f_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l96_c16_b6aa_return_output;
     -- is_ins_done_MUX[uxn_c_l82_c7_2f1f] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l82_c7_2f1f_cond <= VAR_is_ins_done_MUX_uxn_c_l82_c7_2f1f_cond;
     is_ins_done_MUX_uxn_c_l82_c7_2f1f_iftrue <= VAR_is_ins_done_MUX_uxn_c_l82_c7_2f1f_iftrue;
     is_ins_done_MUX_uxn_c_l82_c7_2f1f_iffalse <= VAR_is_ins_done_MUX_uxn_c_l82_c7_2f1f_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l82_c7_2f1f_return_output := is_ins_done_MUX_uxn_c_l82_c7_2f1f_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0[uxn_c_l82_c7_2f1f] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l82_c7_2f1f_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_97b2_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l88_l90_DUPLICATE_6046_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_b2b4_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_81fb_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l93_c40_0f11_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l94_c41_bbed_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l95_c30_4e9f_return_output);

     -- is_waiting_MUX[uxn_c_l82_c7_2f1f] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l82_c7_2f1f_cond <= VAR_is_waiting_MUX_uxn_c_l82_c7_2f1f_cond;
     is_waiting_MUX_uxn_c_l82_c7_2f1f_iftrue <= VAR_is_waiting_MUX_uxn_c_l82_c7_2f1f_iftrue;
     is_waiting_MUX_uxn_c_l82_c7_2f1f_iffalse <= VAR_is_waiting_MUX_uxn_c_l82_c7_2f1f_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l82_c7_2f1f_return_output := is_waiting_MUX_uxn_c_l82_c7_2f1f_return_output;

     -- MUX[uxn_c_l88_c8_f0b2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l88_c8_f0b2_cond <= VAR_MUX_uxn_c_l88_c8_f0b2_cond;
     MUX_uxn_c_l88_c8_f0b2_iftrue <= VAR_MUX_uxn_c_l88_c8_f0b2_iftrue;
     MUX_uxn_c_l88_c8_f0b2_iffalse <= VAR_MUX_uxn_c_l88_c8_f0b2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l88_c8_f0b2_return_output := MUX_uxn_c_l88_c8_f0b2_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l82_c7_2f1f_iffalse := VAR_MUX_uxn_c_l88_c8_f0b2_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_2f1f_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l82_c7_2f1f_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c2_4a47_iffalse := VAR_is_ins_done_MUX_uxn_c_l82_c7_2f1f_return_output;
     VAR_is_waiting_MUX_uxn_c_l75_c2_4a47_iffalse := VAR_is_waiting_MUX_uxn_c_l82_c7_2f1f_return_output;
     -- is_waiting_MUX[uxn_c_l75_c2_4a47] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l75_c2_4a47_cond <= VAR_is_waiting_MUX_uxn_c_l75_c2_4a47_cond;
     is_waiting_MUX_uxn_c_l75_c2_4a47_iftrue <= VAR_is_waiting_MUX_uxn_c_l75_c2_4a47_iftrue;
     is_waiting_MUX_uxn_c_l75_c2_4a47_iffalse <= VAR_is_waiting_MUX_uxn_c_l75_c2_4a47_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l75_c2_4a47_return_output := is_waiting_MUX_uxn_c_l75_c2_4a47_return_output;

     -- cpu_step_result_MUX[uxn_c_l82_c7_2f1f] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l82_c7_2f1f_cond <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_2f1f_cond;
     cpu_step_result_MUX_uxn_c_l82_c7_2f1f_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_2f1f_iftrue;
     cpu_step_result_MUX_uxn_c_l82_c7_2f1f_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_2f1f_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_2f1f_return_output := cpu_step_result_MUX_uxn_c_l82_c7_2f1f_return_output;

     -- pc_MUX[uxn_c_l82_c7_2f1f] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l82_c7_2f1f_cond <= VAR_pc_MUX_uxn_c_l82_c7_2f1f_cond;
     pc_MUX_uxn_c_l82_c7_2f1f_iftrue <= VAR_pc_MUX_uxn_c_l82_c7_2f1f_iftrue;
     pc_MUX_uxn_c_l82_c7_2f1f_iffalse <= VAR_pc_MUX_uxn_c_l82_c7_2f1f_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l82_c7_2f1f_return_output := pc_MUX_uxn_c_l82_c7_2f1f_return_output;

     -- is_ins_done_MUX[uxn_c_l75_c2_4a47] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l75_c2_4a47_cond <= VAR_is_ins_done_MUX_uxn_c_l75_c2_4a47_cond;
     is_ins_done_MUX_uxn_c_l75_c2_4a47_iftrue <= VAR_is_ins_done_MUX_uxn_c_l75_c2_4a47_iftrue;
     is_ins_done_MUX_uxn_c_l75_c2_4a47_iffalse <= VAR_is_ins_done_MUX_uxn_c_l75_c2_4a47_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l75_c2_4a47_return_output := is_ins_done_MUX_uxn_c_l75_c2_4a47_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_4a47_iffalse := VAR_cpu_step_result_MUX_uxn_c_l82_c7_2f1f_return_output;
     VAR_BIN_OP_OR_uxn_c_l100_c6_1629_left := VAR_is_ins_done_MUX_uxn_c_l75_c2_4a47_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l75_c2_4a47_return_output;
     VAR_BIN_OP_OR_uxn_c_l100_c6_1629_right := VAR_is_waiting_MUX_uxn_c_l75_c2_4a47_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l75_c2_4a47_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_4a47_iffalse := VAR_pc_MUX_uxn_c_l82_c7_2f1f_return_output;
     -- pc_MUX[uxn_c_l75_c2_4a47] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l75_c2_4a47_cond <= VAR_pc_MUX_uxn_c_l75_c2_4a47_cond;
     pc_MUX_uxn_c_l75_c2_4a47_iftrue <= VAR_pc_MUX_uxn_c_l75_c2_4a47_iftrue;
     pc_MUX_uxn_c_l75_c2_4a47_iffalse <= VAR_pc_MUX_uxn_c_l75_c2_4a47_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l75_c2_4a47_return_output := pc_MUX_uxn_c_l75_c2_4a47_return_output;

     -- cpu_step_result_MUX[uxn_c_l75_c2_4a47] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l75_c2_4a47_cond <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_4a47_cond;
     cpu_step_result_MUX_uxn_c_l75_c2_4a47_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_4a47_iftrue;
     cpu_step_result_MUX_uxn_c_l75_c2_4a47_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_4a47_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_4a47_return_output := cpu_step_result_MUX_uxn_c_l75_c2_4a47_return_output;

     -- BIN_OP_OR[uxn_c_l100_c6_1629] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l100_c6_1629_left <= VAR_BIN_OP_OR_uxn_c_l100_c6_1629_left;
     BIN_OP_OR_uxn_c_l100_c6_1629_right <= VAR_BIN_OP_OR_uxn_c_l100_c6_1629_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l100_c6_1629_return_output := BIN_OP_OR_uxn_c_l100_c6_1629_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_faa9_cond := VAR_BIN_OP_OR_uxn_c_l100_c6_1629_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l75_c2_4a47_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l75_c2_4a47_return_output;
     VAR_BIN_OP_EQ_uxn_c_l103_c21_1c4e_left := VAR_pc_MUX_uxn_c_l75_c2_4a47_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l75_c2_4a47_return_output;
     -- BIN_OP_EQ[uxn_c_l103_c21_1c4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l103_c21_1c4e_left <= VAR_BIN_OP_EQ_uxn_c_l103_c21_1c4e_left;
     BIN_OP_EQ_uxn_c_l103_c21_1c4e_right <= VAR_BIN_OP_EQ_uxn_c_l103_c21_1c4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l103_c21_1c4e_return_output := BIN_OP_EQ_uxn_c_l103_c21_1c4e_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l103_c21_65bb_cond := VAR_BIN_OP_EQ_uxn_c_l103_c21_1c4e_return_output;
     -- MUX[uxn_c_l103_c21_65bb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l103_c21_65bb_cond <= VAR_MUX_uxn_c_l103_c21_65bb_cond;
     MUX_uxn_c_l103_c21_65bb_iftrue <= VAR_MUX_uxn_c_l103_c21_65bb_iftrue;
     MUX_uxn_c_l103_c21_65bb_iffalse <= VAR_MUX_uxn_c_l103_c21_65bb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l103_c21_65bb_return_output := MUX_uxn_c_l103_c21_65bb_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_faa9_iffalse := VAR_MUX_uxn_c_l103_c21_65bb_return_output;
     -- step_cpu_phase_MUX[uxn_c_l100_c2_faa9] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l100_c2_faa9_cond <= VAR_step_cpu_phase_MUX_uxn_c_l100_c2_faa9_cond;
     step_cpu_phase_MUX_uxn_c_l100_c2_faa9_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l100_c2_faa9_iftrue;
     step_cpu_phase_MUX_uxn_c_l100_c2_faa9_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l100_c2_faa9_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_faa9_return_output := step_cpu_phase_MUX_uxn_c_l100_c2_faa9_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l100_c2_faa9_return_output;
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
