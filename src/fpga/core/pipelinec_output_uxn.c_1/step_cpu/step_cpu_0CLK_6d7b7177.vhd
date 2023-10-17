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
-- Submodules: 27
entity step_cpu_0CLK_6d7b7177 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ram_read_value : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_6d7b7177;
architecture arch of step_cpu_0CLK_6d7b7177 is
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
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
u8_value => to_unsigned(0, 8))
;
signal REG_COMB_pc : unsigned(15 downto 0);
signal REG_COMB_ins : unsigned(7 downto 0);
signal REG_COMB_step_cpu_phase : unsigned(7 downto 0);
signal REG_COMB_is_ins_done : unsigned(0 downto 0);
signal REG_COMB_eval_opcode_result : eval_opcode_result_t;
signal REG_COMB_cpu_step_result : cpu_step_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_c_l61_c6_8282]
signal BIN_OP_EQ_uxn_c_l61_c6_8282_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l61_c6_8282_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l61_c6_8282_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l67_c7_7460]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l61_c2_8670]
signal cpu_step_result_MUX_uxn_c_l61_c2_8670_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l61_c2_8670_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l61_c2_8670_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l61_c2_8670_return_output : cpu_step_result_t;

-- is_ins_done_MUX[uxn_c_l61_c2_8670]
signal is_ins_done_MUX_uxn_c_l61_c2_8670_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l61_c2_8670_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l61_c2_8670_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l61_c2_8670_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l61_c2_8670]
signal ins_MUX_uxn_c_l61_c2_8670_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l61_c2_8670_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l61_c2_8670_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l61_c2_8670_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l61_c2_8670]
signal pc_MUX_uxn_c_l61_c2_8670_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l61_c2_8670_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l61_c2_8670_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l61_c2_8670_return_output : unsigned(15 downto 0);

-- eval_opcode_result_MUX[uxn_c_l61_c2_8670]
signal eval_opcode_result_MUX_uxn_c_l61_c2_8670_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l61_c2_8670_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l61_c2_8670_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l61_c2_8670_return_output : eval_opcode_result_t;

-- BIN_OP_EQ[uxn_c_l67_c11_f8ea]
signal BIN_OP_EQ_uxn_c_l67_c11_f8ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l67_c11_f8ea_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l67_c11_f8ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l70_c1_b110]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l67_c7_7460]
signal cpu_step_result_MUX_uxn_c_l67_c7_7460_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l67_c7_7460_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l67_c7_7460_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l67_c7_7460_return_output : cpu_step_result_t;

-- is_ins_done_MUX[uxn_c_l67_c7_7460]
signal is_ins_done_MUX_uxn_c_l67_c7_7460_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l67_c7_7460_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l67_c7_7460_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l67_c7_7460_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l67_c7_7460]
signal ins_MUX_uxn_c_l67_c7_7460_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l67_c7_7460_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l67_c7_7460_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l67_c7_7460_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l67_c7_7460]
signal pc_MUX_uxn_c_l67_c7_7460_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l67_c7_7460_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l67_c7_7460_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l67_c7_7460_return_output : unsigned(15 downto 0);

-- eval_opcode_result_MUX[uxn_c_l67_c7_7460]
signal eval_opcode_result_MUX_uxn_c_l67_c7_7460_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l67_c7_7460_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l67_c7_7460_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l67_c7_7460_return_output : eval_opcode_result_t;

-- BIN_OP_PLUS[uxn_c_l68_c3_d0b8]
signal BIN_OP_PLUS_uxn_c_l68_c3_d0b8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l68_c3_d0b8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l68_c3_d0b8_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l71_c9_482f]
signal BIN_OP_EQ_uxn_c_l71_c9_482f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l71_c9_482f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l71_c9_482f_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l71_c9_4d6e]
signal MUX_uxn_c_l71_c9_4d6e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l71_c9_4d6e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l71_c9_4d6e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l71_c9_4d6e_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l72_c43_aa4d]
signal BIN_OP_MINUS_uxn_c_l72_c43_aa4d_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l72_c43_aa4d_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l72_c43_aa4d_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l72_c24_b618]
signal eval_opcode_phased_uxn_c_l72_c24_b618_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l72_c24_b618_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l72_c24_b618_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l72_c24_b618_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l72_c24_b618_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l72_c24_b618_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l73_c8_d2bb]
signal MUX_uxn_c_l73_c8_d2bb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l73_c8_d2bb_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l73_c8_d2bb_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l73_c8_d2bb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l83_c6_cf4a]
signal BIN_OP_EQ_uxn_c_l83_c6_cf4a_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l83_c6_cf4a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l83_c6_cf4a_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l83_c2_6ea7]
signal step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l86_c21_4693]
signal BIN_OP_EQ_uxn_c_l86_c21_4693_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l86_c21_4693_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l86_c21_4693_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l86_c37_a6c4]
signal BIN_OP_PLUS_uxn_c_l86_c37_a6c4_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l86_c37_a6c4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l86_c37_a6c4_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l86_c21_5ed9]
signal MUX_uxn_c_l86_c21_5ed9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l86_c21_5ed9_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l86_c21_5ed9_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l86_c21_5ed9_return_output : unsigned(7 downto 0);

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8326( ref_toks_0 : cpu_step_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base := ref_toks_0;
      base.ram_address := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d03d( ref_toks_0 : unsigned;
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
      base.is_vram_write := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.vram_address := ref_toks_4;
      base.u8_value := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_c_l61_c6_8282
BIN_OP_EQ_uxn_c_l61_c6_8282 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l61_c6_8282_left,
BIN_OP_EQ_uxn_c_l61_c6_8282_right,
BIN_OP_EQ_uxn_c_l61_c6_8282_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460
FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_return_output);

-- cpu_step_result_MUX_uxn_c_l61_c2_8670
cpu_step_result_MUX_uxn_c_l61_c2_8670 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l61_c2_8670_cond,
cpu_step_result_MUX_uxn_c_l61_c2_8670_iftrue,
cpu_step_result_MUX_uxn_c_l61_c2_8670_iffalse,
cpu_step_result_MUX_uxn_c_l61_c2_8670_return_output);

