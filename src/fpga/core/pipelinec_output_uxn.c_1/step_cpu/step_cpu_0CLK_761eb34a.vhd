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
-- Submodules: 42
entity step_cpu_0CLK_761eb34a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 use_vector : in unsigned(0 downto 0);
 vector : in unsigned(15 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_761eb34a;
architecture arch of step_cpu_0CLK_761eb34a is
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
swap_buffers => to_unsigned(0, 1),
u8_value => to_unsigned(0, 8))
;
signal REG_COMB_pc : unsigned(15 downto 0);
signal REG_COMB_ins : unsigned(7 downto 0);
signal REG_COMB_step_cpu_phase : unsigned(7 downto 0);
signal REG_COMB_is_ins_done : unsigned(0 downto 0);
signal REG_COMB_is_waiting : unsigned(0 downto 0);
signal REG_COMB_cpu_step_result : cpu_step_result_t;

-- Each function instance gets signals
-- MUX[uxn_c_l71_c8_d46f]
signal MUX_uxn_c_l71_c8_d46f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l71_c8_d46f_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l71_c8_d46f_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l71_c8_d46f_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l72_c15_ee54]
signal MUX_uxn_c_l72_c15_ee54_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l72_c15_ee54_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l72_c15_ee54_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l72_c15_ee54_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l74_c6_777c]
signal BIN_OP_EQ_uxn_c_l74_c6_777c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c6_777c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c6_777c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c7_35b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);

-- is_waiting_MUX[uxn_c_l74_c2_95c3]
signal is_waiting_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l74_c2_95c3]
signal is_ins_done_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(0 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l74_c2_95c3]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l74_c2_95c3]
signal cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l74_c2_95c3]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(0 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l74_c2_95c3]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l74_c2_95c3]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(0 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l74_c2_95c3]
signal cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l74_c2_95c3]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l74_c2_95c3]
signal pc_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l74_c2_95c3]
signal ins_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l81_c11_1b3b]
signal BIN_OP_EQ_uxn_c_l81_c11_1b3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c11_1b3b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l84_c1_cffc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_return_output : unsigned(0 downto 0);

-- is_waiting_MUX[uxn_c_l81_c7_35b5]
signal is_waiting_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l81_c7_35b5]
signal is_ins_done_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l81_c7_35b5]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l81_c7_35b5]
signal cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l81_c7_35b5]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l81_c7_35b5]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l81_c7_35b5]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l81_c7_35b5]
signal cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l81_c7_35b5]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l81_c7_35b5]
signal pc_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(15 downto 0);

-- ins_MUX[uxn_c_l81_c7_35b5]
signal ins_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l82_c3_8c5a]
signal BIN_OP_PLUS_uxn_c_l82_c3_8c5a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_8c5a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_8c5a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l85_c9_3960]
signal BIN_OP_EQ_uxn_c_l85_c9_3960_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l85_c9_3960_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l85_c9_3960_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l85_c9_e3d3]
signal MUX_uxn_c_l85_c9_e3d3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l85_c9_e3d3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l85_c9_e3d3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l85_c9_e3d3_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l86_c64_32fa]
signal BIN_OP_MINUS_uxn_c_l86_c64_32fa_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c64_32fa_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c64_32fa_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l86_c45_cb2c]
signal eval_opcode_phased_uxn_c_l86_c45_cb2c_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_cb2c_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_cb2c_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_cb2c_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_cb2c_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_cb2c_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l87_c8_0c6c]
signal MUX_uxn_c_l87_c8_0c6c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l87_c8_0c6c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_0c6c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_0c6c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l99_c6_b0c9]
signal BIN_OP_OR_uxn_c_l99_c6_b0c9_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l99_c6_b0c9_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l99_c6_b0c9_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l99_c2_fea5]
signal step_cpu_phase_MUX_uxn_c_l99_c2_fea5_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_fea5_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_fea5_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_fea5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l102_c21_818e]
signal BIN_OP_EQ_uxn_c_l102_c21_818e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c21_818e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c21_818e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l102_c44_c913]
signal BIN_OP_PLUS_uxn_c_l102_c44_c913_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c44_c913_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c44_c913_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l102_c21_b4f8]
signal MUX_uxn_c_l102_c21_b4f8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l102_c21_b4f8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l102_c21_b4f8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l102_c21_b4f8_return_output : unsigned(7 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_return_output : unsigned(0 downto 0);

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_65f3( ref_toks_0 : unsigned;
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
      base.swap_buffers := ref_toks_0;
      base.vram_write_layer := ref_toks_1;
      base.u16_addr := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.is_ram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- MUX_uxn_c_l71_c8_d46f
MUX_uxn_c_l71_c8_d46f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l71_c8_d46f_cond,
MUX_uxn_c_l71_c8_d46f_iftrue,
MUX_uxn_c_l71_c8_d46f_iffalse,
MUX_uxn_c_l71_c8_d46f_return_output);

-- MUX_uxn_c_l72_c15_ee54
MUX_uxn_c_l72_c15_ee54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l72_c15_ee54_cond,
MUX_uxn_c_l72_c15_ee54_iftrue,
MUX_uxn_c_l72_c15_ee54_iffalse,
MUX_uxn_c_l72_c15_ee54_return_output);

