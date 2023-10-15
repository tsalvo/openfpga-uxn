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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 31
entity step_cpu_0CLK_9ae23c9e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ram_read_value : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_9ae23c9e;
architecture arch of step_cpu_0CLK_9ae23c9e is
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
-- BIN_OP_EQ[uxn_c_l66_c6_e57b]
signal BIN_OP_EQ_uxn_c_l66_c6_e57b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l66_c6_e57b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l66_c6_e57b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l72_c7_5a3d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l66_c2_5749]
signal eval_opcode_result_MUX_uxn_c_l66_c2_5749_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l66_c2_5749_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l66_c2_5749_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l66_c2_5749_return_output : eval_opcode_result_t;

-- ins_MUX[uxn_c_l66_c2_5749]
signal ins_MUX_uxn_c_l66_c2_5749_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l66_c2_5749_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l66_c2_5749_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l66_c2_5749_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l66_c2_5749]
signal is_ins_done_MUX_uxn_c_l66_c2_5749_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l66_c2_5749_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l66_c2_5749_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l66_c2_5749_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l66_c2_5749]
signal pc_MUX_uxn_c_l66_c2_5749_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l66_c2_5749_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l66_c2_5749_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l66_c2_5749_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l66_c2_5749]
signal cpu_step_result_MUX_uxn_c_l66_c2_5749_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l66_c2_5749_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l66_c2_5749_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l66_c2_5749_return_output : cpu_step_result_t;

-- BIN_OP_EQ[uxn_c_l72_c11_da96]
signal BIN_OP_EQ_uxn_c_l72_c11_da96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l72_c11_da96_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l72_c11_da96_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l76_c7_c60e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l72_c7_5a3d]
signal eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_return_output : eval_opcode_result_t;

-- ins_MUX[uxn_c_l72_c7_5a3d]
signal ins_MUX_uxn_c_l72_c7_5a3d_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l72_c7_5a3d_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l72_c7_5a3d_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l72_c7_5a3d_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l72_c7_5a3d]
signal is_ins_done_MUX_uxn_c_l72_c7_5a3d_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l72_c7_5a3d_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l72_c7_5a3d_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l72_c7_5a3d_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l72_c7_5a3d]
signal pc_MUX_uxn_c_l72_c7_5a3d_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l72_c7_5a3d_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l72_c7_5a3d_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l72_c7_5a3d_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l72_c7_5a3d]
signal cpu_step_result_MUX_uxn_c_l72_c7_5a3d_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l72_c7_5a3d_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l72_c7_5a3d_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l72_c7_5a3d_return_output : cpu_step_result_t;

-- BIN_OP_EQ[uxn_c_l76_c11_c435]
signal BIN_OP_EQ_uxn_c_l76_c11_c435_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l76_c11_c435_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l76_c11_c435_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c1_35a1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l76_c7_c60e]
signal eval_opcode_result_MUX_uxn_c_l76_c7_c60e_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l76_c7_c60e_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l76_c7_c60e_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l76_c7_c60e_return_output : eval_opcode_result_t;

-- ins_MUX[uxn_c_l76_c7_c60e]
signal ins_MUX_uxn_c_l76_c7_c60e_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l76_c7_c60e_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l76_c7_c60e_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l76_c7_c60e_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l76_c7_c60e]
signal is_ins_done_MUX_uxn_c_l76_c7_c60e_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l76_c7_c60e_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l76_c7_c60e_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l76_c7_c60e_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l76_c7_c60e]
signal pc_MUX_uxn_c_l76_c7_c60e_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l76_c7_c60e_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l76_c7_c60e_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l76_c7_c60e_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l76_c7_c60e]
signal cpu_step_result_MUX_uxn_c_l76_c7_c60e_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l76_c7_c60e_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l76_c7_c60e_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l76_c7_c60e_return_output : cpu_step_result_t;

-- BIN_OP_PLUS[uxn_c_l78_c3_a605]
signal BIN_OP_PLUS_uxn_c_l78_c3_a605_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_a605_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_a605_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_c_l82_c43_8474]
signal BIN_OP_MINUS_uxn_c_l82_c43_8474_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l82_c43_8474_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l82_c43_8474_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l82_c24_b47a]
signal eval_opcode_phased_uxn_c_l82_c24_b47a_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_b47a_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_b47a_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_b47a_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_b47a_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c24_b47a_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l83_c8_27c2]
signal MUX_uxn_c_l83_c8_27c2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l83_c8_27c2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l83_c8_27c2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l83_c8_27c2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l95_c6_ac15]
signal BIN_OP_EQ_uxn_c_l95_c6_ac15_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l95_c6_ac15_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l95_c6_ac15_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l95_c2_e64b]
signal step_cpu_phase_MUX_uxn_c_l95_c2_e64b_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l95_c2_e64b_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l95_c2_e64b_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l95_c2_e64b_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l98_c3_3a18]
signal BIN_OP_PLUS_uxn_c_l98_c3_3a18_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l98_c3_3a18_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l98_c3_3a18_return_output : unsigned(8 downto 0);

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
-- BIN_OP_EQ_uxn_c_l66_c6_e57b
BIN_OP_EQ_uxn_c_l66_c6_e57b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l66_c6_e57b_left,
BIN_OP_EQ_uxn_c_l66_c6_e57b_right,
BIN_OP_EQ_uxn_c_l66_c6_e57b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_return_output);

