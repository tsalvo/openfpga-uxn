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
entity step_cpu_0CLK_f8d25c58 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_f8d25c58;
architecture arch of step_cpu_0CLK_f8d25c58 is
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
-- BIN_OP_EQ[uxn_c_l64_c6_cab9]
signal BIN_OP_EQ_uxn_c_l64_c6_cab9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l64_c6_cab9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l64_c6_cab9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l71_c7_76d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l64_c2_c9f9]
signal pc_MUX_uxn_c_l64_c2_c9f9_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l64_c2_c9f9_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l64_c2_c9f9_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l64_c2_c9f9_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l64_c2_c9f9]
signal ins_MUX_uxn_c_l64_c2_c9f9_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l64_c2_c9f9_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l64_c2_c9f9_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l64_c2_c9f9_return_output : unsigned(7 downto 0);

-- eval_opcode_result_MUX[uxn_c_l64_c2_c9f9]
signal eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_return_output : eval_opcode_result_t;

-- is_ins_done_MUX[uxn_c_l64_c2_c9f9]
signal is_ins_done_MUX_uxn_c_l64_c2_c9f9_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l64_c2_c9f9_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l64_c2_c9f9_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l64_c2_c9f9_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l64_c2_c9f9]
signal cpu_step_result_MUX_uxn_c_l64_c2_c9f9_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l64_c2_c9f9_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l64_c2_c9f9_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l64_c2_c9f9_return_output : cpu_step_result_t;

-- BIN_OP_EQ[uxn_c_l71_c11_16f0]
signal BIN_OP_EQ_uxn_c_l71_c11_16f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l71_c11_16f0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l71_c11_16f0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l74_c1_4ef5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l71_c7_76d4]
signal pc_MUX_uxn_c_l71_c7_76d4_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l71_c7_76d4_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l71_c7_76d4_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l71_c7_76d4_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l71_c7_76d4]
signal ins_MUX_uxn_c_l71_c7_76d4_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l71_c7_76d4_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l71_c7_76d4_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l71_c7_76d4_return_output : unsigned(7 downto 0);

-- eval_opcode_result_MUX[uxn_c_l71_c7_76d4]
signal eval_opcode_result_MUX_uxn_c_l71_c7_76d4_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l71_c7_76d4_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l71_c7_76d4_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l71_c7_76d4_return_output : eval_opcode_result_t;

-- is_ins_done_MUX[uxn_c_l71_c7_76d4]
signal is_ins_done_MUX_uxn_c_l71_c7_76d4_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l71_c7_76d4_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l71_c7_76d4_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l71_c7_76d4_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l71_c7_76d4]
signal cpu_step_result_MUX_uxn_c_l71_c7_76d4_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l71_c7_76d4_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l71_c7_76d4_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l71_c7_76d4_return_output : cpu_step_result_t;

-- BIN_OP_PLUS[uxn_c_l72_c3_ce85]
signal BIN_OP_PLUS_uxn_c_l72_c3_ce85_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l72_c3_ce85_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l72_c3_ce85_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c9_3a83]
signal BIN_OP_EQ_uxn_c_l75_c9_3a83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c9_3a83_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c9_3a83_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l75_c9_3328]
signal MUX_uxn_c_l75_c9_3328_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l75_c9_3328_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l75_c9_3328_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l75_c9_3328_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l76_c43_77b5]
signal BIN_OP_MINUS_uxn_c_l76_c43_77b5_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l76_c43_77b5_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l76_c43_77b5_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l76_c24_736f]
signal eval_opcode_phased_uxn_c_l76_c24_736f_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l76_c24_736f_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l76_c24_736f_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l76_c24_736f_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l76_c24_736f_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l76_c24_736f_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l76_c24_736f_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l77_c8_e0d4]
signal MUX_uxn_c_l77_c8_e0d4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l77_c8_e0d4_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l77_c8_e0d4_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l77_c8_e0d4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l89_c6_b761]
signal BIN_OP_EQ_uxn_c_l89_c6_b761_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l89_c6_b761_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l89_c6_b761_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l89_c2_658e]
signal step_cpu_phase_MUX_uxn_c_l89_c2_658e_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l89_c2_658e_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l89_c2_658e_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l89_c2_658e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l92_c21_16fd]
signal BIN_OP_EQ_uxn_c_l92_c21_16fd_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l92_c21_16fd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l92_c21_16fd_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l92_c37_de63]
signal BIN_OP_PLUS_uxn_c_l92_c37_de63_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l92_c37_de63_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l92_c37_de63_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l92_c21_ac88]
signal MUX_uxn_c_l92_c21_ac88_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l92_c21_ac88_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l92_c21_ac88_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l92_c21_ac88_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_c_l64_c6_cab9
BIN_OP_EQ_uxn_c_l64_c6_cab9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l64_c6_cab9_left,
BIN_OP_EQ_uxn_c_l64_c6_cab9_right,
BIN_OP_EQ_uxn_c_l64_c6_cab9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4
FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_return_output);