-- BIN_OP_EQ_uxn_c_l74_c6_777c
BIN_OP_EQ_uxn_c_l74_c6_777c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l74_c6_777c_left,
BIN_OP_EQ_uxn_c_l74_c6_777c_right,
BIN_OP_EQ_uxn_c_l74_c6_777c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_return_output);

-- is_waiting_MUX_uxn_c_l74_c2_95c3
is_waiting_MUX_uxn_c_l74_c2_95c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l74_c2_95c3_cond,
is_waiting_MUX_uxn_c_l74_c2_95c3_iftrue,
is_waiting_MUX_uxn_c_l74_c2_95c3_iffalse,
is_waiting_MUX_uxn_c_l74_c2_95c3_return_output);

-- is_ins_done_MUX_uxn_c_l74_c2_95c3
is_ins_done_MUX_uxn_c_l74_c2_95c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l74_c2_95c3_cond,
is_ins_done_MUX_uxn_c_l74_c2_95c3_iftrue,
is_ins_done_MUX_uxn_c_l74_c2_95c3_iffalse,
is_ins_done_MUX_uxn_c_l74_c2_95c3_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3
cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3
cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3
cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3
cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3
cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3
cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_cond,
cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3
cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_return_output);

-- pc_MUX_uxn_c_l74_c2_95c3
pc_MUX_uxn_c_l74_c2_95c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l74_c2_95c3_cond,
pc_MUX_uxn_c_l74_c2_95c3_iftrue,
pc_MUX_uxn_c_l74_c2_95c3_iffalse,
pc_MUX_uxn_c_l74_c2_95c3_return_output);

-- ins_MUX_uxn_c_l74_c2_95c3
ins_MUX_uxn_c_l74_c2_95c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l74_c2_95c3_cond,
ins_MUX_uxn_c_l74_c2_95c3_iftrue,
ins_MUX_uxn_c_l74_c2_95c3_iffalse,
ins_MUX_uxn_c_l74_c2_95c3_return_output);

-- BIN_OP_EQ_uxn_c_l81_c11_1b3b
BIN_OP_EQ_uxn_c_l81_c11_1b3b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l81_c11_1b3b_left,
BIN_OP_EQ_uxn_c_l81_c11_1b3b_right,
BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_return_output);

-- is_waiting_MUX_uxn_c_l81_c7_35b5
is_waiting_MUX_uxn_c_l81_c7_35b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l81_c7_35b5_cond,
is_waiting_MUX_uxn_c_l81_c7_35b5_iftrue,
is_waiting_MUX_uxn_c_l81_c7_35b5_iffalse,
is_waiting_MUX_uxn_c_l81_c7_35b5_return_output);

-- is_ins_done_MUX_uxn_c_l81_c7_35b5
is_ins_done_MUX_uxn_c_l81_c7_35b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l81_c7_35b5_cond,
is_ins_done_MUX_uxn_c_l81_c7_35b5_iftrue,
is_ins_done_MUX_uxn_c_l81_c7_35b5_iffalse,
is_ins_done_MUX_uxn_c_l81_c7_35b5_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5
cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5
cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5
cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5
cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5
cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5
cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_cond,
cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5
cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_return_output);

-- pc_MUX_uxn_c_l81_c7_35b5
pc_MUX_uxn_c_l81_c7_35b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l81_c7_35b5_cond,
pc_MUX_uxn_c_l81_c7_35b5_iftrue,
pc_MUX_uxn_c_l81_c7_35b5_iffalse,
pc_MUX_uxn_c_l81_c7_35b5_return_output);

-- ins_MUX_uxn_c_l81_c7_35b5
ins_MUX_uxn_c_l81_c7_35b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l81_c7_35b5_cond,
ins_MUX_uxn_c_l81_c7_35b5_iftrue,
ins_MUX_uxn_c_l81_c7_35b5_iffalse,
ins_MUX_uxn_c_l81_c7_35b5_return_output);

-- BIN_OP_PLUS_uxn_c_l82_c3_8c5a
BIN_OP_PLUS_uxn_c_l82_c3_8c5a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l82_c3_8c5a_left,
BIN_OP_PLUS_uxn_c_l82_c3_8c5a_right,
BIN_OP_PLUS_uxn_c_l82_c3_8c5a_return_output);

-- BIN_OP_EQ_uxn_c_l85_c9_3960
BIN_OP_EQ_uxn_c_l85_c9_3960 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l85_c9_3960_left,
BIN_OP_EQ_uxn_c_l85_c9_3960_right,
BIN_OP_EQ_uxn_c_l85_c9_3960_return_output);

