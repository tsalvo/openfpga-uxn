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
-- BIN_OP_AND[uxn_c_l68_c8_aff2]
signal BIN_OP_AND_uxn_c_l68_c8_aff2_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l68_c8_aff2_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l68_c8_aff2_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l68_c8_1985]
signal MUX_uxn_c_l68_c8_1985_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l68_c8_1985_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l68_c8_1985_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l68_c8_1985_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l69_c15_9974]
signal MUX_uxn_c_l69_c15_9974_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_9974_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_9974_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_9974_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c6_71e1]
signal BIN_OP_EQ_uxn_c_l75_c6_71e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c6_71e1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c6_71e1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c7_0a25]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_return_output : unsigned(0 downto 0);

-- is_waiting_MUX[uxn_c_l75_c2_9f7b]
signal is_waiting_MUX_uxn_c_l75_c2_9f7b_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_9f7b_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_9f7b_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_9f7b_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l75_c2_9f7b]
signal pc_MUX_uxn_c_l75_c2_9f7b_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l75_c2_9f7b_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c2_9f7b_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c2_9f7b_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l75_c2_9f7b]
signal ins_MUX_uxn_c_l75_c2_9f7b_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l75_c2_9f7b_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c2_9f7b_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c2_9f7b_return_output : unsigned(7 downto 0);

-- cpu_step_result_MUX[uxn_c_l75_c2_9f7b]
signal cpu_step_result_MUX_uxn_c_l75_c2_9f7b_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l75_c2_9f7b_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c2_9f7b_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c2_9f7b_return_output : cpu_step_result_t;

-- is_ins_done_MUX[uxn_c_l75_c2_9f7b]
signal is_ins_done_MUX_uxn_c_l75_c2_9f7b_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_9f7b_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_9f7b_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_9f7b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l82_c11_7a79]
signal BIN_OP_EQ_uxn_c_l82_c11_7a79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c11_7a79_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c11_7a79_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_3aa5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_return_output : unsigned(0 downto 0);

-- is_waiting_MUX[uxn_c_l82_c7_0a25]
signal is_waiting_MUX_uxn_c_l82_c7_0a25_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_0a25_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_0a25_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_0a25_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l82_c7_0a25]
signal pc_MUX_uxn_c_l82_c7_0a25_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l82_c7_0a25_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l82_c7_0a25_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l82_c7_0a25_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l82_c7_0a25]
signal ins_MUX_uxn_c_l82_c7_0a25_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l82_c7_0a25_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l82_c7_0a25_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l82_c7_0a25_return_output : unsigned(7 downto 0);

-- cpu_step_result_MUX[uxn_c_l82_c7_0a25]
signal cpu_step_result_MUX_uxn_c_l82_c7_0a25_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l82_c7_0a25_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l82_c7_0a25_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l82_c7_0a25_return_output : cpu_step_result_t;

-- is_ins_done_MUX[uxn_c_l82_c7_0a25]
signal is_ins_done_MUX_uxn_c_l82_c7_0a25_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_0a25_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_0a25_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_0a25_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l83_c3_9bf6]
signal BIN_OP_PLUS_uxn_c_l83_c3_9bf6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l83_c3_9bf6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l83_c3_9bf6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l86_c9_6edb]
signal BIN_OP_EQ_uxn_c_l86_c9_6edb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l86_c9_6edb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l86_c9_6edb_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l86_c9_0f5e]
signal MUX_uxn_c_l86_c9_0f5e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l86_c9_0f5e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l86_c9_0f5e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l86_c9_0f5e_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l87_c64_a62e]
signal BIN_OP_MINUS_uxn_c_l87_c64_a62e_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l87_c64_a62e_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l87_c64_a62e_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l87_c45_d020]
signal eval_opcode_phased_uxn_c_l87_c45_d020_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_d020_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_d020_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_d020_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_d020_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_d020_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c45_d020_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l88_c8_1cf2]
signal MUX_uxn_c_l88_c8_1cf2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l88_c8_1cf2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l88_c8_1cf2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l88_c8_1cf2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l100_c6_cff9]
signal BIN_OP_OR_uxn_c_l100_c6_cff9_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l100_c6_cff9_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l100_c6_cff9_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l100_c2_1441]
signal step_cpu_phase_MUX_uxn_c_l100_c2_1441_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l100_c2_1441_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l100_c2_1441_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l100_c2_1441_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l103_c21_fc59]
signal BIN_OP_EQ_uxn_c_l103_c21_fc59_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l103_c21_fc59_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l103_c21_fc59_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l103_c37_ea41]
signal BIN_OP_PLUS_uxn_c_l103_c37_ea41_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l103_c37_ea41_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l103_c37_ea41_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l103_c21_d308]
signal MUX_uxn_c_l103_c21_d308_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l103_c21_d308_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l103_c21_d308_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l103_c21_d308_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_c_l68_c8_aff2
BIN_OP_AND_uxn_c_l68_c8_aff2 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l68_c8_aff2_left,
BIN_OP_AND_uxn_c_l68_c8_aff2_right,
BIN_OP_AND_uxn_c_l68_c8_aff2_return_output);