-- pc_MUX_uxn_c_l64_c2_c9f9
pc_MUX_uxn_c_l64_c2_c9f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l64_c2_c9f9_cond,
pc_MUX_uxn_c_l64_c2_c9f9_iftrue,
pc_MUX_uxn_c_l64_c2_c9f9_iffalse,
pc_MUX_uxn_c_l64_c2_c9f9_return_output);

-- ins_MUX_uxn_c_l64_c2_c9f9
ins_MUX_uxn_c_l64_c2_c9f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l64_c2_c9f9_cond,
ins_MUX_uxn_c_l64_c2_c9f9_iftrue,
ins_MUX_uxn_c_l64_c2_c9f9_iffalse,
ins_MUX_uxn_c_l64_c2_c9f9_return_output);

-- eval_opcode_result_MUX_uxn_c_l64_c2_c9f9
eval_opcode_result_MUX_uxn_c_l64_c2_c9f9 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_cond,
eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_iftrue,
eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_iffalse,
eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_return_output);

-- is_ins_done_MUX_uxn_c_l64_c2_c9f9
is_ins_done_MUX_uxn_c_l64_c2_c9f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l64_c2_c9f9_cond,
is_ins_done_MUX_uxn_c_l64_c2_c9f9_iftrue,
is_ins_done_MUX_uxn_c_l64_c2_c9f9_iffalse,
is_ins_done_MUX_uxn_c_l64_c2_c9f9_return_output);

-- cpu_step_result_MUX_uxn_c_l64_c2_c9f9
cpu_step_result_MUX_uxn_c_l64_c2_c9f9 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l64_c2_c9f9_cond,
cpu_step_result_MUX_uxn_c_l64_c2_c9f9_iftrue,
cpu_step_result_MUX_uxn_c_l64_c2_c9f9_iffalse,
cpu_step_result_MUX_uxn_c_l64_c2_c9f9_return_output);

-- BIN_OP_EQ_uxn_c_l71_c11_16f0
BIN_OP_EQ_uxn_c_l71_c11_16f0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l71_c11_16f0_left,
BIN_OP_EQ_uxn_c_l71_c11_16f0_right,
BIN_OP_EQ_uxn_c_l71_c11_16f0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_return_output);

-- pc_MUX_uxn_c_l71_c7_76d4
pc_MUX_uxn_c_l71_c7_76d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l71_c7_76d4_cond,
pc_MUX_uxn_c_l71_c7_76d4_iftrue,
pc_MUX_uxn_c_l71_c7_76d4_iffalse,
pc_MUX_uxn_c_l71_c7_76d4_return_output);

-- ins_MUX_uxn_c_l71_c7_76d4
ins_MUX_uxn_c_l71_c7_76d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l71_c7_76d4_cond,
ins_MUX_uxn_c_l71_c7_76d4_iftrue,
ins_MUX_uxn_c_l71_c7_76d4_iffalse,
ins_MUX_uxn_c_l71_c7_76d4_return_output);

-- eval_opcode_result_MUX_uxn_c_l71_c7_76d4
eval_opcode_result_MUX_uxn_c_l71_c7_76d4 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l71_c7_76d4_cond,
eval_opcode_result_MUX_uxn_c_l71_c7_76d4_iftrue,
eval_opcode_result_MUX_uxn_c_l71_c7_76d4_iffalse,
eval_opcode_result_MUX_uxn_c_l71_c7_76d4_return_output);

-- is_ins_done_MUX_uxn_c_l71_c7_76d4
is_ins_done_MUX_uxn_c_l71_c7_76d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l71_c7_76d4_cond,
is_ins_done_MUX_uxn_c_l71_c7_76d4_iftrue,
is_ins_done_MUX_uxn_c_l71_c7_76d4_iffalse,
is_ins_done_MUX_uxn_c_l71_c7_76d4_return_output);

-- cpu_step_result_MUX_uxn_c_l71_c7_76d4
cpu_step_result_MUX_uxn_c_l71_c7_76d4 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l71_c7_76d4_cond,
cpu_step_result_MUX_uxn_c_l71_c7_76d4_iftrue,
cpu_step_result_MUX_uxn_c_l71_c7_76d4_iffalse,
cpu_step_result_MUX_uxn_c_l71_c7_76d4_return_output);

-- BIN_OP_PLUS_uxn_c_l72_c3_ce85
BIN_OP_PLUS_uxn_c_l72_c3_ce85 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l72_c3_ce85_left,
BIN_OP_PLUS_uxn_c_l72_c3_ce85_right,
BIN_OP_PLUS_uxn_c_l72_c3_ce85_return_output);

