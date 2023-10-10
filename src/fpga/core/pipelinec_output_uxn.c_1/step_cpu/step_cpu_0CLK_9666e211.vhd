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
entity step_cpu_0CLK_9666e211 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ram_read_value : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_9666e211;
architecture arch of step_cpu_0CLK_9666e211 is
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
-- BIN_OP_EQ[uxn_c_l67_c6_85f4]
signal BIN_OP_EQ_uxn_c_l67_c6_85f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l67_c6_85f4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l67_c6_85f4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l67_c1_5749]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l73_c7_3232]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l67_c2_7b89]
signal pc_MUX_uxn_c_l67_c2_7b89_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l67_c2_7b89_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l67_c2_7b89_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l67_c2_7b89_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l67_c2_7b89]
signal ins_MUX_uxn_c_l67_c2_7b89_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l67_c2_7b89_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l67_c2_7b89_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l67_c2_7b89_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l67_c2_7b89]
signal is_ins_done_MUX_uxn_c_l67_c2_7b89_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l67_c2_7b89_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l67_c2_7b89_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l67_c2_7b89_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l67_c2_7b89]
signal cpu_step_result_MUX_uxn_c_l67_c2_7b89_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l67_c2_7b89_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l67_c2_7b89_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l67_c2_7b89_return_output : cpu_step_result_t;

-- eval_opcode_result_MUX[uxn_c_l67_c2_7b89]
signal eval_opcode_result_MUX_uxn_c_l67_c2_7b89_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l67_c2_7b89_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l67_c2_7b89_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l67_c2_7b89_return_output : eval_opcode_result_t;

-- printf_uxn_c_l71_c3_d170[uxn_c_l71_c3_d170]
signal printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l73_c11_b4b0]
signal BIN_OP_EQ_uxn_c_l73_c11_b4b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l73_c11_b4b0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l73_c11_b4b0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l73_c1_2e60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l77_c7_4588]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l73_c7_3232]
signal pc_MUX_uxn_c_l73_c7_3232_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l73_c7_3232_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l73_c7_3232_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l73_c7_3232_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l73_c7_3232]
signal ins_MUX_uxn_c_l73_c7_3232_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l73_c7_3232_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l73_c7_3232_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l73_c7_3232_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l73_c7_3232]
signal is_ins_done_MUX_uxn_c_l73_c7_3232_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l73_c7_3232_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l73_c7_3232_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l73_c7_3232_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l73_c7_3232]
signal cpu_step_result_MUX_uxn_c_l73_c7_3232_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l73_c7_3232_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l73_c7_3232_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l73_c7_3232_return_output : cpu_step_result_t;

-- eval_opcode_result_MUX[uxn_c_l73_c7_3232]
signal eval_opcode_result_MUX_uxn_c_l73_c7_3232_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l73_c7_3232_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l73_c7_3232_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l73_c7_3232_return_output : eval_opcode_result_t;

-- printf_uxn_c_l75_c3_dfee[uxn_c_l75_c3_dfee]
signal printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l77_c11_6bc6]
signal BIN_OP_EQ_uxn_c_l77_c11_6bc6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l77_c11_6bc6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l77_c11_6bc6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l77_c1_5eb6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c1_9b2d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l77_c7_4588]
signal pc_MUX_uxn_c_l77_c7_4588_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l77_c7_4588_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l77_c7_4588_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l77_c7_4588_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l77_c7_4588]
signal ins_MUX_uxn_c_l77_c7_4588_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l77_c7_4588_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l77_c7_4588_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l77_c7_4588_return_output : unsigned(7 downto 0);

-- is_ins_done_MUX[uxn_c_l77_c7_4588]
signal is_ins_done_MUX_uxn_c_l77_c7_4588_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_4588_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_4588_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l77_c7_4588_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l77_c7_4588]
signal cpu_step_result_MUX_uxn_c_l77_c7_4588_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l77_c7_4588_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l77_c7_4588_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l77_c7_4588_return_output : cpu_step_result_t;

-- eval_opcode_result_MUX[uxn_c_l77_c7_4588]
signal eval_opcode_result_MUX_uxn_c_l77_c7_4588_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l77_c7_4588_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l77_c7_4588_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l77_c7_4588_return_output : eval_opcode_result_t;

-- BIN_OP_PLUS[uxn_c_l79_c3_74f8]
signal BIN_OP_PLUS_uxn_c_l79_c3_74f8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l79_c3_74f8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l79_c3_74f8_return_output : unsigned(16 downto 0);

-- printf_uxn_c_l80_c3_4e81[uxn_c_l80_c3_4e81]
signal printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg2 : unsigned(31 downto 0);

-- BIN_OP_MINUS[uxn_c_l83_c43_0eb2]
signal BIN_OP_MINUS_uxn_c_l83_c43_0eb2_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l83_c43_0eb2_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l83_c43_0eb2_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l83_c24_26bf]
signal eval_opcode_phased_uxn_c_l83_c24_26bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l83_c24_26bf_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l83_c24_26bf_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l83_c24_26bf_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l83_c24_26bf_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l83_c24_26bf_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l84_c8_1aa8]
signal MUX_uxn_c_l84_c8_1aa8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l84_c8_1aa8_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l84_c8_1aa8_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l84_c8_1aa8_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l92_c3_221b[uxn_c_l92_c3_221b]
signal printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l95_c6_0aad]
signal BIN_OP_EQ_uxn_c_l95_c6_0aad_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l95_c6_0aad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l95_c6_0aad_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l95_c2_73ab]
signal step_cpu_phase_MUX_uxn_c_l95_c2_73ab_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l95_c2_73ab_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l95_c2_73ab_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l95_c2_73ab_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l98_c3_5800]
signal BIN_OP_PLUS_uxn_c_l98_c3_5800_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l98_c3_5800_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l98_c3_5800_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_01a8( ref_toks_0 : unsigned;
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
      base.ram_value := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.vram_address := ref_toks_4;
      base.vram_value := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_c_l67_c6_85f4
BIN_OP_EQ_uxn_c_l67_c6_85f4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l67_c6_85f4_left,
BIN_OP_EQ_uxn_c_l67_c6_85f4_right,
BIN_OP_EQ_uxn_c_l67_c6_85f4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749
TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232
FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_return_output);

