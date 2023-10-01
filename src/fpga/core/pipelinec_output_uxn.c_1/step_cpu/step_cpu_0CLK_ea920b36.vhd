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
-- Submodules: 38
entity step_cpu_0CLK_ea920b36 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ram_read_value : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_ea920b36;
architecture arch of step_cpu_0CLK_ea920b36 is
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
is_ram_read => to_unsigned(0, 1),
is_ram_write => to_unsigned(0, 1),
ram_address => to_unsigned(0, 16),
ram_value => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
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
-- BIN_OP_EQ[uxn_c_l68_c6_d553]
signal BIN_OP_EQ_uxn_c_l68_c6_d553_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_d553_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l68_c6_d553_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_874c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l75_c7_2d23]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l68_c2_82bc]
signal cpu_step_result_MUX_uxn_c_l68_c2_82bc_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l68_c2_82bc_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_82bc_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l68_c2_82bc_return_output : cpu_step_result_t;

-- eval_opcode_result_MUX[uxn_c_l68_c2_82bc]
signal eval_opcode_result_MUX_uxn_c_l68_c2_82bc_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l68_c2_82bc_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_82bc_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l68_c2_82bc_return_output : eval_opcode_result_t;

-- pc_MUX[uxn_c_l68_c2_82bc]
signal pc_MUX_uxn_c_l68_c2_82bc_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l68_c2_82bc_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_82bc_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l68_c2_82bc_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l68_c2_82bc]
signal ins_MUX_uxn_c_l68_c2_82bc_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l68_c2_82bc_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_82bc_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l68_c2_82bc_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l68_c2_82bc]
signal is_ins_done_MUX_uxn_c_l68_c2_82bc_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_82bc_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_82bc_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l68_c2_82bc_return_output : unsigned(0 downto 0);

-- printf_uxn_c_l73_c3_d92f[uxn_c_l73_c3_d92f]
signal printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c11_3d4c]
signal BIN_OP_EQ_uxn_c_l75_c11_3d4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c11_3d4c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c11_3d4c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l75_c1_2c21]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l83_c7_83d9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l75_c7_2d23]
signal cpu_step_result_MUX_uxn_c_l75_c7_2d23_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l75_c7_2d23_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c7_2d23_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l75_c7_2d23_return_output : cpu_step_result_t;

-- eval_opcode_result_MUX[uxn_c_l75_c7_2d23]
signal eval_opcode_result_MUX_uxn_c_l75_c7_2d23_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l75_c7_2d23_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l75_c7_2d23_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l75_c7_2d23_return_output : eval_opcode_result_t;

-- pc_MUX[uxn_c_l75_c7_2d23]
signal pc_MUX_uxn_c_l75_c7_2d23_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l75_c7_2d23_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c7_2d23_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l75_c7_2d23_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l75_c7_2d23]
signal ins_MUX_uxn_c_l75_c7_2d23_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l75_c7_2d23_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c7_2d23_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l75_c7_2d23_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l75_c7_2d23]
signal is_ins_done_MUX_uxn_c_l75_c7_2d23_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c7_2d23_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c7_2d23_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l75_c7_2d23_return_output : unsigned(0 downto 0);

-- printf_uxn_c_l81_c3_e589[uxn_c_l81_c3_e589]
signal printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l83_c11_422c]
signal BIN_OP_EQ_uxn_c_l83_c11_422c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l83_c11_422c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l83_c11_422c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l83_c1_2d21]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l88_c1_488b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l83_c7_83d9]
signal cpu_step_result_MUX_uxn_c_l83_c7_83d9_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l83_c7_83d9_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l83_c7_83d9_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l83_c7_83d9_return_output : cpu_step_result_t;

-- eval_opcode_result_MUX[uxn_c_l83_c7_83d9]
signal eval_opcode_result_MUX_uxn_c_l83_c7_83d9_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l83_c7_83d9_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l83_c7_83d9_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l83_c7_83d9_return_output : eval_opcode_result_t;

-- pc_MUX[uxn_c_l83_c7_83d9]
signal pc_MUX_uxn_c_l83_c7_83d9_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l83_c7_83d9_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l83_c7_83d9_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l83_c7_83d9_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l83_c7_83d9]
signal ins_MUX_uxn_c_l83_c7_83d9_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l83_c7_83d9_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l83_c7_83d9_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l83_c7_83d9_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l83_c7_83d9]
signal is_ins_done_MUX_uxn_c_l83_c7_83d9_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l83_c7_83d9_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l83_c7_83d9_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l83_c7_83d9_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l85_c3_494d]
signal BIN_OP_PLUS_uxn_c_l85_c3_494d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l85_c3_494d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l85_c3_494d_return_output : unsigned(16 downto 0);

-- printf_uxn_c_l86_c3_4624[uxn_c_l86_c3_4624]
signal printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg2 : unsigned(31 downto 0);