-- MUX_uxn_c_l68_c8_1985
MUX_uxn_c_l68_c8_1985 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l68_c8_1985_cond,
MUX_uxn_c_l68_c8_1985_iftrue,
MUX_uxn_c_l68_c8_1985_iffalse,
MUX_uxn_c_l68_c8_1985_return_output);

-- MUX_uxn_c_l69_c15_9974
MUX_uxn_c_l69_c15_9974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l69_c15_9974_cond,
MUX_uxn_c_l69_c15_9974_iftrue,
MUX_uxn_c_l69_c15_9974_iffalse,
MUX_uxn_c_l69_c15_9974_return_output);

-- BIN_OP_EQ_uxn_c_l75_c6_71e1
BIN_OP_EQ_uxn_c_l75_c6_71e1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c6_71e1_left,
BIN_OP_EQ_uxn_c_l75_c6_71e1_right,
BIN_OP_EQ_uxn_c_l75_c6_71e1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_return_output);

-- is_waiting_MUX_uxn_c_l75_c2_9f7b
is_waiting_MUX_uxn_c_l75_c2_9f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l75_c2_9f7b_cond,
is_waiting_MUX_uxn_c_l75_c2_9f7b_iftrue,
is_waiting_MUX_uxn_c_l75_c2_9f7b_iffalse,
is_waiting_MUX_uxn_c_l75_c2_9f7b_return_output);

-- pc_MUX_uxn_c_l75_c2_9f7b
pc_MUX_uxn_c_l75_c2_9f7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l75_c2_9f7b_cond,
pc_MUX_uxn_c_l75_c2_9f7b_iftrue,
pc_MUX_uxn_c_l75_c2_9f7b_iffalse,
pc_MUX_uxn_c_l75_c2_9f7b_return_output);

-- ins_MUX_uxn_c_l75_c2_9f7b
ins_MUX_uxn_c_l75_c2_9f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l75_c2_9f7b_cond,
ins_MUX_uxn_c_l75_c2_9f7b_iftrue,
ins_MUX_uxn_c_l75_c2_9f7b_iffalse,
ins_MUX_uxn_c_l75_c2_9f7b_return_output);

-- cpu_step_result_MUX_uxn_c_l75_c2_9f7b
cpu_step_result_MUX_uxn_c_l75_c2_9f7b : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l75_c2_9f7b_cond,
cpu_step_result_MUX_uxn_c_l75_c2_9f7b_iftrue,
cpu_step_result_MUX_uxn_c_l75_c2_9f7b_iffalse,
cpu_step_result_MUX_uxn_c_l75_c2_9f7b_return_output);

-- is_ins_done_MUX_uxn_c_l75_c2_9f7b
is_ins_done_MUX_uxn_c_l75_c2_9f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l75_c2_9f7b_cond,
is_ins_done_MUX_uxn_c_l75_c2_9f7b_iftrue,
is_ins_done_MUX_uxn_c_l75_c2_9f7b_iffalse,
is_ins_done_MUX_uxn_c_l75_c2_9f7b_return_output);

-- BIN_OP_EQ_uxn_c_l82_c11_7a79
BIN_OP_EQ_uxn_c_l82_c11_7a79 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l82_c11_7a79_left,
BIN_OP_EQ_uxn_c_l82_c11_7a79_right,
BIN_OP_EQ_uxn_c_l82_c11_7a79_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_return_output);

-- is_waiting_MUX_uxn_c_l82_c7_0a25
is_waiting_MUX_uxn_c_l82_c7_0a25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l82_c7_0a25_cond,
is_waiting_MUX_uxn_c_l82_c7_0a25_iftrue,
is_waiting_MUX_uxn_c_l82_c7_0a25_iffalse,
is_waiting_MUX_uxn_c_l82_c7_0a25_return_output);

-- pc_MUX_uxn_c_l82_c7_0a25
pc_MUX_uxn_c_l82_c7_0a25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l82_c7_0a25_cond,
pc_MUX_uxn_c_l82_c7_0a25_iftrue,
pc_MUX_uxn_c_l82_c7_0a25_iffalse,
pc_MUX_uxn_c_l82_c7_0a25_return_output);

-- ins_MUX_uxn_c_l82_c7_0a25
ins_MUX_uxn_c_l82_c7_0a25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l82_c7_0a25_cond,
ins_MUX_uxn_c_l82_c7_0a25_iftrue,
ins_MUX_uxn_c_l82_c7_0a25_iffalse,
ins_MUX_uxn_c_l82_c7_0a25_return_output);

-- cpu_step_result_MUX_uxn_c_l82_c7_0a25
cpu_step_result_MUX_uxn_c_l82_c7_0a25 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l82_c7_0a25_cond,
cpu_step_result_MUX_uxn_c_l82_c7_0a25_iftrue,
cpu_step_result_MUX_uxn_c_l82_c7_0a25_iffalse,
cpu_step_result_MUX_uxn_c_l82_c7_0a25_return_output);