-- MUX_uxn_c_l85_c9_e3d3
MUX_uxn_c_l85_c9_e3d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l85_c9_e3d3_cond,
MUX_uxn_c_l85_c9_e3d3_iftrue,
MUX_uxn_c_l85_c9_e3d3_iffalse,
MUX_uxn_c_l85_c9_e3d3_return_output);

-- BIN_OP_MINUS_uxn_c_l86_c64_32fa
BIN_OP_MINUS_uxn_c_l86_c64_32fa : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l86_c64_32fa_left,
BIN_OP_MINUS_uxn_c_l86_c64_32fa_right,
BIN_OP_MINUS_uxn_c_l86_c64_32fa_return_output);

-- eval_opcode_phased_uxn_c_l86_c45_cb2c
eval_opcode_phased_uxn_c_l86_c45_cb2c : entity work.eval_opcode_phased_0CLK_17f7f827 port map (
clk,
eval_opcode_phased_uxn_c_l86_c45_cb2c_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l86_c45_cb2c_phase,
eval_opcode_phased_uxn_c_l86_c45_cb2c_ins,
eval_opcode_phased_uxn_c_l86_c45_cb2c_pc,
eval_opcode_phased_uxn_c_l86_c45_cb2c_previous_ram_read,
eval_opcode_phased_uxn_c_l86_c45_cb2c_previous_device_ram_read,
eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output);

-- MUX_uxn_c_l87_c8_0c6c
MUX_uxn_c_l87_c8_0c6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l87_c8_0c6c_cond,
MUX_uxn_c_l87_c8_0c6c_iftrue,
MUX_uxn_c_l87_c8_0c6c_iffalse,
MUX_uxn_c_l87_c8_0c6c_return_output);

-- BIN_OP_OR_uxn_c_l99_c6_b0c9
BIN_OP_OR_uxn_c_l99_c6_b0c9 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l99_c6_b0c9_left,
BIN_OP_OR_uxn_c_l99_c6_b0c9_right,
BIN_OP_OR_uxn_c_l99_c6_b0c9_return_output);

-- step_cpu_phase_MUX_uxn_c_l99_c2_fea5
step_cpu_phase_MUX_uxn_c_l99_c2_fea5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l99_c2_fea5_cond,
step_cpu_phase_MUX_uxn_c_l99_c2_fea5_iftrue,
step_cpu_phase_MUX_uxn_c_l99_c2_fea5_iffalse,
step_cpu_phase_MUX_uxn_c_l99_c2_fea5_return_output);

-- BIN_OP_EQ_uxn_c_l102_c21_818e
BIN_OP_EQ_uxn_c_l102_c21_818e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l102_c21_818e_left,
BIN_OP_EQ_uxn_c_l102_c21_818e_right,
BIN_OP_EQ_uxn_c_l102_c21_818e_return_output);

-- BIN_OP_PLUS_uxn_c_l102_c44_c913
BIN_OP_PLUS_uxn_c_l102_c44_c913 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l102_c44_c913_left,
BIN_OP_PLUS_uxn_c_l102_c44_c913_right,
BIN_OP_PLUS_uxn_c_l102_c44_c913_return_output);

