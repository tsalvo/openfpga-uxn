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
entity step_cpu_0CLK_4faf9571 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 use_vector : in unsigned(0 downto 0);
 vector : in unsigned(15 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_4faf9571;
architecture arch of step_cpu_0CLK_4faf9571 is
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
-- BIN_OP_AND[uxn_c_l67_c8_c6e2]
signal BIN_OP_AND_uxn_c_l67_c8_c6e2_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l67_c8_c6e2_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l67_c8_c6e2_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l67_c8_de96]
signal MUX_uxn_c_l67_c8_de96_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l67_c8_de96_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l67_c8_de96_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l67_c8_de96_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l68_c15_c5e2]
signal MUX_uxn_c_l68_c15_c5e2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l68_c15_c5e2_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l68_c15_c5e2_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l68_c15_c5e2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l74_c6_5530]
signal BIN_OP_EQ_uxn_c_l74_c6_5530_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c6_5530_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c6_5530_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c7_30d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_return_output : unsigned(0 downto 0);

-- is_waiting_MUX[uxn_c_l74_c2_2e12]
signal is_waiting_MUX_uxn_c_l74_c2_2e12_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l74_c2_2e12_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l74_c2_2e12_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l74_c2_2e12_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l74_c2_2e12]
signal cpu_step_result_MUX_uxn_c_l74_c2_2e12_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l74_c2_2e12_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l74_c2_2e12_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l74_c2_2e12_return_output : cpu_step_result_t;

-- is_ins_done_MUX[uxn_c_l74_c2_2e12]
signal is_ins_done_MUX_uxn_c_l74_c2_2e12_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c2_2e12_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c2_2e12_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c2_2e12_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l74_c2_2e12]
signal pc_MUX_uxn_c_l74_c2_2e12_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l74_c2_2e12_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c2_2e12_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c2_2e12_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l74_c2_2e12]
signal ins_MUX_uxn_c_l74_c2_2e12_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l74_c2_2e12_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c2_2e12_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c2_2e12_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l81_c11_3e0e]
signal BIN_OP_EQ_uxn_c_l81_c11_3e0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c11_3e0e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c11_3e0e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l84_c1_1b77]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_return_output : unsigned(0 downto 0);

-- is_waiting_MUX[uxn_c_l81_c7_30d4]
signal is_waiting_MUX_uxn_c_l81_c7_30d4_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l81_c7_30d4_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l81_c7_30d4_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l81_c7_30d4_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l81_c7_30d4]
signal cpu_step_result_MUX_uxn_c_l81_c7_30d4_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l81_c7_30d4_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l81_c7_30d4_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l81_c7_30d4_return_output : cpu_step_result_t;

-- is_ins_done_MUX[uxn_c_l81_c7_30d4]
signal is_ins_done_MUX_uxn_c_l81_c7_30d4_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l81_c7_30d4_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l81_c7_30d4_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l81_c7_30d4_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l81_c7_30d4]
signal pc_MUX_uxn_c_l81_c7_30d4_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l81_c7_30d4_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l81_c7_30d4_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l81_c7_30d4_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l81_c7_30d4]
signal ins_MUX_uxn_c_l81_c7_30d4_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l81_c7_30d4_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l81_c7_30d4_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l81_c7_30d4_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l82_c3_627f]
signal BIN_OP_PLUS_uxn_c_l82_c3_627f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_627f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_627f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l85_c9_2da6]
signal BIN_OP_EQ_uxn_c_l85_c9_2da6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l85_c9_2da6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l85_c9_2da6_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l85_c9_77bd]
signal MUX_uxn_c_l85_c9_77bd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l85_c9_77bd_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l85_c9_77bd_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l85_c9_77bd_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l86_c64_52cb]
signal BIN_OP_MINUS_uxn_c_l86_c64_52cb_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c64_52cb_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c64_52cb_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l86_c45_ca8e]
signal eval_opcode_phased_uxn_c_l86_c45_ca8e_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_ca8e_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_ca8e_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_ca8e_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_ca8e_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_ca8e_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l87_c8_c516]
signal MUX_uxn_c_l87_c8_c516_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l87_c8_c516_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_c516_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_c516_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l99_c6_f33f]
signal BIN_OP_OR_uxn_c_l99_c6_f33f_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l99_c6_f33f_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l99_c6_f33f_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l99_c2_0d6b]
signal step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l102_c21_990f]
signal BIN_OP_EQ_uxn_c_l102_c21_990f_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c21_990f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c21_990f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l102_c37_75a7]
signal BIN_OP_PLUS_uxn_c_l102_c37_75a7_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c37_75a7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c37_75a7_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l102_c21_a2f9]
signal MUX_uxn_c_l102_c21_a2f9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l102_c21_a2f9_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l102_c21_a2f9_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l102_c21_a2f9_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_c_l67_c8_c6e2
BIN_OP_AND_uxn_c_l67_c8_c6e2 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l67_c8_c6e2_left,
BIN_OP_AND_uxn_c_l67_c8_c6e2_right,
BIN_OP_AND_uxn_c_l67_c8_c6e2_return_output);

