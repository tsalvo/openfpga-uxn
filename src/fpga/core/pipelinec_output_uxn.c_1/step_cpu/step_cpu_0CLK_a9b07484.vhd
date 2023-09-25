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
-- Submodules: 59
entity step_cpu_0CLK_a9b07484 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ram_read_value : in unsigned(7 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_a9b07484;
architecture arch of step_cpu_0CLK_a9b07484 is
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
vram_value => to_unsigned(0, 2),
is_pc_updated => to_unsigned(0, 1),
pc => to_unsigned(0, 16),
is_ins_done => to_unsigned(0, 1))
;
signal REG_COMB_pc : unsigned(15 downto 0);
signal REG_COMB_ins : unsigned(7 downto 0);
signal REG_COMB_step_cpu_phase : unsigned(7 downto 0);
signal REG_COMB_is_ins_done : unsigned(0 downto 0);
signal REG_COMB_eval_opcode_result : eval_opcode_result_t;
signal REG_COMB_cpu_step_result : cpu_step_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_c_l73_c6_980b]
signal BIN_OP_EQ_uxn_c_l73_c6_980b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l73_c6_980b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l73_c6_980b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l73_c1_78ba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c7_aaa6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l73_c2_40f1]
signal ins_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l73_c2_40f1]
signal pc_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(15 downto 0);

-- cpu_step_result_ram_address_MUX[uxn_c_l73_c2_40f1]
signal cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
signal cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(15 downto 0);
signal cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(15 downto 0);
signal cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l73_c2_40f1]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_pc_updated_MUX[uxn_c_l73_c2_40f1]
signal cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
signal cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(0 downto 0);

-- cpu_step_result_vram_value_MUX[uxn_c_l73_c2_40f1]
signal cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(1 downto 0);
signal cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(1 downto 0);
signal cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(1 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l73_c2_40f1]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(0 downto 0);

-- cpu_step_result_ram_value_MUX[uxn_c_l73_c2_40f1]
signal cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
signal cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(7 downto 0);
signal cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(7 downto 0);
signal cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(7 downto 0);

-- cpu_step_result_vram_address_MUX[uxn_c_l73_c2_40f1]
signal cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(31 downto 0);
signal cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(31 downto 0);
signal cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(31 downto 0);

-- cpu_step_result_pc_MUX[uxn_c_l73_c2_40f1]
signal cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
signal cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(15 downto 0);
signal cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(15 downto 0);
signal cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_ram_read_MUX[uxn_c_l73_c2_40f1]
signal cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l73_c2_40f1]
signal eval_opcode_result_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l73_c2_40f1_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l73_c2_40f1_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l73_c2_40f1_return_output : eval_opcode_result_t;

-- is_ins_done_MUX[uxn_c_l73_c2_40f1]
signal is_ins_done_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(0 downto 0);

-- printf_uxn_c_l78_c3_3bf3[uxn_c_l78_c3_3bf3]
signal printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l80_c11_6f5a]
signal BIN_OP_EQ_uxn_c_l80_c11_6f5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l80_c11_6f5a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_2fc5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l88_c7_31c8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l80_c7_aaa6]
signal ins_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l80_c7_aaa6]
signal pc_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(15 downto 0);

-- cpu_step_result_ram_address_MUX[uxn_c_l80_c7_aaa6]
signal cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
signal cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(15 downto 0);
signal cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(15 downto 0);
signal cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l80_c7_aaa6]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_pc_updated_MUX[uxn_c_l80_c7_aaa6]
signal cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
signal cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(0 downto 0);

-- cpu_step_result_vram_value_MUX[uxn_c_l80_c7_aaa6]
signal cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(1 downto 0);
signal cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(1 downto 0);
signal cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(1 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l80_c7_aaa6]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(0 downto 0);

-- cpu_step_result_ram_value_MUX[uxn_c_l80_c7_aaa6]
signal cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
signal cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(7 downto 0);
signal cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(7 downto 0);
signal cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(7 downto 0);

-- cpu_step_result_vram_address_MUX[uxn_c_l80_c7_aaa6]
signal cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(31 downto 0);
signal cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(31 downto 0);
signal cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(31 downto 0);

-- cpu_step_result_pc_MUX[uxn_c_l80_c7_aaa6]
signal cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
signal cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(15 downto 0);
signal cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(15 downto 0);
signal cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_ram_read_MUX[uxn_c_l80_c7_aaa6]
signal cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l80_c7_aaa6]
signal eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_return_output : eval_opcode_result_t;

-- is_ins_done_MUX[uxn_c_l80_c7_aaa6]
signal is_ins_done_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(0 downto 0);

-- printf_uxn_c_l86_c3_f1ad[uxn_c_l86_c3_f1ad]
signal printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l88_c11_755a]
signal BIN_OP_EQ_uxn_c_l88_c11_755a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l88_c11_755a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l88_c11_755a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l88_c1_cd22]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l93_c1_74fe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l88_c7_31c8]
signal ins_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l88_c7_31c8]
signal pc_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(15 downto 0);

-- cpu_step_result_ram_address_MUX[uxn_c_l88_c7_31c8]
signal cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
signal cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(15 downto 0);
signal cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(15 downto 0);
signal cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l88_c7_31c8]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_pc_updated_MUX[uxn_c_l88_c7_31c8]
signal cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
signal cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(0 downto 0);

-- cpu_step_result_vram_value_MUX[uxn_c_l88_c7_31c8]
signal cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(1 downto 0);
signal cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(1 downto 0);
signal cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(1 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l88_c7_31c8]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(0 downto 0);

-- cpu_step_result_ram_value_MUX[uxn_c_l88_c7_31c8]
signal cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
signal cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(7 downto 0);
signal cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(7 downto 0);
signal cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(7 downto 0);

-- cpu_step_result_vram_address_MUX[uxn_c_l88_c7_31c8]
signal cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(31 downto 0);
signal cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(31 downto 0);
signal cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(31 downto 0);

-- cpu_step_result_pc_MUX[uxn_c_l88_c7_31c8]
signal cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
signal cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(15 downto 0);
signal cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(15 downto 0);
signal cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_ram_read_MUX[uxn_c_l88_c7_31c8]
signal cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(0 downto 0);

-- eval_opcode_result_MUX[uxn_c_l88_c7_31c8]
signal eval_opcode_result_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
signal eval_opcode_result_MUX_uxn_c_l88_c7_31c8_iftrue : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l88_c7_31c8_iffalse : eval_opcode_result_t;
signal eval_opcode_result_MUX_uxn_c_l88_c7_31c8_return_output : eval_opcode_result_t;

-- is_ins_done_MUX[uxn_c_l88_c7_31c8]
signal is_ins_done_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l90_c3_df75]
signal BIN_OP_PLUS_uxn_c_l90_c3_df75_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l90_c3_df75_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l90_c3_df75_return_output : unsigned(16 downto 0);

-- printf_uxn_c_l91_c3_83b0[uxn_c_l91_c3_83b0]
signal printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg2 : unsigned(31 downto 0);

-- BIN_OP_MINUS[uxn_c_l94_c43_28b9]
signal BIN_OP_MINUS_uxn_c_l94_c43_28b9_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l94_c43_28b9_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l94_c43_28b9_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l94_c24_e874]
signal eval_opcode_phased_uxn_c_l94_c24_e874_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l94_c24_e874_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l94_c24_e874_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l94_c24_e874_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l94_c24_e874_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l94_c24_e874_return_output : eval_opcode_result_t;

