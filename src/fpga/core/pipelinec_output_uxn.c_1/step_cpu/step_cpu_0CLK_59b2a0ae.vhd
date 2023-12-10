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
entity step_cpu_0CLK_59b2a0ae is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 use_vector : in unsigned(0 downto 0);
 vector : in unsigned(15 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_59b2a0ae;
architecture arch of step_cpu_0CLK_59b2a0ae is
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
-- BIN_OP_AND[uxn_c_l68_c8_6baa]
signal BIN_OP_AND_uxn_c_l68_c8_6baa_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l68_c8_6baa_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l68_c8_6baa_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l68_c8_fdd1]
signal MUX_uxn_c_l68_c8_fdd1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l68_c8_fdd1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l68_c8_fdd1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l68_c8_fdd1_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l69_c15_a4e6]
signal MUX_uxn_c_l69_c15_a4e6_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_a4e6_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_a4e6_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l69_c15_a4e6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c6_971e]
signal BIN_OP_EQ_uxn_c_l75_c6_971e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c6_971e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c6_971e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c7_4e64]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l75_c2_3e77]
signal cpu_step_result_MUX_uxn_c_l75_c2_3e77_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l75_c2_3e77_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c2_3e77_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c2_3e77_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l75_c2_3e77]
signal ins_MUX_uxn_c_l75_c2_3e77_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l75_c2_3e77_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c2_3e77_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c2_3e77_return_output : unsigned(7 downto 0);

-- is_waiting_MUX[uxn_c_l75_c2_3e77]
signal is_waiting_MUX_uxn_c_l75_c2_3e77_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_3e77_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_3e77_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l75_c2_3e77_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l75_c2_3e77]
signal is_ins_done_MUX_uxn_c_l75_c2_3e77_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_3e77_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_3e77_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c2_3e77_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l75_c2_3e77]
signal pc_MUX_uxn_c_l75_c2_3e77_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l75_c2_3e77_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c2_3e77_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c2_3e77_return_output : unsigned(15 downto 0);

-- eval_opcode_result_MUX[uxn_c_l75_c2_3e77]
signal eval_opcode_result_MUX_uxn_c_l75_c2_3e77_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l75_c2_3e77_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l75_c2_3e77_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l75_c2_3e77_return_output : eval_opcode_result_t;

-- BIN_OP_EQ[uxn_c_l82_c11_8d5d]
signal BIN_OP_EQ_uxn_c_l82_c11_8d5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c11_8d5d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l82_c11_8d5d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_2349]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l82_c7_4e64]
signal cpu_step_result_MUX_uxn_c_l82_c7_4e64_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l82_c7_4e64_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l82_c7_4e64_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l82_c7_4e64_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l82_c7_4e64]
signal ins_MUX_uxn_c_l82_c7_4e64_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l82_c7_4e64_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l82_c7_4e64_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l82_c7_4e64_return_output : unsigned(7 downto 0);

-- is_waiting_MUX[uxn_c_l82_c7_4e64]
signal is_waiting_MUX_uxn_c_l82_c7_4e64_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_4e64_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_4e64_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l82_c7_4e64_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l82_c7_4e64]
signal is_ins_done_MUX_uxn_c_l82_c7_4e64_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_4e64_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_4e64_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l82_c7_4e64_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l82_c7_4e64]
signal pc_MUX_uxn_c_l82_c7_4e64_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l82_c7_4e64_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l82_c7_4e64_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l82_c7_4e64_return_output : unsigned(15 downto 0);

-- eval_opcode_result_MUX[uxn_c_l82_c7_4e64]
signal eval_opcode_result_MUX_uxn_c_l82_c7_4e64_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l82_c7_4e64_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l82_c7_4e64_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l82_c7_4e64_return_output : eval_opcode_result_t;

-- BIN_OP_PLUS[uxn_c_l83_c3_d4a5]
signal BIN_OP_PLUS_uxn_c_l83_c3_d4a5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l83_c3_d4a5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l83_c3_d4a5_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l86_c9_954f]
signal BIN_OP_EQ_uxn_c_l86_c9_954f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l86_c9_954f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l86_c9_954f_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l86_c9_25cb]
signal MUX_uxn_c_l86_c9_25cb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l86_c9_25cb_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l86_c9_25cb_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l86_c9_25cb_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l87_c43_e8d5]
signal BIN_OP_MINUS_uxn_c_l87_c43_e8d5_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l87_c43_e8d5_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l87_c43_e8d5_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l87_c24_f0b3]
signal eval_opcode_phased_uxn_c_l87_c24_f0b3_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_f0b3_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_f0b3_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_f0b3_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_f0b3_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_f0b3_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l88_c8_2273]
signal MUX_uxn_c_l88_c8_2273_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l88_c8_2273_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l88_c8_2273_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l88_c8_2273_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l100_c6_3a3e]
signal BIN_OP_OR_uxn_c_l100_c6_3a3e_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l100_c6_3a3e_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l100_c6_3a3e_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l100_c2_5916]
signal step_cpu_phase_MUX_uxn_c_l100_c2_5916_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l100_c2_5916_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l100_c2_5916_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l100_c2_5916_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l103_c21_93ba]
signal BIN_OP_EQ_uxn_c_l103_c21_93ba_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l103_c21_93ba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l103_c21_93ba_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l103_c37_c4d7]
signal BIN_OP_PLUS_uxn_c_l103_c37_c4d7_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l103_c37_c4d7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l103_c37_c4d7_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l103_c21_6963]
signal MUX_uxn_c_l103_c21_6963_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l103_c21_6963_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l103_c21_6963_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l103_c21_6963_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_c_l68_c8_6baa
BIN_OP_AND_uxn_c_l68_c8_6baa : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l68_c8_6baa_left,
BIN_OP_AND_uxn_c_l68_c8_6baa_right,
BIN_OP_AND_uxn_c_l68_c8_6baa_return_output);