-- eval_opcode_result_MUX_uxn_c_l66_c2_5749
eval_opcode_result_MUX_uxn_c_l66_c2_5749 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l66_c2_5749_cond,
eval_opcode_result_MUX_uxn_c_l66_c2_5749_iftrue,
eval_opcode_result_MUX_uxn_c_l66_c2_5749_iffalse,
eval_opcode_result_MUX_uxn_c_l66_c2_5749_return_output);

-- ins_MUX_uxn_c_l66_c2_5749
ins_MUX_uxn_c_l66_c2_5749 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l66_c2_5749_cond,
ins_MUX_uxn_c_l66_c2_5749_iftrue,
ins_MUX_uxn_c_l66_c2_5749_iffalse,
ins_MUX_uxn_c_l66_c2_5749_return_output);

-- is_ins_done_MUX_uxn_c_l66_c2_5749
is_ins_done_MUX_uxn_c_l66_c2_5749 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l66_c2_5749_cond,
is_ins_done_MUX_uxn_c_l66_c2_5749_iftrue,
is_ins_done_MUX_uxn_c_l66_c2_5749_iffalse,
is_ins_done_MUX_uxn_c_l66_c2_5749_return_output);

-- pc_MUX_uxn_c_l66_c2_5749
pc_MUX_uxn_c_l66_c2_5749 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l66_c2_5749_cond,
pc_MUX_uxn_c_l66_c2_5749_iftrue,
pc_MUX_uxn_c_l66_c2_5749_iffalse,
pc_MUX_uxn_c_l66_c2_5749_return_output);

-- cpu_step_result_MUX_uxn_c_l66_c2_5749
cpu_step_result_MUX_uxn_c_l66_c2_5749 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l66_c2_5749_cond,
cpu_step_result_MUX_uxn_c_l66_c2_5749_iftrue,
cpu_step_result_MUX_uxn_c_l66_c2_5749_iffalse,
cpu_step_result_MUX_uxn_c_l66_c2_5749_return_output);

-- BIN_OP_EQ_uxn_c_l72_c11_da96
BIN_OP_EQ_uxn_c_l72_c11_da96 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l72_c11_da96_left,
BIN_OP_EQ_uxn_c_l72_c11_da96_right,
BIN_OP_EQ_uxn_c_l72_c11_da96_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e
FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_return_output);

-- eval_opcode_result_MUX_uxn_c_l72_c7_5a3d
eval_opcode_result_MUX_uxn_c_l72_c7_5a3d : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_cond,
eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_iftrue,
eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_iffalse,
eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_return_output);

-- ins_MUX_uxn_c_l72_c7_5a3d
ins_MUX_uxn_c_l72_c7_5a3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l72_c7_5a3d_cond,
ins_MUX_uxn_c_l72_c7_5a3d_iftrue,
ins_MUX_uxn_c_l72_c7_5a3d_iffalse,
ins_MUX_uxn_c_l72_c7_5a3d_return_output);

-- is_ins_done_MUX_uxn_c_l72_c7_5a3d
is_ins_done_MUX_uxn_c_l72_c7_5a3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l72_c7_5a3d_cond,
is_ins_done_MUX_uxn_c_l72_c7_5a3d_iftrue,
is_ins_done_MUX_uxn_c_l72_c7_5a3d_iffalse,
is_ins_done_MUX_uxn_c_l72_c7_5a3d_return_output);

-- pc_MUX_uxn_c_l72_c7_5a3d
pc_MUX_uxn_c_l72_c7_5a3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l72_c7_5a3d_cond,
pc_MUX_uxn_c_l72_c7_5a3d_iftrue,
pc_MUX_uxn_c_l72_c7_5a3d_iffalse,
pc_MUX_uxn_c_l72_c7_5a3d_return_output);

-- cpu_step_result_MUX_uxn_c_l72_c7_5a3d
cpu_step_result_MUX_uxn_c_l72_c7_5a3d : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l72_c7_5a3d_cond,
cpu_step_result_MUX_uxn_c_l72_c7_5a3d_iftrue,
cpu_step_result_MUX_uxn_c_l72_c7_5a3d_iffalse,
cpu_step_result_MUX_uxn_c_l72_c7_5a3d_return_output);

-- BIN_OP_EQ_uxn_c_l76_c11_c435
BIN_OP_EQ_uxn_c_l76_c11_c435 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l76_c11_c435_left,
BIN_OP_EQ_uxn_c_l76_c11_c435_right,
BIN_OP_EQ_uxn_c_l76_c11_c435_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_return_output);

-- eval_opcode_result_MUX_uxn_c_l76_c7_c60e
eval_opcode_result_MUX_uxn_c_l76_c7_c60e : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l76_c7_c60e_cond,
eval_opcode_result_MUX_uxn_c_l76_c7_c60e_iftrue,
eval_opcode_result_MUX_uxn_c_l76_c7_c60e_iffalse,
eval_opcode_result_MUX_uxn_c_l76_c7_c60e_return_output);