-- BIN_OP_EQ_uxn_c_l75_c9_3a83
BIN_OP_EQ_uxn_c_l75_c9_3a83 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c9_3a83_left,
BIN_OP_EQ_uxn_c_l75_c9_3a83_right,
BIN_OP_EQ_uxn_c_l75_c9_3a83_return_output);

-- MUX_uxn_c_l75_c9_3328
MUX_uxn_c_l75_c9_3328 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l75_c9_3328_cond,
MUX_uxn_c_l75_c9_3328_iftrue,
MUX_uxn_c_l75_c9_3328_iffalse,
MUX_uxn_c_l75_c9_3328_return_output);

-- BIN_OP_MINUS_uxn_c_l76_c43_77b5
BIN_OP_MINUS_uxn_c_l76_c43_77b5 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l76_c43_77b5_left,
BIN_OP_MINUS_uxn_c_l76_c43_77b5_right,
BIN_OP_MINUS_uxn_c_l76_c43_77b5_return_output);

-- eval_opcode_phased_uxn_c_l76_c24_736f
eval_opcode_phased_uxn_c_l76_c24_736f : entity work.eval_opcode_phased_0CLK_13684ab1 port map (
clk,
eval_opcode_phased_uxn_c_l76_c24_736f_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l76_c24_736f_phase,
eval_opcode_phased_uxn_c_l76_c24_736f_ins,
eval_opcode_phased_uxn_c_l76_c24_736f_pc,
eval_opcode_phased_uxn_c_l76_c24_736f_previous_ram_read,
eval_opcode_phased_uxn_c_l76_c24_736f_previous_device_ram_read,
eval_opcode_phased_uxn_c_l76_c24_736f_return_output);

-- MUX_uxn_c_l77_c8_e0d4
MUX_uxn_c_l77_c8_e0d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l77_c8_e0d4_cond,
MUX_uxn_c_l77_c8_e0d4_iftrue,
MUX_uxn_c_l77_c8_e0d4_iffalse,
MUX_uxn_c_l77_c8_e0d4_return_output);

-- BIN_OP_EQ_uxn_c_l89_c6_b761
BIN_OP_EQ_uxn_c_l89_c6_b761 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l89_c6_b761_left,
BIN_OP_EQ_uxn_c_l89_c6_b761_right,
BIN_OP_EQ_uxn_c_l89_c6_b761_return_output);

-- step_cpu_phase_MUX_uxn_c_l89_c2_658e
step_cpu_phase_MUX_uxn_c_l89_c2_658e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l89_c2_658e_cond,
step_cpu_phase_MUX_uxn_c_l89_c2_658e_iftrue,
step_cpu_phase_MUX_uxn_c_l89_c2_658e_iffalse,
step_cpu_phase_MUX_uxn_c_l89_c2_658e_return_output);

-- BIN_OP_EQ_uxn_c_l92_c21_16fd
BIN_OP_EQ_uxn_c_l92_c21_16fd : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l92_c21_16fd_left,
BIN_OP_EQ_uxn_c_l92_c21_16fd_right,
BIN_OP_EQ_uxn_c_l92_c21_16fd_return_output);

-- BIN_OP_PLUS_uxn_c_l92_c37_de63
BIN_OP_PLUS_uxn_c_l92_c37_de63 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l92_c37_de63_left,
BIN_OP_PLUS_uxn_c_l92_c37_de63_right,
BIN_OP_PLUS_uxn_c_l92_c37_de63_return_output);