-- pc_MUX_uxn_c_l67_c2_7b89
pc_MUX_uxn_c_l67_c2_7b89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l67_c2_7b89_cond,
pc_MUX_uxn_c_l67_c2_7b89_iftrue,
pc_MUX_uxn_c_l67_c2_7b89_iffalse,
pc_MUX_uxn_c_l67_c2_7b89_return_output);

-- ins_MUX_uxn_c_l67_c2_7b89
ins_MUX_uxn_c_l67_c2_7b89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l67_c2_7b89_cond,
ins_MUX_uxn_c_l67_c2_7b89_iftrue,
ins_MUX_uxn_c_l67_c2_7b89_iffalse,
ins_MUX_uxn_c_l67_c2_7b89_return_output);

-- is_ins_done_MUX_uxn_c_l67_c2_7b89
is_ins_done_MUX_uxn_c_l67_c2_7b89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l67_c2_7b89_cond,
is_ins_done_MUX_uxn_c_l67_c2_7b89_iftrue,
is_ins_done_MUX_uxn_c_l67_c2_7b89_iffalse,
is_ins_done_MUX_uxn_c_l67_c2_7b89_return_output);

-- cpu_step_result_MUX_uxn_c_l67_c2_7b89
cpu_step_result_MUX_uxn_c_l67_c2_7b89 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l67_c2_7b89_cond,
cpu_step_result_MUX_uxn_c_l67_c2_7b89_iftrue,
cpu_step_result_MUX_uxn_c_l67_c2_7b89_iffalse,
cpu_step_result_MUX_uxn_c_l67_c2_7b89_return_output);

-- eval_opcode_result_MUX_uxn_c_l67_c2_7b89
eval_opcode_result_MUX_uxn_c_l67_c2_7b89 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l67_c2_7b89_cond,
eval_opcode_result_MUX_uxn_c_l67_c2_7b89_iftrue,
eval_opcode_result_MUX_uxn_c_l67_c2_7b89_iffalse,
eval_opcode_result_MUX_uxn_c_l67_c2_7b89_return_output);

-- printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170
printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170 : entity work.printf_uxn_c_l71_c3_d170_0CLK_de264c78 port map (
printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_CLOCK_ENABLE,
printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_arg0,
printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_arg1);

-- BIN_OP_EQ_uxn_c_l73_c11_b4b0
BIN_OP_EQ_uxn_c_l73_c11_b4b0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l73_c11_b4b0_left,
BIN_OP_EQ_uxn_c_l73_c11_b4b0_right,
BIN_OP_EQ_uxn_c_l73_c11_b4b0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60
TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_return_output);

-- pc_MUX_uxn_c_l73_c7_3232
pc_MUX_uxn_c_l73_c7_3232 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l73_c7_3232_cond,
pc_MUX_uxn_c_l73_c7_3232_iftrue,
pc_MUX_uxn_c_l73_c7_3232_iffalse,
pc_MUX_uxn_c_l73_c7_3232_return_output);

-- ins_MUX_uxn_c_l73_c7_3232
ins_MUX_uxn_c_l73_c7_3232 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l73_c7_3232_cond,
ins_MUX_uxn_c_l73_c7_3232_iftrue,
ins_MUX_uxn_c_l73_c7_3232_iffalse,
ins_MUX_uxn_c_l73_c7_3232_return_output);

-- is_ins_done_MUX_uxn_c_l73_c7_3232
is_ins_done_MUX_uxn_c_l73_c7_3232 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l73_c7_3232_cond,
is_ins_done_MUX_uxn_c_l73_c7_3232_iftrue,
is_ins_done_MUX_uxn_c_l73_c7_3232_iffalse,
is_ins_done_MUX_uxn_c_l73_c7_3232_return_output);

-- cpu_step_result_MUX_uxn_c_l73_c7_3232
cpu_step_result_MUX_uxn_c_l73_c7_3232 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l73_c7_3232_cond,
cpu_step_result_MUX_uxn_c_l73_c7_3232_iftrue,
cpu_step_result_MUX_uxn_c_l73_c7_3232_iffalse,
cpu_step_result_MUX_uxn_c_l73_c7_3232_return_output);

-- eval_opcode_result_MUX_uxn_c_l73_c7_3232
eval_opcode_result_MUX_uxn_c_l73_c7_3232 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l73_c7_3232_cond,
eval_opcode_result_MUX_uxn_c_l73_c7_3232_iftrue,
eval_opcode_result_MUX_uxn_c_l73_c7_3232_iffalse,
eval_opcode_result_MUX_uxn_c_l73_c7_3232_return_output);

-- printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee
printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee : entity work.printf_uxn_c_l75_c3_dfee_0CLK_de264c78 port map (
printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_CLOCK_ENABLE,
printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg0,
printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg1,
printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg2);

-- BIN_OP_EQ_uxn_c_l77_c11_6bc6
BIN_OP_EQ_uxn_c_l77_c11_6bc6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l77_c11_6bc6_left,
BIN_OP_EQ_uxn_c_l77_c11_6bc6_right,
BIN_OP_EQ_uxn_c_l77_c11_6bc6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6
TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_return_output);

-- pc_MUX_uxn_c_l77_c7_4588
pc_MUX_uxn_c_l77_c7_4588 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l77_c7_4588_cond,
pc_MUX_uxn_c_l77_c7_4588_iftrue,
pc_MUX_uxn_c_l77_c7_4588_iffalse,
pc_MUX_uxn_c_l77_c7_4588_return_output);