-- ins_MUX_uxn_c_l76_c7_c60e
ins_MUX_uxn_c_l76_c7_c60e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l76_c7_c60e_cond,
ins_MUX_uxn_c_l76_c7_c60e_iftrue,
ins_MUX_uxn_c_l76_c7_c60e_iffalse,
ins_MUX_uxn_c_l76_c7_c60e_return_output);

-- is_ins_done_MUX_uxn_c_l76_c7_c60e
is_ins_done_MUX_uxn_c_l76_c7_c60e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l76_c7_c60e_cond,
is_ins_done_MUX_uxn_c_l76_c7_c60e_iftrue,
is_ins_done_MUX_uxn_c_l76_c7_c60e_iffalse,
is_ins_done_MUX_uxn_c_l76_c7_c60e_return_output);

-- pc_MUX_uxn_c_l76_c7_c60e
pc_MUX_uxn_c_l76_c7_c60e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l76_c7_c60e_cond,
pc_MUX_uxn_c_l76_c7_c60e_iftrue,
pc_MUX_uxn_c_l76_c7_c60e_iffalse,
pc_MUX_uxn_c_l76_c7_c60e_return_output);

-- cpu_step_result_MUX_uxn_c_l76_c7_c60e
cpu_step_result_MUX_uxn_c_l76_c7_c60e : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l76_c7_c60e_cond,
cpu_step_result_MUX_uxn_c_l76_c7_c60e_iftrue,
cpu_step_result_MUX_uxn_c_l76_c7_c60e_iffalse,
cpu_step_result_MUX_uxn_c_l76_c7_c60e_return_output);

-- BIN_OP_PLUS_uxn_c_l78_c3_a605
BIN_OP_PLUS_uxn_c_l78_c3_a605 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l78_c3_a605_left,
BIN_OP_PLUS_uxn_c_l78_c3_a605_right,
BIN_OP_PLUS_uxn_c_l78_c3_a605_return_output);

-- BIN_OP_MINUS_uxn_c_l82_c43_8474
BIN_OP_MINUS_uxn_c_l82_c43_8474 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l82_c43_8474_left,
BIN_OP_MINUS_uxn_c_l82_c43_8474_right,
BIN_OP_MINUS_uxn_c_l82_c43_8474_return_output);

-- eval_opcode_phased_uxn_c_l82_c24_b47a
eval_opcode_phased_uxn_c_l82_c24_b47a : entity work.eval_opcode_phased_0CLK_9caae9a0 port map (
clk,
eval_opcode_phased_uxn_c_l82_c24_b47a_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l82_c24_b47a_phase,
eval_opcode_phased_uxn_c_l82_c24_b47a_ins,
eval_opcode_phased_uxn_c_l82_c24_b47a_pc,
eval_opcode_phased_uxn_c_l82_c24_b47a_previous_ram_read,
eval_opcode_phased_uxn_c_l82_c24_b47a_return_output);

-- MUX_uxn_c_l83_c8_27c2
MUX_uxn_c_l83_c8_27c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l83_c8_27c2_cond,
MUX_uxn_c_l83_c8_27c2_iftrue,
MUX_uxn_c_l83_c8_27c2_iffalse,
MUX_uxn_c_l83_c8_27c2_return_output);

-- BIN_OP_EQ_uxn_c_l95_c6_ac15
BIN_OP_EQ_uxn_c_l95_c6_ac15 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l95_c6_ac15_left,
BIN_OP_EQ_uxn_c_l95_c6_ac15_right,
BIN_OP_EQ_uxn_c_l95_c6_ac15_return_output);

-- step_cpu_phase_MUX_uxn_c_l95_c2_e64b
step_cpu_phase_MUX_uxn_c_l95_c2_e64b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l95_c2_e64b_cond,
step_cpu_phase_MUX_uxn_c_l95_c2_e64b_iftrue,
step_cpu_phase_MUX_uxn_c_l95_c2_e64b_iffalse,
step_cpu_phase_MUX_uxn_c_l95_c2_e64b_return_output);