-- MUX_uxn_c_l92_c21_ac88
MUX_uxn_c_l92_c21_ac88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l92_c21_ac88_cond,
MUX_uxn_c_l92_c21_ac88_iftrue,
MUX_uxn_c_l92_c21_ac88_iffalse,
MUX_uxn_c_l92_c21_ac88_return_output);



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
 BIN_OP_EQ_uxn_c_l64_c6_cab9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_return_output,
 pc_MUX_uxn_c_l64_c2_c9f9_return_output,
 ins_MUX_uxn_c_l64_c2_c9f9_return_output,
 eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_return_output,
 is_ins_done_MUX_uxn_c_l64_c2_c9f9_return_output,
 cpu_step_result_MUX_uxn_c_l64_c2_c9f9_return_output,
 BIN_OP_EQ_uxn_c_l71_c11_16f0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_return_output,
 pc_MUX_uxn_c_l71_c7_76d4_return_output,
 ins_MUX_uxn_c_l71_c7_76d4_return_output,
 eval_opcode_result_MUX_uxn_c_l71_c7_76d4_return_output,
 is_ins_done_MUX_uxn_c_l71_c7_76d4_return_output,
 cpu_step_result_MUX_uxn_c_l71_c7_76d4_return_output,
 BIN_OP_PLUS_uxn_c_l72_c3_ce85_return_output,
 BIN_OP_EQ_uxn_c_l75_c9_3a83_return_output,
 MUX_uxn_c_l75_c9_3328_return_output,
 BIN_OP_MINUS_uxn_c_l76_c43_77b5_return_output,
 eval_opcode_phased_uxn_c_l76_c24_736f_return_output,
 MUX_uxn_c_l77_c8_e0d4_return_output,
 BIN_OP_EQ_uxn_c_l89_c6_b761_return_output,
 step_cpu_phase_MUX_uxn_c_l89_c2_658e_return_output,
 BIN_OP_EQ_uxn_c_l92_c21_16fd_return_output,
 BIN_OP_PLUS_uxn_c_l92_c37_de63_return_output,
 MUX_uxn_c_l92_c21_ac88_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l64_c6_cab9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l64_c6_cab9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l64_c6_cab9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l64_c2_c9f9_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l64_c2_c9f9_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l71_c7_76d4_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l64_c2_c9f9_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l64_c2_c9f9_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l64_c2_c9f9_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l64_c2_c9f9_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l71_c7_76d4_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l64_c2_c9f9_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l64_c2_c9f9_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l71_c7_76d4_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l64_c2_c9f9_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l64_c2_c9f9_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l71_c7_76d4_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l64_c2_c9f9_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l64_c2_c9f9_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l64_c2_c9f9_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l64_c2_c9f9_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l64_c2_c9f9_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l71_c7_76d4_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l64_c2_c9f9_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l64_c2_c9f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l71_c11_16f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l71_c11_16f0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l71_c11_16f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l71_c7_76d4_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l72_c3_5146 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l71_c7_76d4_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l71_c7_76d4_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l71_c7_76d4_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l71_c7_76d4_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l71_c7_76d4_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l71_c7_76d4_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l71_c7_76d4_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l71_c7_76d4_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l71_c7_76d4_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l71_c7_76d4_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l71_c7_76d4_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l71_c7_76d4_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l71_c7_76d4_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l71_c7_76d4_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l71_c7_76d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l72_c3_ce85_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l72_c3_ce85_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l72_c3_ce85_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l75_c9_3328_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c9_3328_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l75_c9_3328_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c9_3a83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c9_3a83_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c9_3a83_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l75_c9_3328_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c24_736f_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c24_736f_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c24_736f_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c24_736f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c24_736f_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l76_c43_77b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l76_c43_77b5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l76_c43_77b5_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c24_736f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c24_736f_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l77_c8_e0d4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l77_c8_e0d4_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l77_c8_e0d4_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l77_c8_1636_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l77_c8_e0d4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l78_c34_bbc0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l80_c35_555f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l81_c38_d817_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l82_c34_9fcc_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l83_c40_75e4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l84_c41_f9f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l85_c30_675c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l86_c17_1471_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l89_c6_b761_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l89_c6_b761_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l89_c6_b761_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l89_c2_658e_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l90_c3_11db : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l89_c2_658e_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l89_c2_658e_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l89_c2_658e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l92_c21_ac88_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l92_c21_ac88_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l92_c21_ac88_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l92_c21_16fd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l92_c21_16fd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l92_c21_16fd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l92_c37_de63_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l92_c37_de63_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l92_c37_de63_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l92_c21_ac88_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l79_l77_DUPLICATE_2d31_return_output : unsigned(15 downto 0);
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
     VAR_BIN_OP_EQ_uxn_c_l75_c9_3a83_right := to_unsigned(2, 2);
     VAR_MUX_uxn_c_l92_c21_ac88_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_PLUS_uxn_c_l72_c3_ce85_right := to_unsigned(1, 1);
     VAR_step_cpu_phase_uxn_c_l90_c3_11db := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l89_c2_658e_iftrue := VAR_step_cpu_phase_uxn_c_l90_c3_11db;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l76_c43_77b5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l71_c11_16f0_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l92_c37_de63_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l89_c6_b761_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l92_c21_16fd_right := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l64_c2_c9f9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l64_c6_cab9_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_iffalse := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l71_c7_76d4_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l71_c7_76d4_iftrue := eval_opcode_result;
     VAR_MUX_uxn_c_l75_c9_3328_iffalse := ins;
     VAR_ins_MUX_uxn_c_l64_c2_c9f9_iftrue := ins;
     VAR_ins_MUX_uxn_c_l71_c7_76d4_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l71_c7_76d4_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l72_c3_ce85_left := pc;
     VAR_MUX_uxn_c_l77_c8_e0d4_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l76_c24_736f_pc := pc;
     VAR_pc_MUX_uxn_c_l64_c2_c9f9_iftrue := pc;
     VAR_eval_opcode_phased_uxn_c_l76_c24_736f_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l75_c9_3328_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l76_c24_736f_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l64_c6_cab9_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l71_c11_16f0_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l75_c9_3a83_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l76_c43_77b5_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l92_c37_de63_left := step_cpu_phase;
     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7[uxn_c_l64_c2_c9f9] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l64_c2_c9f9_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7(
     cpu_step_result,
     pc,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_c_l71_c11_16f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l71_c11_16f0_left <= VAR_BIN_OP_EQ_uxn_c_l71_c11_16f0_left;
     BIN_OP_EQ_uxn_c_l71_c11_16f0_right <= VAR_BIN_OP_EQ_uxn_c_l71_c11_16f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l71_c11_16f0_return_output := BIN_OP_EQ_uxn_c_l71_c11_16f0_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c9_3a83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c9_3a83_left <= VAR_BIN_OP_EQ_uxn_c_l75_c9_3a83_left;
     BIN_OP_EQ_uxn_c_l75_c9_3a83_right <= VAR_BIN_OP_EQ_uxn_c_l75_c9_3a83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c9_3a83_return_output := BIN_OP_EQ_uxn_c_l75_c9_3a83_return_output;

     -- BIN_OP_PLUS[uxn_c_l72_c3_ce85] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l72_c3_ce85_left <= VAR_BIN_OP_PLUS_uxn_c_l72_c3_ce85_left;
     BIN_OP_PLUS_uxn_c_l72_c3_ce85_right <= VAR_BIN_OP_PLUS_uxn_c_l72_c3_ce85_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l72_c3_ce85_return_output := BIN_OP_PLUS_uxn_c_l72_c3_ce85_return_output;

     -- BIN_OP_EQ[uxn_c_l64_c6_cab9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l64_c6_cab9_left <= VAR_BIN_OP_EQ_uxn_c_l64_c6_cab9_left;
     BIN_OP_EQ_uxn_c_l64_c6_cab9_right <= VAR_BIN_OP_EQ_uxn_c_l64_c6_cab9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l64_c6_cab9_return_output := BIN_OP_EQ_uxn_c_l64_c6_cab9_return_output;

     -- BIN_OP_MINUS[uxn_c_l76_c43_77b5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l76_c43_77b5_left <= VAR_BIN_OP_MINUS_uxn_c_l76_c43_77b5_left;
     BIN_OP_MINUS_uxn_c_l76_c43_77b5_right <= VAR_BIN_OP_MINUS_uxn_c_l76_c43_77b5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l76_c43_77b5_return_output := BIN_OP_MINUS_uxn_c_l76_c43_77b5_return_output;

     -- BIN_OP_PLUS[uxn_c_l92_c37_de63] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l92_c37_de63_left <= VAR_BIN_OP_PLUS_uxn_c_l92_c37_de63_left;
     BIN_OP_PLUS_uxn_c_l92_c37_de63_right <= VAR_BIN_OP_PLUS_uxn_c_l92_c37_de63_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l92_c37_de63_return_output := BIN_OP_PLUS_uxn_c_l92_c37_de63_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_cond := VAR_BIN_OP_EQ_uxn_c_l64_c6_cab9_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l64_c2_c9f9_cond := VAR_BIN_OP_EQ_uxn_c_l64_c6_cab9_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_cond := VAR_BIN_OP_EQ_uxn_c_l64_c6_cab9_return_output;
     VAR_ins_MUX_uxn_c_l64_c2_c9f9_cond := VAR_BIN_OP_EQ_uxn_c_l64_c6_cab9_return_output;
     VAR_is_ins_done_MUX_uxn_c_l64_c2_c9f9_cond := VAR_BIN_OP_EQ_uxn_c_l64_c6_cab9_return_output;
     VAR_pc_MUX_uxn_c_l64_c2_c9f9_cond := VAR_BIN_OP_EQ_uxn_c_l64_c6_cab9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_cond := VAR_BIN_OP_EQ_uxn_c_l71_c11_16f0_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l71_c7_76d4_cond := VAR_BIN_OP_EQ_uxn_c_l71_c11_16f0_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l71_c7_76d4_cond := VAR_BIN_OP_EQ_uxn_c_l71_c11_16f0_return_output;
     VAR_ins_MUX_uxn_c_l71_c7_76d4_cond := VAR_BIN_OP_EQ_uxn_c_l71_c11_16f0_return_output;
     VAR_is_ins_done_MUX_uxn_c_l71_c7_76d4_cond := VAR_BIN_OP_EQ_uxn_c_l71_c11_16f0_return_output;
     VAR_pc_MUX_uxn_c_l71_c7_76d4_cond := VAR_BIN_OP_EQ_uxn_c_l71_c11_16f0_return_output;
     VAR_MUX_uxn_c_l75_c9_3328_cond := VAR_BIN_OP_EQ_uxn_c_l75_c9_3a83_return_output;
     VAR_eval_opcode_phased_uxn_c_l76_c24_736f_phase := VAR_BIN_OP_MINUS_uxn_c_l76_c43_77b5_return_output;
     VAR_pc_uxn_c_l72_c3_5146 := resize(VAR_BIN_OP_PLUS_uxn_c_l72_c3_ce85_return_output, 16);
     VAR_MUX_uxn_c_l92_c21_ac88_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l92_c37_de63_return_output, 8);
     VAR_cpu_step_result_MUX_uxn_c_l64_c2_c9f9_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_c2a7_uxn_c_l64_c2_c9f9_return_output;
     VAR_pc_MUX_uxn_c_l71_c7_76d4_iftrue := VAR_pc_uxn_c_l72_c3_5146;
     -- MUX[uxn_c_l75_c9_3328] LATENCY=0
     -- Inputs
     MUX_uxn_c_l75_c9_3328_cond <= VAR_MUX_uxn_c_l75_c9_3328_cond;
     MUX_uxn_c_l75_c9_3328_iftrue <= VAR_MUX_uxn_c_l75_c9_3328_iftrue;
     MUX_uxn_c_l75_c9_3328_iffalse <= VAR_MUX_uxn_c_l75_c9_3328_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l75_c9_3328_return_output := MUX_uxn_c_l75_c9_3328_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l71_c7_76d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l71_c7_76d4_return_output;
     VAR_eval_opcode_phased_uxn_c_l76_c24_736f_ins := VAR_MUX_uxn_c_l75_c9_3328_return_output;
     VAR_ins_MUX_uxn_c_l71_c7_76d4_iffalse := VAR_MUX_uxn_c_l75_c9_3328_return_output;
     -- ins_MUX[uxn_c_l71_c7_76d4] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l71_c7_76d4_cond <= VAR_ins_MUX_uxn_c_l71_c7_76d4_cond;
     ins_MUX_uxn_c_l71_c7_76d4_iftrue <= VAR_ins_MUX_uxn_c_l71_c7_76d4_iftrue;
     ins_MUX_uxn_c_l71_c7_76d4_iffalse <= VAR_ins_MUX_uxn_c_l71_c7_76d4_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l71_c7_76d4_return_output := ins_MUX_uxn_c_l71_c7_76d4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l74_c1_4ef5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_return_output;

     -- Submodule level 3
     VAR_eval_opcode_phased_uxn_c_l76_c24_736f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l74_c1_4ef5_return_output;
     VAR_ins_MUX_uxn_c_l64_c2_c9f9_iffalse := VAR_ins_MUX_uxn_c_l71_c7_76d4_return_output;
     -- eval_opcode_phased[uxn_c_l76_c24_736f] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l76_c24_736f_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l76_c24_736f_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l76_c24_736f_phase <= VAR_eval_opcode_phased_uxn_c_l76_c24_736f_phase;
     eval_opcode_phased_uxn_c_l76_c24_736f_ins <= VAR_eval_opcode_phased_uxn_c_l76_c24_736f_ins;
     eval_opcode_phased_uxn_c_l76_c24_736f_pc <= VAR_eval_opcode_phased_uxn_c_l76_c24_736f_pc;
     eval_opcode_phased_uxn_c_l76_c24_736f_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l76_c24_736f_previous_ram_read;
     eval_opcode_phased_uxn_c_l76_c24_736f_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l76_c24_736f_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l76_c24_736f_return_output := eval_opcode_phased_uxn_c_l76_c24_736f_return_output;

     -- ins_MUX[uxn_c_l64_c2_c9f9] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l64_c2_c9f9_cond <= VAR_ins_MUX_uxn_c_l64_c2_c9f9_cond;
     ins_MUX_uxn_c_l64_c2_c9f9_iftrue <= VAR_ins_MUX_uxn_c_l64_c2_c9f9_iftrue;
     ins_MUX_uxn_c_l64_c2_c9f9_iffalse <= VAR_ins_MUX_uxn_c_l64_c2_c9f9_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l64_c2_c9f9_return_output := ins_MUX_uxn_c_l64_c2_c9f9_return_output;

     -- Submodule level 4
     VAR_eval_opcode_result_MUX_uxn_c_l71_c7_76d4_iffalse := VAR_eval_opcode_phased_uxn_c_l76_c24_736f_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l64_c2_c9f9_return_output;
     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l83_c40_75e4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l83_c40_75e4_return_output := VAR_eval_opcode_phased_uxn_c_l76_c24_736f_return_output.device_ram_address;

     -- eval_opcode_result_MUX[uxn_c_l71_c7_76d4] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l71_c7_76d4_cond <= VAR_eval_opcode_result_MUX_uxn_c_l71_c7_76d4_cond;
     eval_opcode_result_MUX_uxn_c_l71_c7_76d4_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l71_c7_76d4_iftrue;
     eval_opcode_result_MUX_uxn_c_l71_c7_76d4_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l71_c7_76d4_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l71_c7_76d4_return_output := eval_opcode_result_MUX_uxn_c_l71_c7_76d4_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l80_c35_555f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l80_c35_555f_return_output := VAR_eval_opcode_phased_uxn_c_l76_c24_736f_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l86_c17_1471] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l86_c17_1471_return_output := VAR_eval_opcode_phased_uxn_c_l76_c24_736f_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l79_l77_DUPLICATE_2d31 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l79_l77_DUPLICATE_2d31_return_output := VAR_eval_opcode_phased_uxn_c_l76_c24_736f_return_output.u16_value;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l82_c34_9fcc] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l82_c34_9fcc_return_output := VAR_eval_opcode_phased_uxn_c_l76_c24_736f_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l81_c38_d817] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l81_c38_d817_return_output := VAR_eval_opcode_phased_uxn_c_l76_c24_736f_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l85_c30_675c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l85_c30_675c_return_output := VAR_eval_opcode_phased_uxn_c_l76_c24_736f_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l84_c41_f9f5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l84_c41_f9f5_return_output := VAR_eval_opcode_phased_uxn_c_l76_c24_736f_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l78_c34_bbc0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l78_c34_bbc0_return_output := VAR_eval_opcode_phased_uxn_c_l76_c24_736f_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l77_c8_1636] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l77_c8_1636_return_output := VAR_eval_opcode_phased_uxn_c_l76_c24_736f_return_output.is_pc_updated;

     -- Submodule level 5
     VAR_MUX_uxn_c_l77_c8_e0d4_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l79_l77_DUPLICATE_2d31_return_output;
     VAR_is_ins_done_MUX_uxn_c_l71_c7_76d4_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l86_c17_1471_return_output;
     VAR_MUX_uxn_c_l77_c8_e0d4_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l77_c8_1636_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l71_c7_76d4_return_output;
     -- MUX[uxn_c_l77_c8_e0d4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l77_c8_e0d4_cond <= VAR_MUX_uxn_c_l77_c8_e0d4_cond;
     MUX_uxn_c_l77_c8_e0d4_iftrue <= VAR_MUX_uxn_c_l77_c8_e0d4_iftrue;
     MUX_uxn_c_l77_c8_e0d4_iffalse <= VAR_MUX_uxn_c_l77_c8_e0d4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l77_c8_e0d4_return_output := MUX_uxn_c_l77_c8_e0d4_return_output;

     -- eval_opcode_result_MUX[uxn_c_l64_c2_c9f9] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_cond <= VAR_eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_cond;
     eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_iftrue;
     eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_return_output := eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_return_output;

     -- is_ins_done_MUX[uxn_c_l71_c7_76d4] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l71_c7_76d4_cond <= VAR_is_ins_done_MUX_uxn_c_l71_c7_76d4_cond;
     is_ins_done_MUX_uxn_c_l71_c7_76d4_iftrue <= VAR_is_ins_done_MUX_uxn_c_l71_c7_76d4_iftrue;
     is_ins_done_MUX_uxn_c_l71_c7_76d4_iffalse <= VAR_is_ins_done_MUX_uxn_c_l71_c7_76d4_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l71_c7_76d4_return_output := is_ins_done_MUX_uxn_c_l71_c7_76d4_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030[uxn_c_l71_c7_76d4] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l71_c7_76d4_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l78_c34_bbc0_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l79_l77_DUPLICATE_2d31_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l80_c35_555f_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l81_c38_d817_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l82_c34_9fcc_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l83_c40_75e4_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l84_c41_f9f5_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l85_c30_675c_return_output);

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l71_c7_76d4_iffalse := VAR_MUX_uxn_c_l77_c8_e0d4_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l71_c7_76d4_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9030_uxn_c_l71_c7_76d4_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l64_c2_c9f9_return_output;
     VAR_is_ins_done_MUX_uxn_c_l64_c2_c9f9_iffalse := VAR_is_ins_done_MUX_uxn_c_l71_c7_76d4_return_output;
     -- pc_MUX[uxn_c_l71_c7_76d4] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l71_c7_76d4_cond <= VAR_pc_MUX_uxn_c_l71_c7_76d4_cond;
     pc_MUX_uxn_c_l71_c7_76d4_iftrue <= VAR_pc_MUX_uxn_c_l71_c7_76d4_iftrue;
     pc_MUX_uxn_c_l71_c7_76d4_iffalse <= VAR_pc_MUX_uxn_c_l71_c7_76d4_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l71_c7_76d4_return_output := pc_MUX_uxn_c_l71_c7_76d4_return_output;

     -- is_ins_done_MUX[uxn_c_l64_c2_c9f9] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l64_c2_c9f9_cond <= VAR_is_ins_done_MUX_uxn_c_l64_c2_c9f9_cond;
     is_ins_done_MUX_uxn_c_l64_c2_c9f9_iftrue <= VAR_is_ins_done_MUX_uxn_c_l64_c2_c9f9_iftrue;
     is_ins_done_MUX_uxn_c_l64_c2_c9f9_iffalse <= VAR_is_ins_done_MUX_uxn_c_l64_c2_c9f9_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l64_c2_c9f9_return_output := is_ins_done_MUX_uxn_c_l64_c2_c9f9_return_output;

     -- cpu_step_result_MUX[uxn_c_l71_c7_76d4] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l71_c7_76d4_cond <= VAR_cpu_step_result_MUX_uxn_c_l71_c7_76d4_cond;
     cpu_step_result_MUX_uxn_c_l71_c7_76d4_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l71_c7_76d4_iftrue;
     cpu_step_result_MUX_uxn_c_l71_c7_76d4_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l71_c7_76d4_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l71_c7_76d4_return_output := cpu_step_result_MUX_uxn_c_l71_c7_76d4_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_MUX_uxn_c_l64_c2_c9f9_iffalse := VAR_cpu_step_result_MUX_uxn_c_l71_c7_76d4_return_output;
     VAR_BIN_OP_EQ_uxn_c_l89_c6_b761_left := VAR_is_ins_done_MUX_uxn_c_l64_c2_c9f9_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l64_c2_c9f9_return_output;
     VAR_pc_MUX_uxn_c_l64_c2_c9f9_iffalse := VAR_pc_MUX_uxn_c_l71_c7_76d4_return_output;
     -- pc_MUX[uxn_c_l64_c2_c9f9] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l64_c2_c9f9_cond <= VAR_pc_MUX_uxn_c_l64_c2_c9f9_cond;
     pc_MUX_uxn_c_l64_c2_c9f9_iftrue <= VAR_pc_MUX_uxn_c_l64_c2_c9f9_iftrue;
     pc_MUX_uxn_c_l64_c2_c9f9_iffalse <= VAR_pc_MUX_uxn_c_l64_c2_c9f9_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l64_c2_c9f9_return_output := pc_MUX_uxn_c_l64_c2_c9f9_return_output;

     -- cpu_step_result_MUX[uxn_c_l64_c2_c9f9] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l64_c2_c9f9_cond <= VAR_cpu_step_result_MUX_uxn_c_l64_c2_c9f9_cond;
     cpu_step_result_MUX_uxn_c_l64_c2_c9f9_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l64_c2_c9f9_iftrue;
     cpu_step_result_MUX_uxn_c_l64_c2_c9f9_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l64_c2_c9f9_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l64_c2_c9f9_return_output := cpu_step_result_MUX_uxn_c_l64_c2_c9f9_return_output;

     -- BIN_OP_EQ[uxn_c_l89_c6_b761] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l89_c6_b761_left <= VAR_BIN_OP_EQ_uxn_c_l89_c6_b761_left;
     BIN_OP_EQ_uxn_c_l89_c6_b761_right <= VAR_BIN_OP_EQ_uxn_c_l89_c6_b761_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l89_c6_b761_return_output := BIN_OP_EQ_uxn_c_l89_c6_b761_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l89_c2_658e_cond := VAR_BIN_OP_EQ_uxn_c_l89_c6_b761_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l64_c2_c9f9_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l64_c2_c9f9_return_output;
     VAR_BIN_OP_EQ_uxn_c_l92_c21_16fd_left := VAR_pc_MUX_uxn_c_l64_c2_c9f9_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l64_c2_c9f9_return_output;
     -- BIN_OP_EQ[uxn_c_l92_c21_16fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l92_c21_16fd_left <= VAR_BIN_OP_EQ_uxn_c_l92_c21_16fd_left;
     BIN_OP_EQ_uxn_c_l92_c21_16fd_right <= VAR_BIN_OP_EQ_uxn_c_l92_c21_16fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l92_c21_16fd_return_output := BIN_OP_EQ_uxn_c_l92_c21_16fd_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_c_l92_c21_ac88_cond := VAR_BIN_OP_EQ_uxn_c_l92_c21_16fd_return_output;
     -- MUX[uxn_c_l92_c21_ac88] LATENCY=0
     -- Inputs
     MUX_uxn_c_l92_c21_ac88_cond <= VAR_MUX_uxn_c_l92_c21_ac88_cond;
     MUX_uxn_c_l92_c21_ac88_iftrue <= VAR_MUX_uxn_c_l92_c21_ac88_iftrue;
     MUX_uxn_c_l92_c21_ac88_iffalse <= VAR_MUX_uxn_c_l92_c21_ac88_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l92_c21_ac88_return_output := MUX_uxn_c_l92_c21_ac88_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l89_c2_658e_iffalse := VAR_MUX_uxn_c_l92_c21_ac88_return_output;
     -- step_cpu_phase_MUX[uxn_c_l89_c2_658e] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l89_c2_658e_cond <= VAR_step_cpu_phase_MUX_uxn_c_l89_c2_658e_cond;
     step_cpu_phase_MUX_uxn_c_l89_c2_658e_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l89_c2_658e_iftrue;
     step_cpu_phase_MUX_uxn_c_l89_c2_658e_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l89_c2_658e_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l89_c2_658e_return_output := step_cpu_phase_MUX_uxn_c_l89_c2_658e_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l89_c2_658e_return_output;
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