-- printf_uxn_c_l105_c3_1a20[uxn_c_l105_c3_1a20]
signal printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l108_c6_a472]
signal BIN_OP_EQ_uxn_c_l108_c6_a472_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l108_c6_a472_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l108_c6_a472_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l108_c2_545a]
signal step_cpu_phase_MUX_uxn_c_l108_c2_545a_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l108_c2_545a_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l108_c2_545a_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l108_c2_545a_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l111_c3_8f8b]
signal BIN_OP_PLUS_uxn_c_l111_c3_8f8b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l111_c3_8f8b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l111_c3_8f8b_return_output : unsigned(8 downto 0);

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8e7b( ref_toks_0 : cpu_step_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return cpu_step_result_t is
 
  variable base : cpu_step_result_t; 
  variable return_output : cpu_step_result_t;
begin
      base := ref_toks_0;
      base.ram_address := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.vram_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.ram_value := ref_toks_6;
      base.vram_address := ref_toks_7;
      base.pc := ref_toks_8;
      base.is_ram_read := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_c_l73_c6_980b
BIN_OP_EQ_uxn_c_l73_c6_980b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l73_c6_980b_left,
BIN_OP_EQ_uxn_c_l73_c6_980b_right,
BIN_OP_EQ_uxn_c_l73_c6_980b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba
TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_return_output);

-- ins_MUX_uxn_c_l73_c2_40f1
ins_MUX_uxn_c_l73_c2_40f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l73_c2_40f1_cond,
ins_MUX_uxn_c_l73_c2_40f1_iftrue,
ins_MUX_uxn_c_l73_c2_40f1_iffalse,
ins_MUX_uxn_c_l73_c2_40f1_return_output);

-- pc_MUX_uxn_c_l73_c2_40f1
pc_MUX_uxn_c_l73_c2_40f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l73_c2_40f1_cond,
pc_MUX_uxn_c_l73_c2_40f1_iftrue,
pc_MUX_uxn_c_l73_c2_40f1_iffalse,
pc_MUX_uxn_c_l73_c2_40f1_return_output);

-- cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1
cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_cond,
cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_iftrue,
cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_iffalse,
cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1
cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_return_output);

-- cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1
cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_cond,
cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_iftrue,
cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_iffalse,
cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_return_output);

-- cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1
cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_cond,
cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_iftrue,
cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_iffalse,
cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1
cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_return_output);

-- cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1
cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_cond,
cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_iftrue,
cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_iffalse,
cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_return_output);

-- cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1
cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_cond,
cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_iftrue,
cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_iffalse,
cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_return_output);

-- cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1
cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_cond,
cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_iftrue,
cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_iffalse,
cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_return_output);

-- cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1
cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_cond,
cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_iftrue,
cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_iffalse,
cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_return_output);

-- eval_opcode_result_MUX_uxn_c_l73_c2_40f1
eval_opcode_result_MUX_uxn_c_l73_c2_40f1 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l73_c2_40f1_cond,
eval_opcode_result_MUX_uxn_c_l73_c2_40f1_iftrue,
eval_opcode_result_MUX_uxn_c_l73_c2_40f1_iffalse,
eval_opcode_result_MUX_uxn_c_l73_c2_40f1_return_output);

-- is_ins_done_MUX_uxn_c_l73_c2_40f1
is_ins_done_MUX_uxn_c_l73_c2_40f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l73_c2_40f1_cond,
is_ins_done_MUX_uxn_c_l73_c2_40f1_iftrue,
is_ins_done_MUX_uxn_c_l73_c2_40f1_iffalse,
is_ins_done_MUX_uxn_c_l73_c2_40f1_return_output);

-- printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3
printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3 : entity work.printf_uxn_c_l78_c3_3bf3_0CLK_de264c78 port map (
printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_CLOCK_ENABLE,
printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_arg0,
printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_arg1);

-- BIN_OP_EQ_uxn_c_l80_c11_6f5a
BIN_OP_EQ_uxn_c_l80_c11_6f5a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l80_c11_6f5a_left,
BIN_OP_EQ_uxn_c_l80_c11_6f5a_right,
BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_return_output);

-- ins_MUX_uxn_c_l80_c7_aaa6
ins_MUX_uxn_c_l80_c7_aaa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l80_c7_aaa6_cond,
ins_MUX_uxn_c_l80_c7_aaa6_iftrue,
ins_MUX_uxn_c_l80_c7_aaa6_iffalse,
ins_MUX_uxn_c_l80_c7_aaa6_return_output);

-- pc_MUX_uxn_c_l80_c7_aaa6
pc_MUX_uxn_c_l80_c7_aaa6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l80_c7_aaa6_cond,
pc_MUX_uxn_c_l80_c7_aaa6_iftrue,
pc_MUX_uxn_c_l80_c7_aaa6_iffalse,
pc_MUX_uxn_c_l80_c7_aaa6_return_output);

-- cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6
cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_cond,
cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_iftrue,
cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_iffalse,
cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6
cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_return_output);

-- cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6
cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_cond,
cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_iftrue,
cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_iffalse,
cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_return_output);

-- cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6
cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_cond,
cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_iftrue,
cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_iffalse,
cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6
cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_return_output);

-- cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6
cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_cond,
cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_iftrue,
cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_iffalse,
cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_return_output);

-- cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6
cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_cond,
cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_iftrue,
cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_iffalse,
cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_return_output);

-- cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6
cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_cond,
cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_iftrue,
cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_iffalse,
cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_return_output);

-- cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6
cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_cond,
cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_iftrue,
cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_iffalse,
cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_return_output);

-- eval_opcode_result_MUX_uxn_c_l80_c7_aaa6
eval_opcode_result_MUX_uxn_c_l80_c7_aaa6 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_cond,
eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_iftrue,
eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_iffalse,
eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_return_output);

-- is_ins_done_MUX_uxn_c_l80_c7_aaa6
is_ins_done_MUX_uxn_c_l80_c7_aaa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l80_c7_aaa6_cond,
is_ins_done_MUX_uxn_c_l80_c7_aaa6_iftrue,
is_ins_done_MUX_uxn_c_l80_c7_aaa6_iffalse,
is_ins_done_MUX_uxn_c_l80_c7_aaa6_return_output);

-- printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad
printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad : entity work.printf_uxn_c_l86_c3_f1ad_0CLK_de264c78 port map (
printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_CLOCK_ENABLE,
printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg0,
printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg1,
printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg2);

-- BIN_OP_EQ_uxn_c_l88_c11_755a
BIN_OP_EQ_uxn_c_l88_c11_755a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l88_c11_755a_left,
BIN_OP_EQ_uxn_c_l88_c11_755a_right,
BIN_OP_EQ_uxn_c_l88_c11_755a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22
TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe
FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_return_output);

-- ins_MUX_uxn_c_l88_c7_31c8
ins_MUX_uxn_c_l88_c7_31c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l88_c7_31c8_cond,
ins_MUX_uxn_c_l88_c7_31c8_iftrue,
ins_MUX_uxn_c_l88_c7_31c8_iffalse,
ins_MUX_uxn_c_l88_c7_31c8_return_output);

-- pc_MUX_uxn_c_l88_c7_31c8
pc_MUX_uxn_c_l88_c7_31c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l88_c7_31c8_cond,
pc_MUX_uxn_c_l88_c7_31c8_iftrue,
pc_MUX_uxn_c_l88_c7_31c8_iffalse,
pc_MUX_uxn_c_l88_c7_31c8_return_output);

-- cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8
cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_cond,
cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_iftrue,
cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_iffalse,
cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8
cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_return_output);

-- cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8
cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_cond,
cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_iftrue,
cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_iffalse,
cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_return_output);

-- cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8
cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_cond,
cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_iftrue,
cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_iffalse,
cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8
cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_return_output);

-- cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8
cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_cond,
cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_iftrue,
cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_iffalse,
cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_return_output);

-- cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8
cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_cond,
cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_iftrue,
cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_iffalse,
cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_return_output);

-- cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8
cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_cond,
cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_iftrue,
cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_iffalse,
cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_return_output);

-- cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8
cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_cond,
cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_iftrue,
cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_iffalse,
cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_return_output);