-- BIN_OP_MINUS[uxn_c_l89_c43_39e0]
signal BIN_OP_MINUS_uxn_c_l89_c43_39e0_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l89_c43_39e0_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l89_c43_39e0_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l89_c24_3bcf]
signal eval_opcode_phased_uxn_c_l89_c24_3bcf_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_3bcf_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_3bcf_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_3bcf_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_3bcf_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l90_c8_8abc]
signal MUX_uxn_c_l90_c8_8abc_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l90_c8_8abc_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l90_c8_8abc_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l90_c8_8abc_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l99_c3_2384[uxn_c_l99_c3_2384]
signal printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l102_c6_102e]
signal BIN_OP_EQ_uxn_c_l102_c6_102e_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c6_102e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c6_102e_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l102_c2_99de]
signal step_cpu_phase_MUX_uxn_c_l102_c2_99de_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l102_c2_99de_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l102_c2_99de_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l102_c2_99de_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l105_c3_0b74]
signal BIN_OP_PLUS_uxn_c_l105_c3_0b74_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l105_c3_0b74_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l105_c3_0b74_return_output : unsigned(8 downto 0);

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f( ref_toks_0 : cpu_step_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base := ref_toks_0;
      base.ram_address := ref_toks_1;
      base.is_ram_read := ref_toks_2;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base.is_ram_read := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.ram_address := ref_toks_2;
      base.ram_value := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.vram_address := ref_toks_5;
      base.vram_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_c_l68_c6_d553
BIN_OP_EQ_uxn_c_l68_c6_d553 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l68_c6_d553_left,
BIN_OP_EQ_uxn_c_l68_c6_d553_right,
BIN_OP_EQ_uxn_c_l68_c6_d553_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_return_output);

-- cpu_step_result_MUX_uxn_c_l68_c2_82bc
cpu_step_result_MUX_uxn_c_l68_c2_82bc : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l68_c2_82bc_cond,
cpu_step_result_MUX_uxn_c_l68_c2_82bc_iftrue,
cpu_step_result_MUX_uxn_c_l68_c2_82bc_iffalse,
cpu_step_result_MUX_uxn_c_l68_c2_82bc_return_output);

-- eval_opcode_result_MUX_uxn_c_l68_c2_82bc
eval_opcode_result_MUX_uxn_c_l68_c2_82bc : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l68_c2_82bc_cond,
eval_opcode_result_MUX_uxn_c_l68_c2_82bc_iftrue,
eval_opcode_result_MUX_uxn_c_l68_c2_82bc_iffalse,
eval_opcode_result_MUX_uxn_c_l68_c2_82bc_return_output);

-- pc_MUX_uxn_c_l68_c2_82bc
pc_MUX_uxn_c_l68_c2_82bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l68_c2_82bc_cond,
pc_MUX_uxn_c_l68_c2_82bc_iftrue,
pc_MUX_uxn_c_l68_c2_82bc_iffalse,
pc_MUX_uxn_c_l68_c2_82bc_return_output);

-- ins_MUX_uxn_c_l68_c2_82bc
ins_MUX_uxn_c_l68_c2_82bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l68_c2_82bc_cond,
ins_MUX_uxn_c_l68_c2_82bc_iftrue,
ins_MUX_uxn_c_l68_c2_82bc_iffalse,
ins_MUX_uxn_c_l68_c2_82bc_return_output);

-- is_ins_done_MUX_uxn_c_l68_c2_82bc
is_ins_done_MUX_uxn_c_l68_c2_82bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l68_c2_82bc_cond,
is_ins_done_MUX_uxn_c_l68_c2_82bc_iftrue,
is_ins_done_MUX_uxn_c_l68_c2_82bc_iffalse,
is_ins_done_MUX_uxn_c_l68_c2_82bc_return_output);

-- printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f
printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f : entity work.printf_uxn_c_l73_c3_d92f_0CLK_de264c78 port map (
printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_CLOCK_ENABLE,
printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_arg0,
printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_arg1);

-- BIN_OP_EQ_uxn_c_l75_c11_3d4c
BIN_OP_EQ_uxn_c_l75_c11_3d4c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c11_3d4c_left,
BIN_OP_EQ_uxn_c_l75_c11_3d4c_right,
BIN_OP_EQ_uxn_c_l75_c11_3d4c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_return_output);

-- cpu_step_result_MUX_uxn_c_l75_c7_2d23
cpu_step_result_MUX_uxn_c_l75_c7_2d23 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l75_c7_2d23_cond,
cpu_step_result_MUX_uxn_c_l75_c7_2d23_iftrue,
cpu_step_result_MUX_uxn_c_l75_c7_2d23_iffalse,
cpu_step_result_MUX_uxn_c_l75_c7_2d23_return_output);

-- eval_opcode_result_MUX_uxn_c_l75_c7_2d23
eval_opcode_result_MUX_uxn_c_l75_c7_2d23 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l75_c7_2d23_cond,
eval_opcode_result_MUX_uxn_c_l75_c7_2d23_iftrue,
eval_opcode_result_MUX_uxn_c_l75_c7_2d23_iffalse,
eval_opcode_result_MUX_uxn_c_l75_c7_2d23_return_output);

-- pc_MUX_uxn_c_l75_c7_2d23
pc_MUX_uxn_c_l75_c7_2d23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l75_c7_2d23_cond,
pc_MUX_uxn_c_l75_c7_2d23_iftrue,
pc_MUX_uxn_c_l75_c7_2d23_iffalse,
pc_MUX_uxn_c_l75_c7_2d23_return_output);

-- ins_MUX_uxn_c_l75_c7_2d23
ins_MUX_uxn_c_l75_c7_2d23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l75_c7_2d23_cond,
ins_MUX_uxn_c_l75_c7_2d23_iftrue,
ins_MUX_uxn_c_l75_c7_2d23_iffalse,
ins_MUX_uxn_c_l75_c7_2d23_return_output);

-- is_ins_done_MUX_uxn_c_l75_c7_2d23
is_ins_done_MUX_uxn_c_l75_c7_2d23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l75_c7_2d23_cond,
is_ins_done_MUX_uxn_c_l75_c7_2d23_iftrue,
is_ins_done_MUX_uxn_c_l75_c7_2d23_iffalse,
is_ins_done_MUX_uxn_c_l75_c7_2d23_return_output);

-- printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589
printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589 : entity work.printf_uxn_c_l81_c3_e589_0CLK_de264c78 port map (
printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_CLOCK_ENABLE,
printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg0,
printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg1,
printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg2);

-- BIN_OP_EQ_uxn_c_l83_c11_422c
BIN_OP_EQ_uxn_c_l83_c11_422c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l83_c11_422c_left,
BIN_OP_EQ_uxn_c_l83_c11_422c_right,
BIN_OP_EQ_uxn_c_l83_c11_422c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_return_output);

-- cpu_step_result_MUX_uxn_c_l83_c7_83d9
cpu_step_result_MUX_uxn_c_l83_c7_83d9 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l83_c7_83d9_cond,
cpu_step_result_MUX_uxn_c_l83_c7_83d9_iftrue,
cpu_step_result_MUX_uxn_c_l83_c7_83d9_iffalse,
cpu_step_result_MUX_uxn_c_l83_c7_83d9_return_output);

-- eval_opcode_result_MUX_uxn_c_l83_c7_83d9
eval_opcode_result_MUX_uxn_c_l83_c7_83d9 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l83_c7_83d9_cond,
eval_opcode_result_MUX_uxn_c_l83_c7_83d9_iftrue,
eval_opcode_result_MUX_uxn_c_l83_c7_83d9_iffalse,
eval_opcode_result_MUX_uxn_c_l83_c7_83d9_return_output);

-- pc_MUX_uxn_c_l83_c7_83d9
pc_MUX_uxn_c_l83_c7_83d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l83_c7_83d9_cond,
pc_MUX_uxn_c_l83_c7_83d9_iftrue,
pc_MUX_uxn_c_l83_c7_83d9_iffalse,
pc_MUX_uxn_c_l83_c7_83d9_return_output);

-- ins_MUX_uxn_c_l83_c7_83d9
ins_MUX_uxn_c_l83_c7_83d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l83_c7_83d9_cond,
ins_MUX_uxn_c_l83_c7_83d9_iftrue,
ins_MUX_uxn_c_l83_c7_83d9_iffalse,
ins_MUX_uxn_c_l83_c7_83d9_return_output);

-- is_ins_done_MUX_uxn_c_l83_c7_83d9
is_ins_done_MUX_uxn_c_l83_c7_83d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l83_c7_83d9_cond,
is_ins_done_MUX_uxn_c_l83_c7_83d9_iftrue,
is_ins_done_MUX_uxn_c_l83_c7_83d9_iffalse,
is_ins_done_MUX_uxn_c_l83_c7_83d9_return_output);

-- BIN_OP_PLUS_uxn_c_l85_c3_494d
BIN_OP_PLUS_uxn_c_l85_c3_494d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l85_c3_494d_left,
BIN_OP_PLUS_uxn_c_l85_c3_494d_right,
BIN_OP_PLUS_uxn_c_l85_c3_494d_return_output);

-- printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624
printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624 : entity work.printf_uxn_c_l86_c3_4624_0CLK_de264c78 port map (
printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_CLOCK_ENABLE,
printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg0,
printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg1,
printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg2);

-- BIN_OP_MINUS_uxn_c_l89_c43_39e0
BIN_OP_MINUS_uxn_c_l89_c43_39e0 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l89_c43_39e0_left,
BIN_OP_MINUS_uxn_c_l89_c43_39e0_right,
BIN_OP_MINUS_uxn_c_l89_c43_39e0_return_output);

-- eval_opcode_phased_uxn_c_l89_c24_3bcf
eval_opcode_phased_uxn_c_l89_c24_3bcf : entity work.eval_opcode_phased_0CLK_63e4fff8 port map (
clk,
eval_opcode_phased_uxn_c_l89_c24_3bcf_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l89_c24_3bcf_phase,
eval_opcode_phased_uxn_c_l89_c24_3bcf_ins,
eval_opcode_phased_uxn_c_l89_c24_3bcf_pc,
eval_opcode_phased_uxn_c_l89_c24_3bcf_previous_ram_read,
eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output);

-- MUX_uxn_c_l90_c8_8abc
MUX_uxn_c_l90_c8_8abc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l90_c8_8abc_cond,
MUX_uxn_c_l90_c8_8abc_iftrue,
MUX_uxn_c_l90_c8_8abc_iffalse,
MUX_uxn_c_l90_c8_8abc_return_output);

-- printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384
printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384 : entity work.printf_uxn_c_l99_c3_2384_0CLK_de264c78 port map (
printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_CLOCK_ENABLE,
printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg0,
printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg1,
printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg2);

-- BIN_OP_EQ_uxn_c_l102_c6_102e
BIN_OP_EQ_uxn_c_l102_c6_102e : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l102_c6_102e_left,
BIN_OP_EQ_uxn_c_l102_c6_102e_right,
BIN_OP_EQ_uxn_c_l102_c6_102e_return_output);

-- step_cpu_phase_MUX_uxn_c_l102_c2_99de
step_cpu_phase_MUX_uxn_c_l102_c2_99de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l102_c2_99de_cond,
step_cpu_phase_MUX_uxn_c_l102_c2_99de_iftrue,
step_cpu_phase_MUX_uxn_c_l102_c2_99de_iffalse,
step_cpu_phase_MUX_uxn_c_l102_c2_99de_return_output);