-- MUX_uxn_c_l68_c8_fdd1
MUX_uxn_c_l68_c8_fdd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l68_c8_fdd1_cond,
MUX_uxn_c_l68_c8_fdd1_iftrue,
MUX_uxn_c_l68_c8_fdd1_iffalse,
MUX_uxn_c_l68_c8_fdd1_return_output);

-- MUX_uxn_c_l69_c15_a4e6
MUX_uxn_c_l69_c15_a4e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l69_c15_a4e6_cond,
MUX_uxn_c_l69_c15_a4e6_iftrue,
MUX_uxn_c_l69_c15_a4e6_iffalse,
MUX_uxn_c_l69_c15_a4e6_return_output);

-- BIN_OP_EQ_uxn_c_l75_c6_971e
BIN_OP_EQ_uxn_c_l75_c6_971e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c6_971e_left,
BIN_OP_EQ_uxn_c_l75_c6_971e_right,
BIN_OP_EQ_uxn_c_l75_c6_971e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_return_output);

-- cpu_step_result_MUX_uxn_c_l75_c2_3e77
cpu_step_result_MUX_uxn_c_l75_c2_3e77 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l75_c2_3e77_cond,
cpu_step_result_MUX_uxn_c_l75_c2_3e77_iftrue,
cpu_step_result_MUX_uxn_c_l75_c2_3e77_iffalse,
cpu_step_result_MUX_uxn_c_l75_c2_3e77_return_output);

-- ins_MUX_uxn_c_l75_c2_3e77
ins_MUX_uxn_c_l75_c2_3e77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l75_c2_3e77_cond,
ins_MUX_uxn_c_l75_c2_3e77_iftrue,
ins_MUX_uxn_c_l75_c2_3e77_iffalse,
ins_MUX_uxn_c_l75_c2_3e77_return_output);

-- is_waiting_MUX_uxn_c_l75_c2_3e77
is_waiting_MUX_uxn_c_l75_c2_3e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l75_c2_3e77_cond,
is_waiting_MUX_uxn_c_l75_c2_3e77_iftrue,
is_waiting_MUX_uxn_c_l75_c2_3e77_iffalse,
is_waiting_MUX_uxn_c_l75_c2_3e77_return_output);

-- is_ins_done_MUX_uxn_c_l75_c2_3e77
is_ins_done_MUX_uxn_c_l75_c2_3e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l75_c2_3e77_cond,
is_ins_done_MUX_uxn_c_l75_c2_3e77_iftrue,
is_ins_done_MUX_uxn_c_l75_c2_3e77_iffalse,
is_ins_done_MUX_uxn_c_l75_c2_3e77_return_output);

-- pc_MUX_uxn_c_l75_c2_3e77
pc_MUX_uxn_c_l75_c2_3e77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l75_c2_3e77_cond,
pc_MUX_uxn_c_l75_c2_3e77_iftrue,
pc_MUX_uxn_c_l75_c2_3e77_iffalse,
pc_MUX_uxn_c_l75_c2_3e77_return_output);

-- eval_opcode_result_MUX_uxn_c_l75_c2_3e77
eval_opcode_result_MUX_uxn_c_l75_c2_3e77 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l75_c2_3e77_cond,
eval_opcode_result_MUX_uxn_c_l75_c2_3e77_iftrue,
eval_opcode_result_MUX_uxn_c_l75_c2_3e77_iffalse,
eval_opcode_result_MUX_uxn_c_l75_c2_3e77_return_output);

-- BIN_OP_EQ_uxn_c_l82_c11_8d5d
BIN_OP_EQ_uxn_c_l82_c11_8d5d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l82_c11_8d5d_left,
BIN_OP_EQ_uxn_c_l82_c11_8d5d_right,
BIN_OP_EQ_uxn_c_l82_c11_8d5d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_return_output);

-- cpu_step_result_MUX_uxn_c_l82_c7_4e64
cpu_step_result_MUX_uxn_c_l82_c7_4e64 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l82_c7_4e64_cond,
cpu_step_result_MUX_uxn_c_l82_c7_4e64_iftrue,
cpu_step_result_MUX_uxn_c_l82_c7_4e64_iffalse,
cpu_step_result_MUX_uxn_c_l82_c7_4e64_return_output);

-- ins_MUX_uxn_c_l82_c7_4e64
ins_MUX_uxn_c_l82_c7_4e64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l82_c7_4e64_cond,
ins_MUX_uxn_c_l82_c7_4e64_iftrue,
ins_MUX_uxn_c_l82_c7_4e64_iffalse,
ins_MUX_uxn_c_l82_c7_4e64_return_output);

-- is_waiting_MUX_uxn_c_l82_c7_4e64
is_waiting_MUX_uxn_c_l82_c7_4e64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l82_c7_4e64_cond,
is_waiting_MUX_uxn_c_l82_c7_4e64_iftrue,
is_waiting_MUX_uxn_c_l82_c7_4e64_iffalse,
is_waiting_MUX_uxn_c_l82_c7_4e64_return_output);