-- eval_opcode_result_MUX_uxn_c_l88_c7_31c8
eval_opcode_result_MUX_uxn_c_l88_c7_31c8 : entity work.MUX_uint1_t_eval_opcode_result_t_eval_opcode_result_t_0CLK_de264c78 port map (
eval_opcode_result_MUX_uxn_c_l88_c7_31c8_cond,
eval_opcode_result_MUX_uxn_c_l88_c7_31c8_iftrue,
eval_opcode_result_MUX_uxn_c_l88_c7_31c8_iffalse,
eval_opcode_result_MUX_uxn_c_l88_c7_31c8_return_output);

-- is_ins_done_MUX_uxn_c_l88_c7_31c8
is_ins_done_MUX_uxn_c_l88_c7_31c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l88_c7_31c8_cond,
is_ins_done_MUX_uxn_c_l88_c7_31c8_iftrue,
is_ins_done_MUX_uxn_c_l88_c7_31c8_iffalse,
is_ins_done_MUX_uxn_c_l88_c7_31c8_return_output);

-- BIN_OP_PLUS_uxn_c_l90_c3_df75
BIN_OP_PLUS_uxn_c_l90_c3_df75 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l90_c3_df75_left,
BIN_OP_PLUS_uxn_c_l90_c3_df75_right,
BIN_OP_PLUS_uxn_c_l90_c3_df75_return_output);

-- printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0
printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0 : entity work.printf_uxn_c_l91_c3_83b0_0CLK_de264c78 port map (
printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_CLOCK_ENABLE,
printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg0,
printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg1,
printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg2);

-- BIN_OP_MINUS_uxn_c_l94_c43_28b9
BIN_OP_MINUS_uxn_c_l94_c43_28b9 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l94_c43_28b9_left,
BIN_OP_MINUS_uxn_c_l94_c43_28b9_right,
BIN_OP_MINUS_uxn_c_l94_c43_28b9_return_output);

-- eval_opcode_phased_uxn_c_l94_c24_e874
eval_opcode_phased_uxn_c_l94_c24_e874 : entity work.eval_opcode_phased_0CLK_7750fe9e port map (
clk,
eval_opcode_phased_uxn_c_l94_c24_e874_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l94_c24_e874_phase,
eval_opcode_phased_uxn_c_l94_c24_e874_ins,
eval_opcode_phased_uxn_c_l94_c24_e874_pc,
eval_opcode_phased_uxn_c_l94_c24_e874_previous_ram_read,
eval_opcode_phased_uxn_c_l94_c24_e874_return_output);

-- printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20
printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20 : entity work.printf_uxn_c_l105_c3_1a20_0CLK_de264c78 port map (
printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_CLOCK_ENABLE,
printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg0,
printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg1,
printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg2);

-- BIN_OP_EQ_uxn_c_l108_c6_a472
BIN_OP_EQ_uxn_c_l108_c6_a472 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l108_c6_a472_left,
BIN_OP_EQ_uxn_c_l108_c6_a472_right,
BIN_OP_EQ_uxn_c_l108_c6_a472_return_output);

-- step_cpu_phase_MUX_uxn_c_l108_c2_545a
step_cpu_phase_MUX_uxn_c_l108_c2_545a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l108_c2_545a_cond,
step_cpu_phase_MUX_uxn_c_l108_c2_545a_iftrue,
step_cpu_phase_MUX_uxn_c_l108_c2_545a_iffalse,
step_cpu_phase_MUX_uxn_c_l108_c2_545a_return_output);

