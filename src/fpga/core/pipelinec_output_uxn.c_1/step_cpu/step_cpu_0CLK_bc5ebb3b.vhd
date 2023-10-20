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
-- Submodules: 27
entity step_cpu_0CLK_bc5ebb3b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_bc5ebb3b;
architecture arch of step_cpu_0CLK_bc5ebb3b is
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
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
u8_value => to_unsigned(0, 8))
;
signal REG_COMB_pc : unsigned(15 downto 0);
signal REG_COMB_ins : unsigned(7 downto 0);
signal REG_COMB_step_cpu_phase : unsigned(7 downto 0);
signal REG_COMB_is_ins_done : unsigned(0 downto 0);
signal REG_COMB_eval_opcode_result : eval_opcode_result_t;
signal REG_COMB_cpu_step_result : cpu_step_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_c_l65_c6_4b01]
signal BIN_OP_EQ_uxn_c_l65_c6_4b01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l65_c6_4b01_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l65_c6_4b01_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l72_c7_dfd4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l65_c2_176b]
signal is_ins_done_MUX_uxn_c_l65_c2_176b_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l65_c2_176b_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l65_c2_176b_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l65_c2_176b_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l65_c2_176b]
signal pc_MUX_uxn_c_l65_c2_176b_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l65_c2_176b_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l65_c2_176b_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l65_c2_176b_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l65_c2_176b]
signal cpu_step_result_MUX_uxn_c_l65_c2_176b_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l65_c2_176b_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l65_c2_176b_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l65_c2_176b_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l65_c2_176b]
signal ins_MUX_uxn_c_l65_c2_176b_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l65_c2_176b_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l65_c2_176b_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l65_c2_176b_return_output : unsigned(7 downto 0);

-- eval_opcode_result_MUX[uxn_c_l65_c2_176b]
signal eval_opcode_result_MUX_uxn_c_l65_c2_176b_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l65_c2_176b_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l65_c2_176b_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l65_c2_176b_return_output : eval_opcode_result_t;

-- BIN_OP_EQ[uxn_c_l72_c11_2297]
signal BIN_OP_EQ_uxn_c_l72_c11_2297_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l72_c11_2297_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l72_c11_2297_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l75_c1_072c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l72_c7_dfd4]
signal is_ins_done_MUX_uxn_c_l72_c7_dfd4_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l72_c7_dfd4_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l72_c7_dfd4_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l72_c7_dfd4_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l72_c7_dfd4]
signal pc_MUX_uxn_c_l72_c7_dfd4_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l72_c7_dfd4_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l72_c7_dfd4_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l72_c7_dfd4_return_output : unsigned(15 downto 0);

-- cpu_step_result_MUX[uxn_c_l72_c7_dfd4]
signal cpu_step_result_MUX_uxn_c_l72_c7_dfd4_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l72_c7_dfd4_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l72_c7_dfd4_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l72_c7_dfd4_return_output : cpu_step_result_t;

-- ins_MUX[uxn_c_l72_c7_dfd4]
signal ins_MUX_uxn_c_l72_c7_dfd4_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l72_c7_dfd4_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l72_c7_dfd4_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l72_c7_dfd4_return_output : unsigned(7 downto 0);

-- eval_opcode_result_MUX[uxn_c_l72_c7_dfd4]
signal eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_return_output : eval_opcode_result_t;

-- BIN_OP_PLUS[uxn_c_l73_c3_50a6]
signal BIN_OP_PLUS_uxn_c_l73_c3_50a6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l73_c3_50a6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l73_c3_50a6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l76_c9_5f98]
signal BIN_OP_EQ_uxn_c_l76_c9_5f98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l76_c9_5f98_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l76_c9_5f98_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l76_c9_4686]
signal MUX_uxn_c_l76_c9_4686_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l76_c9_4686_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l76_c9_4686_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l76_c9_4686_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l77_c43_9fba]
signal BIN_OP_MINUS_uxn_c_l77_c43_9fba_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l77_c43_9fba_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l77_c43_9fba_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l77_c24_dcfc]
signal eval_opcode_phased_uxn_c_l77_c24_dcfc_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l77_c24_dcfc_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l77_c24_dcfc_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l77_c24_dcfc_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l77_c24_dcfc_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l77_c24_dcfc_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l78_c8_086a]
signal MUX_uxn_c_l78_c8_086a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l78_c8_086a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l78_c8_086a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l78_c8_086a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l90_c6_dacd]
signal BIN_OP_EQ_uxn_c_l90_c6_dacd_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l90_c6_dacd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l90_c6_dacd_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l90_c2_7c02]
signal step_cpu_phase_MUX_uxn_c_l90_c2_7c02_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l90_c2_7c02_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l90_c2_7c02_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l90_c2_7c02_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l93_c21_e206]
signal BIN_OP_EQ_uxn_c_l93_c21_e206_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l93_c21_e206_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l93_c21_e206_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l93_c37_4a64]
signal BIN_OP_PLUS_uxn_c_l93_c37_4a64_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l93_c37_4a64_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l93_c37_4a64_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l93_c21_8c74]
signal MUX_uxn_c_l93_c21_8c74_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l93_c21_8c74_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l93_c21_8c74_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l93_c21_8c74_return_output : unsigned(7 downto 0);

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7( ref_toks_0 : cpu_step_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base := ref_toks_0;
      base.ram_address := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base.is_ram_write := ref_toks_0;
      base.ram_address := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.vram_address := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_c_l65_c6_4b01
BIN_OP_EQ_uxn_c_l65_c6_4b01 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l65_c6_4b01_left,
BIN_OP_EQ_uxn_c_l65_c6_4b01_right,
BIN_OP_EQ_uxn_c_l65_c6_4b01_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_return_output);

