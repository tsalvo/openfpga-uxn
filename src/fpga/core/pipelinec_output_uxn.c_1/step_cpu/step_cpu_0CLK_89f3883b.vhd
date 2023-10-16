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
-- Submodules: 31
entity step_cpu_0CLK_89f3883b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ram_read_value : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_89f3883b;
architecture arch of step_cpu_0CLK_89f3883b is
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
-- BIN_OP_EQ[uxn_c_l68_c6_f4ad]
signal BIN_OP_EQ_uxn_c_l68_c6_f4ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_f4ad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_f4ad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l73_c7_5714]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l68_c2_0f6a]
signal ins_MUX_uxn_c_l68_c2_0f6a_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l68_c2_0f6a_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_0f6a_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_0f6a_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l68_c2_0f6a]
signal is_ins_done_MUX_uxn_c_l68_c2_0f6a_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_0f6a_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_0f6a_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_0f6a_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l68_c2_0f6a]
signal cpu_step_result_MUX_uxn_c_l68_c2_0f6a_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l68_c2_0f6a_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_0f6a_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_0f6a_return_output : cpu_step_result_t;

-- eval_opcode_result_MUX[uxn_c_l68_c2_0f6a]
signal eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_return_output : eval_opcode_result_t;

-- pc_MUX[uxn_c_l68_c2_0f6a]
signal pc_MUX_uxn_c_l68_c2_0f6a_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l68_c2_0f6a_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_0f6a_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_0f6a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l73_c11_b848]
signal BIN_OP_EQ_uxn_c_l73_c11_b848_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l73_c11_b848_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l73_c11_b848_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l76_c7_2c30]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l73_c7_5714]
signal ins_MUX_uxn_c_l73_c7_5714_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l73_c7_5714_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l73_c7_5714_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l73_c7_5714_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l73_c7_5714]
signal is_ins_done_MUX_uxn_c_l73_c7_5714_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l73_c7_5714_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l73_c7_5714_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l73_c7_5714_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l73_c7_5714]
signal cpu_step_result_MUX_uxn_c_l73_c7_5714_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l73_c7_5714_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l73_c7_5714_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l73_c7_5714_return_output : cpu_step_result_t;

-- eval_opcode_result_MUX[uxn_c_l73_c7_5714]
signal eval_opcode_result_MUX_uxn_c_l73_c7_5714_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l73_c7_5714_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l73_c7_5714_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l73_c7_5714_return_output : eval_opcode_result_t;

-- pc_MUX[uxn_c_l73_c7_5714]
signal pc_MUX_uxn_c_l73_c7_5714_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l73_c7_5714_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l73_c7_5714_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l73_c7_5714_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l76_c11_c274]
signal BIN_OP_EQ_uxn_c_l76_c11_c274_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l76_c11_c274_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l76_c11_c274_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_5786]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l76_c7_2c30]
signal ins_MUX_uxn_c_l76_c7_2c30_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l76_c7_2c30_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l76_c7_2c30_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l76_c7_2c30_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l76_c7_2c30]
signal is_ins_done_MUX_uxn_c_l76_c7_2c30_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l76_c7_2c30_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l76_c7_2c30_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l76_c7_2c30_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l76_c7_2c30]
signal cpu_step_result_MUX_uxn_c_l76_c7_2c30_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l76_c7_2c30_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l76_c7_2c30_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l76_c7_2c30_return_output : cpu_step_result_t;

-- eval_opcode_result_MUX[uxn_c_l76_c7_2c30]
signal eval_opcode_result_MUX_uxn_c_l76_c7_2c30_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l76_c7_2c30_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l76_c7_2c30_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l76_c7_2c30_return_output : eval_opcode_result_t;

-- pc_MUX[uxn_c_l76_c7_2c30]
signal pc_MUX_uxn_c_l76_c7_2c30_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l76_c7_2c30_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l76_c7_2c30_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l76_c7_2c30_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l78_c3_2511]
signal BIN_OP_PLUS_uxn_c_l78_c3_2511_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_2511_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l78_c3_2511_return_output : unsigned(16 downto 0);

-- BIN_OP_MINUS[uxn_c_l81_c43_9e77]
signal BIN_OP_MINUS_uxn_c_l81_c43_9e77_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l81_c43_9e77_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l81_c43_9e77_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l81_c24_2bb9]
signal eval_opcode_phased_uxn_c_l81_c24_2bb9_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l81_c24_2bb9_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l81_c24_2bb9_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l81_c24_2bb9_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l81_c24_2bb9_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l81_c24_2bb9_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l82_c8_0b96]
signal MUX_uxn_c_l82_c8_0b96_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l82_c8_0b96_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l82_c8_0b96_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l82_c8_0b96_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l92_c6_1029]
signal BIN_OP_EQ_uxn_c_l92_c6_1029_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l92_c6_1029_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l92_c6_1029_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l92_c2_06e9]
signal step_cpu_phase_MUX_uxn_c_l92_c2_06e9_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l92_c2_06e9_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l92_c2_06e9_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l92_c2_06e9_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l95_c3_fff9]
signal BIN_OP_PLUS_uxn_c_l95_c3_fff9_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_fff9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l95_c3_fff9_return_output : unsigned(8 downto 0);

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
-- BIN_OP_EQ_uxn_c_l68_c6_f4ad
BIN_OP_EQ_uxn_c_l68_c6_f4ad : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l68_c6_f4ad_left,
BIN_OP_EQ_uxn_c_l68_c6_f4ad_right,
BIN_OP_EQ_uxn_c_l68_c6_f4ad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714
FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_return_output);