-- is_ins_done_MUX_uxn_c_l82_c7_0a25
is_ins_done_MUX_uxn_c_l82_c7_0a25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l82_c7_0a25_cond,
is_ins_done_MUX_uxn_c_l82_c7_0a25_iftrue,
is_ins_done_MUX_uxn_c_l82_c7_0a25_iffalse,
is_ins_done_MUX_uxn_c_l82_c7_0a25_return_output);

-- BIN_OP_PLUS_uxn_c_l83_c3_9bf6
BIN_OP_PLUS_uxn_c_l83_c3_9bf6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l83_c3_9bf6_left,
BIN_OP_PLUS_uxn_c_l83_c3_9bf6_right,
BIN_OP_PLUS_uxn_c_l83_c3_9bf6_return_output);

-- BIN_OP_EQ_uxn_c_l86_c9_6edb
BIN_OP_EQ_uxn_c_l86_c9_6edb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l86_c9_6edb_left,
BIN_OP_EQ_uxn_c_l86_c9_6edb_right,
BIN_OP_EQ_uxn_c_l86_c9_6edb_return_output);

-- MUX_uxn_c_l86_c9_0f5e
MUX_uxn_c_l86_c9_0f5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l86_c9_0f5e_cond,
MUX_uxn_c_l86_c9_0f5e_iftrue,
MUX_uxn_c_l86_c9_0f5e_iffalse,
MUX_uxn_c_l86_c9_0f5e_return_output);

-- BIN_OP_MINUS_uxn_c_l87_c64_a62e
BIN_OP_MINUS_uxn_c_l87_c64_a62e : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l87_c64_a62e_left,
BIN_OP_MINUS_uxn_c_l87_c64_a62e_right,
BIN_OP_MINUS_uxn_c_l87_c64_a62e_return_output);

-- eval_opcode_phased_uxn_c_l87_c45_d020
eval_opcode_phased_uxn_c_l87_c45_d020 : entity work.eval_opcode_phased_0CLK_17f7f827 port map (
clk,
eval_opcode_phased_uxn_c_l87_c45_d020_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l87_c45_d020_phase,
eval_opcode_phased_uxn_c_l87_c45_d020_ins,
eval_opcode_phased_uxn_c_l87_c45_d020_pc,
eval_opcode_phased_uxn_c_l87_c45_d020_previous_ram_read,
eval_opcode_phased_uxn_c_l87_c45_d020_previous_device_ram_read,
eval_opcode_phased_uxn_c_l87_c45_d020_return_output);

-- MUX_uxn_c_l88_c8_1cf2
MUX_uxn_c_l88_c8_1cf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l88_c8_1cf2_cond,
MUX_uxn_c_l88_c8_1cf2_iftrue,
MUX_uxn_c_l88_c8_1cf2_iffalse,
MUX_uxn_c_l88_c8_1cf2_return_output);

-- BIN_OP_OR_uxn_c_l100_c6_cff9
BIN_OP_OR_uxn_c_l100_c6_cff9 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l100_c6_cff9_left,
BIN_OP_OR_uxn_c_l100_c6_cff9_right,
BIN_OP_OR_uxn_c_l100_c6_cff9_return_output);

-- step_cpu_phase_MUX_uxn_c_l100_c2_1441
step_cpu_phase_MUX_uxn_c_l100_c2_1441 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l100_c2_1441_cond,
step_cpu_phase_MUX_uxn_c_l100_c2_1441_iftrue,
step_cpu_phase_MUX_uxn_c_l100_c2_1441_iffalse,
step_cpu_phase_MUX_uxn_c_l100_c2_1441_return_output);

-- BIN_OP_EQ_uxn_c_l103_c21_fc59
BIN_OP_EQ_uxn_c_l103_c21_fc59 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l103_c21_fc59_left,
BIN_OP_EQ_uxn_c_l103_c21_fc59_right,
BIN_OP_EQ_uxn_c_l103_c21_fc59_return_output);

-- BIN_OP_PLUS_uxn_c_l103_c37_ea41
BIN_OP_PLUS_uxn_c_l103_c37_ea41 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l103_c37_ea41_left,
BIN_OP_PLUS_uxn_c_l103_c37_ea41_right,
BIN_OP_PLUS_uxn_c_l103_c37_ea41_return_output);