-- MUX_uxn_c_l67_c8_de96
MUX_uxn_c_l67_c8_de96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l67_c8_de96_cond,
MUX_uxn_c_l67_c8_de96_iftrue,
MUX_uxn_c_l67_c8_de96_iffalse,
MUX_uxn_c_l67_c8_de96_return_output);

-- MUX_uxn_c_l68_c15_c5e2
MUX_uxn_c_l68_c15_c5e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l68_c15_c5e2_cond,
MUX_uxn_c_l68_c15_c5e2_iftrue,
MUX_uxn_c_l68_c15_c5e2_iffalse,
MUX_uxn_c_l68_c15_c5e2_return_output);

-- BIN_OP_EQ_uxn_c_l74_c6_5530
BIN_OP_EQ_uxn_c_l74_c6_5530 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l74_c6_5530_left,
BIN_OP_EQ_uxn_c_l74_c6_5530_right,
BIN_OP_EQ_uxn_c_l74_c6_5530_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_return_output);

-- is_waiting_MUX_uxn_c_l74_c2_2e12
is_waiting_MUX_uxn_c_l74_c2_2e12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l74_c2_2e12_cond,
is_waiting_MUX_uxn_c_l74_c2_2e12_iftrue,
is_waiting_MUX_uxn_c_l74_c2_2e12_iffalse,
is_waiting_MUX_uxn_c_l74_c2_2e12_return_output);

-- cpu_step_result_MUX_uxn_c_l74_c2_2e12
cpu_step_result_MUX_uxn_c_l74_c2_2e12 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l74_c2_2e12_cond,
cpu_step_result_MUX_uxn_c_l74_c2_2e12_iftrue,
cpu_step_result_MUX_uxn_c_l74_c2_2e12_iffalse,
cpu_step_result_MUX_uxn_c_l74_c2_2e12_return_output);

-- is_ins_done_MUX_uxn_c_l74_c2_2e12
is_ins_done_MUX_uxn_c_l74_c2_2e12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l74_c2_2e12_cond,
is_ins_done_MUX_uxn_c_l74_c2_2e12_iftrue,
is_ins_done_MUX_uxn_c_l74_c2_2e12_iffalse,
is_ins_done_MUX_uxn_c_l74_c2_2e12_return_output);

-- pc_MUX_uxn_c_l74_c2_2e12
pc_MUX_uxn_c_l74_c2_2e12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l74_c2_2e12_cond,
pc_MUX_uxn_c_l74_c2_2e12_iftrue,
pc_MUX_uxn_c_l74_c2_2e12_iffalse,
pc_MUX_uxn_c_l74_c2_2e12_return_output);

-- ins_MUX_uxn_c_l74_c2_2e12
ins_MUX_uxn_c_l74_c2_2e12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l74_c2_2e12_cond,
ins_MUX_uxn_c_l74_c2_2e12_iftrue,
ins_MUX_uxn_c_l74_c2_2e12_iffalse,
ins_MUX_uxn_c_l74_c2_2e12_return_output);

-- BIN_OP_EQ_uxn_c_l81_c11_3e0e
BIN_OP_EQ_uxn_c_l81_c11_3e0e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l81_c11_3e0e_left,
BIN_OP_EQ_uxn_c_l81_c11_3e0e_right,
BIN_OP_EQ_uxn_c_l81_c11_3e0e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_return_output);

-- is_waiting_MUX_uxn_c_l81_c7_30d4
is_waiting_MUX_uxn_c_l81_c7_30d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l81_c7_30d4_cond,
is_waiting_MUX_uxn_c_l81_c7_30d4_iftrue,
is_waiting_MUX_uxn_c_l81_c7_30d4_iffalse,
is_waiting_MUX_uxn_c_l81_c7_30d4_return_output);

-- cpu_step_result_MUX_uxn_c_l81_c7_30d4
cpu_step_result_MUX_uxn_c_l81_c7_30d4 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l81_c7_30d4_cond,
cpu_step_result_MUX_uxn_c_l81_c7_30d4_iftrue,
cpu_step_result_MUX_uxn_c_l81_c7_30d4_iffalse,
cpu_step_result_MUX_uxn_c_l81_c7_30d4_return_output);

-- is_ins_done_MUX_uxn_c_l81_c7_30d4
is_ins_done_MUX_uxn_c_l81_c7_30d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l81_c7_30d4_cond,
is_ins_done_MUX_uxn_c_l81_c7_30d4_iftrue,
is_ins_done_MUX_uxn_c_l81_c7_30d4_iffalse,
is_ins_done_MUX_uxn_c_l81_c7_30d4_return_output);

-- pc_MUX_uxn_c_l81_c7_30d4
pc_MUX_uxn_c_l81_c7_30d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l81_c7_30d4_cond,
pc_MUX_uxn_c_l81_c7_30d4_iftrue,
pc_MUX_uxn_c_l81_c7_30d4_iffalse,
pc_MUX_uxn_c_l81_c7_30d4_return_output);