-- ins_MUX_uxn_c_l68_c2_0f6a
ins_MUX_uxn_c_l68_c2_0f6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l68_c2_0f6a_cond,
ins_MUX_uxn_c_l68_c2_0f6a_iftrue,
ins_MUX_uxn_c_l68_c2_0f6a_iffalse,
ins_MUX_uxn_c_l68_c2_0f6a_return_output);

-- is_ins_done_MUX_uxn_c_l68_c2_0f6a
is_ins_done_MUX_uxn_c_l68_c2_0f6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l68_c2_0f6a_cond,
is_ins_done_MUX_uxn_c_l68_c2_0f6a_iftrue,
is_ins_done_MUX_uxn_c_l68_c2_0f6a_iffalse,
is_ins_done_MUX_uxn_c_l68_c2_0f6a_return_output);

-- cpu_step_result_MUX_uxn_c_l68_c2_0f6a
cpu_step_result_MUX_uxn_c_l68_c2_0f6a : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l68_c2_0f6a_cond,
cpu_step_result_MUX_uxn_c_l68_c2_0f6a_iftrue,
cpu_step_result_MUX_uxn_c_l68_c2_0f6a_iffalse,
cpu_step_result_MUX_uxn_c_l68_c2_0f6a_return_output);

-- eval_opcode_result_MUX_uxn_c_l68_c2_0f6a
eval_opcode_result_MUX_uxn_c_l68_c2_0f6a : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_cond,
eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_iftrue,
eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_iffalse,
eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_return_output);

-- pc_MUX_uxn_c_l68_c2_0f6a
pc_MUX_uxn_c_l68_c2_0f6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l68_c2_0f6a_cond,
pc_MUX_uxn_c_l68_c2_0f6a_iftrue,
pc_MUX_uxn_c_l68_c2_0f6a_iffalse,
pc_MUX_uxn_c_l68_c2_0f6a_return_output);

-- BIN_OP_EQ_uxn_c_l73_c11_b848
BIN_OP_EQ_uxn_c_l73_c11_b848 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l73_c11_b848_left,
BIN_OP_EQ_uxn_c_l73_c11_b848_right,
BIN_OP_EQ_uxn_c_l73_c11_b848_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30
FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_return_output);

-- ins_MUX_uxn_c_l73_c7_5714
ins_MUX_uxn_c_l73_c7_5714 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l73_c7_5714_cond,
ins_MUX_uxn_c_l73_c7_5714_iftrue,
ins_MUX_uxn_c_l73_c7_5714_iffalse,
ins_MUX_uxn_c_l73_c7_5714_return_output);

-- is_ins_done_MUX_uxn_c_l73_c7_5714
is_ins_done_MUX_uxn_c_l73_c7_5714 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l73_c7_5714_cond,
is_ins_done_MUX_uxn_c_l73_c7_5714_iftrue,
is_ins_done_MUX_uxn_c_l73_c7_5714_iffalse,
is_ins_done_MUX_uxn_c_l73_c7_5714_return_output);

-- cpu_step_result_MUX_uxn_c_l73_c7_5714
cpu_step_result_MUX_uxn_c_l73_c7_5714 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l73_c7_5714_cond,
cpu_step_result_MUX_uxn_c_l73_c7_5714_iftrue,
cpu_step_result_MUX_uxn_c_l73_c7_5714_iffalse,
cpu_step_result_MUX_uxn_c_l73_c7_5714_return_output);

-- eval_opcode_result_MUX_uxn_c_l73_c7_5714
eval_opcode_result_MUX_uxn_c_l73_c7_5714 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l73_c7_5714_cond,
eval_opcode_result_MUX_uxn_c_l73_c7_5714_iftrue,
eval_opcode_result_MUX_uxn_c_l73_c7_5714_iffalse,
eval_opcode_result_MUX_uxn_c_l73_c7_5714_return_output);

-- pc_MUX_uxn_c_l73_c7_5714
pc_MUX_uxn_c_l73_c7_5714 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l73_c7_5714_cond,
pc_MUX_uxn_c_l73_c7_5714_iftrue,
pc_MUX_uxn_c_l73_c7_5714_iffalse,
pc_MUX_uxn_c_l73_c7_5714_return_output);