-- BIN_OP_PLUS_uxn_c_l105_c3_0b74
BIN_OP_PLUS_uxn_c_l105_c3_0b74 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l105_c3_0b74_left,
BIN_OP_PLUS_uxn_c_l105_c3_0b74_right,
BIN_OP_PLUS_uxn_c_l105_c3_0b74_return_output);



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
 BIN_OP_EQ_uxn_c_l68_c6_d553_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_return_output,
 cpu_step_result_MUX_uxn_c_l68_c2_82bc_return_output,
 eval_opcode_result_MUX_uxn_c_l68_c2_82bc_return_output,
 pc_MUX_uxn_c_l68_c2_82bc_return_output,
 ins_MUX_uxn_c_l68_c2_82bc_return_output,
 is_ins_done_MUX_uxn_c_l68_c2_82bc_return_output,
 BIN_OP_EQ_uxn_c_l75_c11_3d4c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_return_output,
 cpu_step_result_MUX_uxn_c_l75_c7_2d23_return_output,
 eval_opcode_result_MUX_uxn_c_l75_c7_2d23_return_output,
 pc_MUX_uxn_c_l75_c7_2d23_return_output,
 ins_MUX_uxn_c_l75_c7_2d23_return_output,
 is_ins_done_MUX_uxn_c_l75_c7_2d23_return_output,
 BIN_OP_EQ_uxn_c_l83_c11_422c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_return_output,
 cpu_step_result_MUX_uxn_c_l83_c7_83d9_return_output,
 eval_opcode_result_MUX_uxn_c_l83_c7_83d9_return_output,
 pc_MUX_uxn_c_l83_c7_83d9_return_output,
 ins_MUX_uxn_c_l83_c7_83d9_return_output,
 is_ins_done_MUX_uxn_c_l83_c7_83d9_return_output,
 BIN_OP_PLUS_uxn_c_l85_c3_494d_return_output,
 BIN_OP_MINUS_uxn_c_l89_c43_39e0_return_output,
 eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output,
 MUX_uxn_c_l90_c8_8abc_return_output,
 BIN_OP_EQ_uxn_c_l102_c6_102e_return_output,
 step_cpu_phase_MUX_uxn_c_l102_c2_99de_return_output,
 BIN_OP_PLUS_uxn_c_l105_c3_0b74_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_ram_read_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_d553_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_d553_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l68_c6_d553_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_82bc_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_82bc_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_82bc_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_2d23_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_82bc_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l68_c2_82bc_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_82bc_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_82bc_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_2d23_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_82bc_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l68_c2_82bc_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_82bc_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_82bc_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_2d23_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_82bc_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l68_c2_82bc_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_82bc_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_82bc_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_2d23_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_82bc_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l68_c2_82bc_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_82bc_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_82bc_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_2d23_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_82bc_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l68_c2_82bc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c11_3d4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c11_3d4c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c11_3d4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_2d23_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l75_c7_2d23_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_2d23_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_83d9_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l75_c7_2d23_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_2d23_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_2d23_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_83d9_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l75_c7_2d23_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_2d23_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_2d23_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_83d9_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l75_c7_2d23_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_2d23_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_2d23_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_83d9_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l75_c7_2d23_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_2d23_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_2d23_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_83d9_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l75_c7_2d23_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l83_c11_422c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l83_c11_422c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l83_c11_422c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_83d9_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_83d9_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l83_c7_83d9_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l83_c7_83d9_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_83d9_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_83d9_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l83_c7_83d9_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_83d9_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l85_c3_2550 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_83d9_iffalse : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l90_c3_43e4 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l83_c7_83d9_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_83d9_iftrue : unsigned(7 downto 0);
 variable VAR_ins_uxn_c_l84_c3_afc7 : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_83d9_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l83_c7_83d9_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_83d9_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_83d9_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l83_c7_83d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l85_c3_494d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l85_c3_494d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l85_c3_494d_return_output : unsigned(16 downto 0);
 variable VAR_printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg2 : unsigned(31 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l89_c43_39e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l89_c43_39e0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l89_c43_39e0_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l90_c8_8abc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l90_c8_8abc_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l90_c8_8abc_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l90_c8_73bc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l90_c43_fe50_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l90_c8_8abc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l91_c33_373b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l92_c34_3dd0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l93_c33_9775_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l94_c31_e4a6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l95_c35_8c00_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l96_c34_140d_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l97_c32_4061_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l98_c17_abe4_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c6_102e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c6_102e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c6_102e_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_99de_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l103_c3_0e4f : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_99de_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l105_c3_97f7 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_99de_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l102_c2_99de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l105_c3_0b74_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l105_c3_0b74_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l105_c3_0b74_return_output : unsigned(8 downto 0);
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
     VAR_BIN_OP_PLUS_uxn_c_l85_c3_494d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l83_c11_422c_right := to_unsigned(2, 2);
     VAR_BIN_OP_MINUS_uxn_c_l89_c43_39e0_right := to_unsigned(3, 2);
     VAR_step_cpu_phase_uxn_c_l103_c3_0e4f := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_99de_iftrue := VAR_step_cpu_phase_uxn_c_l103_c3_0e4f;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_82bc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l75_c11_3d4c_right := to_unsigned(1, 1);
     VAR_is_ins_done_MUX_uxn_c_l75_c7_2d23_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l105_c3_0b74_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l102_c6_102e_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l68_c6_d553_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ram_read_value := ram_read_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_iftrue := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_83d9_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_82bc_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_2d23_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_83d9_iftrue := eval_opcode_result;
     VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_ins := ins;
     VAR_ins_MUX_uxn_c_l68_c2_82bc_iftrue := ins;
     VAR_ins_MUX_uxn_c_l75_c7_2d23_iftrue := ins;
     VAR_ins_MUX_uxn_c_l83_c7_83d9_iffalse := ins;
     VAR_printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg2 := resize(ins, 32);
     VAR_printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg2 := resize(ins, 32);
     VAR_is_ins_done_MUX_uxn_c_l83_c7_83d9_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l85_c3_494d_left := pc;
     VAR_MUX_uxn_c_l90_c8_8abc_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_pc := pc;
     VAR_pc_MUX_uxn_c_l68_c2_82bc_iftrue := pc;
     VAR_pc_MUX_uxn_c_l75_c7_2d23_iftrue := pc;
     VAR_printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_arg1 := resize(pc, 32);
     VAR_printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg1 := resize(pc, 32);
     VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_previous_ram_read := VAR_ram_read_value;
     VAR_ins_uxn_c_l84_c3_afc7 := VAR_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l68_c6_d553_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l75_c11_3d4c_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l83_c11_422c_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l89_c43_39e0_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l105_c3_0b74_left := step_cpu_phase;
     VAR_printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg0 := resize(step_cpu_phase, 32);
     VAR_ins_MUX_uxn_c_l83_c7_83d9_iftrue := VAR_ins_uxn_c_l84_c3_afc7;
     VAR_printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg2 := resize(VAR_ins_uxn_c_l84_c3_afc7, 32);
     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l68_c2_82bc] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_82bc_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- BIN_OP_EQ[uxn_c_l83_c11_422c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l83_c11_422c_left <= VAR_BIN_OP_EQ_uxn_c_l83_c11_422c_left;
     BIN_OP_EQ_uxn_c_l83_c11_422c_right <= VAR_BIN_OP_EQ_uxn_c_l83_c11_422c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l83_c11_422c_return_output := BIN_OP_EQ_uxn_c_l83_c11_422c_return_output;

     -- BIN_OP_MINUS[uxn_c_l89_c43_39e0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l89_c43_39e0_left <= VAR_BIN_OP_MINUS_uxn_c_l89_c43_39e0_left;
     BIN_OP_MINUS_uxn_c_l89_c43_39e0_right <= VAR_BIN_OP_MINUS_uxn_c_l89_c43_39e0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l89_c43_39e0_return_output := BIN_OP_MINUS_uxn_c_l89_c43_39e0_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f[uxn_c_l75_c7_2d23] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l75_c7_2d23_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f(
     cpu_step_result,
     pc,
     to_unsigned(1, 1));

     -- BIN_OP_EQ[uxn_c_l75_c11_3d4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c11_3d4c_left <= VAR_BIN_OP_EQ_uxn_c_l75_c11_3d4c_left;
     BIN_OP_EQ_uxn_c_l75_c11_3d4c_right <= VAR_BIN_OP_EQ_uxn_c_l75_c11_3d4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c11_3d4c_return_output := BIN_OP_EQ_uxn_c_l75_c11_3d4c_return_output;

     -- BIN_OP_EQ[uxn_c_l68_c6_d553] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l68_c6_d553_left <= VAR_BIN_OP_EQ_uxn_c_l68_c6_d553_left;
     BIN_OP_EQ_uxn_c_l68_c6_d553_right <= VAR_BIN_OP_EQ_uxn_c_l68_c6_d553_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l68_c6_d553_return_output := BIN_OP_EQ_uxn_c_l68_c6_d553_return_output;

     -- BIN_OP_PLUS[uxn_c_l105_c3_0b74] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l105_c3_0b74_left <= VAR_BIN_OP_PLUS_uxn_c_l105_c3_0b74_left;
     BIN_OP_PLUS_uxn_c_l105_c3_0b74_right <= VAR_BIN_OP_PLUS_uxn_c_l105_c3_0b74_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l105_c3_0b74_return_output := BIN_OP_PLUS_uxn_c_l105_c3_0b74_return_output;

     -- BIN_OP_PLUS[uxn_c_l85_c3_494d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l85_c3_494d_left <= VAR_BIN_OP_PLUS_uxn_c_l85_c3_494d_left;
     BIN_OP_PLUS_uxn_c_l85_c3_494d_right <= VAR_BIN_OP_PLUS_uxn_c_l85_c3_494d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l85_c3_494d_return_output := BIN_OP_PLUS_uxn_c_l85_c3_494d_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_d553_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_d553_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_82bc_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_d553_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_82bc_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_d553_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_82bc_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_d553_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_82bc_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_d553_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_82bc_cond := VAR_BIN_OP_EQ_uxn_c_l68_c6_d553_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_3d4c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_3d4c_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_2d23_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_3d4c_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_2d23_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_3d4c_return_output;
     VAR_ins_MUX_uxn_c_l75_c7_2d23_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_3d4c_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c7_2d23_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_3d4c_return_output;
     VAR_pc_MUX_uxn_c_l75_c7_2d23_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_3d4c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_422c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_422c_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_83d9_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_422c_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_83d9_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_422c_return_output;
     VAR_ins_MUX_uxn_c_l83_c7_83d9_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_422c_return_output;
     VAR_is_ins_done_MUX_uxn_c_l83_c7_83d9_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_422c_return_output;
     VAR_pc_MUX_uxn_c_l83_c7_83d9_cond := VAR_BIN_OP_EQ_uxn_c_l83_c11_422c_return_output;
     VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_phase := VAR_BIN_OP_MINUS_uxn_c_l89_c43_39e0_return_output;
     VAR_step_cpu_phase_uxn_c_l105_c3_97f7 := resize(VAR_BIN_OP_PLUS_uxn_c_l105_c3_0b74_return_output, 8);
     VAR_pc_uxn_c_l85_c3_2550 := resize(VAR_BIN_OP_PLUS_uxn_c_l85_c3_494d_return_output, 16);
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_82bc_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l68_c2_82bc_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_2d23_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8f2f_uxn_c_l75_c7_2d23_return_output;
     VAR_pc_MUX_uxn_c_l83_c7_83d9_iftrue := VAR_pc_uxn_c_l85_c3_2550;
     VAR_printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg1 := resize(VAR_pc_uxn_c_l85_c3_2550, 32);
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_99de_iffalse := VAR_step_cpu_phase_uxn_c_l105_c3_97f7;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l75_c7_2d23] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_return_output;

     -- ins_MUX[uxn_c_l83_c7_83d9] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l83_c7_83d9_cond <= VAR_ins_MUX_uxn_c_l83_c7_83d9_cond;
     ins_MUX_uxn_c_l83_c7_83d9_iftrue <= VAR_ins_MUX_uxn_c_l83_c7_83d9_iftrue;
     ins_MUX_uxn_c_l83_c7_83d9_iffalse <= VAR_ins_MUX_uxn_c_l83_c7_83d9_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l83_c7_83d9_return_output := ins_MUX_uxn_c_l83_c7_83d9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l68_c1_874c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_2d23_return_output;
     VAR_printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l68_c1_874c_return_output;
     VAR_ins_MUX_uxn_c_l75_c7_2d23_iffalse := VAR_ins_MUX_uxn_c_l83_c7_83d9_return_output;
     -- printf_uxn_c_l73_c3_d92f[uxn_c_l73_c3_d92f] LATENCY=0
     -- Clock enable
     printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_CLOCK_ENABLE <= VAR_printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_arg0 <= VAR_printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_arg0;
     printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_arg1 <= VAR_printf_uxn_c_l73_c3_d92f_uxn_c_l73_c3_d92f_arg1;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l83_c7_83d9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l75_c1_2c21] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_return_output;

     -- ins_MUX[uxn_c_l75_c7_2d23] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l75_c7_2d23_cond <= VAR_ins_MUX_uxn_c_l75_c7_2d23_cond;
     ins_MUX_uxn_c_l75_c7_2d23_iftrue <= VAR_ins_MUX_uxn_c_l75_c7_2d23_iftrue;
     ins_MUX_uxn_c_l75_c7_2d23_iffalse <= VAR_ins_MUX_uxn_c_l75_c7_2d23_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l75_c7_2d23_return_output := ins_MUX_uxn_c_l75_c7_2d23_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l83_c7_83d9_return_output;
     VAR_printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_2c21_return_output;
     VAR_ins_MUX_uxn_c_l68_c2_82bc_iffalse := VAR_ins_MUX_uxn_c_l75_c7_2d23_return_output;
     -- printf_uxn_c_l81_c3_e589[uxn_c_l81_c3_e589] LATENCY=0
     -- Clock enable
     printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_CLOCK_ENABLE <= VAR_printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg0 <= VAR_printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg0;
     printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg1 <= VAR_printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg1;
     printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg2 <= VAR_printf_uxn_c_l81_c3_e589_uxn_c_l81_c3_e589_arg2;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l83_c1_2d21] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l88_c1_488b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_return_output;

     -- ins_MUX[uxn_c_l68_c2_82bc] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l68_c2_82bc_cond <= VAR_ins_MUX_uxn_c_l68_c2_82bc_cond;
     ins_MUX_uxn_c_l68_c2_82bc_iftrue <= VAR_ins_MUX_uxn_c_l68_c2_82bc_iftrue;
     ins_MUX_uxn_c_l68_c2_82bc_iffalse <= VAR_ins_MUX_uxn_c_l68_c2_82bc_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l68_c2_82bc_return_output := ins_MUX_uxn_c_l68_c2_82bc_return_output;

     -- Submodule level 4
     VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_return_output;
     VAR_printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_488b_return_output;
     VAR_printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l83_c1_2d21_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l68_c2_82bc_return_output;
     -- printf_uxn_c_l86_c3_4624[uxn_c_l86_c3_4624] LATENCY=0
     -- Clock enable
     printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_CLOCK_ENABLE <= VAR_printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg0 <= VAR_printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg0;
     printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg1 <= VAR_printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg1;
     printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg2 <= VAR_printf_uxn_c_l86_c3_4624_uxn_c_l86_c3_4624_arg2;
     -- Outputs

     -- eval_opcode_phased[uxn_c_l89_c24_3bcf] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l89_c24_3bcf_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l89_c24_3bcf_phase <= VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_phase;
     eval_opcode_phased_uxn_c_l89_c24_3bcf_ins <= VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_ins;
     eval_opcode_phased_uxn_c_l89_c24_3bcf_pc <= VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_pc;
     eval_opcode_phased_uxn_c_l89_c24_3bcf_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_previous_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output := eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output;

     -- Submodule level 5
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_83d9_iffalse := VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output;
     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d[uxn_c_l94_c31_e4a6] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l94_c31_e4a6_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l98_c17_abe4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l98_c17_abe4_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d[uxn_c_l90_c43_fe50] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l90_c43_fe50_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output.pc;

     -- eval_opcode_result_MUX[uxn_c_l83_c7_83d9] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l83_c7_83d9_cond <= VAR_eval_opcode_result_MUX_uxn_c_l83_c7_83d9_cond;
     eval_opcode_result_MUX_uxn_c_l83_c7_83d9_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l83_c7_83d9_iftrue;
     eval_opcode_result_MUX_uxn_c_l83_c7_83d9_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l83_c7_83d9_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l83_c7_83d9_return_output := eval_opcode_result_MUX_uxn_c_l83_c7_83d9_return_output;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d[uxn_c_l93_c33_9775] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l93_c33_9775_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output.ram_addr;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l92_c34_3dd0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l92_c34_3dd0_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l90_c8_73bc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l90_c8_73bc_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l95_c35_8c00] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l95_c35_8c00_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output.is_vram_write;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l96_c34_140d] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l96_c34_140d_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d[uxn_c_l91_c33_373b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l91_c33_373b_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output.is_ram_read;

     -- CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d[uxn_c_l97_c32_4061] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l97_c32_4061_return_output := VAR_eval_opcode_phased_uxn_c_l89_c24_3bcf_return_output.vram_value;

     -- Submodule level 6
     VAR_MUX_uxn_c_l90_c8_8abc_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l90_c43_fe50_return_output;
     VAR_is_ins_done_MUX_uxn_c_l83_c7_83d9_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l98_c17_abe4_return_output;
     VAR_MUX_uxn_c_l90_c8_8abc_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l90_c8_73bc_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_2d23_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l83_c7_83d9_return_output;
     -- is_ins_done_MUX[uxn_c_l83_c7_83d9] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l83_c7_83d9_cond <= VAR_is_ins_done_MUX_uxn_c_l83_c7_83d9_cond;
     is_ins_done_MUX_uxn_c_l83_c7_83d9_iftrue <= VAR_is_ins_done_MUX_uxn_c_l83_c7_83d9_iftrue;
     is_ins_done_MUX_uxn_c_l83_c7_83d9_iffalse <= VAR_is_ins_done_MUX_uxn_c_l83_c7_83d9_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l83_c7_83d9_return_output := is_ins_done_MUX_uxn_c_l83_c7_83d9_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70[uxn_c_l83_c7_83d9] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l83_c7_83d9_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l91_c33_373b_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l92_c34_3dd0_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l93_c33_9775_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l94_c31_e4a6_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l95_c35_8c00_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l96_c34_140d_return_output,
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l97_c32_4061_return_output);

     -- MUX[uxn_c_l90_c8_8abc] LATENCY=0
     -- Inputs
     MUX_uxn_c_l90_c8_8abc_cond <= VAR_MUX_uxn_c_l90_c8_8abc_cond;
     MUX_uxn_c_l90_c8_8abc_iftrue <= VAR_MUX_uxn_c_l90_c8_8abc_iftrue;
     MUX_uxn_c_l90_c8_8abc_iffalse <= VAR_MUX_uxn_c_l90_c8_8abc_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l90_c8_8abc_return_output := MUX_uxn_c_l90_c8_8abc_return_output;

     -- eval_opcode_result_MUX[uxn_c_l75_c7_2d23] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l75_c7_2d23_cond <= VAR_eval_opcode_result_MUX_uxn_c_l75_c7_2d23_cond;
     eval_opcode_result_MUX_uxn_c_l75_c7_2d23_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l75_c7_2d23_iftrue;
     eval_opcode_result_MUX_uxn_c_l75_c7_2d23_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l75_c7_2d23_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l75_c7_2d23_return_output := eval_opcode_result_MUX_uxn_c_l75_c7_2d23_return_output;

     -- Submodule level 7
     VAR_pc_uxn_c_l90_c3_43e4 := VAR_MUX_uxn_c_l90_c8_8abc_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_83d9_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_9d70_uxn_c_l83_c7_83d9_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_82bc_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l75_c7_2d23_return_output;
     VAR_is_ins_done_MUX_uxn_c_l75_c7_2d23_iffalse := VAR_is_ins_done_MUX_uxn_c_l83_c7_83d9_return_output;
     VAR_pc_MUX_uxn_c_l83_c7_83d9_iffalse := VAR_pc_uxn_c_l90_c3_43e4;
     VAR_printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg1 := resize(VAR_pc_uxn_c_l90_c3_43e4, 32);
     -- pc_MUX[uxn_c_l83_c7_83d9] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l83_c7_83d9_cond <= VAR_pc_MUX_uxn_c_l83_c7_83d9_cond;
     pc_MUX_uxn_c_l83_c7_83d9_iftrue <= VAR_pc_MUX_uxn_c_l83_c7_83d9_iftrue;
     pc_MUX_uxn_c_l83_c7_83d9_iffalse <= VAR_pc_MUX_uxn_c_l83_c7_83d9_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l83_c7_83d9_return_output := pc_MUX_uxn_c_l83_c7_83d9_return_output;

     -- is_ins_done_MUX[uxn_c_l75_c7_2d23] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l75_c7_2d23_cond <= VAR_is_ins_done_MUX_uxn_c_l75_c7_2d23_cond;
     is_ins_done_MUX_uxn_c_l75_c7_2d23_iftrue <= VAR_is_ins_done_MUX_uxn_c_l75_c7_2d23_iftrue;
     is_ins_done_MUX_uxn_c_l75_c7_2d23_iffalse <= VAR_is_ins_done_MUX_uxn_c_l75_c7_2d23_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l75_c7_2d23_return_output := is_ins_done_MUX_uxn_c_l75_c7_2d23_return_output;

     -- printf_uxn_c_l99_c3_2384[uxn_c_l99_c3_2384] LATENCY=0
     -- Clock enable
     printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_CLOCK_ENABLE <= VAR_printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg0 <= VAR_printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg0;
     printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg1 <= VAR_printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg1;
     printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg2 <= VAR_printf_uxn_c_l99_c3_2384_uxn_c_l99_c3_2384_arg2;
     -- Outputs

     -- cpu_step_result_MUX[uxn_c_l83_c7_83d9] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l83_c7_83d9_cond <= VAR_cpu_step_result_MUX_uxn_c_l83_c7_83d9_cond;
     cpu_step_result_MUX_uxn_c_l83_c7_83d9_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l83_c7_83d9_iftrue;
     cpu_step_result_MUX_uxn_c_l83_c7_83d9_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l83_c7_83d9_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l83_c7_83d9_return_output := cpu_step_result_MUX_uxn_c_l83_c7_83d9_return_output;

     -- eval_opcode_result_MUX[uxn_c_l68_c2_82bc] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l68_c2_82bc_cond <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_82bc_cond;
     eval_opcode_result_MUX_uxn_c_l68_c2_82bc_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_82bc_iftrue;
     eval_opcode_result_MUX_uxn_c_l68_c2_82bc_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l68_c2_82bc_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l68_c2_82bc_return_output := eval_opcode_result_MUX_uxn_c_l68_c2_82bc_return_output;

     -- Submodule level 8
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_2d23_iffalse := VAR_cpu_step_result_MUX_uxn_c_l83_c7_83d9_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l68_c2_82bc_return_output;
     VAR_is_ins_done_MUX_uxn_c_l68_c2_82bc_iffalse := VAR_is_ins_done_MUX_uxn_c_l75_c7_2d23_return_output;
     VAR_pc_MUX_uxn_c_l75_c7_2d23_iffalse := VAR_pc_MUX_uxn_c_l83_c7_83d9_return_output;
     -- pc_MUX[uxn_c_l75_c7_2d23] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l75_c7_2d23_cond <= VAR_pc_MUX_uxn_c_l75_c7_2d23_cond;
     pc_MUX_uxn_c_l75_c7_2d23_iftrue <= VAR_pc_MUX_uxn_c_l75_c7_2d23_iftrue;
     pc_MUX_uxn_c_l75_c7_2d23_iffalse <= VAR_pc_MUX_uxn_c_l75_c7_2d23_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l75_c7_2d23_return_output := pc_MUX_uxn_c_l75_c7_2d23_return_output;

     -- cpu_step_result_MUX[uxn_c_l75_c7_2d23] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l75_c7_2d23_cond <= VAR_cpu_step_result_MUX_uxn_c_l75_c7_2d23_cond;
     cpu_step_result_MUX_uxn_c_l75_c7_2d23_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l75_c7_2d23_iftrue;
     cpu_step_result_MUX_uxn_c_l75_c7_2d23_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l75_c7_2d23_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l75_c7_2d23_return_output := cpu_step_result_MUX_uxn_c_l75_c7_2d23_return_output;

     -- is_ins_done_MUX[uxn_c_l68_c2_82bc] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l68_c2_82bc_cond <= VAR_is_ins_done_MUX_uxn_c_l68_c2_82bc_cond;
     is_ins_done_MUX_uxn_c_l68_c2_82bc_iftrue <= VAR_is_ins_done_MUX_uxn_c_l68_c2_82bc_iftrue;
     is_ins_done_MUX_uxn_c_l68_c2_82bc_iffalse <= VAR_is_ins_done_MUX_uxn_c_l68_c2_82bc_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l68_c2_82bc_return_output := is_ins_done_MUX_uxn_c_l68_c2_82bc_return_output;

     -- Submodule level 9
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_82bc_iffalse := VAR_cpu_step_result_MUX_uxn_c_l75_c7_2d23_return_output;
     VAR_BIN_OP_EQ_uxn_c_l102_c6_102e_left := VAR_is_ins_done_MUX_uxn_c_l68_c2_82bc_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l68_c2_82bc_return_output;
     VAR_pc_MUX_uxn_c_l68_c2_82bc_iffalse := VAR_pc_MUX_uxn_c_l75_c7_2d23_return_output;
     -- pc_MUX[uxn_c_l68_c2_82bc] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l68_c2_82bc_cond <= VAR_pc_MUX_uxn_c_l68_c2_82bc_cond;
     pc_MUX_uxn_c_l68_c2_82bc_iftrue <= VAR_pc_MUX_uxn_c_l68_c2_82bc_iftrue;
     pc_MUX_uxn_c_l68_c2_82bc_iffalse <= VAR_pc_MUX_uxn_c_l68_c2_82bc_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l68_c2_82bc_return_output := pc_MUX_uxn_c_l68_c2_82bc_return_output;

     -- BIN_OP_EQ[uxn_c_l102_c6_102e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l102_c6_102e_left <= VAR_BIN_OP_EQ_uxn_c_l102_c6_102e_left;
     BIN_OP_EQ_uxn_c_l102_c6_102e_right <= VAR_BIN_OP_EQ_uxn_c_l102_c6_102e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l102_c6_102e_return_output := BIN_OP_EQ_uxn_c_l102_c6_102e_return_output;

     -- cpu_step_result_MUX[uxn_c_l68_c2_82bc] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l68_c2_82bc_cond <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_82bc_cond;
     cpu_step_result_MUX_uxn_c_l68_c2_82bc_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_82bc_iftrue;
     cpu_step_result_MUX_uxn_c_l68_c2_82bc_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l68_c2_82bc_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l68_c2_82bc_return_output := cpu_step_result_MUX_uxn_c_l68_c2_82bc_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_99de_cond := VAR_BIN_OP_EQ_uxn_c_l102_c6_102e_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l68_c2_82bc_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l68_c2_82bc_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l68_c2_82bc_return_output;
     -- step_cpu_phase_MUX[uxn_c_l102_c2_99de] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l102_c2_99de_cond <= VAR_step_cpu_phase_MUX_uxn_c_l102_c2_99de_cond;
     step_cpu_phase_MUX_uxn_c_l102_c2_99de_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l102_c2_99de_iftrue;
     step_cpu_phase_MUX_uxn_c_l102_c2_99de_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l102_c2_99de_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l102_c2_99de_return_output := step_cpu_phase_MUX_uxn_c_l102_c2_99de_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l102_c2_99de_return_output;
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