-- ins_MUX_uxn_c_l81_c7_30d4
ins_MUX_uxn_c_l81_c7_30d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l81_c7_30d4_cond,
ins_MUX_uxn_c_l81_c7_30d4_iftrue,
ins_MUX_uxn_c_l81_c7_30d4_iffalse,
ins_MUX_uxn_c_l81_c7_30d4_return_output);

-- BIN_OP_PLUS_uxn_c_l82_c3_627f
BIN_OP_PLUS_uxn_c_l82_c3_627f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l82_c3_627f_left,
BIN_OP_PLUS_uxn_c_l82_c3_627f_right,
BIN_OP_PLUS_uxn_c_l82_c3_627f_return_output);

-- BIN_OP_EQ_uxn_c_l85_c9_2da6
BIN_OP_EQ_uxn_c_l85_c9_2da6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l85_c9_2da6_left,
BIN_OP_EQ_uxn_c_l85_c9_2da6_right,
BIN_OP_EQ_uxn_c_l85_c9_2da6_return_output);

-- MUX_uxn_c_l85_c9_77bd
MUX_uxn_c_l85_c9_77bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l85_c9_77bd_cond,
MUX_uxn_c_l85_c9_77bd_iftrue,
MUX_uxn_c_l85_c9_77bd_iffalse,
MUX_uxn_c_l85_c9_77bd_return_output);

-- BIN_OP_MINUS_uxn_c_l86_c64_52cb
BIN_OP_MINUS_uxn_c_l86_c64_52cb : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l86_c64_52cb_left,
BIN_OP_MINUS_uxn_c_l86_c64_52cb_right,
BIN_OP_MINUS_uxn_c_l86_c64_52cb_return_output);

-- eval_opcode_phased_uxn_c_l86_c45_ca8e
eval_opcode_phased_uxn_c_l86_c45_ca8e : entity work.eval_opcode_phased_0CLK_de56be10 port map (
clk,
eval_opcode_phased_uxn_c_l86_c45_ca8e_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l86_c45_ca8e_phase,
eval_opcode_phased_uxn_c_l86_c45_ca8e_ins,
eval_opcode_phased_uxn_c_l86_c45_ca8e_pc,
eval_opcode_phased_uxn_c_l86_c45_ca8e_previous_ram_read,
eval_opcode_phased_uxn_c_l86_c45_ca8e_previous_device_ram_read,
eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output);

-- MUX_uxn_c_l87_c8_c516
MUX_uxn_c_l87_c8_c516 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l87_c8_c516_cond,
MUX_uxn_c_l87_c8_c516_iftrue,
MUX_uxn_c_l87_c8_c516_iffalse,
MUX_uxn_c_l87_c8_c516_return_output);

-- BIN_OP_OR_uxn_c_l99_c6_f33f
BIN_OP_OR_uxn_c_l99_c6_f33f : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l99_c6_f33f_left,
BIN_OP_OR_uxn_c_l99_c6_f33f_right,
BIN_OP_OR_uxn_c_l99_c6_f33f_return_output);

-- step_cpu_phase_MUX_uxn_c_l99_c2_0d6b
step_cpu_phase_MUX_uxn_c_l99_c2_0d6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_cond,
step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_iftrue,
step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_iffalse,
step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_return_output);

-- BIN_OP_EQ_uxn_c_l102_c21_990f
BIN_OP_EQ_uxn_c_l102_c21_990f : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l102_c21_990f_left,
BIN_OP_EQ_uxn_c_l102_c21_990f_right,
BIN_OP_EQ_uxn_c_l102_c21_990f_return_output);

-- BIN_OP_PLUS_uxn_c_l102_c37_75a7
BIN_OP_PLUS_uxn_c_l102_c37_75a7 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l102_c37_75a7_left,
BIN_OP_PLUS_uxn_c_l102_c37_75a7_right,
BIN_OP_PLUS_uxn_c_l102_c37_75a7_return_output);