-- is_ins_done_MUX_uxn_c_l65_c2_176b
is_ins_done_MUX_uxn_c_l65_c2_176b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l65_c2_176b_cond,
is_ins_done_MUX_uxn_c_l65_c2_176b_iftrue,
is_ins_done_MUX_uxn_c_l65_c2_176b_iffalse,
is_ins_done_MUX_uxn_c_l65_c2_176b_return_output);

-- pc_MUX_uxn_c_l65_c2_176b
pc_MUX_uxn_c_l65_c2_176b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l65_c2_176b_cond,
pc_MUX_uxn_c_l65_c2_176b_iftrue,
pc_MUX_uxn_c_l65_c2_176b_iffalse,
pc_MUX_uxn_c_l65_c2_176b_return_output);

-- cpu_step_result_MUX_uxn_c_l65_c2_176b
cpu_step_result_MUX_uxn_c_l65_c2_176b : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l65_c2_176b_cond,
cpu_step_result_MUX_uxn_c_l65_c2_176b_iftrue,
cpu_step_result_MUX_uxn_c_l65_c2_176b_iffalse,
cpu_step_result_MUX_uxn_c_l65_c2_176b_return_output);

-- ins_MUX_uxn_c_l65_c2_176b
ins_MUX_uxn_c_l65_c2_176b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l65_c2_176b_cond,
ins_MUX_uxn_c_l65_c2_176b_iftrue,
ins_MUX_uxn_c_l65_c2_176b_iffalse,
ins_MUX_uxn_c_l65_c2_176b_return_output);

-- eval_opcode_result_MUX_uxn_c_l65_c2_176b
eval_opcode_result_MUX_uxn_c_l65_c2_176b : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l65_c2_176b_cond,
eval_opcode_result_MUX_uxn_c_l65_c2_176b_iftrue,
eval_opcode_result_MUX_uxn_c_l65_c2_176b_iffalse,
eval_opcode_result_MUX_uxn_c_l65_c2_176b_return_output);

-- BIN_OP_EQ_uxn_c_l72_c11_2297
BIN_OP_EQ_uxn_c_l72_c11_2297 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l72_c11_2297_left,
BIN_OP_EQ_uxn_c_l72_c11_2297_right,
BIN_OP_EQ_uxn_c_l72_c11_2297_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_return_output);

-- is_ins_done_MUX_uxn_c_l72_c7_dfd4
is_ins_done_MUX_uxn_c_l72_c7_dfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l72_c7_dfd4_cond,
is_ins_done_MUX_uxn_c_l72_c7_dfd4_iftrue,
is_ins_done_MUX_uxn_c_l72_c7_dfd4_iffalse,
is_ins_done_MUX_uxn_c_l72_c7_dfd4_return_output);

-- pc_MUX_uxn_c_l72_c7_dfd4
pc_MUX_uxn_c_l72_c7_dfd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l72_c7_dfd4_cond,
pc_MUX_uxn_c_l72_c7_dfd4_iftrue,
pc_MUX_uxn_c_l72_c7_dfd4_iffalse,
pc_MUX_uxn_c_l72_c7_dfd4_return_output);

-- cpu_step_result_MUX_uxn_c_l72_c7_dfd4
cpu_step_result_MUX_uxn_c_l72_c7_dfd4 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l72_c7_dfd4_cond,
cpu_step_result_MUX_uxn_c_l72_c7_dfd4_iftrue,
cpu_step_result_MUX_uxn_c_l72_c7_dfd4_iffalse,
cpu_step_result_MUX_uxn_c_l72_c7_dfd4_return_output);