-- BIN_OP_PLUS_uxn_c_l111_c3_8f8b
BIN_OP_PLUS_uxn_c_l111_c3_8f8b : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l111_c3_8f8b_left,
BIN_OP_PLUS_uxn_c_l111_c3_8f8b_right,
BIN_OP_PLUS_uxn_c_l111_c3_8f8b_return_output);



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
 BIN_OP_EQ_uxn_c_l73_c6_980b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_return_output,
 ins_MUX_uxn_c_l73_c2_40f1_return_output,
 pc_MUX_uxn_c_l73_c2_40f1_return_output,
 cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_return_output,
 cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_return_output,
 cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_return_output,
 cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_return_output,
 cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_return_output,
 cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_return_output,
 cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_return_output,
 eval_opcode_result_MUX_uxn_c_l73_c2_40f1_return_output,
 is_ins_done_MUX_uxn_c_l73_c2_40f1_return_output,
 BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_return_output,
 ins_MUX_uxn_c_l80_c7_aaa6_return_output,
 pc_MUX_uxn_c_l80_c7_aaa6_return_output,
 cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_return_output,
 cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_return_output,
 cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_return_output,
 cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_return_output,
 cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_return_output,
 cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_return_output,
 cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_return_output,
 eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_return_output,
 is_ins_done_MUX_uxn_c_l80_c7_aaa6_return_output,
 BIN_OP_EQ_uxn_c_l88_c11_755a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_return_output,
 ins_MUX_uxn_c_l88_c7_31c8_return_output,
 pc_MUX_uxn_c_l88_c7_31c8_return_output,
 cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_return_output,
 cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_return_output,
 cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_return_output,
 cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_return_output,
 cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_return_output,
 cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_return_output,
 cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_return_output,
 eval_opcode_result_MUX_uxn_c_l88_c7_31c8_return_output,
 is_ins_done_MUX_uxn_c_l88_c7_31c8_return_output,
 BIN_OP_PLUS_uxn_c_l90_c3_df75_return_output,
 BIN_OP_MINUS_uxn_c_l94_c43_28b9_return_output,
 eval_opcode_phased_uxn_c_l94_c24_e874_return_output,
 BIN_OP_EQ_uxn_c_l108_c6_a472_return_output,
 step_cpu_phase_MUX_uxn_c_l108_c2_545a_return_output,
 BIN_OP_PLUS_uxn_c_l111_c3_8f8b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_ram_read_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(1 downto 0);
 variable VAR_cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(1 downto 0);
 variable VAR_cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(1 downto 0);
 variable VAR_cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(1 downto 0);
 variable VAR_cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(31 downto 0);
 variable VAR_cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(31 downto 0);
 variable VAR_cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(31 downto 0);
 variable VAR_cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(31 downto 0);
 variable VAR_cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c2_40f1_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c2_40f1_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c2_40f1_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c2_40f1_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c2_40f1_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_aaa6_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c2_40f1_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l73_c2_40f1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(1 downto 0);
 variable VAR_cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(1 downto 0);
 variable VAR_cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(1 downto 0);
 variable VAR_cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(31 downto 0);
 variable VAR_cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(31 downto 0);
 variable VAR_cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(31 downto 0);
 variable VAR_cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l88_c7_31c8_return_output : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_aaa6_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_aaa6_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l88_c7_31c8_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l80_c7_aaa6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(7 downto 0);
 variable VAR_ins_uxn_c_l89_c3_b2f4 : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l90_c3_9160 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_ram_address_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l88_c7_31c8_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(1 downto 0);
 variable VAR_cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(1 downto 0);
 variable VAR_cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(31 downto 0);
 variable VAR_cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(31 downto 0);
 variable VAR_cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_read_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_read_d41d_uxn_c_l88_c7_31c8_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_result_MUX_uxn_c_l88_c7_31c8_iftrue : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l88_c7_31c8_iffalse : eval_opcode_result_t;
 variable VAR_eval_opcode_result_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l88_c7_31c8_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l88_c7_31c8_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l88_c7_31c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l90_c3_df75_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l90_c3_df75_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l90_c3_df75_return_output : unsigned(16 downto 0);
 variable VAR_printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg2 : unsigned(31 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l94_c24_e874_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l94_c24_e874_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l94_c24_e874_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l94_c24_e874_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l94_c43_28b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l94_c43_28b9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l94_c43_28b9_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l94_c24_e874_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l94_c24_e874_return_output : eval_opcode_result_t;
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l95_c35_b6b7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l96_c33_d721_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l97_c34_19f0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l98_c33_77b9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l99_c31_111b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l100_c24_8394_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l101_c35_d887_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l102_c34_b455_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l103_c32_71c6_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l104_c17_00f8_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l108_c6_a472_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l108_c6_a472_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l108_c6_a472_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l108_c2_545a_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l109_c3_9b55 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l108_c2_545a_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l111_c3_4739 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l108_c2_545a_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l108_c2_545a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l111_c3_8f8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l111_c3_8f8b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l111_c3_8f8b_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l88_l73_l80_DUPLICATE_db17_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_pc_updated_d41d_uxn_c_l73_l80_l88_DUPLICATE_2be4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d_uxn_c_l80_l88_l73_DUPLICATE_e6bf_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l88_l73_l80_DUPLICATE_4c04_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d_uxn_c_l80_l73_l88_DUPLICATE_5f03_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l80_l88_l73_DUPLICATE_5be2_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_pc_d41d_uxn_c_l73_l80_l88_DUPLICATE_d609_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8e7b_uxn_c_l114_l66_DUPLICATE_7b0c_return_output : cpu_step_result_t;
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
     VAR_BIN_OP_PLUS_uxn_c_l90_c3_df75_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_iffalse := to_unsigned(0, 1);
     VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_iftrue := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l73_c2_40f1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_iftrue := to_unsigned(0, 1);
     VAR_is_ins_done_MUX_uxn_c_l80_c7_aaa6_iftrue := to_unsigned(0, 1);
     VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_right := to_unsigned(2, 2);
     VAR_step_cpu_phase_uxn_c_l109_c3_9b55 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l108_c2_545a_iftrue := VAR_step_cpu_phase_uxn_c_l109_c3_9b55;
     VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l108_c6_a472_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l111_c3_8f8b_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l94_c43_28b9_right := to_unsigned(3, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ram_read_value := ram_read_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_iftrue := VAR_CLOCK_ENABLE;
     VAR_eval_opcode_result_MUX_uxn_c_l73_c2_40f1_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_iftrue := eval_opcode_result;
     VAR_eval_opcode_result_MUX_uxn_c_l88_c7_31c8_iftrue := eval_opcode_result;
     VAR_eval_opcode_phased_uxn_c_l94_c24_e874_ins := ins;
     VAR_ins_MUX_uxn_c_l73_c2_40f1_iftrue := ins;
     VAR_ins_MUX_uxn_c_l80_c7_aaa6_iftrue := ins;
     VAR_ins_MUX_uxn_c_l88_c7_31c8_iffalse := ins;
     VAR_printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg2 := resize(ins, 32);
     VAR_printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg2 := resize(ins, 32);
     VAR_is_ins_done_MUX_uxn_c_l88_c7_31c8_iftrue := is_ins_done;
     VAR_BIN_OP_PLUS_uxn_c_l90_c3_df75_left := pc;
     VAR_cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_iftrue := pc;
     VAR_cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_iftrue := pc;
     VAR_eval_opcode_phased_uxn_c_l94_c24_e874_pc := pc;
     VAR_pc_MUX_uxn_c_l73_c2_40f1_iftrue := pc;
     VAR_pc_MUX_uxn_c_l80_c7_aaa6_iftrue := pc;
     VAR_pc_MUX_uxn_c_l88_c7_31c8_iffalse := pc;
     VAR_printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg1 := resize(pc, 32);
     VAR_printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_arg1 := resize(pc, 32);
     VAR_printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg1 := resize(pc, 32);
     VAR_eval_opcode_phased_uxn_c_l94_c24_e874_previous_ram_read := VAR_ram_read_value;
     VAR_ins_uxn_c_l89_c3_b2f4 := VAR_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l94_c43_28b9_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l111_c3_8f8b_left := step_cpu_phase;
     VAR_printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg0 := resize(step_cpu_phase, 32);
     VAR_printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg0 := resize(step_cpu_phase, 32);
     VAR_ins_MUX_uxn_c_l88_c7_31c8_iftrue := VAR_ins_uxn_c_l89_c3_b2f4;
     VAR_printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg2 := resize(VAR_ins_uxn_c_l89_c3_b2f4, 32);
     -- BIN_OP_PLUS[uxn_c_l90_c3_df75] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l90_c3_df75_left <= VAR_BIN_OP_PLUS_uxn_c_l90_c3_df75_left;
     BIN_OP_PLUS_uxn_c_l90_c3_df75_right <= VAR_BIN_OP_PLUS_uxn_c_l90_c3_df75_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l90_c3_df75_return_output := BIN_OP_PLUS_uxn_c_l90_c3_df75_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l88_l73_l80_DUPLICATE_4c04 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l88_l73_l80_DUPLICATE_4c04_return_output := cpu_step_result.is_vram_write;

     -- BIN_OP_EQ[uxn_c_l73_c6_980b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l73_c6_980b_left <= VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_left;
     BIN_OP_EQ_uxn_c_l73_c6_980b_right <= VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output := BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;

     -- CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l80_l88_l73_DUPLICATE_5be2 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l80_l88_l73_DUPLICATE_5be2_return_output := cpu_step_result.vram_address;

     -- BIN_OP_EQ[uxn_c_l80_c11_6f5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l80_c11_6f5a_left <= VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_left;
     BIN_OP_EQ_uxn_c_l80_c11_6f5a_right <= VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output := BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_pc_updated_d41d_uxn_c_l73_l80_l88_DUPLICATE_2be4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_pc_updated_d41d_uxn_c_l73_l80_l88_DUPLICATE_2be4_return_output := cpu_step_result.is_pc_updated;

     -- cpu_step_result_is_ram_read_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_read_d41d[uxn_c_l88_c7_31c8] LATENCY=0
     VAR_cpu_step_result_is_ram_read_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_read_d41d_uxn_c_l88_c7_31c8_return_output := cpu_step_result.is_ram_read;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d_uxn_c_l80_l73_l88_DUPLICATE_5f03 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d_uxn_c_l80_l73_l88_DUPLICATE_5f03_return_output := cpu_step_result.ram_value;

     -- CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d_uxn_c_l80_l88_l73_DUPLICATE_e6bf LATENCY=0
     VAR_CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d_uxn_c_l80_l88_l73_DUPLICATE_e6bf_return_output := cpu_step_result.vram_value;

     -- BIN_OP_MINUS[uxn_c_l94_c43_28b9] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l94_c43_28b9_left <= VAR_BIN_OP_MINUS_uxn_c_l94_c43_28b9_left;
     BIN_OP_MINUS_uxn_c_l94_c43_28b9_right <= VAR_BIN_OP_MINUS_uxn_c_l94_c43_28b9_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l94_c43_28b9_return_output := BIN_OP_MINUS_uxn_c_l94_c43_28b9_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l88_l73_l80_DUPLICATE_db17 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l88_l73_l80_DUPLICATE_db17_return_output := cpu_step_result.is_ram_write;

     -- BIN_OP_PLUS[uxn_c_l111_c3_8f8b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l111_c3_8f8b_left <= VAR_BIN_OP_PLUS_uxn_c_l111_c3_8f8b_left;
     BIN_OP_PLUS_uxn_c_l111_c3_8f8b_right <= VAR_BIN_OP_PLUS_uxn_c_l111_c3_8f8b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l111_c3_8f8b_return_output := BIN_OP_PLUS_uxn_c_l111_c3_8f8b_return_output;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_pc_d41d_uxn_c_l73_l80_l88_DUPLICATE_d609 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_pc_d41d_uxn_c_l73_l80_l88_DUPLICATE_d609_return_output := cpu_step_result.pc;

     -- BIN_OP_EQ[uxn_c_l88_c11_755a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l88_c11_755a_left <= VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_left;
     BIN_OP_EQ_uxn_c_l88_c11_755a_right <= VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output := BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;

     -- cpu_step_result_ram_address_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d[uxn_c_l88_c7_31c8] LATENCY=0
     VAR_cpu_step_result_ram_address_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l88_c7_31c8_return_output := cpu_step_result.ram_address;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_cond := VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;
     VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_cond := VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;
     VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_cond := VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_cond := VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_cond := VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;
     VAR_cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_cond := VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;
     VAR_cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_cond := VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;
     VAR_cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_cond := VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;
     VAR_cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_cond := VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;
     VAR_cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_cond := VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l73_c2_40f1_cond := VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;
     VAR_ins_MUX_uxn_c_l73_c2_40f1_cond := VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;
     VAR_is_ins_done_MUX_uxn_c_l73_c2_40f1_cond := VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;
     VAR_pc_MUX_uxn_c_l73_c2_40f1_cond := VAR_BIN_OP_EQ_uxn_c_l73_c6_980b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;
     VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;
     VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;
     VAR_cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;
     VAR_cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;
     VAR_cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;
     VAR_cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;
     VAR_cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;
     VAR_ins_MUX_uxn_c_l80_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;
     VAR_is_ins_done_MUX_uxn_c_l80_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;
     VAR_pc_MUX_uxn_c_l80_c7_aaa6_cond := VAR_BIN_OP_EQ_uxn_c_l80_c11_6f5a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_cond := VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_cond := VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;
     VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_cond := VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;
     VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_cond := VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_cond := VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_cond := VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;
     VAR_cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_cond := VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;
     VAR_cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_cond := VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;
     VAR_cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_cond := VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;
     VAR_cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_cond := VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;
     VAR_cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_cond := VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l88_c7_31c8_cond := VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;
     VAR_ins_MUX_uxn_c_l88_c7_31c8_cond := VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;
     VAR_is_ins_done_MUX_uxn_c_l88_c7_31c8_cond := VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;
     VAR_pc_MUX_uxn_c_l88_c7_31c8_cond := VAR_BIN_OP_EQ_uxn_c_l88_c11_755a_return_output;
     VAR_eval_opcode_phased_uxn_c_l94_c24_e874_phase := VAR_BIN_OP_MINUS_uxn_c_l94_c43_28b9_return_output;
     VAR_step_cpu_phase_uxn_c_l111_c3_4739 := resize(VAR_BIN_OP_PLUS_uxn_c_l111_c3_8f8b_return_output, 8);
     VAR_pc_uxn_c_l90_c3_9160 := resize(VAR_BIN_OP_PLUS_uxn_c_l90_c3_df75_return_output, 16);
     VAR_cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_pc_d41d_uxn_c_l73_l80_l88_DUPLICATE_d609_return_output;
     VAR_cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_pc_d41d_uxn_c_l73_l80_l88_DUPLICATE_d609_return_output;
     VAR_cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_pc_d41d_uxn_c_l73_l80_l88_DUPLICATE_d609_return_output;
     VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_pc_updated_d41d_uxn_c_l73_l80_l88_DUPLICATE_2be4_return_output;
     VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_pc_updated_d41d_uxn_c_l73_l80_l88_DUPLICATE_2be4_return_output;
     VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_pc_updated_d41d_uxn_c_l73_l80_l88_DUPLICATE_2be4_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l88_l73_l80_DUPLICATE_db17_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l88_l73_l80_DUPLICATE_db17_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l88_l73_l80_DUPLICATE_db17_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l88_l73_l80_DUPLICATE_4c04_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l88_l73_l80_DUPLICATE_4c04_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l88_l73_l80_DUPLICATE_4c04_return_output;
     VAR_cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_iftrue := VAR_CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d_uxn_c_l80_l88_l73_DUPLICATE_e6bf_return_output;
     VAR_cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_iftrue := VAR_CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d_uxn_c_l80_l88_l73_DUPLICATE_e6bf_return_output;
     VAR_cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_iftrue := VAR_CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d_uxn_c_l80_l88_l73_DUPLICATE_e6bf_return_output;
     VAR_cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_iftrue := VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l80_l88_l73_DUPLICATE_5be2_return_output;
     VAR_cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_iftrue := VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l80_l88_l73_DUPLICATE_5be2_return_output;
     VAR_cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_iftrue := VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l80_l88_l73_DUPLICATE_5be2_return_output;
     VAR_cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d_uxn_c_l80_l73_l88_DUPLICATE_5f03_return_output;
     VAR_cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d_uxn_c_l80_l73_l88_DUPLICATE_5f03_return_output;
     VAR_cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d_uxn_c_l80_l73_l88_DUPLICATE_5f03_return_output;
     VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_iftrue := VAR_cpu_step_result_is_ram_read_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_read_d41d_uxn_c_l88_c7_31c8_return_output;
     VAR_cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_iftrue := VAR_cpu_step_result_ram_address_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l88_c7_31c8_return_output;
     VAR_pc_MUX_uxn_c_l88_c7_31c8_iftrue := VAR_pc_uxn_c_l90_c3_9160;
     VAR_printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg1 := resize(VAR_pc_uxn_c_l90_c3_9160, 32);
     VAR_step_cpu_phase_MUX_uxn_c_l108_c2_545a_iffalse := VAR_step_cpu_phase_uxn_c_l111_c3_4739;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l80_c7_aaa6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_return_output;

     -- pc_MUX[uxn_c_l88_c7_31c8] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l88_c7_31c8_cond <= VAR_pc_MUX_uxn_c_l88_c7_31c8_cond;
     pc_MUX_uxn_c_l88_c7_31c8_iftrue <= VAR_pc_MUX_uxn_c_l88_c7_31c8_iftrue;
     pc_MUX_uxn_c_l88_c7_31c8_iffalse <= VAR_pc_MUX_uxn_c_l88_c7_31c8_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l88_c7_31c8_return_output := pc_MUX_uxn_c_l88_c7_31c8_return_output;

     -- ins_MUX[uxn_c_l88_c7_31c8] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l88_c7_31c8_cond <= VAR_ins_MUX_uxn_c_l88_c7_31c8_cond;
     ins_MUX_uxn_c_l88_c7_31c8_iftrue <= VAR_ins_MUX_uxn_c_l88_c7_31c8_iftrue;
     ins_MUX_uxn_c_l88_c7_31c8_iffalse <= VAR_ins_MUX_uxn_c_l88_c7_31c8_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l88_c7_31c8_return_output := ins_MUX_uxn_c_l88_c7_31c8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l73_c1_78ba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l80_c7_aaa6_return_output;
     VAR_printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l73_c1_78ba_return_output;
     VAR_ins_MUX_uxn_c_l80_c7_aaa6_iffalse := VAR_ins_MUX_uxn_c_l88_c7_31c8_return_output;
     VAR_pc_MUX_uxn_c_l80_c7_aaa6_iffalse := VAR_pc_MUX_uxn_c_l88_c7_31c8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l80_c1_2fc5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_return_output;

     -- ins_MUX[uxn_c_l80_c7_aaa6] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l80_c7_aaa6_cond <= VAR_ins_MUX_uxn_c_l80_c7_aaa6_cond;
     ins_MUX_uxn_c_l80_c7_aaa6_iftrue <= VAR_ins_MUX_uxn_c_l80_c7_aaa6_iftrue;
     ins_MUX_uxn_c_l80_c7_aaa6_iffalse <= VAR_ins_MUX_uxn_c_l80_c7_aaa6_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l80_c7_aaa6_return_output := ins_MUX_uxn_c_l80_c7_aaa6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l88_c7_31c8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_return_output;

     -- pc_MUX[uxn_c_l80_c7_aaa6] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l80_c7_aaa6_cond <= VAR_pc_MUX_uxn_c_l80_c7_aaa6_cond;
     pc_MUX_uxn_c_l80_c7_aaa6_iftrue <= VAR_pc_MUX_uxn_c_l80_c7_aaa6_iftrue;
     pc_MUX_uxn_c_l80_c7_aaa6_iffalse <= VAR_pc_MUX_uxn_c_l80_c7_aaa6_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l80_c7_aaa6_return_output := pc_MUX_uxn_c_l80_c7_aaa6_return_output;

     -- printf_uxn_c_l78_c3_3bf3[uxn_c_l78_c3_3bf3] LATENCY=0
     -- Clock enable
     printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_CLOCK_ENABLE <= VAR_printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_arg0 <= VAR_printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_arg0;
     printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_arg1 <= VAR_printf_uxn_c_l78_c3_3bf3_uxn_c_l78_c3_3bf3_arg1;
     -- Outputs

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l88_c7_31c8_return_output;
     VAR_printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l80_c1_2fc5_return_output;
     VAR_ins_MUX_uxn_c_l73_c2_40f1_iffalse := VAR_ins_MUX_uxn_c_l80_c7_aaa6_return_output;
     VAR_pc_MUX_uxn_c_l73_c2_40f1_iffalse := VAR_pc_MUX_uxn_c_l80_c7_aaa6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l88_c1_cd22] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l93_c1_74fe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_return_output;

     -- printf_uxn_c_l86_c3_f1ad[uxn_c_l86_c3_f1ad] LATENCY=0
     -- Clock enable
     printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_CLOCK_ENABLE <= VAR_printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg0 <= VAR_printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg0;
     printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg1 <= VAR_printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg1;
     printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg2 <= VAR_printf_uxn_c_l86_c3_f1ad_uxn_c_l86_c3_f1ad_arg2;
     -- Outputs

     -- pc_MUX[uxn_c_l73_c2_40f1] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l73_c2_40f1_cond <= VAR_pc_MUX_uxn_c_l73_c2_40f1_cond;
     pc_MUX_uxn_c_l73_c2_40f1_iftrue <= VAR_pc_MUX_uxn_c_l73_c2_40f1_iftrue;
     pc_MUX_uxn_c_l73_c2_40f1_iffalse <= VAR_pc_MUX_uxn_c_l73_c2_40f1_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l73_c2_40f1_return_output := pc_MUX_uxn_c_l73_c2_40f1_return_output;

     -- ins_MUX[uxn_c_l73_c2_40f1] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l73_c2_40f1_cond <= VAR_ins_MUX_uxn_c_l73_c2_40f1_cond;
     ins_MUX_uxn_c_l73_c2_40f1_iftrue <= VAR_ins_MUX_uxn_c_l73_c2_40f1_iftrue;
     ins_MUX_uxn_c_l73_c2_40f1_iffalse <= VAR_ins_MUX_uxn_c_l73_c2_40f1_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l73_c2_40f1_return_output := ins_MUX_uxn_c_l73_c2_40f1_return_output;

     -- Submodule level 4
     VAR_eval_opcode_phased_uxn_c_l94_c24_e874_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_return_output;
     VAR_printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_74fe_return_output;
     VAR_printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l88_c1_cd22_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l73_c2_40f1_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l73_c2_40f1_return_output;
     -- printf_uxn_c_l91_c3_83b0[uxn_c_l91_c3_83b0] LATENCY=0
     -- Clock enable
     printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_CLOCK_ENABLE <= VAR_printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg0 <= VAR_printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg0;
     printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg1 <= VAR_printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg1;
     printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg2 <= VAR_printf_uxn_c_l91_c3_83b0_uxn_c_l91_c3_83b0_arg2;
     -- Outputs

     -- eval_opcode_phased[uxn_c_l94_c24_e874] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l94_c24_e874_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l94_c24_e874_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l94_c24_e874_phase <= VAR_eval_opcode_phased_uxn_c_l94_c24_e874_phase;
     eval_opcode_phased_uxn_c_l94_c24_e874_ins <= VAR_eval_opcode_phased_uxn_c_l94_c24_e874_ins;
     eval_opcode_phased_uxn_c_l94_c24_e874_pc <= VAR_eval_opcode_phased_uxn_c_l94_c24_e874_pc;
     eval_opcode_phased_uxn_c_l94_c24_e874_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l94_c24_e874_previous_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l94_c24_e874_return_output := eval_opcode_phased_uxn_c_l94_c24_e874_return_output;

     -- printf_uxn_c_l105_c3_1a20[uxn_c_l105_c3_1a20] LATENCY=0
     -- Clock enable
     printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_CLOCK_ENABLE <= VAR_printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg0 <= VAR_printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg0;
     printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg1 <= VAR_printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg1;
     printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg2 <= VAR_printf_uxn_c_l105_c3_1a20_uxn_c_l105_c3_1a20_arg2;
     -- Outputs

     -- Submodule level 5
     VAR_eval_opcode_result_MUX_uxn_c_l88_c7_31c8_iffalse := VAR_eval_opcode_phased_uxn_c_l94_c24_e874_return_output;
     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d[uxn_c_l98_c33_77b9] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l98_c33_77b9_return_output := VAR_eval_opcode_phased_uxn_c_l94_c24_e874_return_output.ram_addr;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l97_c34_19f0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l97_c34_19f0_return_output := VAR_eval_opcode_phased_uxn_c_l94_c24_e874_return_output.is_ram_write;

     -- eval_opcode_result_MUX[uxn_c_l88_c7_31c8] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l88_c7_31c8_cond <= VAR_eval_opcode_result_MUX_uxn_c_l88_c7_31c8_cond;
     eval_opcode_result_MUX_uxn_c_l88_c7_31c8_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l88_c7_31c8_iftrue;
     eval_opcode_result_MUX_uxn_c_l88_c7_31c8_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l88_c7_31c8_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l88_c7_31c8_return_output := eval_opcode_result_MUX_uxn_c_l88_c7_31c8_return_output;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l104_c17_00f8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l104_c17_00f8_return_output := VAR_eval_opcode_phased_uxn_c_l94_c24_e874_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l95_c35_b6b7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l95_c35_b6b7_return_output := VAR_eval_opcode_phased_uxn_c_l94_c24_e874_return_output.is_pc_updated;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d[uxn_c_l99_c31_111b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l99_c31_111b_return_output := VAR_eval_opcode_phased_uxn_c_l94_c24_e874_return_output.ram_value;

     -- CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d[uxn_c_l102_c34_b455] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l102_c34_b455_return_output := VAR_eval_opcode_phased_uxn_c_l94_c24_e874_return_output.vram_address;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d[uxn_c_l100_c24_8394] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l100_c24_8394_return_output := VAR_eval_opcode_phased_uxn_c_l94_c24_e874_return_output.pc;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l101_c35_d887] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l101_c35_d887_return_output := VAR_eval_opcode_phased_uxn_c_l94_c24_e874_return_output.is_vram_write;

     -- CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d[uxn_c_l103_c32_71c6] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l103_c32_71c6_return_output := VAR_eval_opcode_phased_uxn_c_l94_c24_e874_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d[uxn_c_l96_c33_d721] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l96_c33_d721_return_output := VAR_eval_opcode_phased_uxn_c_l94_c24_e874_return_output.is_ram_read;

     -- Submodule level 6
     VAR_cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_iffalse := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_pc_d41d_uxn_c_l100_c24_8394_return_output;
     VAR_cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_iffalse := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_ram_addr_d41d_uxn_c_l98_c33_77b9_return_output;
     VAR_is_ins_done_MUX_uxn_c_l88_c7_31c8_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l104_c17_00f8_return_output;
     VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l95_c35_b6b7_return_output;
     VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_read_d41d_uxn_c_l96_c33_d721_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l97_c34_19f0_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l101_c35_d887_return_output;
     VAR_cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_iffalse := VAR_CONST_REF_RD_uint2_t_eval_opcode_result_t_vram_value_d41d_uxn_c_l103_c32_71c6_return_output;
     VAR_cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_iffalse := VAR_CONST_REF_RD_uint32_t_eval_opcode_result_t_vram_address_d41d_uxn_c_l102_c34_b455_return_output;
     VAR_cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_ram_value_d41d_uxn_c_l99_c31_111b_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l88_c7_31c8_return_output;
     -- is_ins_done_MUX[uxn_c_l88_c7_31c8] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l88_c7_31c8_cond <= VAR_is_ins_done_MUX_uxn_c_l88_c7_31c8_cond;
     is_ins_done_MUX_uxn_c_l88_c7_31c8_iftrue <= VAR_is_ins_done_MUX_uxn_c_l88_c7_31c8_iftrue;
     is_ins_done_MUX_uxn_c_l88_c7_31c8_iffalse <= VAR_is_ins_done_MUX_uxn_c_l88_c7_31c8_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l88_c7_31c8_return_output := is_ins_done_MUX_uxn_c_l88_c7_31c8_return_output;

     -- cpu_step_result_ram_address_MUX[uxn_c_l88_c7_31c8] LATENCY=0
     -- Inputs
     cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_cond <= VAR_cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_cond;
     cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_iftrue <= VAR_cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_iftrue;
     cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_iffalse <= VAR_cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_iffalse;
     -- Outputs
     VAR_cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_return_output := cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l88_c7_31c8] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_return_output;

     -- cpu_step_result_pc_MUX[uxn_c_l88_c7_31c8] LATENCY=0
     -- Inputs
     cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_cond <= VAR_cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_cond;
     cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_iftrue <= VAR_cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_iftrue;
     cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_iffalse <= VAR_cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_iffalse;
     -- Outputs
     VAR_cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_return_output := cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_return_output;

     -- cpu_step_result_vram_address_MUX[uxn_c_l88_c7_31c8] LATENCY=0
     -- Inputs
     cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_cond <= VAR_cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_cond;
     cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_iftrue <= VAR_cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_iftrue;
     cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_iffalse <= VAR_cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_return_output := cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_return_output;

     -- cpu_step_result_is_pc_updated_MUX[uxn_c_l88_c7_31c8] LATENCY=0
     -- Inputs
     cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_cond <= VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_cond;
     cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_iftrue <= VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_iftrue;
     cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_iffalse <= VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_return_output := cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_return_output;

     -- cpu_step_result_vram_value_MUX[uxn_c_l88_c7_31c8] LATENCY=0
     -- Inputs
     cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_cond <= VAR_cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_cond;
     cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_iftrue <= VAR_cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_iftrue;
     cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_iffalse <= VAR_cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_return_output := cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_return_output;

     -- cpu_step_result_is_ram_read_MUX[uxn_c_l88_c7_31c8] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_cond <= VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_cond;
     cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_iftrue <= VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_iftrue;
     cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_iffalse <= VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_return_output := cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_return_output;

     -- eval_opcode_result_MUX[uxn_c_l80_c7_aaa6] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_cond <= VAR_eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_cond;
     eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_iftrue;
     eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_return_output := eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l88_c7_31c8] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_return_output;

     -- cpu_step_result_ram_value_MUX[uxn_c_l88_c7_31c8] LATENCY=0
     -- Inputs
     cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_cond <= VAR_cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_cond;
     cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_iftrue <= VAR_cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_iftrue;
     cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_iffalse <= VAR_cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_iffalse;
     -- Outputs
     VAR_cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_return_output := cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_return_output;

     -- Submodule level 7
     VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_iffalse := VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l88_c7_31c8_return_output;
     VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_iffalse := VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l88_c7_31c8_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_iffalse := VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l88_c7_31c8_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_iffalse := VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l88_c7_31c8_return_output;
     VAR_cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_iffalse := VAR_cpu_step_result_pc_MUX_uxn_c_l88_c7_31c8_return_output;
     VAR_cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_iffalse := VAR_cpu_step_result_ram_address_MUX_uxn_c_l88_c7_31c8_return_output;
     VAR_cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_iffalse := VAR_cpu_step_result_ram_value_MUX_uxn_c_l88_c7_31c8_return_output;
     VAR_cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_iffalse := VAR_cpu_step_result_vram_address_MUX_uxn_c_l88_c7_31c8_return_output;
     VAR_cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_iffalse := VAR_cpu_step_result_vram_value_MUX_uxn_c_l88_c7_31c8_return_output;
     VAR_eval_opcode_result_MUX_uxn_c_l73_c2_40f1_iffalse := VAR_eval_opcode_result_MUX_uxn_c_l80_c7_aaa6_return_output;
     VAR_is_ins_done_MUX_uxn_c_l80_c7_aaa6_iffalse := VAR_is_ins_done_MUX_uxn_c_l88_c7_31c8_return_output;
     -- cpu_step_result_is_ram_read_MUX[uxn_c_l80_c7_aaa6] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_cond <= VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_cond;
     cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_iftrue <= VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_iftrue;
     cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_iffalse <= VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_return_output := cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_return_output;

     -- eval_opcode_result_MUX[uxn_c_l73_c2_40f1] LATENCY=0
     -- Inputs
     eval_opcode_result_MUX_uxn_c_l73_c2_40f1_cond <= VAR_eval_opcode_result_MUX_uxn_c_l73_c2_40f1_cond;
     eval_opcode_result_MUX_uxn_c_l73_c2_40f1_iftrue <= VAR_eval_opcode_result_MUX_uxn_c_l73_c2_40f1_iftrue;
     eval_opcode_result_MUX_uxn_c_l73_c2_40f1_iffalse <= VAR_eval_opcode_result_MUX_uxn_c_l73_c2_40f1_iffalse;
     -- Outputs
     VAR_eval_opcode_result_MUX_uxn_c_l73_c2_40f1_return_output := eval_opcode_result_MUX_uxn_c_l73_c2_40f1_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l80_c7_aaa6] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l80_c7_aaa6] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_return_output;

     -- cpu_step_result_vram_address_MUX[uxn_c_l80_c7_aaa6] LATENCY=0
     -- Inputs
     cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_cond <= VAR_cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_cond;
     cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_iftrue <= VAR_cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_iftrue;
     cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_iffalse <= VAR_cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_return_output := cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_return_output;

     -- is_ins_done_MUX[uxn_c_l80_c7_aaa6] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l80_c7_aaa6_cond <= VAR_is_ins_done_MUX_uxn_c_l80_c7_aaa6_cond;
     is_ins_done_MUX_uxn_c_l80_c7_aaa6_iftrue <= VAR_is_ins_done_MUX_uxn_c_l80_c7_aaa6_iftrue;
     is_ins_done_MUX_uxn_c_l80_c7_aaa6_iffalse <= VAR_is_ins_done_MUX_uxn_c_l80_c7_aaa6_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l80_c7_aaa6_return_output := is_ins_done_MUX_uxn_c_l80_c7_aaa6_return_output;

     -- cpu_step_result_ram_value_MUX[uxn_c_l80_c7_aaa6] LATENCY=0
     -- Inputs
     cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_cond <= VAR_cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_cond;
     cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_iftrue <= VAR_cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_iftrue;
     cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_iffalse <= VAR_cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_iffalse;
     -- Outputs
     VAR_cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_return_output := cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_return_output;

     -- cpu_step_result_ram_address_MUX[uxn_c_l80_c7_aaa6] LATENCY=0
     -- Inputs
     cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_cond <= VAR_cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_cond;
     cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_iftrue <= VAR_cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_iftrue;
     cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_iffalse <= VAR_cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_iffalse;
     -- Outputs
     VAR_cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_return_output := cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_return_output;

     -- cpu_step_result_is_pc_updated_MUX[uxn_c_l80_c7_aaa6] LATENCY=0
     -- Inputs
     cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_cond <= VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_cond;
     cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_iftrue <= VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_iftrue;
     cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_iffalse <= VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_return_output := cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_return_output;

     -- cpu_step_result_vram_value_MUX[uxn_c_l80_c7_aaa6] LATENCY=0
     -- Inputs
     cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_cond <= VAR_cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_cond;
     cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_iftrue <= VAR_cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_iftrue;
     cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_iffalse <= VAR_cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_return_output := cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_return_output;

     -- cpu_step_result_pc_MUX[uxn_c_l80_c7_aaa6] LATENCY=0
     -- Inputs
     cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_cond <= VAR_cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_cond;
     cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_iftrue <= VAR_cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_iftrue;
     cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_iffalse <= VAR_cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_iffalse;
     -- Outputs
     VAR_cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_return_output := cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_return_output;

     -- Submodule level 8
     VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_iffalse := VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l80_c7_aaa6_return_output;
     VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_iffalse := VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l80_c7_aaa6_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_iffalse := VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l80_c7_aaa6_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_iffalse := VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l80_c7_aaa6_return_output;
     VAR_cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_iffalse := VAR_cpu_step_result_pc_MUX_uxn_c_l80_c7_aaa6_return_output;
     VAR_cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_iffalse := VAR_cpu_step_result_ram_address_MUX_uxn_c_l80_c7_aaa6_return_output;
     VAR_cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_iffalse := VAR_cpu_step_result_ram_value_MUX_uxn_c_l80_c7_aaa6_return_output;
     VAR_cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_iffalse := VAR_cpu_step_result_vram_address_MUX_uxn_c_l80_c7_aaa6_return_output;
     VAR_cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_iffalse := VAR_cpu_step_result_vram_value_MUX_uxn_c_l80_c7_aaa6_return_output;
     REG_VAR_eval_opcode_result := VAR_eval_opcode_result_MUX_uxn_c_l73_c2_40f1_return_output;
     VAR_is_ins_done_MUX_uxn_c_l73_c2_40f1_iffalse := VAR_is_ins_done_MUX_uxn_c_l80_c7_aaa6_return_output;
     -- is_ins_done_MUX[uxn_c_l73_c2_40f1] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l73_c2_40f1_cond <= VAR_is_ins_done_MUX_uxn_c_l73_c2_40f1_cond;
     is_ins_done_MUX_uxn_c_l73_c2_40f1_iftrue <= VAR_is_ins_done_MUX_uxn_c_l73_c2_40f1_iftrue;
     is_ins_done_MUX_uxn_c_l73_c2_40f1_iffalse <= VAR_is_ins_done_MUX_uxn_c_l73_c2_40f1_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l73_c2_40f1_return_output := is_ins_done_MUX_uxn_c_l73_c2_40f1_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l73_c2_40f1] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_return_output;

     -- cpu_step_result_is_ram_read_MUX[uxn_c_l73_c2_40f1] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_cond <= VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_cond;
     cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_iftrue <= VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_iftrue;
     cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_iffalse <= VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_return_output := cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_return_output;

     -- cpu_step_result_vram_address_MUX[uxn_c_l73_c2_40f1] LATENCY=0
     -- Inputs
     cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_cond <= VAR_cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_cond;
     cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_iftrue <= VAR_cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_iftrue;
     cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_iffalse <= VAR_cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_return_output := cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_return_output;

     -- cpu_step_result_vram_value_MUX[uxn_c_l73_c2_40f1] LATENCY=0
     -- Inputs
     cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_cond <= VAR_cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_cond;
     cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_iftrue <= VAR_cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_iftrue;
     cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_iffalse <= VAR_cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_return_output := cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l73_c2_40f1] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_return_output;

     -- cpu_step_result_pc_MUX[uxn_c_l73_c2_40f1] LATENCY=0
     -- Inputs
     cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_cond <= VAR_cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_cond;
     cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_iftrue <= VAR_cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_iftrue;
     cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_iffalse <= VAR_cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_iffalse;
     -- Outputs
     VAR_cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_return_output := cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_return_output;

     -- cpu_step_result_ram_address_MUX[uxn_c_l73_c2_40f1] LATENCY=0
     -- Inputs
     cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_cond <= VAR_cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_cond;
     cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_iftrue <= VAR_cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_iftrue;
     cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_iffalse <= VAR_cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_iffalse;
     -- Outputs
     VAR_cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_return_output := cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_return_output;

     -- cpu_step_result_is_pc_updated_MUX[uxn_c_l73_c2_40f1] LATENCY=0
     -- Inputs
     cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_cond <= VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_cond;
     cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_iftrue <= VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_iftrue;
     cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_iffalse <= VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_return_output := cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_return_output;

     -- cpu_step_result_ram_value_MUX[uxn_c_l73_c2_40f1] LATENCY=0
     -- Inputs
     cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_cond <= VAR_cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_cond;
     cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_iftrue <= VAR_cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_iftrue;
     cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_iffalse <= VAR_cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_iffalse;
     -- Outputs
     VAR_cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_return_output := cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_return_output;

     -- Submodule level 9
     VAR_BIN_OP_EQ_uxn_c_l108_c6_a472_left := VAR_is_ins_done_MUX_uxn_c_l73_c2_40f1_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l73_c2_40f1_return_output;
     -- BIN_OP_EQ[uxn_c_l108_c6_a472] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l108_c6_a472_left <= VAR_BIN_OP_EQ_uxn_c_l108_c6_a472_left;
     BIN_OP_EQ_uxn_c_l108_c6_a472_right <= VAR_BIN_OP_EQ_uxn_c_l108_c6_a472_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l108_c6_a472_return_output := BIN_OP_EQ_uxn_c_l108_c6_a472_return_output;

     -- CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8e7b_uxn_c_l114_l66_DUPLICATE_7b0c LATENCY=0
     VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8e7b_uxn_c_l114_l66_DUPLICATE_7b0c_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8e7b(
     cpu_step_result,
     VAR_cpu_step_result_ram_address_MUX_uxn_c_l73_c2_40f1_return_output,
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l73_c2_40f1_return_output,
     VAR_cpu_step_result_is_pc_updated_MUX_uxn_c_l73_c2_40f1_return_output,
     VAR_cpu_step_result_vram_value_MUX_uxn_c_l73_c2_40f1_return_output,
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l73_c2_40f1_return_output,
     VAR_cpu_step_result_ram_value_MUX_uxn_c_l73_c2_40f1_return_output,
     VAR_cpu_step_result_vram_address_MUX_uxn_c_l73_c2_40f1_return_output,
     VAR_cpu_step_result_pc_MUX_uxn_c_l73_c2_40f1_return_output,
     VAR_cpu_step_result_is_ram_read_MUX_uxn_c_l73_c2_40f1_return_output);

     -- Submodule level 10
     VAR_step_cpu_phase_MUX_uxn_c_l108_c2_545a_cond := VAR_BIN_OP_EQ_uxn_c_l108_c6_a472_return_output;
     REG_VAR_cpu_step_result := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8e7b_uxn_c_l114_l66_DUPLICATE_7b0c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_8e7b_uxn_c_l114_l66_DUPLICATE_7b0c_return_output;
     -- step_cpu_phase_MUX[uxn_c_l108_c2_545a] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l108_c2_545a_cond <= VAR_step_cpu_phase_MUX_uxn_c_l108_c2_545a_cond;
     step_cpu_phase_MUX_uxn_c_l108_c2_545a_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l108_c2_545a_iftrue;
     step_cpu_phase_MUX_uxn_c_l108_c2_545a_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l108_c2_545a_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l108_c2_545a_return_output := step_cpu_phase_MUX_uxn_c_l108_c2_545a_return_output;

     -- Submodule level 11
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l108_c2_545a_return_output;
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