-- is_ins_done_MUX_uxn_c_l82_c7_4e64
is_ins_done_MUX_uxn_c_l82_c7_4e64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l82_c7_4e64_cond,
is_ins_done_MUX_uxn_c_l82_c7_4e64_iftrue,
is_ins_done_MUX_uxn_c_l82_c7_4e64_iffalse,
is_ins_done_MUX_uxn_c_l82_c7_4e64_return_output);

-- pc_MUX_uxn_c_l82_c7_4e64
pc_MUX_uxn_c_l82_c7_4e64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l82_c7_4e64_cond,
pc_MUX_uxn_c_l82_c7_4e64_iftrue,
pc_MUX_uxn_c_l82_c7_4e64_iffalse,
pc_MUX_uxn_c_l82_c7_4e64_return_output);

-- eval_opcode_result_MUX_uxn_c_l82_c7_4e64
eval_opcode_result_MUX_uxn_c_l82_c7_4e64 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l82_c7_4e64_cond,
eval_opcode_result_MUX_uxn_c_l82_c7_4e64_iftrue,
eval_opcode_result_MUX_uxn_c_l82_c7_4e64_iffalse,
eval_opcode_result_MUX_uxn_c_l82_c7_4e64_return_output);

-- BIN_OP_PLUS_uxn_c_l83_c3_d4a5
BIN_OP_PLUS_uxn_c_l83_c3_d4a5 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l83_c3_d4a5_left,
BIN_OP_PLUS_uxn_c_l83_c3_d4a5_right,
BIN_OP_PLUS_uxn_c_l83_c3_d4a5_return_output);

-- BIN_OP_EQ_uxn_c_l86_c9_954f
BIN_OP_EQ_uxn_c_l86_c9_954f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l86_c9_954f_left,
BIN_OP_EQ_uxn_c_l86_c9_954f_right,
BIN_OP_EQ_uxn_c_l86_c9_954f_return_output);

-- MUX_uxn_c_l86_c9_25cb
MUX_uxn_c_l86_c9_25cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l86_c9_25cb_cond,
MUX_uxn_c_l86_c9_25cb_iftrue,
MUX_uxn_c_l86_c9_25cb_iffalse,
MUX_uxn_c_l86_c9_25cb_return_output);

-- BIN_OP_MINUS_uxn_c_l87_c43_e8d5
BIN_OP_MINUS_uxn_c_l87_c43_e8d5 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l87_c43_e8d5_left,
BIN_OP_MINUS_uxn_c_l87_c43_e8d5_right,
BIN_OP_MINUS_uxn_c_l87_c43_e8d5_return_output);

-- eval_opcode_phased_uxn_c_l87_c24_f0b3
eval_opcode_phased_uxn_c_l87_c24_f0b3 : entity work.eval_opcode_phased_0CLK_c1c6d56d port map (
clk,
eval_opcode_phased_uxn_c_l87_c24_f0b3_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l87_c24_f0b3_phase,
eval_opcode_phased_uxn_c_l87_c24_f0b3_ins,
eval_opcode_phased_uxn_c_l87_c24_f0b3_pc,
eval_opcode_phased_uxn_c_l87_c24_f0b3_previous_ram_read,
eval_opcode_phased_uxn_c_l87_c24_f0b3_previous_device_ram_read,
eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output);

-- MUX_uxn_c_l88_c8_2273
MUX_uxn_c_l88_c8_2273 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l88_c8_2273_cond,
MUX_uxn_c_l88_c8_2273_iftrue,
MUX_uxn_c_l88_c8_2273_iffalse,
MUX_uxn_c_l88_c8_2273_return_output);

-- BIN_OP_OR_uxn_c_l100_c6_3a3e
BIN_OP_OR_uxn_c_l100_c6_3a3e : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l100_c6_3a3e_left,
BIN_OP_OR_uxn_c_l100_c6_3a3e_right,
BIN_OP_OR_uxn_c_l100_c6_3a3e_return_output);

-- step_cpu_phase_MUX_uxn_c_l100_c2_5916
step_cpu_phase_MUX_uxn_c_l100_c2_5916 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l100_c2_5916_cond,
step_cpu_phase_MUX_uxn_c_l100_c2_5916_iftrue,
step_cpu_phase_MUX_uxn_c_l100_c2_5916_iffalse,
step_cpu_phase_MUX_uxn_c_l100_c2_5916_return_output);

-- BIN_OP_EQ_uxn_c_l103_c21_93ba
BIN_OP_EQ_uxn_c_l103_c21_93ba : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l103_c21_93ba_left,
BIN_OP_EQ_uxn_c_l103_c21_93ba_right,
BIN_OP_EQ_uxn_c_l103_c21_93ba_return_output);

-- BIN_OP_PLUS_uxn_c_l103_c37_c4d7
BIN_OP_PLUS_uxn_c_l103_c37_c4d7 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l103_c37_c4d7_left,
BIN_OP_PLUS_uxn_c_l103_c37_c4d7_right,
BIN_OP_PLUS_uxn_c_l103_c37_c4d7_return_output);