-- ins_MUX_uxn_c_l77_c7_4588
ins_MUX_uxn_c_l77_c7_4588 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l77_c7_4588_cond,
ins_MUX_uxn_c_l77_c7_4588_iftrue,
ins_MUX_uxn_c_l77_c7_4588_iffalse,
ins_MUX_uxn_c_l77_c7_4588_return_output);

-- is_ins_done_MUX_uxn_c_l77_c7_4588
is_ins_done_MUX_uxn_c_l77_c7_4588 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l77_c7_4588_cond,
is_ins_done_MUX_uxn_c_l77_c7_4588_iftrue,
is_ins_done_MUX_uxn_c_l77_c7_4588_iffalse,
is_ins_done_MUX_uxn_c_l77_c7_4588_return_output);

-- cpu_step_result_MUX_uxn_c_l77_c7_4588
cpu_step_result_MUX_uxn_c_l77_c7_4588 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l77_c7_4588_cond,
cpu_step_result_MUX_uxn_c_l77_c7_4588_iftrue,
cpu_step_result_MUX_uxn_c_l77_c7_4588_iffalse,
cpu_step_result_MUX_uxn_c_l77_c7_4588_return_output);

-- eval_opcode_result_MUX_uxn_c_l77_c7_4588
eval_opcode_result_MUX_uxn_c_l77_c7_4588 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l77_c7_4588_cond,
eval_opcode_result_MUX_uxn_c_l77_c7_4588_iftrue,
eval_opcode_result_MUX_uxn_c_l77_c7_4588_iffalse,
eval_opcode_result_MUX_uxn_c_l77_c7_4588_return_output);

-- BIN_OP_PLUS_uxn_c_l79_c3_74f8
BIN_OP_PLUS_uxn_c_l79_c3_74f8 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l79_c3_74f8_left,
BIN_OP_PLUS_uxn_c_l79_c3_74f8_right,
BIN_OP_PLUS_uxn_c_l79_c3_74f8_return_output);

-- printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81
printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81 : entity work.printf_uxn_c_l80_c3_4e81_0CLK_de264c78 port map (
printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_CLOCK_ENABLE,
printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg0,
printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg1,
printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg2);

-- BIN_OP_MINUS_uxn_c_l83_c43_0eb2
BIN_OP_MINUS_uxn_c_l83_c43_0eb2 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l83_c43_0eb2_left,
BIN_OP_MINUS_uxn_c_l83_c43_0eb2_right,
BIN_OP_MINUS_uxn_c_l83_c43_0eb2_return_output);

-- eval_opcode_phased_uxn_c_l83_c24_26bf
eval_opcode_phased_uxn_c_l83_c24_26bf : entity work.eval_opcode_phased_0CLK_1ad9220f port map (
clk,
eval_opcode_phased_uxn_c_l83_c24_26bf_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l83_c24_26bf_phase,
eval_opcode_phased_uxn_c_l83_c24_26bf_ins,
eval_opcode_phased_uxn_c_l83_c24_26bf_pc,
eval_opcode_phased_uxn_c_l83_c24_26bf_previous_ram_read,
eval_opcode_phased_uxn_c_l83_c24_26bf_return_output);

-- MUX_uxn_c_l84_c8_1aa8
MUX_uxn_c_l84_c8_1aa8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l84_c8_1aa8_cond,
MUX_uxn_c_l84_c8_1aa8_iftrue,
MUX_uxn_c_l84_c8_1aa8_iffalse,
MUX_uxn_c_l84_c8_1aa8_return_output);

-- printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b
printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b : entity work.printf_uxn_c_l92_c3_221b_0CLK_de264c78 port map (
printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_CLOCK_ENABLE,
printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg0,
printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg1,
printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg2);

-- BIN_OP_EQ_uxn_c_l95_c6_0aad
BIN_OP_EQ_uxn_c_l95_c6_0aad : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l95_c6_0aad_left,
BIN_OP_EQ_uxn_c_l95_c6_0aad_right,
BIN_OP_EQ_uxn_c_l95_c6_0aad_return_output);

-- step_cpu_phase_MUX_uxn_c_l95_c2_73ab
step_cpu_phase_MUX_uxn_c_l95_c2_73ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l95_c2_73ab_cond,
step_cpu_phase_MUX_uxn_c_l95_c2_73ab_iftrue,
step_cpu_phase_MUX_uxn_c_l95_c2_73ab_iffalse,
step_cpu_phase_MUX_uxn_c_l95_c2_73ab_return_output);