-- ins_MUX_uxn_c_l72_c7_dfd4
ins_MUX_uxn_c_l72_c7_dfd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l72_c7_dfd4_cond,
ins_MUX_uxn_c_l72_c7_dfd4_iftrue,
ins_MUX_uxn_c_l72_c7_dfd4_iffalse,
ins_MUX_uxn_c_l72_c7_dfd4_return_output);

-- eval_opcode_result_MUX_uxn_c_l72_c7_dfd4
eval_opcode_result_MUX_uxn_c_l72_c7_dfd4 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_cond,
eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_iftrue,
eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_iffalse,
eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_return_output);

-- BIN_OP_PLUS_uxn_c_l73_c3_50a6
BIN_OP_PLUS_uxn_c_l73_c3_50a6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l73_c3_50a6_left,
BIN_OP_PLUS_uxn_c_l73_c3_50a6_right,
BIN_OP_PLUS_uxn_c_l73_c3_50a6_return_output);

-- BIN_OP_EQ_uxn_c_l76_c9_5f98
BIN_OP_EQ_uxn_c_l76_c9_5f98 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l76_c9_5f98_left,
BIN_OP_EQ_uxn_c_l76_c9_5f98_right,
BIN_OP_EQ_uxn_c_l76_c9_5f98_return_output);

-- MUX_uxn_c_l76_c9_4686
MUX_uxn_c_l76_c9_4686 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l76_c9_4686_cond,
MUX_uxn_c_l76_c9_4686_iftrue,
MUX_uxn_c_l76_c9_4686_iffalse,
MUX_uxn_c_l76_c9_4686_return_output);

-- BIN_OP_MINUS_uxn_c_l77_c43_9fba
BIN_OP_MINUS_uxn_c_l77_c43_9fba : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l77_c43_9fba_left,
BIN_OP_MINUS_uxn_c_l77_c43_9fba_right,
BIN_OP_MINUS_uxn_c_l77_c43_9fba_return_output);

-- eval_opcode_phased_uxn_c_l77_c24_dcfc
eval_opcode_phased_uxn_c_l77_c24_dcfc : entity work.eval_opcode_phased_0CLK_ba8291c2 port map (
clk,
eval_opcode_phased_uxn_c_l77_c24_dcfc_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l77_c24_dcfc_phase,
eval_opcode_phased_uxn_c_l77_c24_dcfc_ins,
eval_opcode_phased_uxn_c_l77_c24_dcfc_pc,
eval_opcode_phased_uxn_c_l77_c24_dcfc_previous_ram_read,
eval_opcode_phased_uxn_c_l77_c24_dcfc_previous_device_ram_read,
eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output);

-- MUX_uxn_c_l78_c8_086a
MUX_uxn_c_l78_c8_086a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l78_c8_086a_cond,
MUX_uxn_c_l78_c8_086a_iftrue,
MUX_uxn_c_l78_c8_086a_iffalse,
MUX_uxn_c_l78_c8_086a_return_output);

-- BIN_OP_EQ_uxn_c_l90_c6_dacd
BIN_OP_EQ_uxn_c_l90_c6_dacd : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l90_c6_dacd_left,
BIN_OP_EQ_uxn_c_l90_c6_dacd_right,
BIN_OP_EQ_uxn_c_l90_c6_dacd_return_output);

-- step_cpu_phase_MUX_uxn_c_l90_c2_7c02
step_cpu_phase_MUX_uxn_c_l90_c2_7c02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l90_c2_7c02_cond,
step_cpu_phase_MUX_uxn_c_l90_c2_7c02_iftrue,
step_cpu_phase_MUX_uxn_c_l90_c2_7c02_iffalse,
step_cpu_phase_MUX_uxn_c_l90_c2_7c02_return_output);

-- BIN_OP_EQ_uxn_c_l93_c21_e206
BIN_OP_EQ_uxn_c_l93_c21_e206 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l93_c21_e206_left,
BIN_OP_EQ_uxn_c_l93_c21_e206_right,
BIN_OP_EQ_uxn_c_l93_c21_e206_return_output);

-- BIN_OP_PLUS_uxn_c_l93_c37_4a64
BIN_OP_PLUS_uxn_c_l93_c37_4a64 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l93_c37_4a64_left,
BIN_OP_PLUS_uxn_c_l93_c37_4a64_right,
BIN_OP_PLUS_uxn_c_l93_c37_4a64_return_output);