-- is_ins_done_MUX_uxn_c_l61_c2_8670
is_ins_done_MUX_uxn_c_l61_c2_8670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l61_c2_8670_cond,
is_ins_done_MUX_uxn_c_l61_c2_8670_iftrue,
is_ins_done_MUX_uxn_c_l61_c2_8670_iffalse,
is_ins_done_MUX_uxn_c_l61_c2_8670_return_output);

-- ins_MUX_uxn_c_l61_c2_8670
ins_MUX_uxn_c_l61_c2_8670 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l61_c2_8670_cond,
ins_MUX_uxn_c_l61_c2_8670_iftrue,
ins_MUX_uxn_c_l61_c2_8670_iffalse,
ins_MUX_uxn_c_l61_c2_8670_return_output);

-- pc_MUX_uxn_c_l61_c2_8670
pc_MUX_uxn_c_l61_c2_8670 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l61_c2_8670_cond,
pc_MUX_uxn_c_l61_c2_8670_iftrue,
pc_MUX_uxn_c_l61_c2_8670_iffalse,
pc_MUX_uxn_c_l61_c2_8670_return_output);

-- eval_opcode_result_MUX_uxn_c_l61_c2_8670
eval_opcode_result_MUX_uxn_c_l61_c2_8670 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l61_c2_8670_cond,
eval_opcode_result_MUX_uxn_c_l61_c2_8670_iftrue,
eval_opcode_result_MUX_uxn_c_l61_c2_8670_iffalse,
eval_opcode_result_MUX_uxn_c_l61_c2_8670_return_output);

-- BIN_OP_EQ_uxn_c_l67_c11_f8ea
BIN_OP_EQ_uxn_c_l67_c11_f8ea : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l67_c11_f8ea_left,
BIN_OP_EQ_uxn_c_l67_c11_f8ea_right,
BIN_OP_EQ_uxn_c_l67_c11_f8ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110
FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_return_output);

-- cpu_step_result_MUX_uxn_c_l67_c7_7460
cpu_step_result_MUX_uxn_c_l67_c7_7460 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l67_c7_7460_cond,
cpu_step_result_MUX_uxn_c_l67_c7_7460_iftrue,
cpu_step_result_MUX_uxn_c_l67_c7_7460_iffalse,
cpu_step_result_MUX_uxn_c_l67_c7_7460_return_output);

-- is_ins_done_MUX_uxn_c_l67_c7_7460
is_ins_done_MUX_uxn_c_l67_c7_7460 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l67_c7_7460_cond,
is_ins_done_MUX_uxn_c_l67_c7_7460_iftrue,
is_ins_done_MUX_uxn_c_l67_c7_7460_iffalse,
is_ins_done_MUX_uxn_c_l67_c7_7460_return_output);

-- ins_MUX_uxn_c_l67_c7_7460
ins_MUX_uxn_c_l67_c7_7460 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l67_c7_7460_cond,
ins_MUX_uxn_c_l67_c7_7460_iftrue,
ins_MUX_uxn_c_l67_c7_7460_iffalse,
ins_MUX_uxn_c_l67_c7_7460_return_output);

-- pc_MUX_uxn_c_l67_c7_7460
pc_MUX_uxn_c_l67_c7_7460 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l67_c7_7460_cond,
pc_MUX_uxn_c_l67_c7_7460_iftrue,
pc_MUX_uxn_c_l67_c7_7460_iffalse,
pc_MUX_uxn_c_l67_c7_7460_return_output);