-- BIN_OP_EQ_uxn_c_l76_c11_c274
BIN_OP_EQ_uxn_c_l76_c11_c274 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l76_c11_c274_left,
BIN_OP_EQ_uxn_c_l76_c11_c274_right,
BIN_OP_EQ_uxn_c_l76_c11_c274_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_return_output);

-- ins_MUX_uxn_c_l76_c7_2c30
ins_MUX_uxn_c_l76_c7_2c30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l76_c7_2c30_cond,
ins_MUX_uxn_c_l76_c7_2c30_iftrue,
ins_MUX_uxn_c_l76_c7_2c30_iffalse,
ins_MUX_uxn_c_l76_c7_2c30_return_output);

-- is_ins_done_MUX_uxn_c_l76_c7_2c30
is_ins_done_MUX_uxn_c_l76_c7_2c30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l76_c7_2c30_cond,
is_ins_done_MUX_uxn_c_l76_c7_2c30_iftrue,
is_ins_done_MUX_uxn_c_l76_c7_2c30_iffalse,
is_ins_done_MUX_uxn_c_l76_c7_2c30_return_output);

-- cpu_step_result_MUX_uxn_c_l76_c7_2c30
cpu_step_result_MUX_uxn_c_l76_c7_2c30 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l76_c7_2c30_cond,
cpu_step_result_MUX_uxn_c_l76_c7_2c30_iftrue,
cpu_step_result_MUX_uxn_c_l76_c7_2c30_iffalse,
cpu_step_result_MUX_uxn_c_l76_c7_2c30_return_output);

-- eval_opcode_result_MUX_uxn_c_l76_c7_2c30
eval_opcode_result_MUX_uxn_c_l76_c7_2c30 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l76_c7_2c30_cond,
eval_opcode_result_MUX_uxn_c_l76_c7_2c30_iftrue,
eval_opcode_result_MUX_uxn_c_l76_c7_2c30_iffalse,
eval_opcode_result_MUX_uxn_c_l76_c7_2c30_return_output);

-- pc_MUX_uxn_c_l76_c7_2c30
pc_MUX_uxn_c_l76_c7_2c30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l76_c7_2c30_cond,
pc_MUX_uxn_c_l76_c7_2c30_iftrue,
pc_MUX_uxn_c_l76_c7_2c30_iffalse,
pc_MUX_uxn_c_l76_c7_2c30_return_output);

-- BIN_OP_PLUS_uxn_c_l78_c3_2511
BIN_OP_PLUS_uxn_c_l78_c3_2511 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l78_c3_2511_left,
BIN_OP_PLUS_uxn_c_l78_c3_2511_right,
BIN_OP_PLUS_uxn_c_l78_c3_2511_return_output);

-- BIN_OP_MINUS_uxn_c_l81_c43_9e77
BIN_OP_MINUS_uxn_c_l81_c43_9e77 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l81_c43_9e77_left,
BIN_OP_MINUS_uxn_c_l81_c43_9e77_right,
BIN_OP_MINUS_uxn_c_l81_c43_9e77_return_output);

-- eval_opcode_phased_uxn_c_l81_c24_2bb9
eval_opcode_phased_uxn_c_l81_c24_2bb9 : entity work.eval_opcode_phased_0CLK_0c80fd85 port map (
clk,
eval_opcode_phased_uxn_c_l81_c24_2bb9_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l81_c24_2bb9_phase,
eval_opcode_phased_uxn_c_l81_c24_2bb9_ins,
eval_opcode_phased_uxn_c_l81_c24_2bb9_pc,
eval_opcode_phased_uxn_c_l81_c24_2bb9_previous_ram_read,
eval_opcode_phased_uxn_c_l81_c24_2bb9_return_output);

-- MUX_uxn_c_l82_c8_0b96
MUX_uxn_c_l82_c8_0b96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l82_c8_0b96_cond,
MUX_uxn_c_l82_c8_0b96_iftrue,
MUX_uxn_c_l82_c8_0b96_iffalse,
MUX_uxn_c_l82_c8_0b96_return_output);

-- BIN_OP_EQ_uxn_c_l92_c6_1029
BIN_OP_EQ_uxn_c_l92_c6_1029 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l92_c6_1029_left,
BIN_OP_EQ_uxn_c_l92_c6_1029_right,
BIN_OP_EQ_uxn_c_l92_c6_1029_return_output);

-- step_cpu_phase_MUX_uxn_c_l92_c2_06e9
step_cpu_phase_MUX_uxn_c_l92_c2_06e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l92_c2_06e9_cond,
step_cpu_phase_MUX_uxn_c_l92_c2_06e9_iftrue,
step_cpu_phase_MUX_uxn_c_l92_c2_06e9_iffalse,
step_cpu_phase_MUX_uxn_c_l92_c2_06e9_return_output);