-- MUX_uxn_c_l102_c21_a2f9
MUX_uxn_c_l102_c21_a2f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l102_c21_a2f9_cond,
MUX_uxn_c_l102_c21_a2f9_iftrue,
MUX_uxn_c_l102_c21_a2f9_iffalse,
MUX_uxn_c_l102_c21_a2f9_return_output);



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
 BIN_OP_AND_uxn_c_l67_c8_c6e2_return_output,
 MUX_uxn_c_l67_c8_de96_return_output,
 MUX_uxn_c_l68_c15_c5e2_return_output,
 BIN_OP_EQ_uxn_c_l74_c6_5530_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_return_output,
 is_waiting_MUX_uxn_c_l74_c2_2e12_return_output,
 cpu_step_result_MUX_uxn_c_l74_c2_2e12_return_output,
 is_ins_done_MUX_uxn_c_l74_c2_2e12_return_output,
 pc_MUX_uxn_c_l74_c2_2e12_return_output,
 ins_MUX_uxn_c_l74_c2_2e12_return_output,
 BIN_OP_EQ_uxn_c_l81_c11_3e0e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_return_output,
 is_waiting_MUX_uxn_c_l81_c7_30d4_return_output,
 cpu_step_result_MUX_uxn_c_l81_c7_30d4_return_output,
 is_ins_done_MUX_uxn_c_l81_c7_30d4_return_output,
 pc_MUX_uxn_c_l81_c7_30d4_return_output,
 ins_MUX_uxn_c_l81_c7_30d4_return_output,
 BIN_OP_PLUS_uxn_c_l82_c3_627f_return_output,
 BIN_OP_EQ_uxn_c_l85_c9_2da6_return_output,
 MUX_uxn_c_l85_c9_77bd_return_output,
 BIN_OP_MINUS_uxn_c_l86_c64_52cb_return_output,
 eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output,
 MUX_uxn_c_l87_c8_c516_return_output,
 BIN_OP_OR_uxn_c_l99_c6_f33f_return_output,
 step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_return_output,
 BIN_OP_EQ_uxn_c_l102_c21_990f_return_output,
 BIN_OP_PLUS_uxn_c_l102_c37_75a7_return_output,
 MUX_uxn_c_l102_c21_a2f9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l67_c8_de96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l67_c8_c6e2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l67_c8_c6e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l67_c8_c6e2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l67_c8_de96_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l67_c8_de96_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l67_c8_de96_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c15_c5e2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l68_c15_c5e2_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l68_c15_c5e2_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l68_c15_c5e2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_5530_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_5530_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_5530_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_2e12_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_2e12_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_30d4_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_2e12_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_2e12_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c2_2e12_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l74_c2_2e12_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c2_2e12_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l81_c7_30d4_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c2_2e12_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l74_c2_2e12_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_2e12_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_2e12_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_30d4_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_2e12_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_2e12_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_2e12_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_2e12_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_30d4_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_2e12_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_2e12_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_2e12_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_2e12_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_30d4_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_2e12_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_2e12_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_3e0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_3e0e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_3e0e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_30d4_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_30d4_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_30d4_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l81_c7_30d4_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l81_c7_30d4_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l81_c7_30d4_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l81_c7_30d4_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_30d4_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_30d4_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_30d4_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_30d4_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l82_c3_a6d0 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_30d4_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_30d4_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_30d4_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_30d4_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_30d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_627f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_627f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_627f_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_77bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l85_c9_2da6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l85_c9_2da6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l85_c9_2da6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_77bd_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_77bd_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_77bd_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_result : eval_opcode_result_t;
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c64_52cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c64_52cb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c64_52cb_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l87_c8_c516_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_44f3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_c516_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_c516_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_c516_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l88_c34_fcd1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l90_c35_a1a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l91_c38_a3ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l92_c40_6df3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l93_c41_1ecb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l94_c30_087c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l95_c16_3209_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l96_c17_7309_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l99_c6_f33f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l99_c6_f33f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l99_c6_f33f_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l100_c3_30fc : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_a2f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c21_990f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c21_990f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c21_990f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_a2f9_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_a2f9_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c37_75a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c37_75a7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c37_75a7_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_a2f9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l89_l87_DUPLICATE_2fe7_return_output : unsigned(15 downto 0);
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
     VAR_is_ins_done_MUX_uxn_c_l74_c2_2e12_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l85_c9_2da6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l102_c21_990f_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l68_c15_c5e2_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l86_c64_52cb_right := to_unsigned(2, 2);
     VAR_step_cpu_phase_uxn_c_l100_c3_30fc := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_iftrue := VAR_step_cpu_phase_uxn_c_l100_c3_30fc;
     VAR_MUX_uxn_c_l102_c21_a2f9_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_c_l81_c11_3e0e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l74_c6_5530_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l102_c37_75a7_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_627f_right := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_iffalse := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l81_c7_30d4_iftrue := cpu_step_result;
     VAR_MUX_uxn_c_l85_c9_77bd_iffalse := ins;
     VAR_ins_MUX_uxn_c_l74_c2_2e12_iftrue := ins;
     VAR_ins_MUX_uxn_c_l81_c7_30d4_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l81_c7_30d4_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l67_c8_c6e2_right := is_waiting;
     VAR_MUX_uxn_c_l68_c15_c5e2_iffalse := is_waiting;
     VAR_MUX_uxn_c_l67_c8_de96_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l85_c9_77bd_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l74_c6_5530_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l81_c11_3e0e_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l85_c9_2da6_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l86_c64_52cb_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l102_c37_75a7_left := step_cpu_phase;
     VAR_BIN_OP_AND_uxn_c_l67_c8_c6e2_left := VAR_use_vector;
     VAR_MUX_uxn_c_l68_c15_c5e2_cond := VAR_use_vector;
     VAR_MUX_uxn_c_l67_c8_de96_iftrue := VAR_vector;
     -- BIN_OP_EQ[uxn_c_l74_c6_5530] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l74_c6_5530_left <= VAR_BIN_OP_EQ_uxn_c_l74_c6_5530_left;
     BIN_OP_EQ_uxn_c_l74_c6_5530_right <= VAR_BIN_OP_EQ_uxn_c_l74_c6_5530_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l74_c6_5530_return_output := BIN_OP_EQ_uxn_c_l74_c6_5530_return_output;

     -- BIN_OP_PLUS[uxn_c_l102_c37_75a7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l102_c37_75a7_left <= VAR_BIN_OP_PLUS_uxn_c_l102_c37_75a7_left;
     BIN_OP_PLUS_uxn_c_l102_c37_75a7_right <= VAR_BIN_OP_PLUS_uxn_c_l102_c37_75a7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l102_c37_75a7_return_output := BIN_OP_PLUS_uxn_c_l102_c37_75a7_return_output;

     -- BIN_OP_AND[uxn_c_l67_c8_c6e2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l67_c8_c6e2_left <= VAR_BIN_OP_AND_uxn_c_l67_c8_c6e2_left;
     BIN_OP_AND_uxn_c_l67_c8_c6e2_right <= VAR_BIN_OP_AND_uxn_c_l67_c8_c6e2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l67_c8_c6e2_return_output := BIN_OP_AND_uxn_c_l67_c8_c6e2_return_output;

     -- BIN_OP_EQ[uxn_c_l85_c9_2da6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l85_c9_2da6_left <= VAR_BIN_OP_EQ_uxn_c_l85_c9_2da6_left;
     BIN_OP_EQ_uxn_c_l85_c9_2da6_right <= VAR_BIN_OP_EQ_uxn_c_l85_c9_2da6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l85_c9_2da6_return_output := BIN_OP_EQ_uxn_c_l85_c9_2da6_return_output;

     -- BIN_OP_EQ[uxn_c_l81_c11_3e0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l81_c11_3e0e_left <= VAR_BIN_OP_EQ_uxn_c_l81_c11_3e0e_left;
     BIN_OP_EQ_uxn_c_l81_c11_3e0e_right <= VAR_BIN_OP_EQ_uxn_c_l81_c11_3e0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l81_c11_3e0e_return_output := BIN_OP_EQ_uxn_c_l81_c11_3e0e_return_output;

     -- BIN_OP_MINUS[uxn_c_l86_c64_52cb] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l86_c64_52cb_left <= VAR_BIN_OP_MINUS_uxn_c_l86_c64_52cb_left;
     BIN_OP_MINUS_uxn_c_l86_c64_52cb_right <= VAR_BIN_OP_MINUS_uxn_c_l86_c64_52cb_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l86_c64_52cb_return_output := BIN_OP_MINUS_uxn_c_l86_c64_52cb_return_output;

     -- MUX[uxn_c_l68_c15_c5e2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l68_c15_c5e2_cond <= VAR_MUX_uxn_c_l68_c15_c5e2_cond;
     MUX_uxn_c_l68_c15_c5e2_iftrue <= VAR_MUX_uxn_c_l68_c15_c5e2_iftrue;
     MUX_uxn_c_l68_c15_c5e2_iffalse <= VAR_MUX_uxn_c_l68_c15_c5e2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l68_c15_c5e2_return_output := MUX_uxn_c_l68_c15_c5e2_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l67_c8_de96_cond := VAR_BIN_OP_AND_uxn_c_l67_c8_c6e2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_5530_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l74_c2_2e12_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_5530_return_output;
     VAR_ins_MUX_uxn_c_l74_c2_2e12_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_5530_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c2_2e12_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_5530_return_output;
     VAR_is_waiting_MUX_uxn_c_l74_c2_2e12_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_5530_return_output;
     VAR_pc_MUX_uxn_c_l74_c2_2e12_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_5530_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_3e0e_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l81_c7_30d4_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_3e0e_return_output;
     VAR_ins_MUX_uxn_c_l81_c7_30d4_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_3e0e_return_output;
     VAR_is_ins_done_MUX_uxn_c_l81_c7_30d4_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_3e0e_return_output;
     VAR_is_waiting_MUX_uxn_c_l81_c7_30d4_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_3e0e_return_output;
     VAR_pc_MUX_uxn_c_l81_c7_30d4_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_3e0e_return_output;
     VAR_MUX_uxn_c_l85_c9_77bd_cond := VAR_BIN_OP_EQ_uxn_c_l85_c9_2da6_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_phase := VAR_BIN_OP_MINUS_uxn_c_l86_c64_52cb_return_output;
     VAR_MUX_uxn_c_l102_c21_a2f9_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l102_c37_75a7_return_output, 8);
     VAR_is_waiting_MUX_uxn_c_l74_c2_2e12_iftrue := VAR_MUX_uxn_c_l68_c15_c5e2_return_output;
     VAR_is_waiting_MUX_uxn_c_l81_c7_30d4_iftrue := VAR_MUX_uxn_c_l68_c15_c5e2_return_output;
     -- MUX[uxn_c_l85_c9_77bd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l85_c9_77bd_cond <= VAR_MUX_uxn_c_l85_c9_77bd_cond;
     MUX_uxn_c_l85_c9_77bd_iftrue <= VAR_MUX_uxn_c_l85_c9_77bd_iftrue;
     MUX_uxn_c_l85_c9_77bd_iffalse <= VAR_MUX_uxn_c_l85_c9_77bd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l85_c9_77bd_return_output := MUX_uxn_c_l85_c9_77bd_return_output;

     -- MUX[uxn_c_l67_c8_de96] LATENCY=0
     -- Inputs
     MUX_uxn_c_l67_c8_de96_cond <= VAR_MUX_uxn_c_l67_c8_de96_cond;
     MUX_uxn_c_l67_c8_de96_iftrue <= VAR_MUX_uxn_c_l67_c8_de96_iftrue;
     MUX_uxn_c_l67_c8_de96_iffalse <= VAR_MUX_uxn_c_l67_c8_de96_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l67_c8_de96_return_output := MUX_uxn_c_l67_c8_de96_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c7_30d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_30d4_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_627f_left := VAR_MUX_uxn_c_l67_c8_de96_return_output;
     VAR_MUX_uxn_c_l87_c8_c516_iffalse := VAR_MUX_uxn_c_l67_c8_de96_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_pc := VAR_MUX_uxn_c_l67_c8_de96_return_output;
     VAR_pc_MUX_uxn_c_l74_c2_2e12_iftrue := VAR_MUX_uxn_c_l67_c8_de96_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_ins := VAR_MUX_uxn_c_l85_c9_77bd_return_output;
     VAR_ins_MUX_uxn_c_l81_c7_30d4_iffalse := VAR_MUX_uxn_c_l85_c9_77bd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l84_c1_1b77] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_return_output;

     -- BIN_OP_PLUS[uxn_c_l82_c3_627f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l82_c3_627f_left <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_627f_left;
     BIN_OP_PLUS_uxn_c_l82_c3_627f_right <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_627f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_627f_return_output := BIN_OP_PLUS_uxn_c_l82_c3_627f_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228[uxn_c_l74_c2_2e12] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l74_c2_2e12_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228(
     cpu_step_result,
     VAR_MUX_uxn_c_l67_c8_de96_return_output,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- ins_MUX[uxn_c_l81_c7_30d4] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l81_c7_30d4_cond <= VAR_ins_MUX_uxn_c_l81_c7_30d4_cond;
     ins_MUX_uxn_c_l81_c7_30d4_iftrue <= VAR_ins_MUX_uxn_c_l81_c7_30d4_iftrue;
     ins_MUX_uxn_c_l81_c7_30d4_iffalse <= VAR_ins_MUX_uxn_c_l81_c7_30d4_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l81_c7_30d4_return_output := ins_MUX_uxn_c_l81_c7_30d4_return_output;

     -- Submodule level 3
     VAR_pc_uxn_c_l82_c3_a6d0 := resize(VAR_BIN_OP_PLUS_uxn_c_l82_c3_627f_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_1b77_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l74_c2_2e12_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l74_c2_2e12_return_output;
     VAR_ins_MUX_uxn_c_l74_c2_2e12_iffalse := VAR_ins_MUX_uxn_c_l81_c7_30d4_return_output;
     VAR_pc_MUX_uxn_c_l81_c7_30d4_iftrue := VAR_pc_uxn_c_l82_c3_a6d0;
     -- ins_MUX[uxn_c_l74_c2_2e12] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l74_c2_2e12_cond <= VAR_ins_MUX_uxn_c_l74_c2_2e12_cond;
     ins_MUX_uxn_c_l74_c2_2e12_iftrue <= VAR_ins_MUX_uxn_c_l74_c2_2e12_iftrue;
     ins_MUX_uxn_c_l74_c2_2e12_iffalse <= VAR_ins_MUX_uxn_c_l74_c2_2e12_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l74_c2_2e12_return_output := ins_MUX_uxn_c_l74_c2_2e12_return_output;

     -- eval_opcode_phased[uxn_c_l86_c45_ca8e] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l86_c45_ca8e_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l86_c45_ca8e_phase <= VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_phase;
     eval_opcode_phased_uxn_c_l86_c45_ca8e_ins <= VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_ins;
     eval_opcode_phased_uxn_c_l86_c45_ca8e_pc <= VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_pc;
     eval_opcode_phased_uxn_c_l86_c45_ca8e_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_previous_ram_read;
     eval_opcode_phased_uxn_c_l86_c45_ca8e_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output := eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output;

     -- Submodule level 4
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l74_c2_2e12_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l87_c8_44f3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_44f3_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output.is_pc_updated;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l94_c30_087c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l94_c30_087c_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l88_c34_fcd1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l88_c34_fcd1_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l91_c38_a3ab] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l91_c38_a3ab_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l95_c16_3209] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l95_c16_3209_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output.is_waiting;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l89_l87_DUPLICATE_2fe7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l89_l87_DUPLICATE_2fe7_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l90_c35_a1a5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l90_c35_a1a5_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l92_c40_6df3] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l92_c40_6df3_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l93_c41_1ecb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l93_c41_1ecb_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l96_c17_7309] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l96_c17_7309_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_ca8e_return_output.is_opc_done;

     -- Submodule level 5
     VAR_MUX_uxn_c_l87_c8_c516_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l89_l87_DUPLICATE_2fe7_return_output;
     VAR_is_ins_done_MUX_uxn_c_l81_c7_30d4_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l96_c17_7309_return_output;
     VAR_MUX_uxn_c_l87_c8_c516_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_44f3_return_output;
     VAR_is_waiting_MUX_uxn_c_l81_c7_30d4_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l95_c16_3209_return_output;
     -- MUX[uxn_c_l87_c8_c516] LATENCY=0
     -- Inputs
     MUX_uxn_c_l87_c8_c516_cond <= VAR_MUX_uxn_c_l87_c8_c516_cond;
     MUX_uxn_c_l87_c8_c516_iftrue <= VAR_MUX_uxn_c_l87_c8_c516_iftrue;
     MUX_uxn_c_l87_c8_c516_iffalse <= VAR_MUX_uxn_c_l87_c8_c516_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l87_c8_c516_return_output := MUX_uxn_c_l87_c8_c516_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0[uxn_c_l81_c7_30d4] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l81_c7_30d4_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l88_c34_fcd1_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l89_l87_DUPLICATE_2fe7_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l90_c35_a1a5_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l91_c38_a3ab_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l92_c40_6df3_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l93_c41_1ecb_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l94_c30_087c_return_output);

     -- is_ins_done_MUX[uxn_c_l81_c7_30d4] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l81_c7_30d4_cond <= VAR_is_ins_done_MUX_uxn_c_l81_c7_30d4_cond;
     is_ins_done_MUX_uxn_c_l81_c7_30d4_iftrue <= VAR_is_ins_done_MUX_uxn_c_l81_c7_30d4_iftrue;
     is_ins_done_MUX_uxn_c_l81_c7_30d4_iffalse <= VAR_is_ins_done_MUX_uxn_c_l81_c7_30d4_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l81_c7_30d4_return_output := is_ins_done_MUX_uxn_c_l81_c7_30d4_return_output;

     -- is_waiting_MUX[uxn_c_l81_c7_30d4] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l81_c7_30d4_cond <= VAR_is_waiting_MUX_uxn_c_l81_c7_30d4_cond;
     is_waiting_MUX_uxn_c_l81_c7_30d4_iftrue <= VAR_is_waiting_MUX_uxn_c_l81_c7_30d4_iftrue;
     is_waiting_MUX_uxn_c_l81_c7_30d4_iffalse <= VAR_is_waiting_MUX_uxn_c_l81_c7_30d4_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l81_c7_30d4_return_output := is_waiting_MUX_uxn_c_l81_c7_30d4_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l81_c7_30d4_iffalse := VAR_MUX_uxn_c_l87_c8_c516_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l81_c7_30d4_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l81_c7_30d4_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c2_2e12_iffalse := VAR_is_ins_done_MUX_uxn_c_l81_c7_30d4_return_output;
     VAR_is_waiting_MUX_uxn_c_l74_c2_2e12_iffalse := VAR_is_waiting_MUX_uxn_c_l81_c7_30d4_return_output;
     -- is_waiting_MUX[uxn_c_l74_c2_2e12] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l74_c2_2e12_cond <= VAR_is_waiting_MUX_uxn_c_l74_c2_2e12_cond;
     is_waiting_MUX_uxn_c_l74_c2_2e12_iftrue <= VAR_is_waiting_MUX_uxn_c_l74_c2_2e12_iftrue;
     is_waiting_MUX_uxn_c_l74_c2_2e12_iffalse <= VAR_is_waiting_MUX_uxn_c_l74_c2_2e12_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l74_c2_2e12_return_output := is_waiting_MUX_uxn_c_l74_c2_2e12_return_output;

     -- pc_MUX[uxn_c_l81_c7_30d4] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l81_c7_30d4_cond <= VAR_pc_MUX_uxn_c_l81_c7_30d4_cond;
     pc_MUX_uxn_c_l81_c7_30d4_iftrue <= VAR_pc_MUX_uxn_c_l81_c7_30d4_iftrue;
     pc_MUX_uxn_c_l81_c7_30d4_iffalse <= VAR_pc_MUX_uxn_c_l81_c7_30d4_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l81_c7_30d4_return_output := pc_MUX_uxn_c_l81_c7_30d4_return_output;

     -- cpu_step_result_MUX[uxn_c_l81_c7_30d4] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l81_c7_30d4_cond <= VAR_cpu_step_result_MUX_uxn_c_l81_c7_30d4_cond;
     cpu_step_result_MUX_uxn_c_l81_c7_30d4_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l81_c7_30d4_iftrue;
     cpu_step_result_MUX_uxn_c_l81_c7_30d4_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l81_c7_30d4_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l81_c7_30d4_return_output := cpu_step_result_MUX_uxn_c_l81_c7_30d4_return_output;

     -- is_ins_done_MUX[uxn_c_l74_c2_2e12] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l74_c2_2e12_cond <= VAR_is_ins_done_MUX_uxn_c_l74_c2_2e12_cond;
     is_ins_done_MUX_uxn_c_l74_c2_2e12_iftrue <= VAR_is_ins_done_MUX_uxn_c_l74_c2_2e12_iftrue;
     is_ins_done_MUX_uxn_c_l74_c2_2e12_iffalse <= VAR_is_ins_done_MUX_uxn_c_l74_c2_2e12_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l74_c2_2e12_return_output := is_ins_done_MUX_uxn_c_l74_c2_2e12_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l74_c2_2e12_iffalse := VAR_cpu_step_result_MUX_uxn_c_l81_c7_30d4_return_output;
     VAR_BIN_OP_OR_uxn_c_l99_c6_f33f_left := VAR_is_ins_done_MUX_uxn_c_l74_c2_2e12_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l74_c2_2e12_return_output;
     VAR_BIN_OP_OR_uxn_c_l99_c6_f33f_right := VAR_is_waiting_MUX_uxn_c_l74_c2_2e12_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l74_c2_2e12_return_output;
     VAR_pc_MUX_uxn_c_l74_c2_2e12_iffalse := VAR_pc_MUX_uxn_c_l81_c7_30d4_return_output;
     -- pc_MUX[uxn_c_l74_c2_2e12] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l74_c2_2e12_cond <= VAR_pc_MUX_uxn_c_l74_c2_2e12_cond;
     pc_MUX_uxn_c_l74_c2_2e12_iftrue <= VAR_pc_MUX_uxn_c_l74_c2_2e12_iftrue;
     pc_MUX_uxn_c_l74_c2_2e12_iffalse <= VAR_pc_MUX_uxn_c_l74_c2_2e12_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l74_c2_2e12_return_output := pc_MUX_uxn_c_l74_c2_2e12_return_output;

     -- BIN_OP_OR[uxn_c_l99_c6_f33f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l99_c6_f33f_left <= VAR_BIN_OP_OR_uxn_c_l99_c6_f33f_left;
     BIN_OP_OR_uxn_c_l99_c6_f33f_right <= VAR_BIN_OP_OR_uxn_c_l99_c6_f33f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l99_c6_f33f_return_output := BIN_OP_OR_uxn_c_l99_c6_f33f_return_output;

     -- cpu_step_result_MUX[uxn_c_l74_c2_2e12] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l74_c2_2e12_cond <= VAR_cpu_step_result_MUX_uxn_c_l74_c2_2e12_cond;
     cpu_step_result_MUX_uxn_c_l74_c2_2e12_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l74_c2_2e12_iftrue;
     cpu_step_result_MUX_uxn_c_l74_c2_2e12_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l74_c2_2e12_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l74_c2_2e12_return_output := cpu_step_result_MUX_uxn_c_l74_c2_2e12_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_cond := VAR_BIN_OP_OR_uxn_c_l99_c6_f33f_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l74_c2_2e12_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l74_c2_2e12_return_output;
     VAR_BIN_OP_EQ_uxn_c_l102_c21_990f_left := VAR_pc_MUX_uxn_c_l74_c2_2e12_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l74_c2_2e12_return_output;
     -- BIN_OP_EQ[uxn_c_l102_c21_990f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l102_c21_990f_left <= VAR_BIN_OP_EQ_uxn_c_l102_c21_990f_left;
     BIN_OP_EQ_uxn_c_l102_c21_990f_right <= VAR_BIN_OP_EQ_uxn_c_l102_c21_990f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l102_c21_990f_return_output := BIN_OP_EQ_uxn_c_l102_c21_990f_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l102_c21_a2f9_cond := VAR_BIN_OP_EQ_uxn_c_l102_c21_990f_return_output;
     -- MUX[uxn_c_l102_c21_a2f9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l102_c21_a2f9_cond <= VAR_MUX_uxn_c_l102_c21_a2f9_cond;
     MUX_uxn_c_l102_c21_a2f9_iftrue <= VAR_MUX_uxn_c_l102_c21_a2f9_iftrue;
     MUX_uxn_c_l102_c21_a2f9_iffalse <= VAR_MUX_uxn_c_l102_c21_a2f9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l102_c21_a2f9_return_output := MUX_uxn_c_l102_c21_a2f9_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_iffalse := VAR_MUX_uxn_c_l102_c21_a2f9_return_output;
     -- step_cpu_phase_MUX[uxn_c_l99_c2_0d6b] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_cond <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_cond;
     step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_iftrue;
     step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_return_output := step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l99_c2_0d6b_return_output;
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