-- eval_opcode_result_MUX_uxn_c_l67_c7_7460
eval_opcode_result_MUX_uxn_c_l67_c7_7460 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l67_c7_7460_cond,
eval_opcode_result_MUX_uxn_c_l67_c7_7460_iftrue,
eval_opcode_result_MUX_uxn_c_l67_c7_7460_iffalse,
eval_opcode_result_MUX_uxn_c_l67_c7_7460_return_output);

-- BIN_OP_PLUS_uxn_c_l68_c3_d0b8
BIN_OP_PLUS_uxn_c_l68_c3_d0b8 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l68_c3_d0b8_left,
BIN_OP_PLUS_uxn_c_l68_c3_d0b8_right,
BIN_OP_PLUS_uxn_c_l68_c3_d0b8_return_output);

-- BIN_OP_EQ_uxn_c_l71_c9_482f
BIN_OP_EQ_uxn_c_l71_c9_482f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l71_c9_482f_left,
BIN_OP_EQ_uxn_c_l71_c9_482f_right,
BIN_OP_EQ_uxn_c_l71_c9_482f_return_output);

-- MUX_uxn_c_l71_c9_4d6e
MUX_uxn_c_l71_c9_4d6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l71_c9_4d6e_cond,
MUX_uxn_c_l71_c9_4d6e_iftrue,
MUX_uxn_c_l71_c9_4d6e_iffalse,
MUX_uxn_c_l71_c9_4d6e_return_output);

-- BIN_OP_MINUS_uxn_c_l72_c43_aa4d
BIN_OP_MINUS_uxn_c_l72_c43_aa4d : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l72_c43_aa4d_left,
BIN_OP_MINUS_uxn_c_l72_c43_aa4d_right,
BIN_OP_MINUS_uxn_c_l72_c43_aa4d_return_output);

-- eval_opcode_phased_uxn_c_l72_c24_b618
eval_opcode_phased_uxn_c_l72_c24_b618 : entity work.eval_opcode_phased_0CLK_0c80fd85 port map (
clk,
eval_opcode_phased_uxn_c_l72_c24_b618_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l72_c24_b618_phase,
eval_opcode_phased_uxn_c_l72_c24_b618_ins,
eval_opcode_phased_uxn_c_l72_c24_b618_pc,
eval_opcode_phased_uxn_c_l72_c24_b618_previous_ram_read,
eval_opcode_phased_uxn_c_l72_c24_b618_return_output);

-- MUX_uxn_c_l73_c8_d2bb
MUX_uxn_c_l73_c8_d2bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l73_c8_d2bb_cond,
MUX_uxn_c_l73_c8_d2bb_iftrue,
MUX_uxn_c_l73_c8_d2bb_iffalse,
MUX_uxn_c_l73_c8_d2bb_return_output);

-- BIN_OP_EQ_uxn_c_l83_c6_cf4a
BIN_OP_EQ_uxn_c_l83_c6_cf4a : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l83_c6_cf4a_left,
BIN_OP_EQ_uxn_c_l83_c6_cf4a_right,
BIN_OP_EQ_uxn_c_l83_c6_cf4a_return_output);

-- step_cpu_phase_MUX_uxn_c_l83_c2_6ea7
step_cpu_phase_MUX_uxn_c_l83_c2_6ea7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_cond,
step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_iftrue,
step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_iffalse,
step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_return_output);

-- BIN_OP_EQ_uxn_c_l86_c21_4693
BIN_OP_EQ_uxn_c_l86_c21_4693 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l86_c21_4693_left,
BIN_OP_EQ_uxn_c_l86_c21_4693_right,
BIN_OP_EQ_uxn_c_l86_c21_4693_return_output);

-- BIN_OP_PLUS_uxn_c_l86_c37_a6c4
BIN_OP_PLUS_uxn_c_l86_c37_a6c4 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l86_c37_a6c4_left,
BIN_OP_PLUS_uxn_c_l86_c37_a6c4_right,
BIN_OP_PLUS_uxn_c_l86_c37_a6c4_return_output);