-- BIN_OP_PLUS_uxn_c_l95_c3_fff9
BIN_OP_PLUS_uxn_c_l95_c3_fff9 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l95_c3_fff9_left,
BIN_OP_PLUS_uxn_c_l95_c3_fff9_right,
BIN_OP_PLUS_uxn_c_l95_c3_fff9_return_output);



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
 BIN_OP_EQ_uxn_c_l68_c6_f4ad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_return_output,
 ins_MUX_uxn_c_l68_c2_0f6a_return_output,
 is_ins_done_MUX_uxn_c_l68_c2_0f6a_return_output,
 cpu_step_result_MUX_uxn_c_l68_c2_0f6a_return_output,
 eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_return_output,
 pc_MUX_uxn_c_l68_c2_0f6a_return_output,
 BIN_OP_EQ_uxn_c_l73_c11_b848_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_return_output,
 ins_MUX_uxn_c_l73_c7_5714_return_output,
 is_ins_done_MUX_uxn_c_l73_c7_5714_return_output,
 cpu_step_result_MUX_uxn_c_l73_c7_5714_return_output,
 eval_opcode_result_MUX_uxn_c_l73_c7_5714_return_output,
 pc_MUX_uxn_c_l73_c7_5714_return_output,
 BIN_OP_EQ_uxn_c_l76_c11_c274_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_return_output,
 ins_MUX_uxn_c_l76_c7_2c30_return_output,
 is_ins_done_MUX_uxn_c_l76_c7_2c30_return_output,
 cpu_step_result_MUX_uxn_c_l76_c7_2c30_return_output,
 eval_opcode_result_MUX_uxn_c_l76_c7_2c30_return_output,
 pc_MUX_uxn_c_l76_c7_2c30_return_output,
 BIN_OP_PLUS_uxn_c_l78_c3_2511_return_output,
 BIN_OP_MINUS_uxn_c_l81_c43_9e77_return_output,
 eval_opcode_phased_uxn_c_l81_c24_2bb9_return_output,
 MUX_uxn_c_l82_c8_0b96_return_output,
 BIN_OP_EQ_uxn_c_l92_c6_1029_return_output,
 step_cpu_phase_MUX_uxn_c_l92_c2_06e9_return_output,
 BIN_OP_PLUS_uxn_c_l95_c3_fff9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_ram_read_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_f4ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_f4ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_f4ad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_0f6a_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_0f6a_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c7_5714_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_0f6a_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_0f6a_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_0f6a_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_0f6a_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c7_5714_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_0f6a_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_0f6a_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_0f6a_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a_uxn_c_l68_c2_0f6a_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_0f6a_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l73_c7_5714_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_0f6a_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_0f6a_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c7_5714_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_0f6a_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_0f6a_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c7_5714_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_0f6a_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_0f6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l73_c11_b848_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l73_c11_b848_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l73_c11_b848_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c7_5714_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c7_5714_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l76_c7_2c30_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c7_5714_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c7_5714_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c7_5714_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l76_c7_2c30_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c7_5714_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l73_c7_5714_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247_uxn_c_l73_c7_5714_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l73_c7_5714_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l76_c7_2c30_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l73_c7_5714_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c7_5714_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c7_5714_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2c30_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c7_5714_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c7_5714_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c7_5714_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l76_c7_2c30_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c7_5714_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l76_c11_c274_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l76_c11_c274_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l76_c11_c274_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l76_c7_2c30_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l76_c7_2c30_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l76_c7_2c30_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l76_c7_2c30_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l76_c7_2c30_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l76_c7_2c30_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l76_c7_2c30_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l76_c7_2c30_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d03d_uxn_c_l76_c7_2c30_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l76_c7_2c30_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2c30_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2c30_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2c30_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l76_c7_2c30_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l78_c3_d7b5 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l76_c7_2c30_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l76_c7_2c30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_2511_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_2511_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l78_c3_2511_return_output : unsigned(16 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l81_c43_9e77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l81_c43_9e77_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l81_c43_9e77_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l82_c8_0b96_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c8_0b96_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l82_c8_0b96_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l82_c8_2485_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l82_c8_0b96_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l83_c34_ff0d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l85_c35_248d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l86_c38_d57d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l87_c34_62d9_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l88_c30_a571_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l89_c17_2055_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l92_c6_1029_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l92_c6_1029_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l92_c6_1029_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l92_c2_06e9_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l93_c3_87a1 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l92_c2_06e9_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l95_c3_9e1c : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l92_c2_06e9_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l92_c2_06e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_fff9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_fff9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l95_c3_fff9_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l84_l82_DUPLICATE_0865_return_output : unsigned(15 downto 0);
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
     VAR_step_cpu_phase_uxn_c_l93_c3_87a1 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l92_c2_06e9_iftrue := VAR_step_cpu_phase_uxn_c_l93_c3_87a1;
     VAR_BIN_OP_EQ_uxn_c_l73_c11_b848_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_2511_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_fff9_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l81_c43_9e77_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_c_l76_c11_c274_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l68_c6_f4ad_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l92_c6_1029_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_iftrue := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l68_c2_0f6a_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ram_read_value := ram_read_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_iffalse := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l76_c7_2c30_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l73_c7_5714_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2c30_iftrue := eval_opcode_result;
     VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_ins := ins;
     VAR_ins_MUX_uxn_c_l68_c2_0f6a_iftrue := ins;
     VAR_ins_MUX_uxn_c_l73_c7_5714_iftrue := ins;
     VAR_ins_MUX_uxn_c_l76_c7_2c30_iffalse := ins;
     VAR_is_ins_done_MUX_uxn_c_l73_c7_5714_iftrue := is_ins_done;
     VAR_is_ins_done_MUX_uxn_c_l76_c7_2c30_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_2511_left := pc;
     VAR_MUX_uxn_c_l82_c8_0b96_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_pc := pc;
     VAR_pc_MUX_uxn_c_l68_c2_0f6a_iftrue := pc;
     VAR_pc_MUX_uxn_c_l73_c7_5714_iftrue := pc;
     VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_previous_ram_read := VAR_ram_read_value;
     VAR_ins_MUX_uxn_c_l76_c7_2c30_iftrue := VAR_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l68_c6_f4ad_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l73_c11_b848_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l76_c11_c274_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l81_c43_9e77_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_fff9_left := step_cpu_phase;
     -- BIN_OP_EQ[uxn_c_l73_c11_b848] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l73_c11_b848_left <= VAR_BIN_OP_EQ_uxn_c_l73_c11_b848_left;
     BIN_OP_EQ_uxn_c_l73_c11_b848_right <= VAR_BIN_OP_EQ_uxn_c_l73_c11_b848_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l73_c11_b848_return_output := BIN_OP_EQ_uxn_c_l73_c11_b848_return_output;

     -- BIN_OP_MINUS[uxn_c_l81_c43_9e77] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l81_c43_9e77_left <= VAR_BIN_OP_MINUS_uxn_c_l81_c43_9e77_left;
     BIN_OP_MINUS_uxn_c_l81_c43_9e77_right <= VAR_BIN_OP_MINUS_uxn_c_l81_c43_9e77_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l81_c43_9e77_return_output := BIN_OP_MINUS_uxn_c_l81_c43_9e77_return_output;

     -- BIN_OP_PLUS[uxn_c_l95_c3_fff9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l95_c3_fff9_left <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_fff9_left;
     BIN_OP_PLUS_uxn_c_l95_c3_fff9_right <= VAR_BIN_OP_PLUS_uxn_c_l95_c3_fff9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l95_c3_fff9_return_output := BIN_OP_PLUS_uxn_c_l95_c3_fff9_return_output;

     -- BIN_OP_PLUS[uxn_c_l78_c3_2511] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l78_c3_2511_left <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_2511_left;
     BIN_OP_PLUS_uxn_c_l78_c3_2511_right <= VAR_BIN_OP_PLUS_uxn_c_l78_c3_2511_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l78_c3_2511_return_output := BIN_OP_PLUS_uxn_c_l78_c3_2511_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a[uxn_c_l68_c2_0f6a] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a_uxn_c_l68_c2_0f6a_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a(
     cpu_step_result,
     pc,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_c_l76_c11_c274] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l76_c11_c274_left <= VAR_BIN_OP_EQ_uxn_c_l76_c11_c274_left;
     BIN_OP_EQ_uxn_c_l76_c11_c274_right <= VAR_BIN_OP_EQ_uxn_c_l76_c11_c274_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l76_c11_c274_return_output := BIN_OP_EQ_uxn_c_l76_c11_c274_return_output;

     -- BIN_OP_EQ[uxn_c_l68_c6_f4ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l68_c6_f4ad_left <= VAR_BIN_OP_EQ_uxn_c_l68_c6_f4ad_left;
     BIN_OP_EQ_uxn_c_l68_c6_f4ad_right <= VAR_BIN_OP_EQ_uxn_c_l68_c6_f4ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l68_c6_f4ad_return_output := BIN_OP_EQ_uxn_c_l68_c6_f4ad_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247[uxn_c_l73_c7_5714] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247_uxn_c_l73_c7_5714_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247(
     cpu_step_result,
     pc);

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_f4ad_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_0f6a_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_f4ad_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_f4ad_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_0f6a_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_f4ad_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_0f6a_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_f4ad_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_0f6a_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_f4ad_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_b848_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l73_c7_5714_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_b848_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l73_c7_5714_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_b848_return_output;
     VAR_ins_MUX_uxn_c_l73_c7_5714_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_b848_return_output;
     VAR_is_ins_done_MUX_uxn_c_l73_c7_5714_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_b848_return_output;
     VAR_pc_MUX_uxn_c_l73_c7_5714_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_b848_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_c274_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l76_c7_2c30_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_c274_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2c30_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_c274_return_output;
     VAR_ins_MUX_uxn_c_l76_c7_2c30_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_c274_return_output;
     VAR_is_ins_done_MUX_uxn_c_l76_c7_2c30_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_c274_return_output;
     VAR_pc_MUX_uxn_c_l76_c7_2c30_cond := VAR_BIN_OP_EQ_uxn_c_l76_c11_c274_return_output;
     VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_phase := VAR_BIN_OP_MINUS_uxn_c_l81_c43_9e77_return_output;
     VAR_pc_uxn_c_l78_c3_d7b5 := resize(VAR_BIN_OP_PLUS_uxn_c_l78_c3_2511_return_output, 16);
     VAR_step_cpu_phase_uxn_c_l95_c3_9e1c := resize(VAR_BIN_OP_PLUS_uxn_c_l95_c3_fff9_return_output, 8);
     VAR_cpu_step_result_MUX_uxn_c_l73_c7_5714_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247_uxn_c_l73_c7_5714_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_0f6a_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a_uxn_c_l68_c2_0f6a_return_output;
     VAR_pc_MUX_uxn_c_l76_c7_2c30_iftrue := VAR_pc_uxn_c_l78_c3_d7b5;
     VAR_step_cpu_phase_MUX_uxn_c_l92_c2_06e9_iffalse := VAR_step_cpu_phase_uxn_c_l95_c3_9e1c;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l73_c7_5714] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_return_output;

     -- ins_MUX[uxn_c_l76_c7_2c30] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l76_c7_2c30_cond <= VAR_ins_MUX_uxn_c_l76_c7_2c30_cond;
     ins_MUX_uxn_c_l76_c7_2c30_iftrue <= VAR_ins_MUX_uxn_c_l76_c7_2c30_iftrue;
     ins_MUX_uxn_c_l76_c7_2c30_iffalse <= VAR_ins_MUX_uxn_c_l76_c7_2c30_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l76_c7_2c30_return_output := ins_MUX_uxn_c_l76_c7_2c30_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_5714_return_output;
     VAR_ins_MUX_uxn_c_l73_c7_5714_iffalse := VAR_ins_MUX_uxn_c_l76_c7_2c30_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l76_c7_2c30] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_return_output;

     -- ins_MUX[uxn_c_l73_c7_5714] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l73_c7_5714_cond <= VAR_ins_MUX_uxn_c_l73_c7_5714_cond;
     ins_MUX_uxn_c_l73_c7_5714_iftrue <= VAR_ins_MUX_uxn_c_l73_c7_5714_iftrue;
     ins_MUX_uxn_c_l73_c7_5714_iffalse <= VAR_ins_MUX_uxn_c_l73_c7_5714_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l73_c7_5714_return_output := ins_MUX_uxn_c_l73_c7_5714_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l76_c7_2c30_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_0f6a_iffalse := VAR_ins_MUX_uxn_c_l73_c7_5714_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_5786] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_return_output;

     -- ins_MUX[uxn_c_l68_c2_0f6a] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l68_c2_0f6a_cond <= VAR_ins_MUX_uxn_c_l68_c2_0f6a_cond;
     ins_MUX_uxn_c_l68_c2_0f6a_iftrue <= VAR_ins_MUX_uxn_c_l68_c2_0f6a_iftrue;
     ins_MUX_uxn_c_l68_c2_0f6a_iffalse <= VAR_ins_MUX_uxn_c_l68_c2_0f6a_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l68_c2_0f6a_return_output := ins_MUX_uxn_c_l68_c2_0f6a_return_output;

     -- Submodule level 4
     VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_5786_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l68_c2_0f6a_return_output;
     -- eval_opcode_phased[uxn_c_l81_c24_2bb9] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l81_c24_2bb9_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l81_c24_2bb9_phase <= VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_phase;
     eval_opcode_phased_uxn_c_l81_c24_2bb9_ins <= VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_ins;
     eval_opcode_phased_uxn_c_l81_c24_2bb9_pc <= VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_pc;
     eval_opcode_phased_uxn_c_l81_c24_2bb9_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_previous_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_return_output := eval_opcode_phased_uxn_c_l81_c24_2bb9_return_output;

     -- Submodule level 5
     VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2c30_iffalse := VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l89_c17_2055] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l89_c17_2055_return_output := VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l84_l82_DUPLICATE_0865 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l84_l82_DUPLICATE_0865_return_output := VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l82_c8_2485] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l82_c8_2485_return_output := VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l83_c34_ff0d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l83_c34_ff0d_return_output := VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l86_c38_d57d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l86_c38_d57d_return_output := VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l85_c35_248d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l85_c35_248d_return_output := VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_return_output.is_vram_write;

     -- eval_opcode_result_MUX[uxn_c_l76_c7_2c30] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l76_c7_2c30_cond <= VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2c30_cond;
     eval_opcode_result_MUX_uxn_c_l76_c7_2c30_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2c30_iftrue;
     eval_opcode_result_MUX_uxn_c_l76_c7_2c30_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2c30_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2c30_return_output := eval_opcode_result_MUX_uxn_c_l76_c7_2c30_return_output;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l87_c34_62d9] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l87_c34_62d9_return_output := VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l88_c30_a571] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l88_c30_a571_return_output := VAR_eval_opcode_phased_uxn_c_l81_c24_2bb9_return_output.u8_value;

     -- Submodule level 6
     VAR_MUX_uxn_c_l82_c8_0b96_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l84_l82_DUPLICATE_0865_return_output;
     VAR_is_ins_done_MUX_uxn_c_l76_c7_2c30_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l89_c17_2055_return_output;
     VAR_MUX_uxn_c_l82_c8_0b96_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l82_c8_2485_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l73_c7_5714_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l76_c7_2c30_return_output;
     -- is_ins_done_MUX[uxn_c_l76_c7_2c30] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l76_c7_2c30_cond <= VAR_is_ins_done_MUX_uxn_c_l76_c7_2c30_cond;
     is_ins_done_MUX_uxn_c_l76_c7_2c30_iftrue <= VAR_is_ins_done_MUX_uxn_c_l76_c7_2c30_iftrue;
     is_ins_done_MUX_uxn_c_l76_c7_2c30_iffalse <= VAR_is_ins_done_MUX_uxn_c_l76_c7_2c30_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l76_c7_2c30_return_output := is_ins_done_MUX_uxn_c_l76_c7_2c30_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d03d[uxn_c_l76_c7_2c30] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d03d_uxn_c_l76_c7_2c30_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d03d(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l83_c34_ff0d_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l84_l82_DUPLICATE_0865_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l85_c35_248d_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l86_c38_d57d_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l87_c34_62d9_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l88_c30_a571_return_output);

     -- MUX[uxn_c_l82_c8_0b96] LATENCY=0
     -- Inputs
     MUX_uxn_c_l82_c8_0b96_cond <= VAR_MUX_uxn_c_l82_c8_0b96_cond;
     MUX_uxn_c_l82_c8_0b96_iftrue <= VAR_MUX_uxn_c_l82_c8_0b96_iftrue;
     MUX_uxn_c_l82_c8_0b96_iffalse <= VAR_MUX_uxn_c_l82_c8_0b96_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l82_c8_0b96_return_output := MUX_uxn_c_l82_c8_0b96_return_output;

     -- eval_opcode_result_MUX[uxn_c_l73_c7_5714] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l73_c7_5714_cond <= VAR_eval_opcode_result_MUX_uxn_c_l73_c7_5714_cond;
     eval_opcode_result_MUX_uxn_c_l73_c7_5714_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l73_c7_5714_iftrue;
     eval_opcode_result_MUX_uxn_c_l73_c7_5714_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l73_c7_5714_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l73_c7_5714_return_output := eval_opcode_result_MUX_uxn_c_l73_c7_5714_return_output;

     -- Submodule level 7
     VAR_pc_MUX_uxn_c_l76_c7_2c30_iffalse := VAR_MUX_uxn_c_l82_c8_0b96_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l76_c7_2c30_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_d03d_uxn_c_l76_c7_2c30_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l73_c7_5714_return_output;
     VAR_is_ins_done_MUX_uxn_c_l73_c7_5714_iffalse := VAR_is_ins_done_MUX_uxn_c_l76_c7_2c30_return_output;
     -- cpu_step_result_MUX[uxn_c_l76_c7_2c30] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l76_c7_2c30_cond <= VAR_cpu_step_result_MUX_uxn_c_l76_c7_2c30_cond;
     cpu_step_result_MUX_uxn_c_l76_c7_2c30_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l76_c7_2c30_iftrue;
     cpu_step_result_MUX_uxn_c_l76_c7_2c30_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l76_c7_2c30_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l76_c7_2c30_return_output := cpu_step_result_MUX_uxn_c_l76_c7_2c30_return_output;

     -- is_ins_done_MUX[uxn_c_l73_c7_5714] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l73_c7_5714_cond <= VAR_is_ins_done_MUX_uxn_c_l73_c7_5714_cond;
     is_ins_done_MUX_uxn_c_l73_c7_5714_iftrue <= VAR_is_ins_done_MUX_uxn_c_l73_c7_5714_iftrue;
     is_ins_done_MUX_uxn_c_l73_c7_5714_iffalse <= VAR_is_ins_done_MUX_uxn_c_l73_c7_5714_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l73_c7_5714_return_output := is_ins_done_MUX_uxn_c_l73_c7_5714_return_output;

     -- pc_MUX[uxn_c_l76_c7_2c30] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l76_c7_2c30_cond <= VAR_pc_MUX_uxn_c_l76_c7_2c30_cond;
     pc_MUX_uxn_c_l76_c7_2c30_iftrue <= VAR_pc_MUX_uxn_c_l76_c7_2c30_iftrue;
     pc_MUX_uxn_c_l76_c7_2c30_iffalse <= VAR_pc_MUX_uxn_c_l76_c7_2c30_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l76_c7_2c30_return_output := pc_MUX_uxn_c_l76_c7_2c30_return_output;

     -- eval_opcode_result_MUX[uxn_c_l68_c2_0f6a] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_cond <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_cond;
     eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_iftrue;
     eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_return_output := eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_return_output;

     -- Submodule level 8
     VAR_cpu_step_result_MUX_uxn_c_l73_c7_5714_iffalse := VAR_cpu_step_result_MUX_uxn_c_l76_c7_2c30_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l68_c2_0f6a_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_0f6a_iffalse := VAR_is_ins_done_MUX_uxn_c_l73_c7_5714_return_output;
     VAR_pc_MUX_uxn_c_l73_c7_5714_iffalse := VAR_pc_MUX_uxn_c_l76_c7_2c30_return_output;
     -- is_ins_done_MUX[uxn_c_l68_c2_0f6a] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l68_c2_0f6a_cond <= VAR_is_ins_done_MUX_uxn_c_l68_c2_0f6a_cond;
     is_ins_done_MUX_uxn_c_l68_c2_0f6a_iftrue <= VAR_is_ins_done_MUX_uxn_c_l68_c2_0f6a_iftrue;
     is_ins_done_MUX_uxn_c_l68_c2_0f6a_iffalse <= VAR_is_ins_done_MUX_uxn_c_l68_c2_0f6a_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l68_c2_0f6a_return_output := is_ins_done_MUX_uxn_c_l68_c2_0f6a_return_output;

     -- pc_MUX[uxn_c_l73_c7_5714] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l73_c7_5714_cond <= VAR_pc_MUX_uxn_c_l73_c7_5714_cond;
     pc_MUX_uxn_c_l73_c7_5714_iftrue <= VAR_pc_MUX_uxn_c_l73_c7_5714_iftrue;
     pc_MUX_uxn_c_l73_c7_5714_iffalse <= VAR_pc_MUX_uxn_c_l73_c7_5714_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l73_c7_5714_return_output := pc_MUX_uxn_c_l73_c7_5714_return_output;

     -- cpu_step_result_MUX[uxn_c_l73_c7_5714] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l73_c7_5714_cond <= VAR_cpu_step_result_MUX_uxn_c_l73_c7_5714_cond;
     cpu_step_result_MUX_uxn_c_l73_c7_5714_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l73_c7_5714_iftrue;
     cpu_step_result_MUX_uxn_c_l73_c7_5714_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l73_c7_5714_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l73_c7_5714_return_output := cpu_step_result_MUX_uxn_c_l73_c7_5714_return_output;

     -- Submodule level 9
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_0f6a_iffalse := VAR_cpu_step_result_MUX_uxn_c_l73_c7_5714_return_output;
     VAR_BIN_OP_EQ_uxn_c_l92_c6_1029_left := VAR_is_ins_done_MUX_uxn_c_l68_c2_0f6a_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l68_c2_0f6a_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_0f6a_iffalse := VAR_pc_MUX_uxn_c_l73_c7_5714_return_output;
     -- cpu_step_result_MUX[uxn_c_l68_c2_0f6a] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l68_c2_0f6a_cond <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_0f6a_cond;
     cpu_step_result_MUX_uxn_c_l68_c2_0f6a_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_0f6a_iftrue;
     cpu_step_result_MUX_uxn_c_l68_c2_0f6a_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_0f6a_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_0f6a_return_output := cpu_step_result_MUX_uxn_c_l68_c2_0f6a_return_output;

     -- BIN_OP_EQ[uxn_c_l92_c6_1029] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l92_c6_1029_left <= VAR_BIN_OP_EQ_uxn_c_l92_c6_1029_left;
     BIN_OP_EQ_uxn_c_l92_c6_1029_right <= VAR_BIN_OP_EQ_uxn_c_l92_c6_1029_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l92_c6_1029_return_output := BIN_OP_EQ_uxn_c_l92_c6_1029_return_output;

     -- pc_MUX[uxn_c_l68_c2_0f6a] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l68_c2_0f6a_cond <= VAR_pc_MUX_uxn_c_l68_c2_0f6a_cond;
     pc_MUX_uxn_c_l68_c2_0f6a_iftrue <= VAR_pc_MUX_uxn_c_l68_c2_0f6a_iftrue;
     pc_MUX_uxn_c_l68_c2_0f6a_iffalse <= VAR_pc_MUX_uxn_c_l68_c2_0f6a_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l68_c2_0f6a_return_output := pc_MUX_uxn_c_l68_c2_0f6a_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l92_c2_06e9_cond := VAR_BIN_OP_EQ_uxn_c_l92_c6_1029_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l68_c2_0f6a_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l68_c2_0f6a_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l68_c2_0f6a_return_output;
     -- step_cpu_phase_MUX[uxn_c_l92_c2_06e9] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l92_c2_06e9_cond <= VAR_step_cpu_phase_MUX_uxn_c_l92_c2_06e9_cond;
     step_cpu_phase_MUX_uxn_c_l92_c2_06e9_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l92_c2_06e9_iftrue;
     step_cpu_phase_MUX_uxn_c_l92_c2_06e9_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l92_c2_06e9_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l92_c2_06e9_return_output := step_cpu_phase_MUX_uxn_c_l92_c2_06e9_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l92_c2_06e9_return_output;
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