-- MUX_uxn_c_l102_c21_b4f8
MUX_uxn_c_l102_c21_b4f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l102_c21_b4f8_cond,
MUX_uxn_c_l102_c21_b4f8_iftrue,
MUX_uxn_c_l102_c21_b4f8_iffalse,
MUX_uxn_c_l102_c21_b4f8_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_return_output);



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
 MUX_uxn_c_l71_c8_d46f_return_output,
 MUX_uxn_c_l72_c15_ee54_return_output,
 BIN_OP_EQ_uxn_c_l74_c6_777c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_return_output,
 is_waiting_MUX_uxn_c_l74_c2_95c3_return_output,
 is_ins_done_MUX_uxn_c_l74_c2_95c3_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_return_output,
 pc_MUX_uxn_c_l74_c2_95c3_return_output,
 ins_MUX_uxn_c_l74_c2_95c3_return_output,
 BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_return_output,
 is_waiting_MUX_uxn_c_l81_c7_35b5_return_output,
 is_ins_done_MUX_uxn_c_l81_c7_35b5_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_return_output,
 pc_MUX_uxn_c_l81_c7_35b5_return_output,
 ins_MUX_uxn_c_l81_c7_35b5_return_output,
 BIN_OP_PLUS_uxn_c_l82_c3_8c5a_return_output,
 BIN_OP_EQ_uxn_c_l85_c9_3960_return_output,
 MUX_uxn_c_l85_c9_e3d3_return_output,
 BIN_OP_MINUS_uxn_c_l86_c64_32fa_return_output,
 eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output,
 MUX_uxn_c_l87_c8_0c6c_return_output,
 BIN_OP_OR_uxn_c_l99_c6_b0c9_return_output,
 step_cpu_phase_MUX_uxn_c_l99_c2_fea5_return_output,
 BIN_OP_EQ_uxn_c_l102_c21_818e_return_output,
 BIN_OP_PLUS_uxn_c_l102_c44_c913_return_output,
 MUX_uxn_c_l102_c21_b4f8_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l71_c8_d46f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l71_c8_d46f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l71_c8_d46f_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l71_c8_d46f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l72_c15_ee54_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l72_c15_ee54_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l72_c15_ee54_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l72_c15_ee54_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_95c3_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_95c3_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_35b5_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_95c3_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_95c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l81_c7_35b5_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l81_c7_35b5_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l82_c3_4981 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_35b5_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_35b5_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_35b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_8c5a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_8c5a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_8c5a_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_e3d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l85_c9_3960_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l85_c9_3960_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l85_c9_3960_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_e3d3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_e3d3_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_e3d3_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_result : eval_opcode_result_t;
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c64_32fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c64_32fa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c64_32fa_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l87_c8_0c6c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_bd7d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_0c6c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_0c6c_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_0c6c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l88_c34_367b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l90_c35_46ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l91_c38_de6e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l92_c40_e6c3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l93_c41_3201_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l94_c30_0b52_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l95_c16_f3c3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l96_c17_24d2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l99_c6_b0c9_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l99_c6_b0c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l99_c6_b0c9_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_fea5_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l100_c3_bce2 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_fea5_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_fea5_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_fea5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_b4f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c21_818e_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l102_c21_429a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c21_818e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c21_818e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_b4f8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_b4f8_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c44_c913_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c44_c913_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c44_c913_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_b4f8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l81_l74_DUPLICATE_79ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l74_l81_DUPLICATE_aa39_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l81_l74_DUPLICATE_90ae_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l87_l89_DUPLICATE_e80a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_65f3_uxn_c_l63_l105_DUPLICATE_b7bf_return_output : cpu_step_result_t;
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
     VAR_MUX_uxn_c_l72_c15_ee54_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l85_c9_3960_right := to_unsigned(2, 2);
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l102_c44_c913_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l102_c21_818e_right := to_unsigned(0, 1);
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l102_c21_b4f8_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_8c5a_right := to_unsigned(1, 1);
     VAR_step_cpu_phase_uxn_c_l100_c3_bce2 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_fea5_iftrue := VAR_step_cpu_phase_uxn_c_l100_c3_bce2;
     VAR_is_ins_done_MUX_uxn_c_l74_c2_95c3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l86_c64_32fa_right := to_unsigned(2, 2);
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_iffalse := VAR_CLOCK_ENABLE;
     VAR_MUX_uxn_c_l85_c9_e3d3_iffalse := ins;
     VAR_ins_MUX_uxn_c_l74_c2_95c3_iftrue := ins;
     VAR_ins_MUX_uxn_c_l81_c7_35b5_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l81_c7_35b5_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_right := is_waiting;
     VAR_MUX_uxn_c_l72_c15_ee54_iffalse := is_waiting;
     VAR_MUX_uxn_c_l71_c8_d46f_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l85_c9_e3d3_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l85_c9_3960_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l86_c64_32fa_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l102_c44_c913_left := step_cpu_phase;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_left := VAR_use_vector;
     VAR_MUX_uxn_c_l72_c15_ee54_cond := VAR_use_vector;
     VAR_MUX_uxn_c_l71_c8_d46f_iftrue := VAR_vector;
     -- cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l81_c7_35b5] LATENCY=0
     VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l81_c7_35b5_return_output := cpu_step_result.is_ram_write;

     -- BIN_OP_EQ[uxn_c_l81_c11_1b3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l81_c11_1b3b_left <= VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_left;
     BIN_OP_EQ_uxn_c_l81_c11_1b3b_right <= VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output := BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output;

     -- BIN_OP_EQ[uxn_c_l85_c9_3960] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l85_c9_3960_left <= VAR_BIN_OP_EQ_uxn_c_l85_c9_3960_left;
     BIN_OP_EQ_uxn_c_l85_c9_3960_right <= VAR_BIN_OP_EQ_uxn_c_l85_c9_3960_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l85_c9_3960_return_output := BIN_OP_EQ_uxn_c_l85_c9_3960_return_output;

     -- MUX[uxn_c_l72_c15_ee54] LATENCY=0
     -- Inputs
     MUX_uxn_c_l72_c15_ee54_cond <= VAR_MUX_uxn_c_l72_c15_ee54_cond;
     MUX_uxn_c_l72_c15_ee54_iftrue <= VAR_MUX_uxn_c_l72_c15_ee54_iftrue;
     MUX_uxn_c_l72_c15_ee54_iffalse <= VAR_MUX_uxn_c_l72_c15_ee54_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l72_c15_ee54_return_output := MUX_uxn_c_l72_c15_ee54_return_output;

     -- BIN_OP_PLUS[uxn_c_l102_c44_c913] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l102_c44_c913_left <= VAR_BIN_OP_PLUS_uxn_c_l102_c44_c913_left;
     BIN_OP_PLUS_uxn_c_l102_c44_c913_right <= VAR_BIN_OP_PLUS_uxn_c_l102_c44_c913_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l102_c44_c913_return_output := BIN_OP_PLUS_uxn_c_l102_c44_c913_return_output;

     -- cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l81_c7_35b5] LATENCY=0
     VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l81_c7_35b5_return_output := cpu_step_result.is_vram_write;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l81_l74_DUPLICATE_79ea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l81_l74_DUPLICATE_79ea_return_output := cpu_step_result.vram_write_layer;

     -- cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l81_c7_35b5] LATENCY=0
     VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l81_c7_35b5_return_output := cpu_step_result.u16_addr;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l81_l74_DUPLICATE_90ae LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l81_l74_DUPLICATE_90ae_return_output := cpu_step_result.u8_value;

     -- BIN_OP_MINUS[uxn_c_l86_c64_32fa] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l86_c64_32fa_left <= VAR_BIN_OP_MINUS_uxn_c_l86_c64_32fa_left;
     BIN_OP_MINUS_uxn_c_l86_c64_32fa_right <= VAR_BIN_OP_MINUS_uxn_c_l86_c64_32fa_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l86_c64_32fa_return_output := BIN_OP_MINUS_uxn_c_l86_c64_32fa_return_output;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l74_l81_DUPLICATE_aa39 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l74_l81_DUPLICATE_aa39_return_output := cpu_step_result.device_ram_address;

     -- cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l81_c7_35b5] LATENCY=0
     VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l81_c7_35b5_return_output := cpu_step_result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_c_l74_c6_777c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l74_c6_777c_left <= VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_left;
     BIN_OP_EQ_uxn_c_l74_c6_777c_right <= VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_return_output := BIN_OP_EQ_uxn_c_l74_c6_777c_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l71_c8_d46f_cond := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_return_output;
     VAR_ins_MUX_uxn_c_l74_c2_95c3_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c2_95c3_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_return_output;
     VAR_is_waiting_MUX_uxn_c_l74_c2_95c3_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_return_output;
     VAR_pc_MUX_uxn_c_l74_c2_95c3_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_777c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output;
     VAR_ins_MUX_uxn_c_l81_c7_35b5_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output;
     VAR_is_ins_done_MUX_uxn_c_l81_c7_35b5_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output;
     VAR_is_waiting_MUX_uxn_c_l81_c7_35b5_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output;
     VAR_pc_MUX_uxn_c_l81_c7_35b5_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_1b3b_return_output;
     VAR_MUX_uxn_c_l85_c9_e3d3_cond := VAR_BIN_OP_EQ_uxn_c_l85_c9_3960_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_phase := VAR_BIN_OP_MINUS_uxn_c_l86_c64_32fa_return_output;
     VAR_MUX_uxn_c_l102_c21_b4f8_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l102_c44_c913_return_output, 8);
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l81_l74_DUPLICATE_79ea_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l81_l74_DUPLICATE_79ea_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l74_l81_DUPLICATE_aa39_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l74_l81_DUPLICATE_aa39_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l81_l74_DUPLICATE_90ae_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l81_l74_DUPLICATE_90ae_return_output;
     VAR_is_waiting_MUX_uxn_c_l74_c2_95c3_iftrue := VAR_MUX_uxn_c_l72_c15_ee54_return_output;
     VAR_is_waiting_MUX_uxn_c_l81_c7_35b5_iftrue := VAR_MUX_uxn_c_l72_c15_ee54_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_iftrue := VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l81_c7_35b5_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_iftrue := VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l81_c7_35b5_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_iftrue := VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l81_c7_35b5_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_iftrue := VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l81_c7_35b5_return_output;
     -- MUX[uxn_c_l85_c9_e3d3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l85_c9_e3d3_cond <= VAR_MUX_uxn_c_l85_c9_e3d3_cond;
     MUX_uxn_c_l85_c9_e3d3_iftrue <= VAR_MUX_uxn_c_l85_c9_e3d3_iftrue;
     MUX_uxn_c_l85_c9_e3d3_iffalse <= VAR_MUX_uxn_c_l85_c9_e3d3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l85_c9_e3d3_return_output := MUX_uxn_c_l85_c9_e3d3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c7_35b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_return_output;

     -- MUX[uxn_c_l71_c8_d46f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l71_c8_d46f_cond <= VAR_MUX_uxn_c_l71_c8_d46f_cond;
     MUX_uxn_c_l71_c8_d46f_iftrue <= VAR_MUX_uxn_c_l71_c8_d46f_iftrue;
     MUX_uxn_c_l71_c8_d46f_iffalse <= VAR_MUX_uxn_c_l71_c8_d46f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l71_c8_d46f_return_output := MUX_uxn_c_l71_c8_d46f_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_35b5_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_8c5a_left := VAR_MUX_uxn_c_l71_c8_d46f_return_output;
     VAR_MUX_uxn_c_l87_c8_0c6c_iffalse := VAR_MUX_uxn_c_l71_c8_d46f_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_iftrue := VAR_MUX_uxn_c_l71_c8_d46f_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_pc := VAR_MUX_uxn_c_l71_c8_d46f_return_output;
     VAR_pc_MUX_uxn_c_l74_c2_95c3_iftrue := VAR_MUX_uxn_c_l71_c8_d46f_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_ins := VAR_MUX_uxn_c_l85_c9_e3d3_return_output;
     VAR_ins_MUX_uxn_c_l81_c7_35b5_iffalse := VAR_MUX_uxn_c_l85_c9_e3d3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l84_c1_cffc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_return_output;

     -- ins_MUX[uxn_c_l81_c7_35b5] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l81_c7_35b5_cond <= VAR_ins_MUX_uxn_c_l81_c7_35b5_cond;
     ins_MUX_uxn_c_l81_c7_35b5_iftrue <= VAR_ins_MUX_uxn_c_l81_c7_35b5_iftrue;
     ins_MUX_uxn_c_l81_c7_35b5_iffalse <= VAR_ins_MUX_uxn_c_l81_c7_35b5_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l81_c7_35b5_return_output := ins_MUX_uxn_c_l81_c7_35b5_return_output;

     -- BIN_OP_PLUS[uxn_c_l82_c3_8c5a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l82_c3_8c5a_left <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_8c5a_left;
     BIN_OP_PLUS_uxn_c_l82_c3_8c5a_right <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_8c5a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_8c5a_return_output := BIN_OP_PLUS_uxn_c_l82_c3_8c5a_return_output;

     -- Submodule level 3
     VAR_pc_uxn_c_l82_c3_4981 := resize(VAR_BIN_OP_PLUS_uxn_c_l82_c3_8c5a_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_cffc_return_output;
     VAR_ins_MUX_uxn_c_l74_c2_95c3_iffalse := VAR_ins_MUX_uxn_c_l81_c7_35b5_return_output;
     VAR_pc_MUX_uxn_c_l81_c7_35b5_iftrue := VAR_pc_uxn_c_l82_c3_4981;
     -- ins_MUX[uxn_c_l74_c2_95c3] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l74_c2_95c3_cond <= VAR_ins_MUX_uxn_c_l74_c2_95c3_cond;
     ins_MUX_uxn_c_l74_c2_95c3_iftrue <= VAR_ins_MUX_uxn_c_l74_c2_95c3_iftrue;
     ins_MUX_uxn_c_l74_c2_95c3_iffalse <= VAR_ins_MUX_uxn_c_l74_c2_95c3_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l74_c2_95c3_return_output := ins_MUX_uxn_c_l74_c2_95c3_return_output;

     -- eval_opcode_phased[uxn_c_l86_c45_cb2c] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l86_c45_cb2c_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l86_c45_cb2c_phase <= VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_phase;
     eval_opcode_phased_uxn_c_l86_c45_cb2c_ins <= VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_ins;
     eval_opcode_phased_uxn_c_l86_c45_cb2c_pc <= VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_pc;
     eval_opcode_phased_uxn_c_l86_c45_cb2c_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_previous_ram_read;
     eval_opcode_phased_uxn_c_l86_c45_cb2c_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output := eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output;

     -- Submodule level 4
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l74_c2_95c3_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l91_c38_de6e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l91_c38_de6e_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l96_c17_24d2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l96_c17_24d2_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l87_l89_DUPLICATE_e80a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l87_l89_DUPLICATE_e80a_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l95_c16_f3c3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l95_c16_f3c3_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l93_c41_3201] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l93_c41_3201_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l87_c8_bd7d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_bd7d_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l88_c34_367b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l88_c34_367b_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l92_c40_e6c3] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l92_c40_e6c3_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output.device_ram_address;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l94_c30_0b52] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l94_c30_0b52_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l90_c35_46ab] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l90_c35_46ab_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_cb2c_return_output.is_vram_write;

     -- Submodule level 5
     VAR_MUX_uxn_c_l87_c8_0c6c_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l87_l89_DUPLICATE_e80a_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_iffalse := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l87_l89_DUPLICATE_e80a_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l93_c41_3201_return_output;
     VAR_is_ins_done_MUX_uxn_c_l81_c7_35b5_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l96_c17_24d2_return_output;
     VAR_MUX_uxn_c_l87_c8_0c6c_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_bd7d_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l88_c34_367b_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l90_c35_46ab_return_output;
     VAR_is_waiting_MUX_uxn_c_l81_c7_35b5_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l95_c16_f3c3_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l91_c38_de6e_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l92_c40_e6c3_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l94_c30_0b52_return_output;
     -- cpu_step_result_is_vram_write_MUX[uxn_c_l81_c7_35b5] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_return_output;

     -- is_ins_done_MUX[uxn_c_l81_c7_35b5] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l81_c7_35b5_cond <= VAR_is_ins_done_MUX_uxn_c_l81_c7_35b5_cond;
     is_ins_done_MUX_uxn_c_l81_c7_35b5_iftrue <= VAR_is_ins_done_MUX_uxn_c_l81_c7_35b5_iftrue;
     is_ins_done_MUX_uxn_c_l81_c7_35b5_iffalse <= VAR_is_ins_done_MUX_uxn_c_l81_c7_35b5_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l81_c7_35b5_return_output := is_ins_done_MUX_uxn_c_l81_c7_35b5_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l81_c7_35b5] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l81_c7_35b5] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l81_c7_35b5] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l81_c7_35b5] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l81_c7_35b5] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_return_output := cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l81_c7_35b5] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_return_output;

     -- is_waiting_MUX[uxn_c_l81_c7_35b5] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l81_c7_35b5_cond <= VAR_is_waiting_MUX_uxn_c_l81_c7_35b5_cond;
     is_waiting_MUX_uxn_c_l81_c7_35b5_iftrue <= VAR_is_waiting_MUX_uxn_c_l81_c7_35b5_iftrue;
     is_waiting_MUX_uxn_c_l81_c7_35b5_iffalse <= VAR_is_waiting_MUX_uxn_c_l81_c7_35b5_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l81_c7_35b5_return_output := is_waiting_MUX_uxn_c_l81_c7_35b5_return_output;

     -- MUX[uxn_c_l87_c8_0c6c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l87_c8_0c6c_cond <= VAR_MUX_uxn_c_l87_c8_0c6c_cond;
     MUX_uxn_c_l87_c8_0c6c_iftrue <= VAR_MUX_uxn_c_l87_c8_0c6c_iftrue;
     MUX_uxn_c_l87_c8_0c6c_iffalse <= VAR_MUX_uxn_c_l87_c8_0c6c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l87_c8_0c6c_return_output := MUX_uxn_c_l87_c8_0c6c_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l81_c7_35b5_iffalse := VAR_MUX_uxn_c_l87_c8_0c6c_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_iffalse := VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_35b5_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_iffalse := VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_35b5_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_iffalse := VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_35b5_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_iffalse := VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_35b5_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_iffalse := VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_35b5_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_iffalse := VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_35b5_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_iffalse := VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_35b5_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c2_95c3_iffalse := VAR_is_ins_done_MUX_uxn_c_l81_c7_35b5_return_output;
     VAR_is_waiting_MUX_uxn_c_l74_c2_95c3_iffalse := VAR_is_waiting_MUX_uxn_c_l81_c7_35b5_return_output;
     -- cpu_step_result_is_vram_write_MUX[uxn_c_l74_c2_95c3] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_return_output;

     -- is_waiting_MUX[uxn_c_l74_c2_95c3] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l74_c2_95c3_cond <= VAR_is_waiting_MUX_uxn_c_l74_c2_95c3_cond;
     is_waiting_MUX_uxn_c_l74_c2_95c3_iftrue <= VAR_is_waiting_MUX_uxn_c_l74_c2_95c3_iftrue;
     is_waiting_MUX_uxn_c_l74_c2_95c3_iffalse <= VAR_is_waiting_MUX_uxn_c_l74_c2_95c3_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l74_c2_95c3_return_output := is_waiting_MUX_uxn_c_l74_c2_95c3_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l74_c2_95c3] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l74_c2_95c3] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_return_output;

     -- pc_MUX[uxn_c_l81_c7_35b5] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l81_c7_35b5_cond <= VAR_pc_MUX_uxn_c_l81_c7_35b5_cond;
     pc_MUX_uxn_c_l81_c7_35b5_iftrue <= VAR_pc_MUX_uxn_c_l81_c7_35b5_iftrue;
     pc_MUX_uxn_c_l81_c7_35b5_iffalse <= VAR_pc_MUX_uxn_c_l81_c7_35b5_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l81_c7_35b5_return_output := pc_MUX_uxn_c_l81_c7_35b5_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l74_c2_95c3] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_return_output := cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l74_c2_95c3] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l74_c2_95c3] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_return_output;

     -- is_ins_done_MUX[uxn_c_l74_c2_95c3] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l74_c2_95c3_cond <= VAR_is_ins_done_MUX_uxn_c_l74_c2_95c3_cond;
     is_ins_done_MUX_uxn_c_l74_c2_95c3_iftrue <= VAR_is_ins_done_MUX_uxn_c_l74_c2_95c3_iftrue;
     is_ins_done_MUX_uxn_c_l74_c2_95c3_iffalse <= VAR_is_ins_done_MUX_uxn_c_l74_c2_95c3_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l74_c2_95c3_return_output := is_ins_done_MUX_uxn_c_l74_c2_95c3_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l74_c2_95c3] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_c_l99_c6_b0c9_left := VAR_is_ins_done_MUX_uxn_c_l74_c2_95c3_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l74_c2_95c3_return_output;
     VAR_BIN_OP_OR_uxn_c_l99_c6_b0c9_right := VAR_is_waiting_MUX_uxn_c_l74_c2_95c3_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l74_c2_95c3_return_output;
     VAR_pc_MUX_uxn_c_l74_c2_95c3_iffalse := VAR_pc_MUX_uxn_c_l81_c7_35b5_return_output;
     -- CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_65f3_uxn_c_l63_l105_DUPLICATE_b7bf LATENCY=0
     VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_65f3_uxn_c_l63_l105_DUPLICATE_b7bf_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_65f3(
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_dc56_return_output,
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_95c3_return_output,
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_95c3_return_output,
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_95c3_return_output,
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_95c3_return_output,
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_95c3_return_output,
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_95c3_return_output,
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_95c3_return_output);

     -- pc_MUX[uxn_c_l74_c2_95c3] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l74_c2_95c3_cond <= VAR_pc_MUX_uxn_c_l74_c2_95c3_cond;
     pc_MUX_uxn_c_l74_c2_95c3_iftrue <= VAR_pc_MUX_uxn_c_l74_c2_95c3_iftrue;
     pc_MUX_uxn_c_l74_c2_95c3_iffalse <= VAR_pc_MUX_uxn_c_l74_c2_95c3_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l74_c2_95c3_return_output := pc_MUX_uxn_c_l74_c2_95c3_return_output;

     -- BIN_OP_OR[uxn_c_l99_c6_b0c9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l99_c6_b0c9_left <= VAR_BIN_OP_OR_uxn_c_l99_c6_b0c9_left;
     BIN_OP_OR_uxn_c_l99_c6_b0c9_right <= VAR_BIN_OP_OR_uxn_c_l99_c6_b0c9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l99_c6_b0c9_return_output := BIN_OP_OR_uxn_c_l99_c6_b0c9_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_fea5_cond := VAR_BIN_OP_OR_uxn_c_l99_c6_b0c9_return_output;
     REG_VAR_cpu_step_result := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_65f3_uxn_c_l63_l105_DUPLICATE_b7bf_return_output;
     VAR_return_output := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_65f3_uxn_c_l63_l105_DUPLICATE_b7bf_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l74_c2_95c3_return_output;
     -- uint16_15_8[uxn_c_l102_c21_429a] LATENCY=0
     VAR_uint16_15_8_uxn_c_l102_c21_429a_return_output := uint16_15_8(
     VAR_pc_MUX_uxn_c_l74_c2_95c3_return_output);

     -- Submodule level 9
     VAR_BIN_OP_EQ_uxn_c_l102_c21_818e_left := VAR_uint16_15_8_uxn_c_l102_c21_429a_return_output;
     -- BIN_OP_EQ[uxn_c_l102_c21_818e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l102_c21_818e_left <= VAR_BIN_OP_EQ_uxn_c_l102_c21_818e_left;
     BIN_OP_EQ_uxn_c_l102_c21_818e_right <= VAR_BIN_OP_EQ_uxn_c_l102_c21_818e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l102_c21_818e_return_output := BIN_OP_EQ_uxn_c_l102_c21_818e_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l102_c21_b4f8_cond := VAR_BIN_OP_EQ_uxn_c_l102_c21_818e_return_output;
     -- MUX[uxn_c_l102_c21_b4f8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l102_c21_b4f8_cond <= VAR_MUX_uxn_c_l102_c21_b4f8_cond;
     MUX_uxn_c_l102_c21_b4f8_iftrue <= VAR_MUX_uxn_c_l102_c21_b4f8_iftrue;
     MUX_uxn_c_l102_c21_b4f8_iffalse <= VAR_MUX_uxn_c_l102_c21_b4f8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l102_c21_b4f8_return_output := MUX_uxn_c_l102_c21_b4f8_return_output;

     -- Submodule level 11
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_fea5_iffalse := VAR_MUX_uxn_c_l102_c21_b4f8_return_output;
     -- step_cpu_phase_MUX[uxn_c_l99_c2_fea5] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l99_c2_fea5_cond <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_fea5_cond;
     step_cpu_phase_MUX_uxn_c_l99_c2_fea5_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_fea5_iftrue;
     step_cpu_phase_MUX_uxn_c_l99_c2_fea5_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_fea5_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_fea5_return_output := step_cpu_phase_MUX_uxn_c_l99_c2_fea5_return_output;

     -- Submodule level 12
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l99_c2_fea5_return_output;
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