-- BIN_OP_PLUS_uxn_c_l98_c3_5800
BIN_OP_PLUS_uxn_c_l98_c3_5800 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l98_c3_5800_left,
BIN_OP_PLUS_uxn_c_l98_c3_5800_right,
BIN_OP_PLUS_uxn_c_l98_c3_5800_return_output);



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
 BIN_OP_EQ_uxn_c_l67_c6_85f4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_return_output,
 pc_MUX_uxn_c_l67_c2_7b89_return_output,
 ins_MUX_uxn_c_l67_c2_7b89_return_output,
 is_ins_done_MUX_uxn_c_l67_c2_7b89_return_output,
 cpu_step_result_MUX_uxn_c_l67_c2_7b89_return_output,
 eval_opcode_result_MUX_uxn_c_l67_c2_7b89_return_output,
 BIN_OP_EQ_uxn_c_l73_c11_b4b0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_return_output,
 pc_MUX_uxn_c_l73_c7_3232_return_output,
 ins_MUX_uxn_c_l73_c7_3232_return_output,
 is_ins_done_MUX_uxn_c_l73_c7_3232_return_output,
 cpu_step_result_MUX_uxn_c_l73_c7_3232_return_output,
 eval_opcode_result_MUX_uxn_c_l73_c7_3232_return_output,
 BIN_OP_EQ_uxn_c_l77_c11_6bc6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_return_output,
 pc_MUX_uxn_c_l77_c7_4588_return_output,
 ins_MUX_uxn_c_l77_c7_4588_return_output,
 is_ins_done_MUX_uxn_c_l77_c7_4588_return_output,
 cpu_step_result_MUX_uxn_c_l77_c7_4588_return_output,
 eval_opcode_result_MUX_uxn_c_l77_c7_4588_return_output,
 BIN_OP_PLUS_uxn_c_l79_c3_74f8_return_output,
 BIN_OP_MINUS_uxn_c_l83_c43_0eb2_return_output,
 eval_opcode_phased_uxn_c_l83_c24_26bf_return_output,
 MUX_uxn_c_l84_c8_1aa8_return_output,
 BIN_OP_EQ_uxn_c_l95_c6_0aad_return_output,
 step_cpu_phase_MUX_uxn_c_l95_c2_73ab_return_output,
 BIN_OP_PLUS_uxn_c_l98_c3_5800_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_ram_read_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l67_c6_85f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l67_c6_85f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l67_c6_85f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l67_c2_7b89_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l67_c2_7b89_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c7_3232_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l67_c2_7b89_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l67_c2_7b89_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l67_c2_7b89_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l67_c2_7b89_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c7_3232_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l67_c2_7b89_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l67_c2_7b89_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l67_c2_7b89_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l67_c2_7b89_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c7_3232_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l67_c2_7b89_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l67_c2_7b89_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l67_c2_7b89_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a_uxn_c_l67_c2_7b89_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l67_c2_7b89_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l73_c7_3232_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l67_c2_7b89_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l67_c2_7b89_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l67_c2_7b89_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l67_c2_7b89_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c7_3232_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l67_c2_7b89_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l67_c2_7b89_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l73_c11_b4b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l73_c11_b4b0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l73_c11_b4b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c7_3232_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c7_3232_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_4588_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c7_3232_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c7_3232_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c7_3232_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_4588_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c7_3232_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c7_3232_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c7_3232_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_4588_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c7_3232_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l73_c7_3232_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247_uxn_c_l73_c7_3232_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l73_c7_3232_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_4588_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l73_c7_3232_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c7_3232_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c7_3232_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_4588_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c7_3232_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_6bc6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_6bc6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l77_c11_6bc6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_4588_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l79_c3_f75b : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_4588_iffalse : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l84_c3_53ee : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l77_c7_4588_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_4588_iftrue : unsigned(7 downto 0);
 variable VAR_ins_uxn_c_l78_c3_7889 : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_4588_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l77_c7_4588_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_4588_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_4588_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l77_c7_4588_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_4588_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_4588_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_01a8_uxn_c_l77_c7_4588_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l77_c7_4588_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_4588_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_4588_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l77_c7_4588_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l79_c3_74f8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l79_c3_74f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l79_c3_74f8_return_output : unsigned(16 downto 0);
 variable VAR_printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg2 : unsigned(31 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l83_c43_0eb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l83_c43_0eb2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l83_c43_0eb2_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l84_c8_1aa8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l84_c8_1aa8_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l84_c8_1aa8_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l84_c8_b3ed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l84_c43_2a86_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l84_c8_1aa8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l85_c34_e20a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l86_c33_207d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l87_c31_7b0f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l88_c35_9abe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l89_c34_65cb_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l90_c32_7ef6_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l91_c17_186a_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l95_c6_0aad_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l95_c6_0aad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l95_c6_0aad_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_73ab_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l96_c3_a57f : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_73ab_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l98_c3_91fc : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_73ab_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l95_c2_73ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l98_c3_5800_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l98_c3_5800_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l98_c3_5800_return_output : unsigned(8 downto 0);
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
     VAR_step_cpu_phase_uxn_c_l96_c3_a57f := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_73ab_iftrue := VAR_step_cpu_phase_uxn_c_l96_c3_a57f;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l83_c43_0eb2_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l79_c3_74f8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l73_c11_b4b0_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l98_c3_5800_right := to_unsigned(1, 1);
     VAR_is_ins_done_MUX_uxn_c_l67_c2_7b89_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l77_c11_6bc6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l67_c6_85f4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l95_c6_0aad_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ram_read_value := ram_read_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_iftrue := VAR_CLOCK_ENABLE;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_4588_iftrue := cpu_step_result;
     VAR_eval_opcode_result_MUX_uxn_c_l67_c2_7b89_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l73_c7_3232_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_4588_iftrue := eval_opcode_result;
     VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_ins := ins;
     VAR_ins_MUX_uxn_c_l67_c2_7b89_iftrue := ins;
     VAR_ins_MUX_uxn_c_l73_c7_3232_iftrue := ins;
     VAR_ins_MUX_uxn_c_l77_c7_4588_iffalse := ins;
     VAR_printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg2 := resize(ins, 32);
     VAR_printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg2 := resize(ins, 32);
     VAR_is_ins_done_MUX_uxn_c_l73_c7_3232_iftrue := is_ins_done;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_4588_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l79_c3_74f8_left := pc;
     VAR_MUX_uxn_c_l84_c8_1aa8_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_pc := pc;
     VAR_pc_MUX_uxn_c_l67_c2_7b89_iftrue := pc;
     VAR_pc_MUX_uxn_c_l73_c7_3232_iftrue := pc;
     VAR_printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_arg1 := resize(pc, 32);
     VAR_printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg1 := resize(pc, 32);
     VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_previous_ram_read := VAR_ram_read_value;
     VAR_ins_uxn_c_l78_c3_7889 := VAR_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l67_c6_85f4_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l73_c11_b4b0_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l77_c11_6bc6_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l83_c43_0eb2_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l98_c3_5800_left := step_cpu_phase;
     VAR_printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg0 := resize(step_cpu_phase, 32);
     VAR_ins_MUX_uxn_c_l77_c7_4588_iftrue := VAR_ins_uxn_c_l78_c3_7889;
     VAR_printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg2 := resize(VAR_ins_uxn_c_l78_c3_7889, 32);
     -- BIN_OP_MINUS[uxn_c_l83_c43_0eb2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l83_c43_0eb2_left <= VAR_BIN_OP_MINUS_uxn_c_l83_c43_0eb2_left;
     BIN_OP_MINUS_uxn_c_l83_c43_0eb2_right <= VAR_BIN_OP_MINUS_uxn_c_l83_c43_0eb2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l83_c43_0eb2_return_output := BIN_OP_MINUS_uxn_c_l83_c43_0eb2_return_output;

     -- BIN_OP_EQ[uxn_c_l73_c11_b4b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l73_c11_b4b0_left <= VAR_BIN_OP_EQ_uxn_c_l73_c11_b4b0_left;
     BIN_OP_EQ_uxn_c_l73_c11_b4b0_right <= VAR_BIN_OP_EQ_uxn_c_l73_c11_b4b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l73_c11_b4b0_return_output := BIN_OP_EQ_uxn_c_l73_c11_b4b0_return_output;

     -- BIN_OP_PLUS[uxn_c_l98_c3_5800] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l98_c3_5800_left <= VAR_BIN_OP_PLUS_uxn_c_l98_c3_5800_left;
     BIN_OP_PLUS_uxn_c_l98_c3_5800_right <= VAR_BIN_OP_PLUS_uxn_c_l98_c3_5800_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l98_c3_5800_return_output := BIN_OP_PLUS_uxn_c_l98_c3_5800_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a[uxn_c_l67_c2_7b89] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a_uxn_c_l67_c2_7b89_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a(
     cpu_step_result,
     pc,
     to_unsigned(0, 1));

     -- BIN_OP_PLUS[uxn_c_l79_c3_74f8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l79_c3_74f8_left <= VAR_BIN_OP_PLUS_uxn_c_l79_c3_74f8_left;
     BIN_OP_PLUS_uxn_c_l79_c3_74f8_right <= VAR_BIN_OP_PLUS_uxn_c_l79_c3_74f8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l79_c3_74f8_return_output := BIN_OP_PLUS_uxn_c_l79_c3_74f8_return_output;

     -- cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247[uxn_c_l73_c7_3232] LATENCY=0
     VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247_uxn_c_l73_c7_3232_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247(
     cpu_step_result,
     pc);

     -- BIN_OP_EQ[uxn_c_l77_c11_6bc6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l77_c11_6bc6_left <= VAR_BIN_OP_EQ_uxn_c_l77_c11_6bc6_left;
     BIN_OP_EQ_uxn_c_l77_c11_6bc6_right <= VAR_BIN_OP_EQ_uxn_c_l77_c11_6bc6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l77_c11_6bc6_return_output := BIN_OP_EQ_uxn_c_l77_c11_6bc6_return_output;

     -- BIN_OP_EQ[uxn_c_l67_c6_85f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l67_c6_85f4_left <= VAR_BIN_OP_EQ_uxn_c_l67_c6_85f4_left;
     BIN_OP_EQ_uxn_c_l67_c6_85f4_right <= VAR_BIN_OP_EQ_uxn_c_l67_c6_85f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l67_c6_85f4_return_output := BIN_OP_EQ_uxn_c_l67_c6_85f4_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_cond := VAR_BIN_OP_EQ_uxn_c_l67_c6_85f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_cond := VAR_BIN_OP_EQ_uxn_c_l67_c6_85f4_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l67_c2_7b89_cond := VAR_BIN_OP_EQ_uxn_c_l67_c6_85f4_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l67_c2_7b89_cond := VAR_BIN_OP_EQ_uxn_c_l67_c6_85f4_return_output;
     VAR_ins_MUX_uxn_c_l67_c2_7b89_cond := VAR_BIN_OP_EQ_uxn_c_l67_c6_85f4_return_output;
     VAR_is_ins_done_MUX_uxn_c_l67_c2_7b89_cond := VAR_BIN_OP_EQ_uxn_c_l67_c6_85f4_return_output;
     VAR_pc_MUX_uxn_c_l67_c2_7b89_cond := VAR_BIN_OP_EQ_uxn_c_l67_c6_85f4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_b4b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_b4b0_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l73_c7_3232_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_b4b0_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l73_c7_3232_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_b4b0_return_output;
     VAR_ins_MUX_uxn_c_l73_c7_3232_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_b4b0_return_output;
     VAR_is_ins_done_MUX_uxn_c_l73_c7_3232_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_b4b0_return_output;
     VAR_pc_MUX_uxn_c_l73_c7_3232_cond := VAR_BIN_OP_EQ_uxn_c_l73_c11_b4b0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_6bc6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_6bc6_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_4588_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_6bc6_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_4588_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_6bc6_return_output;
     VAR_ins_MUX_uxn_c_l77_c7_4588_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_6bc6_return_output;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_4588_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_6bc6_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_4588_cond := VAR_BIN_OP_EQ_uxn_c_l77_c11_6bc6_return_output;
     VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_phase := VAR_BIN_OP_MINUS_uxn_c_l83_c43_0eb2_return_output;
     VAR_pc_uxn_c_l79_c3_f75b := resize(VAR_BIN_OP_PLUS_uxn_c_l79_c3_74f8_return_output, 16);
     VAR_step_cpu_phase_uxn_c_l98_c3_91fc := resize(VAR_BIN_OP_PLUS_uxn_c_l98_c3_5800_return_output, 8);
     VAR_cpu_step_result_MUX_uxn_c_l73_c7_3232_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_2247_uxn_c_l73_c7_3232_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l67_c2_7b89_iftrue := VAR_cpu_step_result_TRUE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_684a_uxn_c_l67_c2_7b89_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_4588_iftrue := VAR_pc_uxn_c_l79_c3_f75b;
     VAR_printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg1 := resize(VAR_pc_uxn_c_l79_c3_f75b, 32);
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_73ab_iffalse := VAR_step_cpu_phase_uxn_c_l98_c3_91fc;
     -- ins_MUX[uxn_c_l77_c7_4588] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l77_c7_4588_cond <= VAR_ins_MUX_uxn_c_l77_c7_4588_cond;
     ins_MUX_uxn_c_l77_c7_4588_iftrue <= VAR_ins_MUX_uxn_c_l77_c7_4588_iftrue;
     ins_MUX_uxn_c_l77_c7_4588_iffalse <= VAR_ins_MUX_uxn_c_l77_c7_4588_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l77_c7_4588_return_output := ins_MUX_uxn_c_l77_c7_4588_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l73_c7_3232] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l67_c1_5749] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l73_c7_3232_return_output;
     VAR_printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l67_c1_5749_return_output;
     VAR_ins_MUX_uxn_c_l73_c7_3232_iffalse := VAR_ins_MUX_uxn_c_l77_c7_4588_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l77_c7_4588] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_return_output;

     -- printf_uxn_c_l71_c3_d170[uxn_c_l71_c3_d170] LATENCY=0
     -- Clock enable
     printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_CLOCK_ENABLE <= VAR_printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_arg0 <= VAR_printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_arg0;
     printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_arg1 <= VAR_printf_uxn_c_l71_c3_d170_uxn_c_l71_c3_d170_arg1;
     -- Outputs

     -- ins_MUX[uxn_c_l73_c7_3232] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l73_c7_3232_cond <= VAR_ins_MUX_uxn_c_l73_c7_3232_cond;
     ins_MUX_uxn_c_l73_c7_3232_iftrue <= VAR_ins_MUX_uxn_c_l73_c7_3232_iftrue;
     ins_MUX_uxn_c_l73_c7_3232_iffalse <= VAR_ins_MUX_uxn_c_l73_c7_3232_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l73_c7_3232_return_output := ins_MUX_uxn_c_l73_c7_3232_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l73_c1_2e60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l77_c7_4588_return_output;
     VAR_printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_2e60_return_output;
     VAR_ins_MUX_uxn_c_l67_c2_7b89_iffalse := VAR_ins_MUX_uxn_c_l73_c7_3232_return_output;
     -- ins_MUX[uxn_c_l67_c2_7b89] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l67_c2_7b89_cond <= VAR_ins_MUX_uxn_c_l67_c2_7b89_cond;
     ins_MUX_uxn_c_l67_c2_7b89_iftrue <= VAR_ins_MUX_uxn_c_l67_c2_7b89_iftrue;
     ins_MUX_uxn_c_l67_c2_7b89_iffalse <= VAR_ins_MUX_uxn_c_l67_c2_7b89_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l67_c2_7b89_return_output := ins_MUX_uxn_c_l67_c2_7b89_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l77_c1_5eb6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_return_output;

     -- printf_uxn_c_l75_c3_dfee[uxn_c_l75_c3_dfee] LATENCY=0
     -- Clock enable
     printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_CLOCK_ENABLE <= VAR_printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg0 <= VAR_printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg0;
     printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg1 <= VAR_printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg1;
     printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg2 <= VAR_printf_uxn_c_l75_c3_dfee_uxn_c_l75_c3_dfee_arg2;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l82_c1_9b2d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_return_output;

     -- Submodule level 4
     VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_return_output;
     VAR_printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l82_c1_9b2d_return_output;
     VAR_printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l77_c1_5eb6_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l67_c2_7b89_return_output;
     -- eval_opcode_phased[uxn_c_l83_c24_26bf] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l83_c24_26bf_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l83_c24_26bf_phase <= VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_phase;
     eval_opcode_phased_uxn_c_l83_c24_26bf_ins <= VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_ins;
     eval_opcode_phased_uxn_c_l83_c24_26bf_pc <= VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_pc;
     eval_opcode_phased_uxn_c_l83_c24_26bf_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_previous_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_return_output := eval_opcode_phased_uxn_c_l83_c24_26bf_return_output;

     -- printf_uxn_c_l80_c3_4e81[uxn_c_l80_c3_4e81] LATENCY=0
     -- Clock enable
     printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_CLOCK_ENABLE <= VAR_printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg0 <= VAR_printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg0;
     printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg1 <= VAR_printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg1;
     printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg2 <= VAR_printf_uxn_c_l80_c3_4e81_uxn_c_l80_c3_4e81_arg2;
     -- Outputs

     -- Submodule level 5
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_4588_iffalse := VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l91_c17_186a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l91_c17_186a_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_return_output.is_opc_done;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l89_c34_65cb] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l89_c34_65cb_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l84_c8_b3ed] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l84_c8_b3ed_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_return_output.is_pc_updated;

     -- CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d[uxn_c_l90_c32_7ef6] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l90_c32_7ef6_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_return_output.vram_value;

     -- eval_opcode_result_MUX[uxn_c_l77_c7_4588] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l77_c7_4588_cond <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_4588_cond;
     eval_opcode_result_MUX_uxn_c_l77_c7_4588_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_4588_iftrue;
     eval_opcode_result_MUX_uxn_c_l77_c7_4588_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l77_c7_4588_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l77_c7_4588_return_output := eval_opcode_result_MUX_uxn_c_l77_c7_4588_return_output;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d[uxn_c_l87_c31_7b0f] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l87_c31_7b0f_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l85_c34_e20a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l85_c34_e20a_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_return_output.is_ram_write;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d[uxn_c_l86_c33_207d] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l86_c33_207d_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_return_output.ram_addr;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d[uxn_c_l84_c43_2a86] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l84_c43_2a86_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_return_output.pc;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l88_c35_9abe] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l88_c35_9abe_return_output := VAR_eval_opcode_phased_uxn_c_l83_c24_26bf_return_output.is_vram_write;

     -- Submodule level 6
     VAR_MUX_uxn_c_l84_c8_1aa8_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l84_c43_2a86_return_output;
     VAR_is_ins_done_MUX_uxn_c_l77_c7_4588_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l91_c17_186a_return_output;
     VAR_MUX_uxn_c_l84_c8_1aa8_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l84_c8_b3ed_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l73_c7_3232_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l77_c7_4588_return_output;
     -- eval_opcode_result_MUX[uxn_c_l73_c7_3232] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l73_c7_3232_cond <= VAR_eval_opcode_result_MUX_uxn_c_l73_c7_3232_cond;
     eval_opcode_result_MUX_uxn_c_l73_c7_3232_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l73_c7_3232_iftrue;
     eval_opcode_result_MUX_uxn_c_l73_c7_3232_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l73_c7_3232_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l73_c7_3232_return_output := eval_opcode_result_MUX_uxn_c_l73_c7_3232_return_output;

     -- cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_01a8[uxn_c_l77_c7_4588] LATENCY=0
     VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_01a8_uxn_c_l77_c7_4588_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_01a8(
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l85_c34_e20a_return_output,
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l86_c33_207d_return_output,
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l87_c31_7b0f_return_output,
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l88_c35_9abe_return_output,
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l89_c34_65cb_return_output,
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l90_c32_7ef6_return_output);

     -- is_ins_done_MUX[uxn_c_l77_c7_4588] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l77_c7_4588_cond <= VAR_is_ins_done_MUX_uxn_c_l77_c7_4588_cond;
     is_ins_done_MUX_uxn_c_l77_c7_4588_iftrue <= VAR_is_ins_done_MUX_uxn_c_l77_c7_4588_iftrue;
     is_ins_done_MUX_uxn_c_l77_c7_4588_iffalse <= VAR_is_ins_done_MUX_uxn_c_l77_c7_4588_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l77_c7_4588_return_output := is_ins_done_MUX_uxn_c_l77_c7_4588_return_output;

     -- MUX[uxn_c_l84_c8_1aa8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l84_c8_1aa8_cond <= VAR_MUX_uxn_c_l84_c8_1aa8_cond;
     MUX_uxn_c_l84_c8_1aa8_iftrue <= VAR_MUX_uxn_c_l84_c8_1aa8_iftrue;
     MUX_uxn_c_l84_c8_1aa8_iffalse <= VAR_MUX_uxn_c_l84_c8_1aa8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l84_c8_1aa8_return_output := MUX_uxn_c_l84_c8_1aa8_return_output;

     -- Submodule level 7
     VAR_pc_uxn_c_l84_c3_53ee := VAR_MUX_uxn_c_l84_c8_1aa8_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_4588_iffalse := VAR_cpu_step_result_FALSE_INPUT_MUX_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_01a8_uxn_c_l77_c7_4588_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l67_c2_7b89_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l73_c7_3232_return_output;
     VAR_is_ins_done_MUX_uxn_c_l73_c7_3232_iffalse := VAR_is_ins_done_MUX_uxn_c_l77_c7_4588_return_output;
     VAR_pc_MUX_uxn_c_l77_c7_4588_iffalse := VAR_pc_uxn_c_l84_c3_53ee;
     VAR_printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg1 := resize(VAR_pc_uxn_c_l84_c3_53ee, 32);
     -- printf_uxn_c_l92_c3_221b[uxn_c_l92_c3_221b] LATENCY=0
     -- Clock enable
     printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_CLOCK_ENABLE <= VAR_printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg0 <= VAR_printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg0;
     printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg1 <= VAR_printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg1;
     printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg2 <= VAR_printf_uxn_c_l92_c3_221b_uxn_c_l92_c3_221b_arg2;
     -- Outputs

     -- eval_opcode_result_MUX[uxn_c_l67_c2_7b89] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l67_c2_7b89_cond <= VAR_eval_opcode_result_MUX_uxn_c_l67_c2_7b89_cond;
     eval_opcode_result_MUX_uxn_c_l67_c2_7b89_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l67_c2_7b89_iftrue;
     eval_opcode_result_MUX_uxn_c_l67_c2_7b89_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l67_c2_7b89_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l67_c2_7b89_return_output := eval_opcode_result_MUX_uxn_c_l67_c2_7b89_return_output;

     -- is_ins_done_MUX[uxn_c_l73_c7_3232] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l73_c7_3232_cond <= VAR_is_ins_done_MUX_uxn_c_l73_c7_3232_cond;
     is_ins_done_MUX_uxn_c_l73_c7_3232_iftrue <= VAR_is_ins_done_MUX_uxn_c_l73_c7_3232_iftrue;
     is_ins_done_MUX_uxn_c_l73_c7_3232_iffalse <= VAR_is_ins_done_MUX_uxn_c_l73_c7_3232_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l73_c7_3232_return_output := is_ins_done_MUX_uxn_c_l73_c7_3232_return_output;

     -- cpu_step_result_MUX[uxn_c_l77_c7_4588] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l77_c7_4588_cond <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_4588_cond;
     cpu_step_result_MUX_uxn_c_l77_c7_4588_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_4588_iftrue;
     cpu_step_result_MUX_uxn_c_l77_c7_4588_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l77_c7_4588_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l77_c7_4588_return_output := cpu_step_result_MUX_uxn_c_l77_c7_4588_return_output;

     -- pc_MUX[uxn_c_l77_c7_4588] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l77_c7_4588_cond <= VAR_pc_MUX_uxn_c_l77_c7_4588_cond;
     pc_MUX_uxn_c_l77_c7_4588_iftrue <= VAR_pc_MUX_uxn_c_l77_c7_4588_iftrue;
     pc_MUX_uxn_c_l77_c7_4588_iffalse <= VAR_pc_MUX_uxn_c_l77_c7_4588_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l77_c7_4588_return_output := pc_MUX_uxn_c_l77_c7_4588_return_output;

     -- Submodule level 8
     VAR_cpu_step_result_MUX_uxn_c_l73_c7_3232_iffalse := VAR_cpu_step_result_MUX_uxn_c_l77_c7_4588_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l67_c2_7b89_return_output;
     VAR_is_ins_done_MUX_uxn_c_l67_c2_7b89_iffalse := VAR_is_ins_done_MUX_uxn_c_l73_c7_3232_return_output;
     VAR_pc_MUX_uxn_c_l73_c7_3232_iffalse := VAR_pc_MUX_uxn_c_l77_c7_4588_return_output;
     -- pc_MUX[uxn_c_l73_c7_3232] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l73_c7_3232_cond <= VAR_pc_MUX_uxn_c_l73_c7_3232_cond;
     pc_MUX_uxn_c_l73_c7_3232_iftrue <= VAR_pc_MUX_uxn_c_l73_c7_3232_iftrue;
     pc_MUX_uxn_c_l73_c7_3232_iffalse <= VAR_pc_MUX_uxn_c_l73_c7_3232_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l73_c7_3232_return_output := pc_MUX_uxn_c_l73_c7_3232_return_output;

     -- cpu_step_result_MUX[uxn_c_l73_c7_3232] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l73_c7_3232_cond <= VAR_cpu_step_result_MUX_uxn_c_l73_c7_3232_cond;
     cpu_step_result_MUX_uxn_c_l73_c7_3232_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l73_c7_3232_iftrue;
     cpu_step_result_MUX_uxn_c_l73_c7_3232_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l73_c7_3232_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l73_c7_3232_return_output := cpu_step_result_MUX_uxn_c_l73_c7_3232_return_output;

     -- is_ins_done_MUX[uxn_c_l67_c2_7b89] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l67_c2_7b89_cond <= VAR_is_ins_done_MUX_uxn_c_l67_c2_7b89_cond;
     is_ins_done_MUX_uxn_c_l67_c2_7b89_iftrue <= VAR_is_ins_done_MUX_uxn_c_l67_c2_7b89_iftrue;
     is_ins_done_MUX_uxn_c_l67_c2_7b89_iffalse <= VAR_is_ins_done_MUX_uxn_c_l67_c2_7b89_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l67_c2_7b89_return_output := is_ins_done_MUX_uxn_c_l67_c2_7b89_return_output;

     -- Submodule level 9
     VAR_cpu_step_result_MUX_uxn_c_l67_c2_7b89_iffalse := VAR_cpu_step_result_MUX_uxn_c_l73_c7_3232_return_output;
     VAR_BIN_OP_EQ_uxn_c_l95_c6_0aad_left := VAR_is_ins_done_MUX_uxn_c_l67_c2_7b89_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l67_c2_7b89_return_output;
     VAR_pc_MUX_uxn_c_l67_c2_7b89_iffalse := VAR_pc_MUX_uxn_c_l73_c7_3232_return_output;
     -- pc_MUX[uxn_c_l67_c2_7b89] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l67_c2_7b89_cond <= VAR_pc_MUX_uxn_c_l67_c2_7b89_cond;
     pc_MUX_uxn_c_l67_c2_7b89_iftrue <= VAR_pc_MUX_uxn_c_l67_c2_7b89_iftrue;
     pc_MUX_uxn_c_l67_c2_7b89_iffalse <= VAR_pc_MUX_uxn_c_l67_c2_7b89_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l67_c2_7b89_return_output := pc_MUX_uxn_c_l67_c2_7b89_return_output;

     -- BIN_OP_EQ[uxn_c_l95_c6_0aad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l95_c6_0aad_left <= VAR_BIN_OP_EQ_uxn_c_l95_c6_0aad_left;
     BIN_OP_EQ_uxn_c_l95_c6_0aad_right <= VAR_BIN_OP_EQ_uxn_c_l95_c6_0aad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l95_c6_0aad_return_output := BIN_OP_EQ_uxn_c_l95_c6_0aad_return_output;

     -- cpu_step_result_MUX[uxn_c_l67_c2_7b89] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l67_c2_7b89_cond <= VAR_cpu_step_result_MUX_uxn_c_l67_c2_7b89_cond;
     cpu_step_result_MUX_uxn_c_l67_c2_7b89_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l67_c2_7b89_iftrue;
     cpu_step_result_MUX_uxn_c_l67_c2_7b89_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l67_c2_7b89_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l67_c2_7b89_return_output := cpu_step_result_MUX_uxn_c_l67_c2_7b89_return_output;

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_73ab_cond := VAR_BIN_OP_EQ_uxn_c_l95_c6_0aad_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l67_c2_7b89_return_output;
     VAR_return_output := VAR_cpu_step_result_MUX_uxn_c_l67_c2_7b89_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l67_c2_7b89_return_output;
     -- step_cpu_phase_MUX[uxn_c_l95_c2_73ab] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l95_c2_73ab_cond <= VAR_step_cpu_phase_MUX_uxn_c_l95_c2_73ab_cond;
     step_cpu_phase_MUX_uxn_c_l95_c2_73ab_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l95_c2_73ab_iftrue;
     step_cpu_phase_MUX_uxn_c_l95_c2_73ab_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l95_c2_73ab_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l95_c2_73ab_return_output := step_cpu_phase_MUX_uxn_c_l95_c2_73ab_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l95_c2_73ab_return_output;
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