-- MUX_uxn_c_l103_c21_6963
MUX_uxn_c_l103_c21_6963 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l103_c21_6963_cond,
MUX_uxn_c_l103_c21_6963_iftrue,
MUX_uxn_c_l103_c21_6963_iffalse,
MUX_uxn_c_l103_c21_6963_return_output);



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
 BIN_OP_AND_uxn_c_l68_c8_6baa_return_output,
 MUX_uxn_c_l68_c8_fdd1_return_output,
 MUX_uxn_c_l69_c15_a4e6_return_output,
 BIN_OP_EQ_uxn_c_l75_c6_971e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_return_output,
 cpu_step_result_MUX_uxn_c_l75_c2_3e77_return_output,
 ins_MUX_uxn_c_l75_c2_3e77_return_output,
 is_waiting_MUX_uxn_c_l75_c2_3e77_return_output,
 is_ins_done_MUX_uxn_c_l75_c2_3e77_return_output,
 pc_MUX_uxn_c_l75_c2_3e77_return_output,
 eval_opcode_result_MUX_uxn_c_l75_c2_3e77_return_output,
 BIN_OP_EQ_uxn_c_l82_c11_8d5d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_return_output,
 cpu_step_result_MUX_uxn_c_l82_c7_4e64_return_output,
 ins_MUX_uxn_c_l82_c7_4e64_return_output,
 is_waiting_MUX_uxn_c_l82_c7_4e64_return_output,
 is_ins_done_MUX_uxn_c_l82_c7_4e64_return_output,
 pc_MUX_uxn_c_l82_c7_4e64_return_output,
 eval_opcode_result_MUX_uxn_c_l82_c7_4e64_return_output,
 BIN_OP_PLUS_uxn_c_l83_c3_d4a5_return_output,
 BIN_OP_EQ_uxn_c_l86_c9_954f_return_output,
 MUX_uxn_c_l86_c9_25cb_return_output,
 BIN_OP_MINUS_uxn_c_l87_c43_e8d5_return_output,
 eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output,
 MUX_uxn_c_l88_c8_2273_return_output,
 BIN_OP_OR_uxn_c_l100_c6_3a3e_return_output,
 step_cpu_phase_MUX_uxn_c_l100_c2_5916_return_output,
 BIN_OP_EQ_uxn_c_l103_c21_93ba_return_output,
 BIN_OP_PLUS_uxn_c_l103_c37_c4d7_return_output,
 MUX_uxn_c_l103_c21_6963_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_fdd1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_6baa_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_6baa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l68_c8_6baa_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_fdd1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_fdd1_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l68_c8_fdd1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_a4e6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_a4e6_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_a4e6_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l69_c15_a4e6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_971e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_971e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c6_971e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_3e77_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l75_c2_3e77_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_3e77_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_4e64_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_3e77_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c2_3e77_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_3e77_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_3e77_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_4e64_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_3e77_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c2_3e77_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_3e77_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_3e77_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_4e64_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_3e77_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l75_c2_3e77_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_3e77_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_3e77_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_4e64_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_3e77_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c2_3e77_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_3e77_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_3e77_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_4e64_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_3e77_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c2_3e77_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c2_3e77_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c2_3e77_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l82_c7_4e64_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c2_3e77_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c2_3e77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_8d5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_8d5d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l82_c11_8d5d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_4e64_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_4e64_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l82_c7_4e64_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l82_c7_4e64_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_4e64_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_4e64_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l82_c7_4e64_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_4e64_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_4e64_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l82_c7_4e64_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_4e64_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_4e64_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l82_c7_4e64_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_4e64_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l83_c3_7002 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_4e64_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l82_c7_4e64_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l82_c7_4e64_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l82_c7_4e64_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l82_c7_4e64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_d4a5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_d4a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l83_c3_d4a5_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_25cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_954f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_954f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c9_954f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_25cb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_25cb_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l86_c9_25cb_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c43_e8d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c43_e8d5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l87_c43_e8d5_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l88_c8_2273_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_9191_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_2273_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_2273_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l88_c8_2273_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_6018_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_e0b7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_ef12_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l93_c40_1195_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l94_c41_ac67_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l95_c30_c26e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l96_c16_0d95_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l97_c17_6ee7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l100_c6_3a3e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l100_c6_3a3e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l100_c6_3a3e_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_5916_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l101_c3_4ce9 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_5916_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_5916_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l100_c2_5916_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_6963_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l103_c21_93ba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l103_c21_93ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l103_c21_93ba_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_6963_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_6963_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l103_c37_c4d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l103_c37_c4d7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l103_c37_c4d7_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l103_c21_6963_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_a2db_return_output : unsigned(15 downto 0);
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
     VAR_MUX_uxn_c_l69_c15_a4e6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l103_c21_93ba_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l86_c9_954f_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l87_c43_e8d5_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_c_l103_c37_c4d7_right := to_unsigned(1, 1);
     VAR_is_ins_done_MUX_uxn_c_l75_c2_3e77_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_d4a5_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l75_c6_971e_right := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l101_c3_4ce9 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_5916_iftrue := VAR_step_cpu_phase_uxn_c_l101_c3_4ce9;
     VAR_MUX_uxn_c_l103_c21_6963_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_c_l82_c11_8d5d_right := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_iffalse := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_4e64_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c2_3e77_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l82_c7_4e64_iftrue := eval_opcode_result;
     VAR_MUX_uxn_c_l86_c9_25cb_iffalse := ins;
     VAR_ins_MUX_uxn_c_l75_c2_3e77_iftrue := ins;
     VAR_ins_MUX_uxn_c_l82_c7_4e64_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_4e64_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uxn_c_l68_c8_6baa_right := is_waiting;
     VAR_MUX_uxn_c_l69_c15_a4e6_iffalse := is_waiting;
     VAR_MUX_uxn_c_l68_c8_fdd1_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l86_c9_25cb_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l75_c6_971e_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l82_c11_8d5d_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l86_c9_954f_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l87_c43_e8d5_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l103_c37_c4d7_left := step_cpu_phase;
     VAR_BIN_OP_AND_uxn_c_l68_c8_6baa_left := VAR_use_vector;
     VAR_MUX_uxn_c_l69_c15_a4e6_cond := VAR_use_vector;
     VAR_MUX_uxn_c_l68_c8_fdd1_iftrue := VAR_vector;
     -- MUX[uxn_c_l69_c15_a4e6] LATENCY=0
     -- Inputs
     MUX_uxn_c_l69_c15_a4e6_cond <= VAR_MUX_uxn_c_l69_c15_a4e6_cond;
     MUX_uxn_c_l69_c15_a4e6_iftrue <= VAR_MUX_uxn_c_l69_c15_a4e6_iftrue;
     MUX_uxn_c_l69_c15_a4e6_iffalse <= VAR_MUX_uxn_c_l69_c15_a4e6_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l69_c15_a4e6_return_output := MUX_uxn_c_l69_c15_a4e6_return_output;

     -- BIN_OP_PLUS[uxn_c_l103_c37_c4d7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l103_c37_c4d7_left <= VAR_BIN_OP_PLUS_uxn_c_l103_c37_c4d7_left;
     BIN_OP_PLUS_uxn_c_l103_c37_c4d7_right <= VAR_BIN_OP_PLUS_uxn_c_l103_c37_c4d7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l103_c37_c4d7_return_output := BIN_OP_PLUS_uxn_c_l103_c37_c4d7_return_output;

     -- BIN_OP_EQ[uxn_c_l86_c9_954f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l86_c9_954f_left <= VAR_BIN_OP_EQ_uxn_c_l86_c9_954f_left;
     BIN_OP_EQ_uxn_c_l86_c9_954f_right <= VAR_BIN_OP_EQ_uxn_c_l86_c9_954f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l86_c9_954f_return_output := BIN_OP_EQ_uxn_c_l86_c9_954f_return_output;

     -- BIN_OP_EQ[uxn_c_l82_c11_8d5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l82_c11_8d5d_left <= VAR_BIN_OP_EQ_uxn_c_l82_c11_8d5d_left;
     BIN_OP_EQ_uxn_c_l82_c11_8d5d_right <= VAR_BIN_OP_EQ_uxn_c_l82_c11_8d5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l82_c11_8d5d_return_output := BIN_OP_EQ_uxn_c_l82_c11_8d5d_return_output;

     -- BIN_OP_MINUS[uxn_c_l87_c43_e8d5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l87_c43_e8d5_left <= VAR_BIN_OP_MINUS_uxn_c_l87_c43_e8d5_left;
     BIN_OP_MINUS_uxn_c_l87_c43_e8d5_right <= VAR_BIN_OP_MINUS_uxn_c_l87_c43_e8d5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l87_c43_e8d5_return_output := BIN_OP_MINUS_uxn_c_l87_c43_e8d5_return_output;

     -- BIN_OP_AND[uxn_c_l68_c8_6baa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l68_c8_6baa_left <= VAR_BIN_OP_AND_uxn_c_l68_c8_6baa_left;
     BIN_OP_AND_uxn_c_l68_c8_6baa_right <= VAR_BIN_OP_AND_uxn_c_l68_c8_6baa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l68_c8_6baa_return_output := BIN_OP_AND_uxn_c_l68_c8_6baa_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c6_971e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c6_971e_left <= VAR_BIN_OP_EQ_uxn_c_l75_c6_971e_left;
     BIN_OP_EQ_uxn_c_l75_c6_971e_right <= VAR_BIN_OP_EQ_uxn_c_l75_c6_971e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c6_971e_return_output := BIN_OP_EQ_uxn_c_l75_c6_971e_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l68_c8_fdd1_cond := VAR_BIN_OP_AND_uxn_c_l68_c8_6baa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_971e_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_3e77_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_971e_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c2_3e77_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_971e_return_output;
     VAR_ins_MUX_uxn_c_l75_c2_3e77_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_971e_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c2_3e77_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_971e_return_output;
     VAR_is_waiting_MUX_uxn_c_l75_c2_3e77_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_971e_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_3e77_cond := VAR_BIN_OP_EQ_uxn_c_l75_c6_971e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_8d5d_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_4e64_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_8d5d_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l82_c7_4e64_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_8d5d_return_output;
     VAR_ins_MUX_uxn_c_l82_c7_4e64_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_8d5d_return_output;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_4e64_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_8d5d_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_4e64_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_8d5d_return_output;
     VAR_pc_MUX_uxn_c_l82_c7_4e64_cond := VAR_BIN_OP_EQ_uxn_c_l82_c11_8d5d_return_output;
     VAR_MUX_uxn_c_l86_c9_25cb_cond := VAR_BIN_OP_EQ_uxn_c_l86_c9_954f_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_phase := VAR_BIN_OP_MINUS_uxn_c_l87_c43_e8d5_return_output;
     VAR_MUX_uxn_c_l103_c21_6963_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l103_c37_c4d7_return_output, 8);
     VAR_is_waiting_MUX_uxn_c_l75_c2_3e77_iftrue := VAR_MUX_uxn_c_l69_c15_a4e6_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_4e64_iftrue := VAR_MUX_uxn_c_l69_c15_a4e6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c7_4e64] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_return_output;

     -- MUX[uxn_c_l68_c8_fdd1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l68_c8_fdd1_cond <= VAR_MUX_uxn_c_l68_c8_fdd1_cond;
     MUX_uxn_c_l68_c8_fdd1_iftrue <= VAR_MUX_uxn_c_l68_c8_fdd1_iftrue;
     MUX_uxn_c_l68_c8_fdd1_iffalse <= VAR_MUX_uxn_c_l68_c8_fdd1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l68_c8_fdd1_return_output := MUX_uxn_c_l68_c8_fdd1_return_output;

     -- MUX[uxn_c_l86_c9_25cb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l86_c9_25cb_cond <= VAR_MUX_uxn_c_l86_c9_25cb_cond;
     MUX_uxn_c_l86_c9_25cb_iftrue <= VAR_MUX_uxn_c_l86_c9_25cb_iftrue;
     MUX_uxn_c_l86_c9_25cb_iffalse <= VAR_MUX_uxn_c_l86_c9_25cb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l86_c9_25cb_return_output := MUX_uxn_c_l86_c9_25cb_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c7_4e64_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_d4a5_left := VAR_MUX_uxn_c_l68_c8_fdd1_return_output;
     VAR_MUX_uxn_c_l88_c8_2273_iffalse := VAR_MUX_uxn_c_l68_c8_fdd1_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_pc := VAR_MUX_uxn_c_l68_c8_fdd1_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_3e77_iftrue := VAR_MUX_uxn_c_l68_c8_fdd1_return_output;
     VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_ins := VAR_MUX_uxn_c_l86_c9_25cb_return_output;
     VAR_ins_MUX_uxn_c_l82_c7_4e64_iffalse := VAR_MUX_uxn_c_l86_c9_25cb_return_output;
     -- BIN_OP_PLUS[uxn_c_l83_c3_d4a5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l83_c3_d4a5_left <= VAR_BIN_OP_PLUS_uxn_c_l83_c3_d4a5_left;
     BIN_OP_PLUS_uxn_c_l83_c3_d4a5_right <= VAR_BIN_OP_PLUS_uxn_c_l83_c3_d4a5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l83_c3_d4a5_return_output := BIN_OP_PLUS_uxn_c_l83_c3_d4a5_return_output;

     -- ins_MUX[uxn_c_l82_c7_4e64] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l82_c7_4e64_cond <= VAR_ins_MUX_uxn_c_l82_c7_4e64_cond;
     ins_MUX_uxn_c_l82_c7_4e64_iftrue <= VAR_ins_MUX_uxn_c_l82_c7_4e64_iftrue;
     ins_MUX_uxn_c_l82_c7_4e64_iffalse <= VAR_ins_MUX_uxn_c_l82_c7_4e64_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l82_c7_4e64_return_output := ins_MUX_uxn_c_l82_c7_4e64_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228[uxn_c_l75_c2_3e77] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l75_c2_3e77_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228(
     cpu_step_result,
     VAR_MUX_uxn_c_l68_c8_fdd1_return_output,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l85_c1_2349] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_return_output;

     -- Submodule level 3
     VAR_pc_uxn_c_l83_c3_7002 := resize(VAR_BIN_OP_PLUS_uxn_c_l83_c3_d4a5_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l85_c1_2349_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_3e77_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b228_uxn_c_l75_c2_3e77_return_output;
     VAR_ins_MUX_uxn_c_l75_c2_3e77_iffalse := VAR_ins_MUX_uxn_c_l82_c7_4e64_return_output;
     VAR_pc_MUX_uxn_c_l82_c7_4e64_iftrue := VAR_pc_uxn_c_l83_c3_7002;
     -- ins_MUX[uxn_c_l75_c2_3e77] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l75_c2_3e77_cond <= VAR_ins_MUX_uxn_c_l75_c2_3e77_cond;
     ins_MUX_uxn_c_l75_c2_3e77_iftrue <= VAR_ins_MUX_uxn_c_l75_c2_3e77_iftrue;
     ins_MUX_uxn_c_l75_c2_3e77_iffalse <= VAR_ins_MUX_uxn_c_l75_c2_3e77_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l75_c2_3e77_return_output := ins_MUX_uxn_c_l75_c2_3e77_return_output;

     -- eval_opcode_phased[uxn_c_l87_c24_f0b3] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l87_c24_f0b3_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l87_c24_f0b3_phase <= VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_phase;
     eval_opcode_phased_uxn_c_l87_c24_f0b3_ins <= VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_ins;
     eval_opcode_phased_uxn_c_l87_c24_f0b3_pc <= VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_pc;
     eval_opcode_phased_uxn_c_l87_c24_f0b3_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_previous_ram_read;
     eval_opcode_phased_uxn_c_l87_c24_f0b3_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output := eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output;

     -- Submodule level 4
     VAR_eval_opcode_result_MUX_uxn_c_l82_c7_4e64_iffalse := VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l75_c2_3e77_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l88_c8_9191] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_9191_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l94_c41_ac67] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l94_c41_ac67_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l97_c17_6ee7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l97_c17_6ee7_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output.is_opc_done;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l95_c30_c26e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l95_c30_c26e_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output.u8_value;

     -- eval_opcode_result_MUX[uxn_c_l82_c7_4e64] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l82_c7_4e64_cond <= VAR_eval_opcode_result_MUX_uxn_c_l82_c7_4e64_cond;
     eval_opcode_result_MUX_uxn_c_l82_c7_4e64_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l82_c7_4e64_iftrue;
     eval_opcode_result_MUX_uxn_c_l82_c7_4e64_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l82_c7_4e64_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l82_c7_4e64_return_output := eval_opcode_result_MUX_uxn_c_l82_c7_4e64_return_output;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_a2db LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_a2db_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l92_c38_ef12] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_ef12_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l91_c35_e0b7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_e0b7_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l93_c40_1195] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l93_c40_1195_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l96_c16_0d95] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l96_c16_0d95_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l89_c34_6018] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_6018_return_output := VAR_eval_opcode_phased_uxn_c_l87_c24_f0b3_return_output.is_ram_write;

     -- Submodule level 5
     VAR_MUX_uxn_c_l88_c8_2273_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_a2db_return_output;
     VAR_is_ins_done_MUX_uxn_c_l82_c7_4e64_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l97_c17_6ee7_return_output;
     VAR_MUX_uxn_c_l88_c8_2273_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l88_c8_9191_return_output;
     VAR_is_waiting_MUX_uxn_c_l82_c7_4e64_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l96_c16_0d95_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c2_3e77_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l82_c7_4e64_return_output;
     -- eval_opcode_result_MUX[uxn_c_l75_c2_3e77] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l75_c2_3e77_cond <= VAR_eval_opcode_result_MUX_uxn_c_l75_c2_3e77_cond;
     eval_opcode_result_MUX_uxn_c_l75_c2_3e77_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l75_c2_3e77_iftrue;
     eval_opcode_result_MUX_uxn_c_l75_c2_3e77_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l75_c2_3e77_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l75_c2_3e77_return_output := eval_opcode_result_MUX_uxn_c_l75_c2_3e77_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0[uxn_c_l82_c7_4e64] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l82_c7_4e64_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l89_c34_6018_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l90_l88_DUPLICATE_a2db_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l91_c35_e0b7_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l92_c38_ef12_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l93_c40_1195_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l94_c41_ac67_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l95_c30_c26e_return_output);

     -- is_waiting_MUX[uxn_c_l82_c7_4e64] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l82_c7_4e64_cond <= VAR_is_waiting_MUX_uxn_c_l82_c7_4e64_cond;
     is_waiting_MUX_uxn_c_l82_c7_4e64_iftrue <= VAR_is_waiting_MUX_uxn_c_l82_c7_4e64_iftrue;
     is_waiting_MUX_uxn_c_l82_c7_4e64_iffalse <= VAR_is_waiting_MUX_uxn_c_l82_c7_4e64_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l82_c7_4e64_return_output := is_waiting_MUX_uxn_c_l82_c7_4e64_return_output;

     -- is_ins_done_MUX[uxn_c_l82_c7_4e64] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l82_c7_4e64_cond <= VAR_is_ins_done_MUX_uxn_c_l82_c7_4e64_cond;
     is_ins_done_MUX_uxn_c_l82_c7_4e64_iftrue <= VAR_is_ins_done_MUX_uxn_c_l82_c7_4e64_iftrue;
     is_ins_done_MUX_uxn_c_l82_c7_4e64_iffalse <= VAR_is_ins_done_MUX_uxn_c_l82_c7_4e64_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l82_c7_4e64_return_output := is_ins_done_MUX_uxn_c_l82_c7_4e64_return_output;

     -- MUX[uxn_c_l88_c8_2273] LATENCY=0
     -- Inputs
     MUX_uxn_c_l88_c8_2273_cond <= VAR_MUX_uxn_c_l88_c8_2273_cond;
     MUX_uxn_c_l88_c8_2273_iftrue <= VAR_MUX_uxn_c_l88_c8_2273_iftrue;
     MUX_uxn_c_l88_c8_2273_iffalse <= VAR_MUX_uxn_c_l88_c8_2273_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l88_c8_2273_return_output := MUX_uxn_c_l88_c8_2273_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l82_c7_4e64_iffalse := VAR_MUX_uxn_c_l88_c8_2273_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_4e64_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_b9a0_uxn_c_l82_c7_4e64_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l75_c2_3e77_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c2_3e77_iffalse := VAR_is_ins_done_MUX_uxn_c_l82_c7_4e64_return_output;
     VAR_is_waiting_MUX_uxn_c_l75_c2_3e77_iffalse := VAR_is_waiting_MUX_uxn_c_l82_c7_4e64_return_output;
     -- pc_MUX[uxn_c_l82_c7_4e64] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l82_c7_4e64_cond <= VAR_pc_MUX_uxn_c_l82_c7_4e64_cond;
     pc_MUX_uxn_c_l82_c7_4e64_iftrue <= VAR_pc_MUX_uxn_c_l82_c7_4e64_iftrue;
     pc_MUX_uxn_c_l82_c7_4e64_iffalse <= VAR_pc_MUX_uxn_c_l82_c7_4e64_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l82_c7_4e64_return_output := pc_MUX_uxn_c_l82_c7_4e64_return_output;

     -- is_waiting_MUX[uxn_c_l75_c2_3e77] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l75_c2_3e77_cond <= VAR_is_waiting_MUX_uxn_c_l75_c2_3e77_cond;
     is_waiting_MUX_uxn_c_l75_c2_3e77_iftrue <= VAR_is_waiting_MUX_uxn_c_l75_c2_3e77_iftrue;
     is_waiting_MUX_uxn_c_l75_c2_3e77_iffalse <= VAR_is_waiting_MUX_uxn_c_l75_c2_3e77_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l75_c2_3e77_return_output := is_waiting_MUX_uxn_c_l75_c2_3e77_return_output;

     -- is_ins_done_MUX[uxn_c_l75_c2_3e77] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l75_c2_3e77_cond <= VAR_is_ins_done_MUX_uxn_c_l75_c2_3e77_cond;
     is_ins_done_MUX_uxn_c_l75_c2_3e77_iftrue <= VAR_is_ins_done_MUX_uxn_c_l75_c2_3e77_iftrue;
     is_ins_done_MUX_uxn_c_l75_c2_3e77_iffalse <= VAR_is_ins_done_MUX_uxn_c_l75_c2_3e77_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l75_c2_3e77_return_output := is_ins_done_MUX_uxn_c_l75_c2_3e77_return_output;

     -- cpu_step_result_MUX[uxn_c_l82_c7_4e64] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l82_c7_4e64_cond <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_4e64_cond;
     cpu_step_result_MUX_uxn_c_l82_c7_4e64_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_4e64_iftrue;
     cpu_step_result_MUX_uxn_c_l82_c7_4e64_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l82_c7_4e64_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l82_c7_4e64_return_output := cpu_step_result_MUX_uxn_c_l82_c7_4e64_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_3e77_iffalse := VAR_cpu_step_result_MUX_uxn_c_l82_c7_4e64_return_output;
     VAR_BIN_OP_OR_uxn_c_l100_c6_3a3e_left := VAR_is_ins_done_MUX_uxn_c_l75_c2_3e77_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l75_c2_3e77_return_output;
     VAR_BIN_OP_OR_uxn_c_l100_c6_3a3e_right := VAR_is_waiting_MUX_uxn_c_l75_c2_3e77_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l75_c2_3e77_return_output;
     VAR_pc_MUX_uxn_c_l75_c2_3e77_iffalse := VAR_pc_MUX_uxn_c_l82_c7_4e64_return_output;
     -- BIN_OP_OR[uxn_c_l100_c6_3a3e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l100_c6_3a3e_left <= VAR_BIN_OP_OR_uxn_c_l100_c6_3a3e_left;
     BIN_OP_OR_uxn_c_l100_c6_3a3e_right <= VAR_BIN_OP_OR_uxn_c_l100_c6_3a3e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l100_c6_3a3e_return_output := BIN_OP_OR_uxn_c_l100_c6_3a3e_return_output;

     -- cpu_step_result_MUX[uxn_c_l75_c2_3e77] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l75_c2_3e77_cond <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_3e77_cond;
     cpu_step_result_MUX_uxn_c_l75_c2_3e77_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_3e77_iftrue;
     cpu_step_result_MUX_uxn_c_l75_c2_3e77_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l75_c2_3e77_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l75_c2_3e77_return_output := cpu_step_result_MUX_uxn_c_l75_c2_3e77_return_output;

     -- pc_MUX[uxn_c_l75_c2_3e77] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l75_c2_3e77_cond <= VAR_pc_MUX_uxn_c_l75_c2_3e77_cond;
     pc_MUX_uxn_c_l75_c2_3e77_iftrue <= VAR_pc_MUX_uxn_c_l75_c2_3e77_iftrue;
     pc_MUX_uxn_c_l75_c2_3e77_iffalse <= VAR_pc_MUX_uxn_c_l75_c2_3e77_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l75_c2_3e77_return_output := pc_MUX_uxn_c_l75_c2_3e77_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_5916_cond := VAR_BIN_OP_OR_uxn_c_l100_c6_3a3e_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l75_c2_3e77_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l75_c2_3e77_return_output;
     VAR_BIN_OP_EQ_uxn_c_l103_c21_93ba_left := VAR_pc_MUX_uxn_c_l75_c2_3e77_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l75_c2_3e77_return_output;
     -- BIN_OP_EQ[uxn_c_l103_c21_93ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l103_c21_93ba_left <= VAR_BIN_OP_EQ_uxn_c_l103_c21_93ba_left;
     BIN_OP_EQ_uxn_c_l103_c21_93ba_right <= VAR_BIN_OP_EQ_uxn_c_l103_c21_93ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l103_c21_93ba_return_output := BIN_OP_EQ_uxn_c_l103_c21_93ba_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l103_c21_6963_cond := VAR_BIN_OP_EQ_uxn_c_l103_c21_93ba_return_output;
     -- MUX[uxn_c_l103_c21_6963] LATENCY=0
     -- Inputs
     MUX_uxn_c_l103_c21_6963_cond <= VAR_MUX_uxn_c_l103_c21_6963_cond;
     MUX_uxn_c_l103_c21_6963_iftrue <= VAR_MUX_uxn_c_l103_c21_6963_iftrue;
     MUX_uxn_c_l103_c21_6963_iffalse <= VAR_MUX_uxn_c_l103_c21_6963_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l103_c21_6963_return_output := MUX_uxn_c_l103_c21_6963_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_5916_iffalse := VAR_MUX_uxn_c_l103_c21_6963_return_output;
     -- step_cpu_phase_MUX[uxn_c_l100_c2_5916] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l100_c2_5916_cond <= VAR_step_cpu_phase_MUX_uxn_c_l100_c2_5916_cond;
     step_cpu_phase_MUX_uxn_c_l100_c2_5916_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l100_c2_5916_iftrue;
     step_cpu_phase_MUX_uxn_c_l100_c2_5916_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l100_c2_5916_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l100_c2_5916_return_output := step_cpu_phase_MUX_uxn_c_l100_c2_5916_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l100_c2_5916_return_output;
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