-- MUX_uxn_c_l86_c21_5ed9
MUX_uxn_c_l86_c21_5ed9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l86_c21_5ed9_cond,
MUX_uxn_c_l86_c21_5ed9_iftrue,
MUX_uxn_c_l86_c21_5ed9_iffalse,
MUX_uxn_c_l86_c21_5ed9_return_output);



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
 BIN_OP_EQ_uxn_c_l61_c6_8282_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_return_output,
 cpu_step_result_MUX_uxn_c_l61_c2_8670_return_output,
 is_ins_done_MUX_uxn_c_l61_c2_8670_return_output,
 ins_MUX_uxn_c_l61_c2_8670_return_output,
 pc_MUX_uxn_c_l61_c2_8670_return_output,
 eval_opcode_result_MUX_uxn_c_l61_c2_8670_return_output,
 BIN_OP_EQ_uxn_c_l67_c11_f8ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_return_output,
 cpu_step_result_MUX_uxn_c_l67_c7_7460_return_output,
 is_ins_done_MUX_uxn_c_l67_c7_7460_return_output,
 ins_MUX_uxn_c_l67_c7_7460_return_output,
 pc_MUX_uxn_c_l67_c7_7460_return_output,
 eval_opcode_result_MUX_uxn_c_l67_c7_7460_return_output,
 BIN_OP_PLUS_uxn_c_l68_c3_d0b8_return_output,
 BIN_OP_EQ_uxn_c_l71_c9_482f_return_output,
 MUX_uxn_c_l71_c9_4d6e_return_output,
 BIN_OP_MINUS_uxn_c_l72_c43_aa4d_return_output,
 eval_opcode_phased_uxn_c_l72_c24_b618_return_output,
 MUX_uxn_c_l73_c8_d2bb_return_output,
 BIN_OP_EQ_uxn_c_l83_c6_cf4a_return_output,
 step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_return_output,
 BIN_OP_EQ_uxn_c_l86_c21_4693_return_output,
 BIN_OP_PLUS_uxn_c_l86_c37_a6c4_return_output,
 MUX_uxn_c_l86_c21_5ed9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_ram_read_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l61_c6_8282_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l61_c6_8282_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l61_c6_8282_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l61_c2_8670_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8326_uxn_c_l61_c2_8670_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l61_c2_8670_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l67_c7_7460_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l61_c2_8670_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l61_c2_8670_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l61_c2_8670_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l61_c2_8670_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l67_c7_7460_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l61_c2_8670_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l61_c2_8670_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l61_c2_8670_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l61_c2_8670_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l67_c7_7460_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l61_c2_8670_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l61_c2_8670_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l61_c2_8670_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l61_c2_8670_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l67_c7_7460_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l61_c2_8670_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l61_c2_8670_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l61_c2_8670_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l61_c2_8670_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l67_c7_7460_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l61_c2_8670_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l61_c2_8670_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l67_c11_f8ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l67_c11_f8ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l67_c11_f8ea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l67_c7_7460_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l67_c7_7460_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d03d_uxn_c_l67_c7_7460_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l67_c7_7460_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l67_c7_7460_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l67_c7_7460_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l67_c7_7460_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l67_c7_7460_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l67_c7_7460_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l67_c7_7460_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l67_c7_7460_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l68_c3_140e : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l67_c7_7460_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l67_c7_7460_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l67_c7_7460_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l67_c7_7460_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l67_c7_7460_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l68_c3_d0b8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l68_c3_d0b8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l68_c3_d0b8_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l71_c9_4d6e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l71_c9_4d6e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l71_c9_4d6e_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l71_c9_482f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l71_c9_482f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l71_c9_482f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l71_c9_4d6e_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l72_c24_b618_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l72_c24_b618_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l72_c24_b618_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l72_c24_b618_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l72_c43_aa4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l72_c43_aa4d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l72_c43_aa4d_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l72_c24_b618_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l72_c24_b618_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l73_c8_d2bb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l73_c8_d2bb_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l73_c8_d2bb_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l73_c8_a649_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l73_c8_d2bb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l74_c34_1fe3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l76_c35_2d54_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l77_c38_a715_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l78_c34_1c6a_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l79_c30_b696_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l80_c17_cfdb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l83_c6_cf4a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l83_c6_cf4a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l83_c6_cf4a_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l84_c3_c323 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l86_c21_5ed9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l86_c21_5ed9_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l86_c21_5ed9_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c21_4693_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c21_4693_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l86_c21_4693_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l86_c37_a6c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l86_c37_a6c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l86_c37_a6c4_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l86_c21_5ed9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l75_l73_DUPLICATE_502a_return_output : unsigned(15 downto 0);
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
     VAR_BIN_OP_EQ_uxn_c_l61_c6_8282_right := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l84_c3_c323 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_iftrue := VAR_step_cpu_phase_uxn_c_l84_c3_c323;
     VAR_is_ins_done_MUX_uxn_c_l61_c2_8670_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l86_c37_a6c4_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l72_c43_aa4d_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l68_c3_d0b8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l71_c9_482f_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l86_c21_4693_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l86_c21_5ed9_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_c_l83_c6_cf4a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l67_c11_f8ea_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ram_read_value := ram_read_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_iffalse := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l67_c7_7460_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l61_c2_8670_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l67_c7_7460_iftrue := eval_opcode_result;
     VAR_MUX_uxn_c_l71_c9_4d6e_iffalse := ins;
     VAR_ins_MUX_uxn_c_l61_c2_8670_iftrue := ins;
     VAR_ins_MUX_uxn_c_l67_c7_7460_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l67_c7_7460_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l68_c3_d0b8_left := pc;
     VAR_MUX_uxn_c_l73_c8_d2bb_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l72_c24_b618_pc := pc;
     VAR_pc_MUX_uxn_c_l61_c2_8670_iftrue := pc;
     VAR_MUX_uxn_c_l71_c9_4d6e_iftrue := VAR_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l72_c24_b618_previous_ram_read := VAR_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l61_c6_8282_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l67_c11_f8ea_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l71_c9_482f_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l72_c43_aa4d_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l86_c37_a6c4_left := step_cpu_phase;
     -- BIN_OP_MINUS[uxn_c_l72_c43_aa4d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l72_c43_aa4d_left <= VAR_BIN_OP_MINUS_uxn_c_l72_c43_aa4d_left;
     BIN_OP_MINUS_uxn_c_l72_c43_aa4d_right <= VAR_BIN_OP_MINUS_uxn_c_l72_c43_aa4d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l72_c43_aa4d_return_output := BIN_OP_MINUS_uxn_c_l72_c43_aa4d_return_output;

     -- BIN_OP_EQ[uxn_c_l67_c11_f8ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l67_c11_f8ea_left <= VAR_BIN_OP_EQ_uxn_c_l67_c11_f8ea_left;
     BIN_OP_EQ_uxn_c_l67_c11_f8ea_right <= VAR_BIN_OP_EQ_uxn_c_l67_c11_f8ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l67_c11_f8ea_return_output := BIN_OP_EQ_uxn_c_l67_c11_f8ea_return_output;

     -- BIN_OP_PLUS[uxn_c_l86_c37_a6c4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l86_c37_a6c4_left <= VAR_BIN_OP_PLUS_uxn_c_l86_c37_a6c4_left;
     BIN_OP_PLUS_uxn_c_l86_c37_a6c4_right <= VAR_BIN_OP_PLUS_uxn_c_l86_c37_a6c4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l86_c37_a6c4_return_output := BIN_OP_PLUS_uxn_c_l86_c37_a6c4_return_output;

     -- BIN_OP_EQ[uxn_c_l61_c6_8282] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l61_c6_8282_left <= VAR_BIN_OP_EQ_uxn_c_l61_c6_8282_left;
     BIN_OP_EQ_uxn_c_l61_c6_8282_right <= VAR_BIN_OP_EQ_uxn_c_l61_c6_8282_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l61_c6_8282_return_output := BIN_OP_EQ_uxn_c_l61_c6_8282_return_output;

     -- BIN_OP_EQ[uxn_c_l71_c9_482f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l71_c9_482f_left <= VAR_BIN_OP_EQ_uxn_c_l71_c9_482f_left;
     BIN_OP_EQ_uxn_c_l71_c9_482f_right <= VAR_BIN_OP_EQ_uxn_c_l71_c9_482f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l71_c9_482f_return_output := BIN_OP_EQ_uxn_c_l71_c9_482f_return_output;

     -- BIN_OP_PLUS[uxn_c_l68_c3_d0b8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l68_c3_d0b8_left <= VAR_BIN_OP_PLUS_uxn_c_l68_c3_d0b8_left;
     BIN_OP_PLUS_uxn_c_l68_c3_d0b8_right <= VAR_BIN_OP_PLUS_uxn_c_l68_c3_d0b8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l68_c3_d0b8_return_output := BIN_OP_PLUS_uxn_c_l68_c3_d0b8_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8326[uxn_c_l61_c2_8670] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8326_uxn_c_l61_c2_8670_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8326(
     cpu_step_result,
     pc,
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_cond := VAR_BIN_OP_EQ_uxn_c_l61_c6_8282_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l61_c2_8670_cond := VAR_BIN_OP_EQ_uxn_c_l61_c6_8282_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l61_c2_8670_cond := VAR_BIN_OP_EQ_uxn_c_l61_c6_8282_return_output;
     VAR_ins_MUX_uxn_c_l61_c2_8670_cond := VAR_BIN_OP_EQ_uxn_c_l61_c6_8282_return_output;
     VAR_is_ins_done_MUX_uxn_c_l61_c2_8670_cond := VAR_BIN_OP_EQ_uxn_c_l61_c6_8282_return_output;
     VAR_pc_MUX_uxn_c_l61_c2_8670_cond := VAR_BIN_OP_EQ_uxn_c_l61_c6_8282_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_cond := VAR_BIN_OP_EQ_uxn_c_l67_c11_f8ea_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l67_c7_7460_cond := VAR_BIN_OP_EQ_uxn_c_l67_c11_f8ea_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l67_c7_7460_cond := VAR_BIN_OP_EQ_uxn_c_l67_c11_f8ea_return_output;
     VAR_ins_MUX_uxn_c_l67_c7_7460_cond := VAR_BIN_OP_EQ_uxn_c_l67_c11_f8ea_return_output;
     VAR_is_ins_done_MUX_uxn_c_l67_c7_7460_cond := VAR_BIN_OP_EQ_uxn_c_l67_c11_f8ea_return_output;
     VAR_pc_MUX_uxn_c_l67_c7_7460_cond := VAR_BIN_OP_EQ_uxn_c_l67_c11_f8ea_return_output;
     VAR_MUX_uxn_c_l71_c9_4d6e_cond := VAR_BIN_OP_EQ_uxn_c_l71_c9_482f_return_output;
     VAR_eval_opcode_phased_uxn_c_l72_c24_b618_phase := VAR_BIN_OP_MINUS_uxn_c_l72_c43_aa4d_return_output;
     VAR_pc_uxn_c_l68_c3_140e := resize(VAR_BIN_OP_PLUS_uxn_c_l68_c3_d0b8_return_output, 16);
     VAR_MUX_uxn_c_l86_c21_5ed9_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l86_c37_a6c4_return_output, 8);
     VAR_cpu_step_result_MUX_uxn_c_l61_c2_8670_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8326_uxn_c_l61_c2_8670_return_output;
     VAR_pc_MUX_uxn_c_l67_c7_7460_iftrue := VAR_pc_uxn_c_l68_c3_140e;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l67_c7_7460] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_return_output;

     -- MUX[uxn_c_l71_c9_4d6e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l71_c9_4d6e_cond <= VAR_MUX_uxn_c_l71_c9_4d6e_cond;
     MUX_uxn_c_l71_c9_4d6e_iftrue <= VAR_MUX_uxn_c_l71_c9_4d6e_iftrue;
     MUX_uxn_c_l71_c9_4d6e_iffalse <= VAR_MUX_uxn_c_l71_c9_4d6e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l71_c9_4d6e_return_output := MUX_uxn_c_l71_c9_4d6e_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l67_c7_7460_return_output;
     VAR_eval_opcode_phased_uxn_c_l72_c24_b618_ins := VAR_MUX_uxn_c_l71_c9_4d6e_return_output;
     VAR_ins_MUX_uxn_c_l67_c7_7460_iffalse := VAR_MUX_uxn_c_l71_c9_4d6e_return_output;
     -- ins_MUX[uxn_c_l67_c7_7460] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l67_c7_7460_cond <= VAR_ins_MUX_uxn_c_l67_c7_7460_cond;
     ins_MUX_uxn_c_l67_c7_7460_iftrue <= VAR_ins_MUX_uxn_c_l67_c7_7460_iftrue;
     ins_MUX_uxn_c_l67_c7_7460_iffalse <= VAR_ins_MUX_uxn_c_l67_c7_7460_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l67_c7_7460_return_output := ins_MUX_uxn_c_l67_c7_7460_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l70_c1_b110] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_return_output;

     -- Submodule level 3
     VAR_eval_opcode_phased_uxn_c_l72_c24_b618_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l70_c1_b110_return_output;
     VAR_ins_MUX_uxn_c_l61_c2_8670_iffalse := VAR_ins_MUX_uxn_c_l67_c7_7460_return_output;
     -- ins_MUX[uxn_c_l61_c2_8670] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l61_c2_8670_cond <= VAR_ins_MUX_uxn_c_l61_c2_8670_cond;
     ins_MUX_uxn_c_l61_c2_8670_iftrue <= VAR_ins_MUX_uxn_c_l61_c2_8670_iftrue;
     ins_MUX_uxn_c_l61_c2_8670_iffalse <= VAR_ins_MUX_uxn_c_l61_c2_8670_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l61_c2_8670_return_output := ins_MUX_uxn_c_l61_c2_8670_return_output;

     -- eval_opcode_phased[uxn_c_l72_c24_b618] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l72_c24_b618_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l72_c24_b618_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l72_c24_b618_phase <= VAR_eval_opcode_phased_uxn_c_l72_c24_b618_phase;
     eval_opcode_phased_uxn_c_l72_c24_b618_ins <= VAR_eval_opcode_phased_uxn_c_l72_c24_b618_ins;
     eval_opcode_phased_uxn_c_l72_c24_b618_pc <= VAR_eval_opcode_phased_uxn_c_l72_c24_b618_pc;
     eval_opcode_phased_uxn_c_l72_c24_b618_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l72_c24_b618_previous_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l72_c24_b618_return_output := eval_opcode_phased_uxn_c_l72_c24_b618_return_output;

     -- Submodule level 4
     VAR_eval_opcode_result_MUX_uxn_c_l67_c7_7460_iffalse := VAR_eval_opcode_phased_uxn_c_l72_c24_b618_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l61_c2_8670_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l74_c34_1fe3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l74_c34_1fe3_return_output := VAR_eval_opcode_phased_uxn_c_l72_c24_b618_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l80_c17_cfdb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l80_c17_cfdb_return_output := VAR_eval_opcode_phased_uxn_c_l72_c24_b618_return_output.is_opc_done;

     -- eval_opcode_result_MUX[uxn_c_l67_c7_7460] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l67_c7_7460_cond <= VAR_eval_opcode_result_MUX_uxn_c_l67_c7_7460_cond;
     eval_opcode_result_MUX_uxn_c_l67_c7_7460_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l67_c7_7460_iftrue;
     eval_opcode_result_MUX_uxn_c_l67_c7_7460_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l67_c7_7460_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l67_c7_7460_return_output := eval_opcode_result_MUX_uxn_c_l67_c7_7460_return_output;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l75_l73_DUPLICATE_502a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l75_l73_DUPLICATE_502a_return_output := VAR_eval_opcode_phased_uxn_c_l72_c24_b618_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l76_c35_2d54] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l76_c35_2d54_return_output := VAR_eval_opcode_phased_uxn_c_l72_c24_b618_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l73_c8_a649] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l73_c8_a649_return_output := VAR_eval_opcode_phased_uxn_c_l72_c24_b618_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l77_c38_a715] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l77_c38_a715_return_output := VAR_eval_opcode_phased_uxn_c_l72_c24_b618_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l79_c30_b696] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l79_c30_b696_return_output := VAR_eval_opcode_phased_uxn_c_l72_c24_b618_return_output.u8_value;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l78_c34_1c6a] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l78_c34_1c6a_return_output := VAR_eval_opcode_phased_uxn_c_l72_c24_b618_return_output.vram_address;

     -- Submodule level 5
     VAR_MUX_uxn_c_l73_c8_d2bb_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l75_l73_DUPLICATE_502a_return_output;
     VAR_is_ins_done_MUX_uxn_c_l67_c7_7460_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l80_c17_cfdb_return_output;
     VAR_MUX_uxn_c_l73_c8_d2bb_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l73_c8_a649_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l61_c2_8670_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l67_c7_7460_return_output;
     -- eval_opcode_result_MUX[uxn_c_l61_c2_8670] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l61_c2_8670_cond <= VAR_eval_opcode_result_MUX_uxn_c_l61_c2_8670_cond;
     eval_opcode_result_MUX_uxn_c_l61_c2_8670_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l61_c2_8670_iftrue;
     eval_opcode_result_MUX_uxn_c_l61_c2_8670_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l61_c2_8670_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l61_c2_8670_return_output := eval_opcode_result_MUX_uxn_c_l61_c2_8670_return_output;

     -- is_ins_done_MUX[uxn_c_l67_c7_7460] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l67_c7_7460_cond <= VAR_is_ins_done_MUX_uxn_c_l67_c7_7460_cond;
     is_ins_done_MUX_uxn_c_l67_c7_7460_iftrue <= VAR_is_ins_done_MUX_uxn_c_l67_c7_7460_iftrue;
     is_ins_done_MUX_uxn_c_l67_c7_7460_iffalse <= VAR_is_ins_done_MUX_uxn_c_l67_c7_7460_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l67_c7_7460_return_output := is_ins_done_MUX_uxn_c_l67_c7_7460_return_output;

     -- MUX[uxn_c_l73_c8_d2bb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l73_c8_d2bb_cond <= VAR_MUX_uxn_c_l73_c8_d2bb_cond;
     MUX_uxn_c_l73_c8_d2bb_iftrue <= VAR_MUX_uxn_c_l73_c8_d2bb_iftrue;
     MUX_uxn_c_l73_c8_d2bb_iffalse <= VAR_MUX_uxn_c_l73_c8_d2bb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l73_c8_d2bb_return_output := MUX_uxn_c_l73_c8_d2bb_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d03d[uxn_c_l67_c7_7460] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d03d_uxn_c_l67_c7_7460_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d03d(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l74_c34_1fe3_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l75_l73_DUPLICATE_502a_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l76_c35_2d54_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l77_c38_a715_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l78_c34_1c6a_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l79_c30_b696_return_output);

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l67_c7_7460_iffalse := VAR_MUX_uxn_c_l73_c8_d2bb_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l67_c7_7460_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d03d_uxn_c_l67_c7_7460_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l61_c2_8670_return_output;
     VAR_is_ins_done_MUX_uxn_c_l61_c2_8670_iffalse := VAR_is_ins_done_MUX_uxn_c_l67_c7_7460_return_output;
     -- is_ins_done_MUX[uxn_c_l61_c2_8670] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l61_c2_8670_cond <= VAR_is_ins_done_MUX_uxn_c_l61_c2_8670_cond;
     is_ins_done_MUX_uxn_c_l61_c2_8670_iftrue <= VAR_is_ins_done_MUX_uxn_c_l61_c2_8670_iftrue;
     is_ins_done_MUX_uxn_c_l61_c2_8670_iffalse <= VAR_is_ins_done_MUX_uxn_c_l61_c2_8670_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l61_c2_8670_return_output := is_ins_done_MUX_uxn_c_l61_c2_8670_return_output;

     -- pc_MUX[uxn_c_l67_c7_7460] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l67_c7_7460_cond <= VAR_pc_MUX_uxn_c_l67_c7_7460_cond;
     pc_MUX_uxn_c_l67_c7_7460_iftrue <= VAR_pc_MUX_uxn_c_l67_c7_7460_iftrue;
     pc_MUX_uxn_c_l67_c7_7460_iffalse <= VAR_pc_MUX_uxn_c_l67_c7_7460_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l67_c7_7460_return_output := pc_MUX_uxn_c_l67_c7_7460_return_output;

     -- cpu_step_result_MUX[uxn_c_l67_c7_7460] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l67_c7_7460_cond <= VAR_cpu_step_result_MUX_uxn_c_l67_c7_7460_cond;
     cpu_step_result_MUX_uxn_c_l67_c7_7460_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l67_c7_7460_iftrue;
     cpu_step_result_MUX_uxn_c_l67_c7_7460_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l67_c7_7460_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l67_c7_7460_return_output := cpu_step_result_MUX_uxn_c_l67_c7_7460_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l61_c2_8670_iffalse := VAR_cpu_step_result_MUX_uxn_c_l67_c7_7460_return_output;
     VAR_BIN_OP_EQ_uxn_c_l83_c6_cf4a_left := VAR_is_ins_done_MUX_uxn_c_l61_c2_8670_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l61_c2_8670_return_output;
     VAR_pc_MUX_uxn_c_l61_c2_8670_iffalse := VAR_pc_MUX_uxn_c_l67_c7_7460_return_output;
     -- cpu_step_result_MUX[uxn_c_l61_c2_8670] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l61_c2_8670_cond <= VAR_cpu_step_result_MUX_uxn_c_l61_c2_8670_cond;
     cpu_step_result_MUX_uxn_c_l61_c2_8670_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l61_c2_8670_iftrue;
     cpu_step_result_MUX_uxn_c_l61_c2_8670_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l61_c2_8670_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l61_c2_8670_return_output := cpu_step_result_MUX_uxn_c_l61_c2_8670_return_output;

     -- BIN_OP_EQ[uxn_c_l83_c6_cf4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l83_c6_cf4a_left <= VAR_BIN_OP_EQ_uxn_c_l83_c6_cf4a_left;
     BIN_OP_EQ_uxn_c_l83_c6_cf4a_right <= VAR_BIN_OP_EQ_uxn_c_l83_c6_cf4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l83_c6_cf4a_return_output := BIN_OP_EQ_uxn_c_l83_c6_cf4a_return_output;

     -- pc_MUX[uxn_c_l61_c2_8670] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l61_c2_8670_cond <= VAR_pc_MUX_uxn_c_l61_c2_8670_cond;
     pc_MUX_uxn_c_l61_c2_8670_iftrue <= VAR_pc_MUX_uxn_c_l61_c2_8670_iftrue;
     pc_MUX_uxn_c_l61_c2_8670_iffalse <= VAR_pc_MUX_uxn_c_l61_c2_8670_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l61_c2_8670_return_output := pc_MUX_uxn_c_l61_c2_8670_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_cond := VAR_BIN_OP_EQ_uxn_c_l83_c6_cf4a_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l61_c2_8670_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l61_c2_8670_return_output;
     VAR_BIN_OP_EQ_uxn_c_l86_c21_4693_left := VAR_pc_MUX_uxn_c_l61_c2_8670_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l61_c2_8670_return_output;
     -- BIN_OP_EQ[uxn_c_l86_c21_4693] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l86_c21_4693_left <= VAR_BIN_OP_EQ_uxn_c_l86_c21_4693_left;
     BIN_OP_EQ_uxn_c_l86_c21_4693_right <= VAR_BIN_OP_EQ_uxn_c_l86_c21_4693_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l86_c21_4693_return_output := BIN_OP_EQ_uxn_c_l86_c21_4693_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l86_c21_5ed9_cond := VAR_BIN_OP_EQ_uxn_c_l86_c21_4693_return_output;
     -- MUX[uxn_c_l86_c21_5ed9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l86_c21_5ed9_cond <= VAR_MUX_uxn_c_l86_c21_5ed9_cond;
     MUX_uxn_c_l86_c21_5ed9_iftrue <= VAR_MUX_uxn_c_l86_c21_5ed9_iftrue;
     MUX_uxn_c_l86_c21_5ed9_iffalse <= VAR_MUX_uxn_c_l86_c21_5ed9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l86_c21_5ed9_return_output := MUX_uxn_c_l86_c21_5ed9_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_iffalse := VAR_MUX_uxn_c_l86_c21_5ed9_return_output;
     -- step_cpu_phase_MUX[uxn_c_l83_c2_6ea7] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_cond <= VAR_step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_cond;
     step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_iftrue;
     step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_return_output := step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l83_c2_6ea7_return_output;
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