-- BIN_OP_PLUS_uxn_c_l98_c3_3a18
BIN_OP_PLUS_uxn_c_l98_c3_3a18 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l98_c3_3a18_left,
BIN_OP_PLUS_uxn_c_l98_c3_3a18_right,
BIN_OP_PLUS_uxn_c_l98_c3_3a18_return_output);



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
 BIN_OP_EQ_uxn_c_l66_c6_e57b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_return_output,
 eval_opcode_result_MUX_uxn_c_l66_c2_5749_return_output,
 ins_MUX_uxn_c_l66_c2_5749_return_output,
 is_ins_done_MUX_uxn_c_l66_c2_5749_return_output,
 pc_MUX_uxn_c_l66_c2_5749_return_output,
 cpu_step_result_MUX_uxn_c_l66_c2_5749_return_output,
 BIN_OP_EQ_uxn_c_l72_c11_da96_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_return_output,
 eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_return_output,
 ins_MUX_uxn_c_l72_c7_5a3d_return_output,
 is_ins_done_MUX_uxn_c_l72_c7_5a3d_return_output,
 pc_MUX_uxn_c_l72_c7_5a3d_return_output,
 cpu_step_result_MUX_uxn_c_l72_c7_5a3d_return_output,
 BIN_OP_EQ_uxn_c_l76_c11_c435_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_return_output,
 eval_opcode_result_MUX_uxn_c_l76_c7_c60e_return_output,
 ins_MUX_uxn_c_l76_c7_c60e_return_output,
 is_ins_done_MUX_uxn_c_l76_c7_c60e_return_output,
 pc_MUX_uxn_c_l76_c7_c60e_return_output,
 cpu_step_result_MUX_uxn_c_l76_c7_c60e_return_output,
 BIN_OP_PLUS_uxn_c_l78_c3_a605_return_output,
 BIN_OP_MINUS_uxn_c_l82_c43_8474_return_output,
 eval_opcode_phased_uxn_c_l82_c24_b47a_return_output,
 MUX_uxn_c_l83_c8_27c2_return_output,
 BIN_OP_EQ_uxn_c_l95_c6_ac15_return_output,
 step_cpu_phase_MUX_uxn_c_l95_c2_e64b_return_output,
 BIN_OP_PLUS_uxn_c_l98_c3_3a18_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_ram_read_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l66_c6_e57b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l66_c6_e57b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l66_c6_e57b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_iffalse : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l66_c2_5749_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l66_c2_5749_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l66_c2_5749_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l66_c2_5749_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l66_c2_5749_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l66_c2_5749_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l72_c7_5a3d_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l66_c2_5749_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l66_c2_5749_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l66_c2_5749_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l66_c2_5749_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l72_c7_5a3d_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l66_c2_5749_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l66_c2_5749_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l66_c2_5749_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l66_c2_5749_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l72_c7_5a3d_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l66_c2_5749_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l66_c2_5749_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l66_c2_5749_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a_uxn_c_l66_c2_5749_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l66_c2_5749_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l72_c7_5a3d_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l66_c2_5749_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l66_c2_5749_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l72_c11_da96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l72_c11_da96_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l72_c11_da96_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_iffalse : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l76_c7_c60e_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l72_c7_5a3d_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l72_c7_5a3d_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l76_c7_c60e_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l72_c7_5a3d_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l72_c7_5a3d_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l72_c7_5a3d_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l76_c7_c60e_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l72_c7_5a3d_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l72_c7_5a3d_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l72_c7_5a3d_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l76_c7_c60e_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l72_c7_5a3d_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l72_c7_5a3d_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247_uxn_c_l72_c7_5a3d_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l72_c7_5a3d_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l76_c7_c60e_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l72_c7_5a3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l76_c11_c435_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l76_c11_c435_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l76_c11_c435_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_iffalse : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l76_c7_c60e_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l76_c7_c60e_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l76_c7_c60e_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l76_c7_c60e_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l76_c7_c60e_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l76_c7_c60e_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l76_c7_c60e_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l76_c7_c60e_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l76_c7_c60e_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l76_c7_c60e_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l78_c3_8e5b : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l76_c7_c60e_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l76_c7_c60e_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l76_c7_c60e_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l76_c7_c60e_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a6e5_uxn_c_l76_c7_c60e_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l76_c7_c60e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_a605_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_a605_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_a605_return_output : unsigned(16 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_8474_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_8474_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l82_c43_8474_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l83_c8_27c2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_27c2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_27c2_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_4ce7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l83_c43_3358_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l83_c8_27c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_6cbb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l85_c33_c3f9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l86_c31_fbfc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l87_c35_0207_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l88_c38_0b00_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l89_c34_0ba4_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l90_c32_f54a_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l91_c17_d56a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l95_c6_ac15_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l95_c6_ac15_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l95_c6_ac15_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_e64b_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l96_c3_3e6b : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_e64b_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l98_c3_fe2c : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_e64b_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_e64b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l98_c3_3a18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l98_c3_3a18_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l98_c3_3a18_return_output : unsigned(8 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l72_c11_da96_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l95_c6_ac15_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l98_c3_3a18_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_8474_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_c_l66_c6_e57b_right := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l66_c2_5749_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_a605_right := to_unsigned(1, 1);
     VAR_step_cpu_phase_uxn_c_l96_c3_3e6b := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_e64b_iftrue := VAR_step_cpu_phase_uxn_c_l96_c3_3e6b;
     VAR_BIN_OP_EQ_uxn_c_l76_c11_c435_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ram_read_value := ram_read_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_iffalse := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l76_c7_c60e_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l66_c2_5749_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l76_c7_c60e_iftrue := eval_opcode_result;
     VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_ins := ins;
     VAR_ins_MUX_uxn_c_l66_c2_5749_iftrue := ins;
     VAR_ins_MUX_uxn_c_l72_c7_5a3d_iftrue := ins;
     VAR_ins_MUX_uxn_c_l76_c7_c60e_iffalse := ins;
     VAR_is_ins_done_MUX_uxn_c_l72_c7_5a3d_iftrue := is_ins_done;
     VAR_is_ins_done_MUX_uxn_c_l76_c7_c60e_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_a605_left := pc;
     VAR_MUX_uxn_c_l83_c8_27c2_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_pc := pc;
     VAR_pc_MUX_uxn_c_l66_c2_5749_iftrue := pc;
     VAR_pc_MUX_uxn_c_l72_c7_5a3d_iftrue := pc;
     VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_previous_ram_read := VAR_ram_read_value;
     VAR_ins_MUX_uxn_c_l76_c7_c60e_iftrue := VAR_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l66_c6_e57b_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l72_c11_da96_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l76_c11_c435_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_8474_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l98_c3_3a18_left := step_cpu_phase;
     -- BIN_OP_EQ[uxn_c_l72_c11_da96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l72_c11_da96_left <= VAR_BIN_OP_EQ_uxn_c_l72_c11_da96_left;
     BIN_OP_EQ_uxn_c_l72_c11_da96_right <= VAR_BIN_OP_EQ_uxn_c_l72_c11_da96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l72_c11_da96_return_output := BIN_OP_EQ_uxn_c_l72_c11_da96_return_output;

     -- BIN_OP_EQ[uxn_c_l76_c11_c435] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l76_c11_c435_left <= VAR_BIN_OP_EQ_uxn_c_l76_c11_c435_left;
     BIN_OP_EQ_uxn_c_l76_c11_c435_right <= VAR_BIN_OP_EQ_uxn_c_l76_c11_c435_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l76_c11_c435_return_output := BIN_OP_EQ_uxn_c_l76_c11_c435_return_output;

     -- BIN_OP_MINUS[uxn_c_l82_c43_8474] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l82_c43_8474_left <= VAR_BIN_OP_MINUS_uxn_c_l82_c43_8474_left;
     BIN_OP_MINUS_uxn_c_l82_c43_8474_right <= VAR_BIN_OP_MINUS_uxn_c_l82_c43_8474_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l82_c43_8474_return_output := BIN_OP_MINUS_uxn_c_l82_c43_8474_return_output;

     -- BIN_OP_PLUS[uxn_c_l98_c3_3a18] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l98_c3_3a18_left <= VAR_BIN_OP_PLUS_uxn_c_l98_c3_3a18_left;
     BIN_OP_PLUS_uxn_c_l98_c3_3a18_right <= VAR_BIN_OP_PLUS_uxn_c_l98_c3_3a18_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l98_c3_3a18_return_output := BIN_OP_PLUS_uxn_c_l98_c3_3a18_return_output;

     -- BIN_OP_PLUS[uxn_c_l78_c3_a605] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l78_c3_a605_left <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_a605_left;
     BIN_OP_PLUS_uxn_c_l78_c3_a605_right <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_a605_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_a605_return_output := BIN_OP_PLUS_uxn_c_l78_c3_a605_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a[uxn_c_l66_c2_5749] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a_uxn_c_l66_c2_5749_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a(
     cpu_step_result,
     pc,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_c_l66_c6_e57b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l66_c6_e57b_left <= VAR_BIN_OP_EQ_uxn_c_l66_c6_e57b_left;
     BIN_OP_EQ_uxn_c_l66_c6_e57b_right <= VAR_BIN_OP_EQ_uxn_c_l66_c6_e57b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l66_c6_e57b_return_output := BIN_OP_EQ_uxn_c_l66_c6_e57b_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247[uxn_c_l72_c7_5a3d] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247_uxn_c_l72_c7_5a3d_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247(
     cpu_step_result,
     pc);

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_cond := VAR_BIN_OP_EQ_uxn_c_l66_c6_e57b_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l66_c2_5749_cond := VAR_BIN_OP_EQ_uxn_c_l66_c6_e57b_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l66_c2_5749_cond := VAR_BIN_OP_EQ_uxn_c_l66_c6_e57b_return_output;
     VAR_ins_MUX_uxn_c_l66_c2_5749_cond := VAR_BIN_OP_EQ_uxn_c_l66_c6_e57b_return_output;
     VAR_is_ins_done_MUX_uxn_c_l66_c2_5749_cond := VAR_BIN_OP_EQ_uxn_c_l66_c6_e57b_return_output;
     VAR_pc_MUX_uxn_c_l66_c2_5749_cond := VAR_BIN_OP_EQ_uxn_c_l66_c6_e57b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_da96_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l72_c7_5a3d_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_da96_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_da96_return_output;
     VAR_ins_MUX_uxn_c_l72_c7_5a3d_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_da96_return_output;
     VAR_is_ins_done_MUX_uxn_c_l72_c7_5a3d_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_da96_return_output;
     VAR_pc_MUX_uxn_c_l72_c7_5a3d_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_da96_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_c435_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l76_c7_c60e_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_c435_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l76_c7_c60e_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_c435_return_output;
     VAR_ins_MUX_uxn_c_l76_c7_c60e_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_c435_return_output;
     VAR_is_ins_done_MUX_uxn_c_l76_c7_c60e_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_c435_return_output;
     VAR_pc_MUX_uxn_c_l76_c7_c60e_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_c435_return_output;
     VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_phase := VAR_BIN_OP_MINUS_uxn_c_l82_c43_8474_return_output;
     VAR_pc_uxn_c_l78_c3_8e5b := resize(VAR_BIN_OP_PLUS_uxn_c_l78_c3_a605_return_output, 16);
     VAR_step_cpu_phase_uxn_c_l98_c3_fe2c := resize(VAR_BIN_OP_PLUS_uxn_c_l98_c3_3a18_return_output, 8);
     VAR_cpu_step_result_MUX_uxn_c_l72_c7_5a3d_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247_uxn_c_l72_c7_5a3d_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l66_c2_5749_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a_uxn_c_l66_c2_5749_return_output;
     VAR_pc_MUX_uxn_c_l76_c7_c60e_iftrue := VAR_pc_uxn_c_l78_c3_8e5b;
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_e64b_iffalse := VAR_step_cpu_phase_uxn_c_l98_c3_fe2c;
     -- ins_MUX[uxn_c_l76_c7_c60e] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l76_c7_c60e_cond <= VAR_ins_MUX_uxn_c_l76_c7_c60e_cond;
     ins_MUX_uxn_c_l76_c7_c60e_iftrue <= VAR_ins_MUX_uxn_c_l76_c7_c60e_iftrue;
     ins_MUX_uxn_c_l76_c7_c60e_iffalse <= VAR_ins_MUX_uxn_c_l76_c7_c60e_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l76_c7_c60e_return_output := ins_MUX_uxn_c_l76_c7_c60e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l72_c7_5a3d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_5a3d_return_output;
     VAR_ins_MUX_uxn_c_l72_c7_5a3d_iffalse := VAR_ins_MUX_uxn_c_l76_c7_c60e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l76_c7_c60e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_return_output;

     -- ins_MUX[uxn_c_l72_c7_5a3d] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l72_c7_5a3d_cond <= VAR_ins_MUX_uxn_c_l72_c7_5a3d_cond;
     ins_MUX_uxn_c_l72_c7_5a3d_iftrue <= VAR_ins_MUX_uxn_c_l72_c7_5a3d_iftrue;
     ins_MUX_uxn_c_l72_c7_5a3d_iffalse <= VAR_ins_MUX_uxn_c_l72_c7_5a3d_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l72_c7_5a3d_return_output := ins_MUX_uxn_c_l72_c7_5a3d_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_c60e_return_output;
     VAR_ins_MUX_uxn_c_l66_c2_5749_iffalse := VAR_ins_MUX_uxn_c_l72_c7_5a3d_return_output;
     -- ins_MUX[uxn_c_l66_c2_5749] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l66_c2_5749_cond <= VAR_ins_MUX_uxn_c_l66_c2_5749_cond;
     ins_MUX_uxn_c_l66_c2_5749_iftrue <= VAR_ins_MUX_uxn_c_l66_c2_5749_iftrue;
     ins_MUX_uxn_c_l66_c2_5749_iffalse <= VAR_ins_MUX_uxn_c_l66_c2_5749_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l66_c2_5749_return_output := ins_MUX_uxn_c_l66_c2_5749_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c1_35a1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_return_output;

     -- Submodule level 4
     VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_35a1_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l66_c2_5749_return_output;
     -- eval_opcode_phased[uxn_c_l82_c24_b47a] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l82_c24_b47a_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l82_c24_b47a_phase <= VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_phase;
     eval_opcode_phased_uxn_c_l82_c24_b47a_ins <= VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_ins;
     eval_opcode_phased_uxn_c_l82_c24_b47a_pc <= VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_pc;
     eval_opcode_phased_uxn_c_l82_c24_b47a_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_previous_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_return_output := eval_opcode_phased_uxn_c_l82_c24_b47a_return_output;

     -- Submodule level 5
     VAR_eval_opcode_result_MUX_uxn_c_l76_c7_c60e_iffalse := VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_return_output;
     -- CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d[uxn_c_l90_c32_f54a] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l90_c32_f54a_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_return_output.vram_value;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d[uxn_c_l83_c43_3358] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l83_c43_3358_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_return_output.pc;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l87_c35_0207] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l87_c35_0207_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_return_output.is_vram_write;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l89_c34_0ba4] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l89_c34_0ba4_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l84_c34_6cbb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_6cbb_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l91_c17_d56a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l91_c17_d56a_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l88_c38_0b00] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l88_c38_0b00_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_return_output.vram_write_layer;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d[uxn_c_l85_c33_c3f9] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l85_c33_c3f9_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_return_output.ram_addr;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d[uxn_c_l86_c31_fbfc] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l86_c31_fbfc_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_return_output.ram_value;

     -- eval_opcode_result_MUX[uxn_c_l76_c7_c60e] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l76_c7_c60e_cond <= VAR_eval_opcode_result_MUX_uxn_c_l76_c7_c60e_cond;
     eval_opcode_result_MUX_uxn_c_l76_c7_c60e_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l76_c7_c60e_iftrue;
     eval_opcode_result_MUX_uxn_c_l76_c7_c60e_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l76_c7_c60e_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l76_c7_c60e_return_output := eval_opcode_result_MUX_uxn_c_l76_c7_c60e_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l83_c8_4ce7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_4ce7_return_output := VAR_eval_opcode_phased_uxn_c_l82_c24_b47a_return_output.is_pc_updated;

     -- Submodule level 6
     VAR_MUX_uxn_c_l83_c8_27c2_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l83_c43_3358_return_output;
     VAR_is_ins_done_MUX_uxn_c_l76_c7_c60e_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l91_c17_d56a_return_output;
     VAR_MUX_uxn_c_l83_c8_27c2_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l83_c8_4ce7_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l76_c7_c60e_return_output;
     -- eval_opcode_result_MUX[uxn_c_l72_c7_5a3d] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_cond <= VAR_eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_cond;
     eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_iftrue;
     eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_return_output := eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_return_output;

     -- MUX[uxn_c_l83_c8_27c2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l83_c8_27c2_cond <= VAR_MUX_uxn_c_l83_c8_27c2_cond;
     MUX_uxn_c_l83_c8_27c2_iftrue <= VAR_MUX_uxn_c_l83_c8_27c2_iftrue;
     MUX_uxn_c_l83_c8_27c2_iffalse <= VAR_MUX_uxn_c_l83_c8_27c2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l83_c8_27c2_return_output := MUX_uxn_c_l83_c8_27c2_return_output;

     -- is_ins_done_MUX[uxn_c_l76_c7_c60e] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l76_c7_c60e_cond <= VAR_is_ins_done_MUX_uxn_c_l76_c7_c60e_cond;
     is_ins_done_MUX_uxn_c_l76_c7_c60e_iftrue <= VAR_is_ins_done_MUX_uxn_c_l76_c7_c60e_iftrue;
     is_ins_done_MUX_uxn_c_l76_c7_c60e_iffalse <= VAR_is_ins_done_MUX_uxn_c_l76_c7_c60e_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l76_c7_c60e_return_output := is_ins_done_MUX_uxn_c_l76_c7_c60e_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a6e5[uxn_c_l76_c7_c60e] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a6e5_uxn_c_l76_c7_c60e_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a6e5(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l84_c34_6cbb_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l85_c33_c3f9_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l86_c31_fbfc_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l87_c35_0207_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l88_c38_0b00_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l89_c34_0ba4_return_output,
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l90_c32_f54a_return_output);

     -- Submodule level 7
     VAR_pc_MUX_uxn_c_l76_c7_c60e_iffalse := VAR_MUX_uxn_c_l83_c8_27c2_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l76_c7_c60e_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a6e5_uxn_c_l76_c7_c60e_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l66_c2_5749_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l72_c7_5a3d_return_output;
     VAR_is_ins_done_MUX_uxn_c_l72_c7_5a3d_iffalse := VAR_is_ins_done_MUX_uxn_c_l76_c7_c60e_return_output;
     -- cpu_step_result_MUX[uxn_c_l76_c7_c60e] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l76_c7_c60e_cond <= VAR_cpu_step_result_MUX_uxn_c_l76_c7_c60e_cond;
     cpu_step_result_MUX_uxn_c_l76_c7_c60e_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l76_c7_c60e_iftrue;
     cpu_step_result_MUX_uxn_c_l76_c7_c60e_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l76_c7_c60e_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l76_c7_c60e_return_output := cpu_step_result_MUX_uxn_c_l76_c7_c60e_return_output;

     -- is_ins_done_MUX[uxn_c_l72_c7_5a3d] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l72_c7_5a3d_cond <= VAR_is_ins_done_MUX_uxn_c_l72_c7_5a3d_cond;
     is_ins_done_MUX_uxn_c_l72_c7_5a3d_iftrue <= VAR_is_ins_done_MUX_uxn_c_l72_c7_5a3d_iftrue;
     is_ins_done_MUX_uxn_c_l72_c7_5a3d_iffalse <= VAR_is_ins_done_MUX_uxn_c_l72_c7_5a3d_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l72_c7_5a3d_return_output := is_ins_done_MUX_uxn_c_l72_c7_5a3d_return_output;

     -- eval_opcode_result_MUX[uxn_c_l66_c2_5749] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l66_c2_5749_cond <= VAR_eval_opcode_result_MUX_uxn_c_l66_c2_5749_cond;
     eval_opcode_result_MUX_uxn_c_l66_c2_5749_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l66_c2_5749_iftrue;
     eval_opcode_result_MUX_uxn_c_l66_c2_5749_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l66_c2_5749_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l66_c2_5749_return_output := eval_opcode_result_MUX_uxn_c_l66_c2_5749_return_output;

     -- pc_MUX[uxn_c_l76_c7_c60e] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l76_c7_c60e_cond <= VAR_pc_MUX_uxn_c_l76_c7_c60e_cond;
     pc_MUX_uxn_c_l76_c7_c60e_iftrue <= VAR_pc_MUX_uxn_c_l76_c7_c60e_iftrue;
     pc_MUX_uxn_c_l76_c7_c60e_iffalse <= VAR_pc_MUX_uxn_c_l76_c7_c60e_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l76_c7_c60e_return_output := pc_MUX_uxn_c_l76_c7_c60e_return_output;

     -- Submodule level 8
     VAR_cpu_step_result_MUX_uxn_c_l72_c7_5a3d_iffalse := VAR_cpu_step_result_MUX_uxn_c_l76_c7_c60e_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l66_c2_5749_return_output;
     VAR_is_ins_done_MUX_uxn_c_l66_c2_5749_iffalse := VAR_is_ins_done_MUX_uxn_c_l72_c7_5a3d_return_output;
     VAR_pc_MUX_uxn_c_l72_c7_5a3d_iffalse := VAR_pc_MUX_uxn_c_l76_c7_c60e_return_output;
     -- pc_MUX[uxn_c_l72_c7_5a3d] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l72_c7_5a3d_cond <= VAR_pc_MUX_uxn_c_l72_c7_5a3d_cond;
     pc_MUX_uxn_c_l72_c7_5a3d_iftrue <= VAR_pc_MUX_uxn_c_l72_c7_5a3d_iftrue;
     pc_MUX_uxn_c_l72_c7_5a3d_iffalse <= VAR_pc_MUX_uxn_c_l72_c7_5a3d_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l72_c7_5a3d_return_output := pc_MUX_uxn_c_l72_c7_5a3d_return_output;

     -- is_ins_done_MUX[uxn_c_l66_c2_5749] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l66_c2_5749_cond <= VAR_is_ins_done_MUX_uxn_c_l66_c2_5749_cond;
     is_ins_done_MUX_uxn_c_l66_c2_5749_iftrue <= VAR_is_ins_done_MUX_uxn_c_l66_c2_5749_iftrue;
     is_ins_done_MUX_uxn_c_l66_c2_5749_iffalse <= VAR_is_ins_done_MUX_uxn_c_l66_c2_5749_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l66_c2_5749_return_output := is_ins_done_MUX_uxn_c_l66_c2_5749_return_output;

     -- cpu_step_result_MUX[uxn_c_l72_c7_5a3d] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l72_c7_5a3d_cond <= VAR_cpu_step_result_MUX_uxn_c_l72_c7_5a3d_cond;
     cpu_step_result_MUX_uxn_c_l72_c7_5a3d_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l72_c7_5a3d_iftrue;
     cpu_step_result_MUX_uxn_c_l72_c7_5a3d_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l72_c7_5a3d_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l72_c7_5a3d_return_output := cpu_step_result_MUX_uxn_c_l72_c7_5a3d_return_output;

     -- Submodule level 9
     VAR_cpu_step_result_MUX_uxn_c_l66_c2_5749_iffalse := VAR_cpu_step_result_MUX_uxn_c_l72_c7_5a3d_return_output;
     VAR_BIN_OP_EQ_uxn_c_l95_c6_ac15_left := VAR_is_ins_done_MUX_uxn_c_l66_c2_5749_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l66_c2_5749_return_output;
     VAR_pc_MUX_uxn_c_l66_c2_5749_iffalse := VAR_pc_MUX_uxn_c_l72_c7_5a3d_return_output;
     -- pc_MUX[uxn_c_l66_c2_5749] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l66_c2_5749_cond <= VAR_pc_MUX_uxn_c_l66_c2_5749_cond;
     pc_MUX_uxn_c_l66_c2_5749_iftrue <= VAR_pc_MUX_uxn_c_l66_c2_5749_iftrue;
     pc_MUX_uxn_c_l66_c2_5749_iffalse <= VAR_pc_MUX_uxn_c_l66_c2_5749_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l66_c2_5749_return_output := pc_MUX_uxn_c_l66_c2_5749_return_output;

     -- cpu_step_result_MUX[uxn_c_l66_c2_5749] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l66_c2_5749_cond <= VAR_cpu_step_result_MUX_uxn_c_l66_c2_5749_cond;
     cpu_step_result_MUX_uxn_c_l66_c2_5749_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l66_c2_5749_iftrue;
     cpu_step_result_MUX_uxn_c_l66_c2_5749_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l66_c2_5749_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l66_c2_5749_return_output := cpu_step_result_MUX_uxn_c_l66_c2_5749_return_output;

     -- BIN_OP_EQ[uxn_c_l95_c6_ac15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l95_c6_ac15_left <= VAR_BIN_OP_EQ_uxn_c_l95_c6_ac15_left;
     BIN_OP_EQ_uxn_c_l95_c6_ac15_right <= VAR_BIN_OP_EQ_uxn_c_l95_c6_ac15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l95_c6_ac15_return_output := BIN_OP_EQ_uxn_c_l95_c6_ac15_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_e64b_cond := VAR_BIN_OP_EQ_uxn_c_l95_c6_ac15_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l66_c2_5749_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l66_c2_5749_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l66_c2_5749_return_output;
     -- step_cpu_phase_MUX[uxn_c_l95_c2_e64b] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l95_c2_e64b_cond <= VAR_step_cpu_phase_MUX_uxn_c_l95_c2_e64b_cond;
     step_cpu_phase_MUX_uxn_c_l95_c2_e64b_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l95_c2_e64b_iftrue;
     step_cpu_phase_MUX_uxn_c_l95_c2_e64b_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l95_c2_e64b_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_e64b_return_output := step_cpu_phase_MUX_uxn_c_l95_c2_e64b_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l95_c2_e64b_return_output;
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