-- MUX_uxn_c_l103_c21_d308
MUX_uxn_c_l103_c21_d308 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l103_c21_d308_cond,
MUX_uxn_c_l103_c21_d308_iftrue,
MUX_uxn_c_l103_c21_d308_iffalse,
MUX_uxn_c_l103_c21_d308_return_output);



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
 BIN_OP_AND_uxn_c_l68_c8_aff2_return_output,
 MUX_uxn_c_l68_c8_1985_return_output,
 MUX_uxn_c_l69_c15_9974_return_output,
 BIN_OP_EQ_uxn_c_l75_c6_71e1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_return_output,
 is_waiting_MUX_uxn_c_l75_c2_9f7b_return_output,
 pc_MUX_uxn_c_l75_c2_9f7b_return_output,
 ins_MUX_uxn_c_l75_c2_9f7b_return_output,
 cpu_step_result_MUX_uxn_c_l75_c2_9f7b_return_output,
 is_ins_done_MUX_uxn_c_l75_c2_9f7b_return_output,
 BIN_OP_EQ_uxn_c_l82_c11_7a79_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_return_output,
 is_waiting_MUX_uxn_c_l82_c7_0a25_return_output,
 pc_MUX_uxn_c_l82_c7_0a25_return_output,
 ins_MUX_uxn_c_l82_c7_0a25_return_output,
 cpu_step_result_MUX_uxn_c_l82_c7_0a25_return_output,
 is_ins_done_MUX_uxn_c_l82_c7_0a25_return_output,
 BIN_OP_PLUS_uxn_c_l83_c3_9bf6_return_output,
 BIN_OP_EQ_uxn_c_l86_c9_6edb_return_output,
 MUX_uxn_c_l86_c9_0f5e_return_output,
 BIN_OP_MINUS_uxn_c_l87_c64_a62e_return_output,
 eval_opcode_phased_uxn_c_l87_c45_d020_return_output,
 MUX_uxn_c_l88_c8_1cf2_return_output,
 BIN_OP_OR_uxn_c_l100_c6_cff9_return_output,
 step_cpu_phase_MUX_uxn_c_l100_c2_1441_return_output,
 BIN_OP_EQ_uxn_c_l103_c21_fc59_return_output,
 BIN_OP_PLUS_uxn_c_l103_c37_ea41_return_output,
 MUX_uxn_c_l103_c21_d308_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_1985_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_aff2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_aff2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_aff2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_1985_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_1985_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_1985_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_9974_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_9974_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_9974_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_9974_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_71e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_71e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_71e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_9f7b_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_9f7b_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_0a25_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_9f7b_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_9f7b_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_9f7b_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_9f7b_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_0a25_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_9f7b_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_9f7b_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_9f7b_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_9f7b_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_0a25_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_9f7b_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_9f7b_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_9f7b_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l75_c2_9f7b_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_9f7b_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_0a25_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_9f7b_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_9f7b_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_9f7b_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_9f7b_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_0a25_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_9f7b_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_9f7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_7a79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_7a79_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_7a79_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_0a25_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_0a25_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_0a25_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_0a25_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l83_c3_6dfd : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_0a25_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_0a25_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_0a25_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_0a25_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_0a25_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_0a25_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_0a25_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l82_c7_0a25_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_0a25_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_0a25_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_0a25_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_0a25_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_9bf6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_9bf6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_9bf6_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_0f5e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_6edb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_6edb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_6edb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_0f5e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_0f5e_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_0f5e_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_result : eval_opcode_result_t;
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_d020_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_d020_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_d020_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_d020_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_d020_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c64_a62e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c64_a62e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c64_a62e_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_d020_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c45_d020_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l88_c8_1cf2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_af45_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_1cf2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_1cf2_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_1cf2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_2eab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_26ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_0473_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l93_c40_df11_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l94_c41_5835_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l95_c30_3d75_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l96_c16_d650_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l97_c17_fd31_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l100_c6_cff9_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l100_c6_cff9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l100_c6_cff9_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_1441_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l101_c3_a205 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_1441_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_1441_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_1441_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_d308_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l103_c21_fc59_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l103_c21_fc59_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l103_c21_fc59_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_d308_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_d308_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l103_c37_ea41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l103_c37_ea41_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l103_c37_ea41_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_d308_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_4144_return_output : unsigned(15 downto 0);
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
     VAR_BIN_OP_EQ_uxn_c_l75_c6_71e1_right := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l101_c3_a205 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_1441_iftrue := VAR_step_cpu_phase_uxn_c_l101_c3_a205;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l69_c15_9974_iftrue := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l75_c2_9f7b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_9bf6_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l103_c21_d308_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_PLUS_uxn_c_l103_c37_ea41_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l82_c11_7a79_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l86_c9_6edb_right := to_unsigned(2, 2);
     VAR_BIN_OP_MINUS_uxn_c_l87_c64_a62e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l103_c21_fc59_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_iffalse := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_0a25_iftrue := cpu_step_result;
     VAR_MUX_uxn_c_l86_c9_0f5e_iffalse := ins;
     VAR_ins_MUX_uxn_c_l75_c2_9f7b_iftrue := ins;
     VAR_ins_MUX_uxn_c_l82_c7_0a25_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_0a25_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l68_c8_aff2_right := is_waiting;
     VAR_MUX_uxn_c_l69_c15_9974_iffalse := is_waiting;
     VAR_MUX_uxn_c_l68_c8_1985_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l87_c45_d020_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l86_c9_0f5e_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l87_c45_d020_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l75_c6_71e1_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l82_c11_7a79_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l86_c9_6edb_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l87_c64_a62e_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l103_c37_ea41_left := step_cpu_phase;
     VAR_BIN_OP_AND_uxn_c_l68_c8_aff2_left := VAR_use_vector;
     VAR_MUX_uxn_c_l69_c15_9974_cond := VAR_use_vector;
     VAR_MUX_uxn_c_l68_c8_1985_iftrue := VAR_vector;
     -- BIN_OP_EQ[uxn_c_l75_c6_71e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c6_71e1_left <= VAR_BIN_OP_EQ_uxn_c_l75_c6_71e1_left;
     BIN_OP_EQ_uxn_c_l75_c6_71e1_right <= VAR_BIN_OP_EQ_uxn_c_l75_c6_71e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c6_71e1_return_output := BIN_OP_EQ_uxn_c_l75_c6_71e1_return_output;

     -- MUX[uxn_c_l69_c15_9974] LATENCY=0
     -- Inputs
     MUX_uxn_c_l69_c15_9974_cond <= VAR_MUX_uxn_c_l69_c15_9974_cond;
     MUX_uxn_c_l69_c15_9974_iftrue <= VAR_MUX_uxn_c_l69_c15_9974_iftrue;
     MUX_uxn_c_l69_c15_9974_iffalse <= VAR_MUX_uxn_c_l69_c15_9974_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l69_c15_9974_return_output := MUX_uxn_c_l69_c15_9974_return_output;

     -- BIN_OP_PLUS[uxn_c_l103_c37_ea41] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l103_c37_ea41_left <= VAR_BIN_OP_PLUS_uxn_c_l103_c37_ea41_left;
     BIN_OP_PLUS_uxn_c_l103_c37_ea41_right <= VAR_BIN_OP_PLUS_uxn_c_l103_c37_ea41_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l103_c37_ea41_return_output := BIN_OP_PLUS_uxn_c_l103_c37_ea41_return_output;

     -- BIN_OP_AND[uxn_c_l68_c8_aff2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l68_c8_aff2_left <= VAR_BIN_OP_AND_uxn_c_l68_c8_aff2_left;
     BIN_OP_AND_uxn_c_l68_c8_aff2_right <= VAR_BIN_OP_AND_uxn_c_l68_c8_aff2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l68_c8_aff2_return_output := BIN_OP_AND_uxn_c_l68_c8_aff2_return_output;

     -- BIN_OP_MINUS[uxn_c_l87_c64_a62e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l87_c64_a62e_left <= VAR_BIN_OP_MINUS_uxn_c_l87_c64_a62e_left;
     BIN_OP_MINUS_uxn_c_l87_c64_a62e_right <= VAR_BIN_OP_MINUS_uxn_c_l87_c64_a62e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l87_c64_a62e_return_output := BIN_OP_MINUS_uxn_c_l87_c64_a62e_return_output;

     -- BIN_OP_EQ[uxn_c_l82_c11_7a79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l82_c11_7a79_left <= VAR_BIN_OP_EQ_uxn_c_l82_c11_7a79_left;
     BIN_OP_EQ_uxn_c_l82_c11_7a79_right <= VAR_BIN_OP_EQ_uxn_c_l82_c11_7a79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l82_c11_7a79_return_output := BIN_OP_EQ_uxn_c_l82_c11_7a79_return_output;

     -- BIN_OP_EQ[uxn_c_l86_c9_6edb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l86_c9_6edb_left <= VAR_BIN_OP_EQ_uxn_c_l86_c9_6edb_left;
     BIN_OP_EQ_uxn_c_l86_c9_6edb_right <= VAR_BIN_OP_EQ_uxn_c_l86_c9_6edb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l86_c9_6edb_return_output := BIN_OP_EQ_uxn_c_l86_c9_6edb_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l68_c8_1985_cond := VAR_BIN_OP_AND_uxn_c_l68_c8_aff2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_71e1_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_9f7b_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_71e1_return_output;
     VAR_ins_MUX_uxn_c_l75_c2_9f7b_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_71e1_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c2_9f7b_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_71e1_return_output;
     VAR_is_waiting_MUX_uxn_c_l75_c2_9f7b_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_71e1_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_9f7b_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_71e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_7a79_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_0a25_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_7a79_return_output;
     VAR_ins_MUX_uxn_c_l82_c7_0a25_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_7a79_return_output;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_0a25_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_7a79_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_0a25_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_7a79_return_output;
     VAR_pc_MUX_uxn_c_l82_c7_0a25_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_7a79_return_output;
     VAR_MUX_uxn_c_l86_c9_0f5e_cond := VAR_BIN_OP_EQ_uxn_c_l86_c9_6edb_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c45_d020_phase := VAR_BIN_OP_MINUS_uxn_c_l87_c64_a62e_return_output;
     VAR_MUX_uxn_c_l103_c21_d308_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l103_c37_ea41_return_output, 8);
     VAR_is_waiting_MUX_uxn_c_l75_c2_9f7b_iftrue := VAR_MUX_uxn_c_l69_c15_9974_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_0a25_iftrue := VAR_MUX_uxn_c_l69_c15_9974_return_output;
     -- MUX[uxn_c_l68_c8_1985] LATENCY=0
     -- Inputs
     MUX_uxn_c_l68_c8_1985_cond <= VAR_MUX_uxn_c_l68_c8_1985_cond;
     MUX_uxn_c_l68_c8_1985_iftrue <= VAR_MUX_uxn_c_l68_c8_1985_iftrue;
     MUX_uxn_c_l68_c8_1985_iffalse <= VAR_MUX_uxn_c_l68_c8_1985_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l68_c8_1985_return_output := MUX_uxn_c_l68_c8_1985_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c7_0a25] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_return_output;

     -- MUX[uxn_c_l86_c9_0f5e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l86_c9_0f5e_cond <= VAR_MUX_uxn_c_l86_c9_0f5e_cond;
     MUX_uxn_c_l86_c9_0f5e_iftrue <= VAR_MUX_uxn_c_l86_c9_0f5e_iftrue;
     MUX_uxn_c_l86_c9_0f5e_iffalse <= VAR_MUX_uxn_c_l86_c9_0f5e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l86_c9_0f5e_return_output := MUX_uxn_c_l86_c9_0f5e_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_0a25_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_9bf6_left := VAR_MUX_uxn_c_l68_c8_1985_return_output;
     VAR_MUX_uxn_c_l88_c8_1cf2_iffalse := VAR_MUX_uxn_c_l68_c8_1985_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c45_d020_pc := VAR_MUX_uxn_c_l68_c8_1985_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_9f7b_iftrue := VAR_MUX_uxn_c_l68_c8_1985_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c45_d020_ins := VAR_MUX_uxn_c_l86_c9_0f5e_return_output;
     VAR_ins_MUX_uxn_c_l82_c7_0a25_iffalse := VAR_MUX_uxn_c_l86_c9_0f5e_return_output;
     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228[uxn_c_l75_c2_9f7b] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l75_c2_9f7b_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228(
     cpu_step_result,
     VAR_MUX_uxn_c_l68_c8_1985_return_output,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- BIN_OP_PLUS[uxn_c_l83_c3_9bf6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l83_c3_9bf6_left <= VAR_BIN_OP_PLUS_uxn_c_l83_c3_9bf6_left;
     BIN_OP_PLUS_uxn_c_l83_c3_9bf6_right <= VAR_BIN_OP_PLUS_uxn_c_l83_c3_9bf6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_9bf6_return_output := BIN_OP_PLUS_uxn_c_l83_c3_9bf6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_3aa5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_return_output;

     -- ins_MUX[uxn_c_l82_c7_0a25] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l82_c7_0a25_cond <= VAR_ins_MUX_uxn_c_l82_c7_0a25_cond;
     ins_MUX_uxn_c_l82_c7_0a25_iftrue <= VAR_ins_MUX_uxn_c_l82_c7_0a25_iftrue;
     ins_MUX_uxn_c_l82_c7_0a25_iffalse <= VAR_ins_MUX_uxn_c_l82_c7_0a25_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l82_c7_0a25_return_output := ins_MUX_uxn_c_l82_c7_0a25_return_output;

     -- Submodule level 3
     VAR_pc_uxn_c_l83_c3_6dfd := resize(VAR_BIN_OP_PLUS_uxn_c_l83_c3_9bf6_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l87_c45_d020_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_3aa5_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_9f7b_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l75_c2_9f7b_return_output;
     VAR_ins_MUX_uxn_c_l75_c2_9f7b_iffalse := VAR_ins_MUX_uxn_c_l82_c7_0a25_return_output;
     VAR_pc_MUX_uxn_c_l82_c7_0a25_iftrue := VAR_pc_uxn_c_l83_c3_6dfd;
     -- eval_opcode_phased[uxn_c_l87_c45_d020] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l87_c45_d020_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l87_c45_d020_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l87_c45_d020_phase <= VAR_eval_opcode_phased_uxn_c_l87_c45_d020_phase;
     eval_opcode_phased_uxn_c_l87_c45_d020_ins <= VAR_eval_opcode_phased_uxn_c_l87_c45_d020_ins;
     eval_opcode_phased_uxn_c_l87_c45_d020_pc <= VAR_eval_opcode_phased_uxn_c_l87_c45_d020_pc;
     eval_opcode_phased_uxn_c_l87_c45_d020_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l87_c45_d020_previous_ram_read;
     eval_opcode_phased_uxn_c_l87_c45_d020_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l87_c45_d020_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l87_c45_d020_return_output := eval_opcode_phased_uxn_c_l87_c45_d020_return_output;

     -- ins_MUX[uxn_c_l75_c2_9f7b] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l75_c2_9f7b_cond <= VAR_ins_MUX_uxn_c_l75_c2_9f7b_cond;
     ins_MUX_uxn_c_l75_c2_9f7b_iftrue <= VAR_ins_MUX_uxn_c_l75_c2_9f7b_iftrue;
     ins_MUX_uxn_c_l75_c2_9f7b_iffalse <= VAR_ins_MUX_uxn_c_l75_c2_9f7b_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l75_c2_9f7b_return_output := ins_MUX_uxn_c_l75_c2_9f7b_return_output;

     -- Submodule level 4
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l75_c2_9f7b_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l92_c38_0473] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_0473_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_d020_return_output.vram_write_layer;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_4144 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_4144_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_d020_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l89_c34_2eab] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_2eab_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_d020_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l95_c30_3d75] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l95_c30_3d75_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_d020_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l94_c41_5835] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l94_c41_5835_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_d020_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l91_c35_26ea] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_26ea_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_d020_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l93_c40_df11] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l93_c40_df11_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_d020_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l96_c16_d650] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l96_c16_d650_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_d020_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l97_c17_fd31] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l97_c17_fd31_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_d020_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l88_c8_af45] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_af45_return_output := VAR_eval_opcode_phased_uxn_c_l87_c45_d020_return_output.is_pc_updated;

     -- Submodule level 5
     VAR_MUX_uxn_c_l88_c8_1cf2_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_4144_return_output;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_0a25_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l97_c17_fd31_return_output;
     VAR_MUX_uxn_c_l88_c8_1cf2_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_af45_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_0a25_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l96_c16_d650_return_output;
     -- is_waiting_MUX[uxn_c_l82_c7_0a25] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l82_c7_0a25_cond <= VAR_is_waiting_MUX_uxn_c_l82_c7_0a25_cond;
     is_waiting_MUX_uxn_c_l82_c7_0a25_iftrue <= VAR_is_waiting_MUX_uxn_c_l82_c7_0a25_iftrue;
     is_waiting_MUX_uxn_c_l82_c7_0a25_iffalse <= VAR_is_waiting_MUX_uxn_c_l82_c7_0a25_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l82_c7_0a25_return_output := is_waiting_MUX_uxn_c_l82_c7_0a25_return_output;

     -- MUX[uxn_c_l88_c8_1cf2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l88_c8_1cf2_cond <= VAR_MUX_uxn_c_l88_c8_1cf2_cond;
     MUX_uxn_c_l88_c8_1cf2_iftrue <= VAR_MUX_uxn_c_l88_c8_1cf2_iftrue;
     MUX_uxn_c_l88_c8_1cf2_iffalse <= VAR_MUX_uxn_c_l88_c8_1cf2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l88_c8_1cf2_return_output := MUX_uxn_c_l88_c8_1cf2_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0[uxn_c_l82_c7_0a25] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l82_c7_0a25_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_2eab_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_4144_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_26ea_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_0473_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l93_c40_df11_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l94_c41_5835_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l95_c30_3d75_return_output);

     -- is_ins_done_MUX[uxn_c_l82_c7_0a25] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l82_c7_0a25_cond <= VAR_is_ins_done_MUX_uxn_c_l82_c7_0a25_cond;
     is_ins_done_MUX_uxn_c_l82_c7_0a25_iftrue <= VAR_is_ins_done_MUX_uxn_c_l82_c7_0a25_iftrue;
     is_ins_done_MUX_uxn_c_l82_c7_0a25_iffalse <= VAR_is_ins_done_MUX_uxn_c_l82_c7_0a25_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l82_c7_0a25_return_output := is_ins_done_MUX_uxn_c_l82_c7_0a25_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l82_c7_0a25_iffalse := VAR_MUX_uxn_c_l88_c8_1cf2_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_0a25_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l82_c7_0a25_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c2_9f7b_iffalse := VAR_is_ins_done_MUX_uxn_c_l82_c7_0a25_return_output;
     VAR_is_waiting_MUX_uxn_c_l75_c2_9f7b_iffalse := VAR_is_waiting_MUX_uxn_c_l82_c7_0a25_return_output;
     -- is_waiting_MUX[uxn_c_l75_c2_9f7b] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l75_c2_9f7b_cond <= VAR_is_waiting_MUX_uxn_c_l75_c2_9f7b_cond;
     is_waiting_MUX_uxn_c_l75_c2_9f7b_iftrue <= VAR_is_waiting_MUX_uxn_c_l75_c2_9f7b_iftrue;
     is_waiting_MUX_uxn_c_l75_c2_9f7b_iffalse <= VAR_is_waiting_MUX_uxn_c_l75_c2_9f7b_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l75_c2_9f7b_return_output := is_waiting_MUX_uxn_c_l75_c2_9f7b_return_output;

     -- cpu_step_result_MUX[uxn_c_l82_c7_0a25] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l82_c7_0a25_cond <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_0a25_cond;
     cpu_step_result_MUX_uxn_c_l82_c7_0a25_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_0a25_iftrue;
     cpu_step_result_MUX_uxn_c_l82_c7_0a25_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_0a25_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_0a25_return_output := cpu_step_result_MUX_uxn_c_l82_c7_0a25_return_output;

     -- pc_MUX[uxn_c_l82_c7_0a25] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l82_c7_0a25_cond <= VAR_pc_MUX_uxn_c_l82_c7_0a25_cond;
     pc_MUX_uxn_c_l82_c7_0a25_iftrue <= VAR_pc_MUX_uxn_c_l82_c7_0a25_iftrue;
     pc_MUX_uxn_c_l82_c7_0a25_iffalse <= VAR_pc_MUX_uxn_c_l82_c7_0a25_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l82_c7_0a25_return_output := pc_MUX_uxn_c_l82_c7_0a25_return_output;

     -- is_ins_done_MUX[uxn_c_l75_c2_9f7b] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l75_c2_9f7b_cond <= VAR_is_ins_done_MUX_uxn_c_l75_c2_9f7b_cond;
     is_ins_done_MUX_uxn_c_l75_c2_9f7b_iftrue <= VAR_is_ins_done_MUX_uxn_c_l75_c2_9f7b_iftrue;
     is_ins_done_MUX_uxn_c_l75_c2_9f7b_iffalse <= VAR_is_ins_done_MUX_uxn_c_l75_c2_9f7b_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l75_c2_9f7b_return_output := is_ins_done_MUX_uxn_c_l75_c2_9f7b_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_9f7b_iffalse := VAR_cpu_step_result_MUX_uxn_c_l82_c7_0a25_return_output;
     VAR_BIN_OP_OR_uxn_c_l100_c6_cff9_left := VAR_is_ins_done_MUX_uxn_c_l75_c2_9f7b_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l75_c2_9f7b_return_output;
     VAR_BIN_OP_OR_uxn_c_l100_c6_cff9_right := VAR_is_waiting_MUX_uxn_c_l75_c2_9f7b_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l75_c2_9f7b_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_9f7b_iffalse := VAR_pc_MUX_uxn_c_l82_c7_0a25_return_output;
     -- cpu_step_result_MUX[uxn_c_l75_c2_9f7b] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l75_c2_9f7b_cond <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_9f7b_cond;
     cpu_step_result_MUX_uxn_c_l75_c2_9f7b_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_9f7b_iftrue;
     cpu_step_result_MUX_uxn_c_l75_c2_9f7b_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_9f7b_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_9f7b_return_output := cpu_step_result_MUX_uxn_c_l75_c2_9f7b_return_output;

     -- pc_MUX[uxn_c_l75_c2_9f7b] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l75_c2_9f7b_cond <= VAR_pc_MUX_uxn_c_l75_c2_9f7b_cond;
     pc_MUX_uxn_c_l75_c2_9f7b_iftrue <= VAR_pc_MUX_uxn_c_l75_c2_9f7b_iftrue;
     pc_MUX_uxn_c_l75_c2_9f7b_iffalse <= VAR_pc_MUX_uxn_c_l75_c2_9f7b_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l75_c2_9f7b_return_output := pc_MUX_uxn_c_l75_c2_9f7b_return_output;

     -- BIN_OP_OR[uxn_c_l100_c6_cff9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l100_c6_cff9_left <= VAR_BIN_OP_OR_uxn_c_l100_c6_cff9_left;
     BIN_OP_OR_uxn_c_l100_c6_cff9_right <= VAR_BIN_OP_OR_uxn_c_l100_c6_cff9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l100_c6_cff9_return_output := BIN_OP_OR_uxn_c_l100_c6_cff9_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_1441_cond := VAR_BIN_OP_OR_uxn_c_l100_c6_cff9_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l75_c2_9f7b_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l75_c2_9f7b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l103_c21_fc59_left := VAR_pc_MUX_uxn_c_l75_c2_9f7b_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l75_c2_9f7b_return_output;
     -- BIN_OP_EQ[uxn_c_l103_c21_fc59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l103_c21_fc59_left <= VAR_BIN_OP_EQ_uxn_c_l103_c21_fc59_left;
     BIN_OP_EQ_uxn_c_l103_c21_fc59_right <= VAR_BIN_OP_EQ_uxn_c_l103_c21_fc59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l103_c21_fc59_return_output := BIN_OP_EQ_uxn_c_l103_c21_fc59_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l103_c21_d308_cond := VAR_BIN_OP_EQ_uxn_c_l103_c21_fc59_return_output;
     -- MUX[uxn_c_l103_c21_d308] LATENCY=0
     -- Inputs
     MUX_uxn_c_l103_c21_d308_cond <= VAR_MUX_uxn_c_l103_c21_d308_cond;
     MUX_uxn_c_l103_c21_d308_iftrue <= VAR_MUX_uxn_c_l103_c21_d308_iftrue;
     MUX_uxn_c_l103_c21_d308_iffalse <= VAR_MUX_uxn_c_l103_c21_d308_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l103_c21_d308_return_output := MUX_uxn_c_l103_c21_d308_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_1441_iffalse := VAR_MUX_uxn_c_l103_c21_d308_return_output;
     -- step_cpu_phase_MUX[uxn_c_l100_c2_1441] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l100_c2_1441_cond <= VAR_step_cpu_phase_MUX_uxn_c_l100_c2_1441_cond;
     step_cpu_phase_MUX_uxn_c_l100_c2_1441_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l100_c2_1441_iftrue;
     step_cpu_phase_MUX_uxn_c_l100_c2_1441_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l100_c2_1441_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_1441_return_output := step_cpu_phase_MUX_uxn_c_l100_c2_1441_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l100_c2_1441_return_output;
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