-- MUX_uxn_c_l93_c21_8c74
MUX_uxn_c_l93_c21_8c74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l93_c21_8c74_cond,
MUX_uxn_c_l93_c21_8c74_iftrue,
MUX_uxn_c_l93_c21_8c74_iffalse,
MUX_uxn_c_l93_c21_8c74_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 previous_ram_read_value,
 previous_device_ram_read,
 -- Registers
 pc,
 ins,
 step_cpu_phase,
 is_ins_done,
 eval_opcode_result,
 cpu_step_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_c_l65_c6_4b01_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_return_output,
 is_ins_done_MUX_uxn_c_l65_c2_176b_return_output,
 pc_MUX_uxn_c_l65_c2_176b_return_output,
 cpu_step_result_MUX_uxn_c_l65_c2_176b_return_output,
 ins_MUX_uxn_c_l65_c2_176b_return_output,
 eval_opcode_result_MUX_uxn_c_l65_c2_176b_return_output,
 BIN_OP_EQ_uxn_c_l72_c11_2297_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_return_output,
 is_ins_done_MUX_uxn_c_l72_c7_dfd4_return_output,
 pc_MUX_uxn_c_l72_c7_dfd4_return_output,
 cpu_step_result_MUX_uxn_c_l72_c7_dfd4_return_output,
 ins_MUX_uxn_c_l72_c7_dfd4_return_output,
 eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_return_output,
 BIN_OP_PLUS_uxn_c_l73_c3_50a6_return_output,
 BIN_OP_EQ_uxn_c_l76_c9_5f98_return_output,
 MUX_uxn_c_l76_c9_4686_return_output,
 BIN_OP_MINUS_uxn_c_l77_c43_9fba_return_output,
 eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output,
 MUX_uxn_c_l78_c8_086a_return_output,
 BIN_OP_EQ_uxn_c_l90_c6_dacd_return_output,
 step_cpu_phase_MUX_uxn_c_l90_c2_7c02_return_output,
 BIN_OP_EQ_uxn_c_l93_c21_e206_return_output,
 BIN_OP_PLUS_uxn_c_l93_c37_4a64_return_output,
 MUX_uxn_c_l93_c21_8c74_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l65_c6_4b01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l65_c6_4b01_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l65_c6_4b01_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l65_c2_176b_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l65_c2_176b_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l72_c7_dfd4_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l65_c2_176b_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l65_c2_176b_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l65_c2_176b_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l65_c2_176b_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l72_c7_dfd4_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l65_c2_176b_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l65_c2_176b_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l65_c2_176b_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l65_c2_176b_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l65_c2_176b_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l72_c7_dfd4_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l65_c2_176b_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l65_c2_176b_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l65_c2_176b_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l65_c2_176b_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l72_c7_dfd4_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l65_c2_176b_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l65_c2_176b_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l65_c2_176b_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l65_c2_176b_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l65_c2_176b_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l65_c2_176b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l72_c11_2297_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l72_c11_2297_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l72_c11_2297_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l72_c7_dfd4_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l72_c7_dfd4_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l72_c7_dfd4_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l72_c7_dfd4_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l73_c3_7e69 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l72_c7_dfd4_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l72_c7_dfd4_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l72_c7_dfd4_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l72_c7_dfd4_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l72_c7_dfd4_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l72_c7_dfd4_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l72_c7_dfd4_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l72_c7_dfd4_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l72_c7_dfd4_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l73_c3_50a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l73_c3_50a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l73_c3_50a6_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l76_c9_4686_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l76_c9_4686_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l76_c9_4686_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l76_c9_5f98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l76_c9_5f98_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l76_c9_5f98_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l76_c9_4686_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l77_c43_9fba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l77_c43_9fba_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l77_c43_9fba_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l78_c8_086a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l78_c8_086a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l78_c8_086a_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l78_c8_f4b8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l78_c8_086a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l79_c34_ad5d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l81_c35_79f0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l82_c38_c19b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l83_c34_5bf4_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l84_c40_4970_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l85_c41_c1ed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l86_c30_d054_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l87_c17_e7a6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l90_c6_dacd_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l90_c6_dacd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l90_c6_dacd_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l90_c2_7c02_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l91_c3_aac1 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l90_c2_7c02_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l90_c2_7c02_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l90_c2_7c02_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l93_c21_8c74_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l93_c21_8c74_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l93_c21_8c74_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l93_c21_e206_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l93_c21_e206_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l93_c21_e206_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l93_c37_4a64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l93_c37_4a64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l93_c37_4a64_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l93_c21_8c74_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l80_l78_DUPLICATE_3344_return_output : unsigned(15 downto 0);
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
     VAR_is_ins_done_MUX_uxn_c_l65_c2_176b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l93_c21_e206_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l93_c21_8c74_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_c_l72_c11_2297_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l65_c6_4b01_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l77_c43_9fba_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_c_l93_c37_4a64_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l90_c6_dacd_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l76_c9_5f98_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_c_l73_c3_50a6_right := to_unsigned(1, 1);
     VAR_step_cpu_phase_uxn_c_l91_c3_aac1 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l90_c2_7c02_iftrue := VAR_step_cpu_phase_uxn_c_l91_c3_aac1;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_previous_ram_read_value := previous_ram_read_value;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_iffalse := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l72_c7_dfd4_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l65_c2_176b_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_iftrue := eval_opcode_result;
     VAR_MUX_uxn_c_l76_c9_4686_iffalse := ins;
     VAR_ins_MUX_uxn_c_l65_c2_176b_iftrue := ins;
     VAR_ins_MUX_uxn_c_l72_c7_dfd4_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l72_c7_dfd4_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l73_c3_50a6_left := pc;
     VAR_MUX_uxn_c_l78_c8_086a_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_pc := pc;
     VAR_pc_MUX_uxn_c_l65_c2_176b_iftrue := pc;
     VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l76_c9_4686_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l65_c6_4b01_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l72_c11_2297_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l76_c9_5f98_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l77_c43_9fba_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l93_c37_4a64_left := step_cpu_phase;
     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7[uxn_c_l65_c2_176b] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l65_c2_176b_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7(
     cpu_step_result,
     pc,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_c_l72_c11_2297] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l72_c11_2297_left <= VAR_BIN_OP_EQ_uxn_c_l72_c11_2297_left;
     BIN_OP_EQ_uxn_c_l72_c11_2297_right <= VAR_BIN_OP_EQ_uxn_c_l72_c11_2297_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l72_c11_2297_return_output := BIN_OP_EQ_uxn_c_l72_c11_2297_return_output;

     -- BIN_OP_PLUS[uxn_c_l93_c37_4a64] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l93_c37_4a64_left <= VAR_BIN_OP_PLUS_uxn_c_l93_c37_4a64_left;
     BIN_OP_PLUS_uxn_c_l93_c37_4a64_right <= VAR_BIN_OP_PLUS_uxn_c_l93_c37_4a64_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l93_c37_4a64_return_output := BIN_OP_PLUS_uxn_c_l93_c37_4a64_return_output;

     -- BIN_OP_MINUS[uxn_c_l77_c43_9fba] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l77_c43_9fba_left <= VAR_BIN_OP_MINUS_uxn_c_l77_c43_9fba_left;
     BIN_OP_MINUS_uxn_c_l77_c43_9fba_right <= VAR_BIN_OP_MINUS_uxn_c_l77_c43_9fba_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l77_c43_9fba_return_output := BIN_OP_MINUS_uxn_c_l77_c43_9fba_return_output;

     -- BIN_OP_PLUS[uxn_c_l73_c3_50a6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l73_c3_50a6_left <= VAR_BIN_OP_PLUS_uxn_c_l73_c3_50a6_left;
     BIN_OP_PLUS_uxn_c_l73_c3_50a6_right <= VAR_BIN_OP_PLUS_uxn_c_l73_c3_50a6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l73_c3_50a6_return_output := BIN_OP_PLUS_uxn_c_l73_c3_50a6_return_output;

     -- BIN_OP_EQ[uxn_c_l65_c6_4b01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l65_c6_4b01_left <= VAR_BIN_OP_EQ_uxn_c_l65_c6_4b01_left;
     BIN_OP_EQ_uxn_c_l65_c6_4b01_right <= VAR_BIN_OP_EQ_uxn_c_l65_c6_4b01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l65_c6_4b01_return_output := BIN_OP_EQ_uxn_c_l65_c6_4b01_return_output;

     -- BIN_OP_EQ[uxn_c_l76_c9_5f98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l76_c9_5f98_left <= VAR_BIN_OP_EQ_uxn_c_l76_c9_5f98_left;
     BIN_OP_EQ_uxn_c_l76_c9_5f98_right <= VAR_BIN_OP_EQ_uxn_c_l76_c9_5f98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l76_c9_5f98_return_output := BIN_OP_EQ_uxn_c_l76_c9_5f98_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_cond := VAR_BIN_OP_EQ_uxn_c_l65_c6_4b01_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l65_c2_176b_cond := VAR_BIN_OP_EQ_uxn_c_l65_c6_4b01_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l65_c2_176b_cond := VAR_BIN_OP_EQ_uxn_c_l65_c6_4b01_return_output;
     VAR_ins_MUX_uxn_c_l65_c2_176b_cond := VAR_BIN_OP_EQ_uxn_c_l65_c6_4b01_return_output;
     VAR_is_ins_done_MUX_uxn_c_l65_c2_176b_cond := VAR_BIN_OP_EQ_uxn_c_l65_c6_4b01_return_output;
     VAR_pc_MUX_uxn_c_l65_c2_176b_cond := VAR_BIN_OP_EQ_uxn_c_l65_c6_4b01_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_2297_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l72_c7_dfd4_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_2297_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_2297_return_output;
     VAR_ins_MUX_uxn_c_l72_c7_dfd4_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_2297_return_output;
     VAR_is_ins_done_MUX_uxn_c_l72_c7_dfd4_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_2297_return_output;
     VAR_pc_MUX_uxn_c_l72_c7_dfd4_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_2297_return_output;
     VAR_MUX_uxn_c_l76_c9_4686_cond := VAR_BIN_OP_EQ_uxn_c_l76_c9_5f98_return_output;
     VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_phase := VAR_BIN_OP_MINUS_uxn_c_l77_c43_9fba_return_output;
     VAR_pc_uxn_c_l73_c3_7e69 := resize(VAR_BIN_OP_PLUS_uxn_c_l73_c3_50a6_return_output, 16);
     VAR_MUX_uxn_c_l93_c21_8c74_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l93_c37_4a64_return_output, 8);
     VAR_cpu_step_result_MUX_uxn_c_l65_c2_176b_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l65_c2_176b_return_output;
     VAR_pc_MUX_uxn_c_l72_c7_dfd4_iftrue := VAR_pc_uxn_c_l73_c3_7e69;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l72_c7_dfd4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_return_output;

     -- MUX[uxn_c_l76_c9_4686] LATENCY=0
     -- Inputs
     MUX_uxn_c_l76_c9_4686_cond <= VAR_MUX_uxn_c_l76_c9_4686_cond;
     MUX_uxn_c_l76_c9_4686_iftrue <= VAR_MUX_uxn_c_l76_c9_4686_iftrue;
     MUX_uxn_c_l76_c9_4686_iffalse <= VAR_MUX_uxn_c_l76_c9_4686_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l76_c9_4686_return_output := MUX_uxn_c_l76_c9_4686_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_dfd4_return_output;
     VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_ins := VAR_MUX_uxn_c_l76_c9_4686_return_output;
     VAR_ins_MUX_uxn_c_l72_c7_dfd4_iffalse := VAR_MUX_uxn_c_l76_c9_4686_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l75_c1_072c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_return_output;

     -- ins_MUX[uxn_c_l72_c7_dfd4] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l72_c7_dfd4_cond <= VAR_ins_MUX_uxn_c_l72_c7_dfd4_cond;
     ins_MUX_uxn_c_l72_c7_dfd4_iftrue <= VAR_ins_MUX_uxn_c_l72_c7_dfd4_iftrue;
     ins_MUX_uxn_c_l72_c7_dfd4_iffalse <= VAR_ins_MUX_uxn_c_l72_c7_dfd4_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l72_c7_dfd4_return_output := ins_MUX_uxn_c_l72_c7_dfd4_return_output;

     -- Submodule level 3
     VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_072c_return_output;
     VAR_ins_MUX_uxn_c_l65_c2_176b_iffalse := VAR_ins_MUX_uxn_c_l72_c7_dfd4_return_output;
     -- eval_opcode_phased[uxn_c_l77_c24_dcfc] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l77_c24_dcfc_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l77_c24_dcfc_phase <= VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_phase;
     eval_opcode_phased_uxn_c_l77_c24_dcfc_ins <= VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_ins;
     eval_opcode_phased_uxn_c_l77_c24_dcfc_pc <= VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_pc;
     eval_opcode_phased_uxn_c_l77_c24_dcfc_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_previous_ram_read;
     eval_opcode_phased_uxn_c_l77_c24_dcfc_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output := eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output;

     -- ins_MUX[uxn_c_l65_c2_176b] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l65_c2_176b_cond <= VAR_ins_MUX_uxn_c_l65_c2_176b_cond;
     ins_MUX_uxn_c_l65_c2_176b_iftrue <= VAR_ins_MUX_uxn_c_l65_c2_176b_iftrue;
     ins_MUX_uxn_c_l65_c2_176b_iffalse <= VAR_ins_MUX_uxn_c_l65_c2_176b_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l65_c2_176b_return_output := ins_MUX_uxn_c_l65_c2_176b_return_output;

     -- Submodule level 4
     VAR_eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_iffalse := VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l65_c2_176b_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l82_c38_c19b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l82_c38_c19b_return_output := VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l84_c40_4970] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l84_c40_4970_return_output := VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output.device_ram_address;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l83_c34_5bf4] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l83_c34_5bf4_return_output := VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output.vram_address;

     -- eval_opcode_result_MUX[uxn_c_l72_c7_dfd4] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_cond <= VAR_eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_cond;
     eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_iftrue;
     eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_return_output := eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l79_c34_ad5d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l79_c34_ad5d_return_output := VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l85_c41_c1ed] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l85_c41_c1ed_return_output := VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l86_c30_d054] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l86_c30_d054_return_output := VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l81_c35_79f0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l81_c35_79f0_return_output := VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l78_c8_f4b8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l78_c8_f4b8_return_output := VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l87_c17_e7a6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l87_c17_e7a6_return_output := VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l80_l78_DUPLICATE_3344 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l80_l78_DUPLICATE_3344_return_output := VAR_eval_opcode_phased_uxn_c_l77_c24_dcfc_return_output.u16_value;

     -- Submodule level 5
     VAR_MUX_uxn_c_l78_c8_086a_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l80_l78_DUPLICATE_3344_return_output;
     VAR_is_ins_done_MUX_uxn_c_l72_c7_dfd4_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l87_c17_e7a6_return_output;
     VAR_MUX_uxn_c_l78_c8_086a_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l78_c8_f4b8_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l65_c2_176b_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l72_c7_dfd4_return_output;
     -- eval_opcode_result_MUX[uxn_c_l65_c2_176b] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l65_c2_176b_cond <= VAR_eval_opcode_result_MUX_uxn_c_l65_c2_176b_cond;
     eval_opcode_result_MUX_uxn_c_l65_c2_176b_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l65_c2_176b_iftrue;
     eval_opcode_result_MUX_uxn_c_l65_c2_176b_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l65_c2_176b_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l65_c2_176b_return_output := eval_opcode_result_MUX_uxn_c_l65_c2_176b_return_output;

     -- is_ins_done_MUX[uxn_c_l72_c7_dfd4] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l72_c7_dfd4_cond <= VAR_is_ins_done_MUX_uxn_c_l72_c7_dfd4_cond;
     is_ins_done_MUX_uxn_c_l72_c7_dfd4_iftrue <= VAR_is_ins_done_MUX_uxn_c_l72_c7_dfd4_iftrue;
     is_ins_done_MUX_uxn_c_l72_c7_dfd4_iffalse <= VAR_is_ins_done_MUX_uxn_c_l72_c7_dfd4_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l72_c7_dfd4_return_output := is_ins_done_MUX_uxn_c_l72_c7_dfd4_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030[uxn_c_l72_c7_dfd4] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l72_c7_dfd4_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l79_c34_ad5d_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l80_l78_DUPLICATE_3344_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l81_c35_79f0_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l82_c38_c19b_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l83_c34_5bf4_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l84_c40_4970_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l85_c41_c1ed_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l86_c30_d054_return_output);

     -- MUX[uxn_c_l78_c8_086a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l78_c8_086a_cond <= VAR_MUX_uxn_c_l78_c8_086a_cond;
     MUX_uxn_c_l78_c8_086a_iftrue <= VAR_MUX_uxn_c_l78_c8_086a_iftrue;
     MUX_uxn_c_l78_c8_086a_iffalse <= VAR_MUX_uxn_c_l78_c8_086a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l78_c8_086a_return_output := MUX_uxn_c_l78_c8_086a_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l72_c7_dfd4_iffalse := VAR_MUX_uxn_c_l78_c8_086a_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l72_c7_dfd4_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l72_c7_dfd4_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l65_c2_176b_return_output;
     VAR_is_ins_done_MUX_uxn_c_l65_c2_176b_iffalse := VAR_is_ins_done_MUX_uxn_c_l72_c7_dfd4_return_output;
     -- cpu_step_result_MUX[uxn_c_l72_c7_dfd4] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l72_c7_dfd4_cond <= VAR_cpu_step_result_MUX_uxn_c_l72_c7_dfd4_cond;
     cpu_step_result_MUX_uxn_c_l72_c7_dfd4_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l72_c7_dfd4_iftrue;
     cpu_step_result_MUX_uxn_c_l72_c7_dfd4_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l72_c7_dfd4_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l72_c7_dfd4_return_output := cpu_step_result_MUX_uxn_c_l72_c7_dfd4_return_output;

     -- pc_MUX[uxn_c_l72_c7_dfd4] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l72_c7_dfd4_cond <= VAR_pc_MUX_uxn_c_l72_c7_dfd4_cond;
     pc_MUX_uxn_c_l72_c7_dfd4_iftrue <= VAR_pc_MUX_uxn_c_l72_c7_dfd4_iftrue;
     pc_MUX_uxn_c_l72_c7_dfd4_iffalse <= VAR_pc_MUX_uxn_c_l72_c7_dfd4_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l72_c7_dfd4_return_output := pc_MUX_uxn_c_l72_c7_dfd4_return_output;

     -- is_ins_done_MUX[uxn_c_l65_c2_176b] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l65_c2_176b_cond <= VAR_is_ins_done_MUX_uxn_c_l65_c2_176b_cond;
     is_ins_done_MUX_uxn_c_l65_c2_176b_iftrue <= VAR_is_ins_done_MUX_uxn_c_l65_c2_176b_iftrue;
     is_ins_done_MUX_uxn_c_l65_c2_176b_iffalse <= VAR_is_ins_done_MUX_uxn_c_l65_c2_176b_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l65_c2_176b_return_output := is_ins_done_MUX_uxn_c_l65_c2_176b_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l65_c2_176b_iffalse := VAR_cpu_step_result_MUX_uxn_c_l72_c7_dfd4_return_output;
     VAR_BIN_OP_EQ_uxn_c_l90_c6_dacd_left := VAR_is_ins_done_MUX_uxn_c_l65_c2_176b_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l65_c2_176b_return_output;
     VAR_pc_MUX_uxn_c_l65_c2_176b_iffalse := VAR_pc_MUX_uxn_c_l72_c7_dfd4_return_output;
     -- cpu_step_result_MUX[uxn_c_l65_c2_176b] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l65_c2_176b_cond <= VAR_cpu_step_result_MUX_uxn_c_l65_c2_176b_cond;
     cpu_step_result_MUX_uxn_c_l65_c2_176b_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l65_c2_176b_iftrue;
     cpu_step_result_MUX_uxn_c_l65_c2_176b_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l65_c2_176b_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l65_c2_176b_return_output := cpu_step_result_MUX_uxn_c_l65_c2_176b_return_output;

     -- pc_MUX[uxn_c_l65_c2_176b] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l65_c2_176b_cond <= VAR_pc_MUX_uxn_c_l65_c2_176b_cond;
     pc_MUX_uxn_c_l65_c2_176b_iftrue <= VAR_pc_MUX_uxn_c_l65_c2_176b_iftrue;
     pc_MUX_uxn_c_l65_c2_176b_iffalse <= VAR_pc_MUX_uxn_c_l65_c2_176b_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l65_c2_176b_return_output := pc_MUX_uxn_c_l65_c2_176b_return_output;

     -- BIN_OP_EQ[uxn_c_l90_c6_dacd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l90_c6_dacd_left <= VAR_BIN_OP_EQ_uxn_c_l90_c6_dacd_left;
     BIN_OP_EQ_uxn_c_l90_c6_dacd_right <= VAR_BIN_OP_EQ_uxn_c_l90_c6_dacd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l90_c6_dacd_return_output := BIN_OP_EQ_uxn_c_l90_c6_dacd_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l90_c2_7c02_cond := VAR_BIN_OP_EQ_uxn_c_l90_c6_dacd_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l65_c2_176b_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l65_c2_176b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l93_c21_e206_left := VAR_pc_MUX_uxn_c_l65_c2_176b_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l65_c2_176b_return_output;
     -- BIN_OP_EQ[uxn_c_l93_c21_e206] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l93_c21_e206_left <= VAR_BIN_OP_EQ_uxn_c_l93_c21_e206_left;
     BIN_OP_EQ_uxn_c_l93_c21_e206_right <= VAR_BIN_OP_EQ_uxn_c_l93_c21_e206_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l93_c21_e206_return_output := BIN_OP_EQ_uxn_c_l93_c21_e206_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l93_c21_8c74_cond := VAR_BIN_OP_EQ_uxn_c_l93_c21_e206_return_output;
     -- MUX[uxn_c_l93_c21_8c74] LATENCY=0
     -- Inputs
     MUX_uxn_c_l93_c21_8c74_cond <= VAR_MUX_uxn_c_l93_c21_8c74_cond;
     MUX_uxn_c_l93_c21_8c74_iftrue <= VAR_MUX_uxn_c_l93_c21_8c74_iftrue;
     MUX_uxn_c_l93_c21_8c74_iffalse <= VAR_MUX_uxn_c_l93_c21_8c74_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l93_c21_8c74_return_output := MUX_uxn_c_l93_c21_8c74_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l90_c2_7c02_iffalse := VAR_MUX_uxn_c_l93_c21_8c74_return_output;
     -- step_cpu_phase_MUX[uxn_c_l90_c2_7c02] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l90_c2_7c02_cond <= VAR_step_cpu_phase_MUX_uxn_c_l90_c2_7c02_cond;
     step_cpu_phase_MUX_uxn_c_l90_c2_7c02_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l90_c2_7c02_iftrue;
     step_cpu_phase_MUX_uxn_c_l90_c2_7c02_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l90_c2_7c02_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l90_c2_7c02_return_output := step_cpu_phase_MUX_uxn_c_l90_c2_7c02_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l90_c2_7c02_return_output;
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
