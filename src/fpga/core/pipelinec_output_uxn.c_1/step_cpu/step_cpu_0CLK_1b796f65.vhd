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
entity step_cpu_0CLK_1b796f65 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 use_vector : in unsigned(0 downto 0);
 vector : in unsigned(15 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_1b796f65;
architecture arch of step_cpu_0CLK_1b796f65 is
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
-- MUX[uxn_c_l71_c8_dbd1]
signal MUX_uxn_c_l71_c8_dbd1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l71_c8_dbd1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l71_c8_dbd1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l71_c8_dbd1_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l72_c15_f61e]
signal MUX_uxn_c_l72_c15_f61e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l72_c15_f61e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l72_c15_f61e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l72_c15_f61e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l74_c6_b482]
signal BIN_OP_EQ_uxn_c_l74_c6_b482_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c6_b482_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c6_b482_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c7_7183]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l74_c2_ec3d]
signal is_ins_done_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l74_c2_ec3d]
signal ins_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l74_c2_ec3d]
signal pc_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(15 downto 0);

-- is_waiting_MUX[uxn_c_l74_c2_ec3d]
signal is_waiting_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l74_c2_ec3d]
signal cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l74_c2_ec3d]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(0 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l74_c2_ec3d]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(7 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l74_c2_ec3d]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l74_c2_ec3d]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l74_c2_ec3d]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(0 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l74_c2_ec3d]
signal cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l81_c11_acec]
signal BIN_OP_EQ_uxn_c_l81_c11_acec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c11_acec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c11_acec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l84_c1_dd85]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l81_c7_7183]
signal is_ins_done_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l81_c7_7183]
signal ins_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l81_c7_7183_return_output : unsigned(7 downto 0);

-- pc_MUX[uxn_c_l81_c7_7183]
signal pc_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l81_c7_7183_return_output : unsigned(15 downto 0);

-- is_waiting_MUX[uxn_c_l81_c7_7183]
signal is_waiting_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l81_c7_7183]
signal cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_return_output : unsigned(15 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l81_c7_7183]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l81_c7_7183]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_return_output : unsigned(7 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l81_c7_7183]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l81_c7_7183]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l81_c7_7183]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l81_c7_7183]
signal cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l82_c3_b060]
signal BIN_OP_PLUS_uxn_c_l82_c3_b060_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_b060_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_b060_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l85_c9_fe24]
signal BIN_OP_EQ_uxn_c_l85_c9_fe24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l85_c9_fe24_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l85_c9_fe24_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l85_c9_2178]
signal MUX_uxn_c_l85_c9_2178_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l85_c9_2178_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l85_c9_2178_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l85_c9_2178_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l86_c64_4cfd]
signal BIN_OP_MINUS_uxn_c_l86_c64_4cfd_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c64_4cfd_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c64_4cfd_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l86_c45_4976]
signal eval_opcode_phased_uxn_c_l86_c45_4976_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_4976_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_4976_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_4976_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_4976_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_4976_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_4976_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l87_c8_59c5]
signal MUX_uxn_c_l87_c8_59c5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l87_c8_59c5_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_59c5_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_59c5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l99_c6_02f6]
signal BIN_OP_OR_uxn_c_l99_c6_02f6_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l99_c6_02f6_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l99_c6_02f6_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l99_c2_f0ce]
signal step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l102_c21_54e5]
signal BIN_OP_EQ_uxn_c_l102_c21_54e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c21_54e5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c21_54e5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l102_c44_365b]
signal BIN_OP_PLUS_uxn_c_l102_c44_365b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c44_365b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c44_365b_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l102_c21_de45]
signal MUX_uxn_c_l102_c21_de45_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l102_c21_de45_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l102_c21_de45_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l102_c21_de45_return_output : unsigned(7 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_return_output : unsigned(0 downto 0);

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a9b2( ref_toks_0 : unsigned;
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
      base.u16_addr := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.vram_write_layer := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- MUX_uxn_c_l71_c8_dbd1
MUX_uxn_c_l71_c8_dbd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l71_c8_dbd1_cond,
MUX_uxn_c_l71_c8_dbd1_iftrue,
MUX_uxn_c_l71_c8_dbd1_iffalse,
MUX_uxn_c_l71_c8_dbd1_return_output);

-- MUX_uxn_c_l72_c15_f61e
MUX_uxn_c_l72_c15_f61e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l72_c15_f61e_cond,
MUX_uxn_c_l72_c15_f61e_iftrue,
MUX_uxn_c_l72_c15_f61e_iffalse,
MUX_uxn_c_l72_c15_f61e_return_output);

-- BIN_OP_EQ_uxn_c_l74_c6_b482
BIN_OP_EQ_uxn_c_l74_c6_b482 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l74_c6_b482_left,
BIN_OP_EQ_uxn_c_l74_c6_b482_right,
BIN_OP_EQ_uxn_c_l74_c6_b482_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_return_output);

-- is_ins_done_MUX_uxn_c_l74_c2_ec3d
is_ins_done_MUX_uxn_c_l74_c2_ec3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l74_c2_ec3d_cond,
is_ins_done_MUX_uxn_c_l74_c2_ec3d_iftrue,
is_ins_done_MUX_uxn_c_l74_c2_ec3d_iffalse,
is_ins_done_MUX_uxn_c_l74_c2_ec3d_return_output);

-- ins_MUX_uxn_c_l74_c2_ec3d
ins_MUX_uxn_c_l74_c2_ec3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l74_c2_ec3d_cond,
ins_MUX_uxn_c_l74_c2_ec3d_iftrue,
ins_MUX_uxn_c_l74_c2_ec3d_iffalse,
ins_MUX_uxn_c_l74_c2_ec3d_return_output);

-- pc_MUX_uxn_c_l74_c2_ec3d
pc_MUX_uxn_c_l74_c2_ec3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l74_c2_ec3d_cond,
pc_MUX_uxn_c_l74_c2_ec3d_iftrue,
pc_MUX_uxn_c_l74_c2_ec3d_iffalse,
pc_MUX_uxn_c_l74_c2_ec3d_return_output);

-- is_waiting_MUX_uxn_c_l74_c2_ec3d
is_waiting_MUX_uxn_c_l74_c2_ec3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l74_c2_ec3d_cond,
is_waiting_MUX_uxn_c_l74_c2_ec3d_iftrue,
is_waiting_MUX_uxn_c_l74_c2_ec3d_iffalse,
is_waiting_MUX_uxn_c_l74_c2_ec3d_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d
cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d
cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d
cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d
cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d
cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d
cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d
cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_cond,
cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_return_output);

-- BIN_OP_EQ_uxn_c_l81_c11_acec
BIN_OP_EQ_uxn_c_l81_c11_acec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l81_c11_acec_left,
BIN_OP_EQ_uxn_c_l81_c11_acec_right,
BIN_OP_EQ_uxn_c_l81_c11_acec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_return_output);

-- is_ins_done_MUX_uxn_c_l81_c7_7183
is_ins_done_MUX_uxn_c_l81_c7_7183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l81_c7_7183_cond,
is_ins_done_MUX_uxn_c_l81_c7_7183_iftrue,
is_ins_done_MUX_uxn_c_l81_c7_7183_iffalse,
is_ins_done_MUX_uxn_c_l81_c7_7183_return_output);

-- ins_MUX_uxn_c_l81_c7_7183
ins_MUX_uxn_c_l81_c7_7183 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l81_c7_7183_cond,
ins_MUX_uxn_c_l81_c7_7183_iftrue,
ins_MUX_uxn_c_l81_c7_7183_iffalse,
ins_MUX_uxn_c_l81_c7_7183_return_output);

-- pc_MUX_uxn_c_l81_c7_7183
pc_MUX_uxn_c_l81_c7_7183 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l81_c7_7183_cond,
pc_MUX_uxn_c_l81_c7_7183_iftrue,
pc_MUX_uxn_c_l81_c7_7183_iffalse,
pc_MUX_uxn_c_l81_c7_7183_return_output);

-- is_waiting_MUX_uxn_c_l81_c7_7183
is_waiting_MUX_uxn_c_l81_c7_7183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l81_c7_7183_cond,
is_waiting_MUX_uxn_c_l81_c7_7183_iftrue,
is_waiting_MUX_uxn_c_l81_c7_7183_iffalse,
is_waiting_MUX_uxn_c_l81_c7_7183_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183
cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183
cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183
cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183
cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183
cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183
cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183
cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_cond,
cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_return_output);

-- BIN_OP_PLUS_uxn_c_l82_c3_b060
BIN_OP_PLUS_uxn_c_l82_c3_b060 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l82_c3_b060_left,
BIN_OP_PLUS_uxn_c_l82_c3_b060_right,
BIN_OP_PLUS_uxn_c_l82_c3_b060_return_output);

-- BIN_OP_EQ_uxn_c_l85_c9_fe24
BIN_OP_EQ_uxn_c_l85_c9_fe24 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l85_c9_fe24_left,
BIN_OP_EQ_uxn_c_l85_c9_fe24_right,
BIN_OP_EQ_uxn_c_l85_c9_fe24_return_output);

-- MUX_uxn_c_l85_c9_2178
MUX_uxn_c_l85_c9_2178 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l85_c9_2178_cond,
MUX_uxn_c_l85_c9_2178_iftrue,
MUX_uxn_c_l85_c9_2178_iffalse,
MUX_uxn_c_l85_c9_2178_return_output);

-- BIN_OP_MINUS_uxn_c_l86_c64_4cfd
BIN_OP_MINUS_uxn_c_l86_c64_4cfd : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l86_c64_4cfd_left,
BIN_OP_MINUS_uxn_c_l86_c64_4cfd_right,
BIN_OP_MINUS_uxn_c_l86_c64_4cfd_return_output);

-- eval_opcode_phased_uxn_c_l86_c45_4976
eval_opcode_phased_uxn_c_l86_c45_4976 : entity work.eval_opcode_phased_0CLK_b68cbcdc port map (
clk,
eval_opcode_phased_uxn_c_l86_c45_4976_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l86_c45_4976_phase,
eval_opcode_phased_uxn_c_l86_c45_4976_ins,
eval_opcode_phased_uxn_c_l86_c45_4976_pc,
eval_opcode_phased_uxn_c_l86_c45_4976_previous_ram_read,
eval_opcode_phased_uxn_c_l86_c45_4976_previous_device_ram_read,
eval_opcode_phased_uxn_c_l86_c45_4976_return_output);

-- MUX_uxn_c_l87_c8_59c5
MUX_uxn_c_l87_c8_59c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l87_c8_59c5_cond,
MUX_uxn_c_l87_c8_59c5_iftrue,
MUX_uxn_c_l87_c8_59c5_iffalse,
MUX_uxn_c_l87_c8_59c5_return_output);

-- BIN_OP_OR_uxn_c_l99_c6_02f6
BIN_OP_OR_uxn_c_l99_c6_02f6 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l99_c6_02f6_left,
BIN_OP_OR_uxn_c_l99_c6_02f6_right,
BIN_OP_OR_uxn_c_l99_c6_02f6_return_output);

-- step_cpu_phase_MUX_uxn_c_l99_c2_f0ce
step_cpu_phase_MUX_uxn_c_l99_c2_f0ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_cond,
step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_iftrue,
step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_iffalse,
step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_return_output);

-- BIN_OP_EQ_uxn_c_l102_c21_54e5
BIN_OP_EQ_uxn_c_l102_c21_54e5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l102_c21_54e5_left,
BIN_OP_EQ_uxn_c_l102_c21_54e5_right,
BIN_OP_EQ_uxn_c_l102_c21_54e5_return_output);

-- BIN_OP_PLUS_uxn_c_l102_c44_365b
BIN_OP_PLUS_uxn_c_l102_c44_365b : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l102_c44_365b_left,
BIN_OP_PLUS_uxn_c_l102_c44_365b_right,
BIN_OP_PLUS_uxn_c_l102_c44_365b_return_output);

-- MUX_uxn_c_l102_c21_de45
MUX_uxn_c_l102_c21_de45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l102_c21_de45_cond,
MUX_uxn_c_l102_c21_de45_iftrue,
MUX_uxn_c_l102_c21_de45_iffalse,
MUX_uxn_c_l102_c21_de45_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_return_output);



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
 MUX_uxn_c_l71_c8_dbd1_return_output,
 MUX_uxn_c_l72_c15_f61e_return_output,
 BIN_OP_EQ_uxn_c_l74_c6_b482_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_return_output,
 is_ins_done_MUX_uxn_c_l74_c2_ec3d_return_output,
 ins_MUX_uxn_c_l74_c2_ec3d_return_output,
 pc_MUX_uxn_c_l74_c2_ec3d_return_output,
 is_waiting_MUX_uxn_c_l74_c2_ec3d_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_return_output,
 BIN_OP_EQ_uxn_c_l81_c11_acec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_return_output,
 is_ins_done_MUX_uxn_c_l81_c7_7183_return_output,
 ins_MUX_uxn_c_l81_c7_7183_return_output,
 pc_MUX_uxn_c_l81_c7_7183_return_output,
 is_waiting_MUX_uxn_c_l81_c7_7183_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_return_output,
 BIN_OP_PLUS_uxn_c_l82_c3_b060_return_output,
 BIN_OP_EQ_uxn_c_l85_c9_fe24_return_output,
 MUX_uxn_c_l85_c9_2178_return_output,
 BIN_OP_MINUS_uxn_c_l86_c64_4cfd_return_output,
 eval_opcode_phased_uxn_c_l86_c45_4976_return_output,
 MUX_uxn_c_l87_c8_59c5_return_output,
 BIN_OP_OR_uxn_c_l99_c6_02f6_return_output,
 step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_return_output,
 BIN_OP_EQ_uxn_c_l102_c21_54e5_return_output,
 BIN_OP_PLUS_uxn_c_l102_c44_365b_return_output,
 MUX_uxn_c_l102_c21_de45_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l71_c8_dbd1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l71_c8_dbd1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l71_c8_dbd1_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l71_c8_dbd1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l72_c15_f61e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l72_c15_f61e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l72_c15_f61e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l72_c15_f61e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_7183_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_7183_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l82_c3_4b4f : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l81_c7_7183_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l81_c7_7183_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_b060_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_b060_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_b060_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_2178_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l85_c9_fe24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l85_c9_fe24_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l85_c9_fe24_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_2178_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_2178_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_2178_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_result : eval_opcode_result_t;
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_4976_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_4976_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_4976_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_4976_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_4976_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c64_4cfd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c64_4cfd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c64_4cfd_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_4976_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_4976_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l87_c8_59c5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_7319_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_59c5_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_59c5_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_59c5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l88_c34_4385_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l90_c35_e1e6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l91_c38_4ec2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l92_c40_d546_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l93_c41_ace0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l94_c30_e51b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l95_c16_267d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l96_c17_60a2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l99_c6_02f6_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l99_c6_02f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l99_c6_02f6_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l100_c3_546f : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_de45_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c21_54e5_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l102_c21_3388_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c21_54e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c21_54e5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_de45_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_de45_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c44_365b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c44_365b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c44_365b_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_de45_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l74_l81_DUPLICATE_422e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l74_l81_DUPLICATE_deb8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l74_l81_DUPLICATE_ac0f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l87_l89_DUPLICATE_dd49_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a9b2_uxn_c_l105_l63_DUPLICATE_e94c_return_output : cpu_step_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_b060_right := to_unsigned(1, 1);
     VAR_is_ins_done_MUX_uxn_c_l74_c2_ec3d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l86_c64_4cfd_right := to_unsigned(2, 2);
     VAR_MUX_uxn_c_l102_c21_de45_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_iftrue := to_unsigned(0, 1);
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_iftrue := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l100_c3_546f := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_iftrue := VAR_step_cpu_phase_uxn_c_l100_c3_546f;
     VAR_BIN_OP_EQ_uxn_c_l102_c21_54e5_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l85_c9_fe24_right := to_unsigned(2, 2);
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l72_c15_f61e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l102_c44_365b_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_right := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_iffalse := VAR_CLOCK_ENABLE;
     VAR_MUX_uxn_c_l85_c9_2178_iffalse := ins;
     VAR_ins_MUX_uxn_c_l74_c2_ec3d_iftrue := ins;
     VAR_ins_MUX_uxn_c_l81_c7_7183_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l81_c7_7183_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_right := is_waiting;
     VAR_MUX_uxn_c_l72_c15_f61e_iffalse := is_waiting;
     VAR_MUX_uxn_c_l71_c8_dbd1_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l86_c45_4976_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l85_c9_2178_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l86_c45_4976_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l85_c9_fe24_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l86_c64_4cfd_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l102_c44_365b_left := step_cpu_phase;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_left := VAR_use_vector;
     VAR_MUX_uxn_c_l72_c15_f61e_cond := VAR_use_vector;
     VAR_MUX_uxn_c_l71_c8_dbd1_iftrue := VAR_vector;
     -- MUX[uxn_c_l72_c15_f61e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l72_c15_f61e_cond <= VAR_MUX_uxn_c_l72_c15_f61e_cond;
     MUX_uxn_c_l72_c15_f61e_iftrue <= VAR_MUX_uxn_c_l72_c15_f61e_iftrue;
     MUX_uxn_c_l72_c15_f61e_iffalse <= VAR_MUX_uxn_c_l72_c15_f61e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l72_c15_f61e_return_output := MUX_uxn_c_l72_c15_f61e_return_output;

     -- cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l81_c7_7183] LATENCY=0
     VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l81_c7_7183_return_output := cpu_step_result.u16_addr;

     -- cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l81_c7_7183] LATENCY=0
     VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l81_c7_7183_return_output := cpu_step_result.is_vram_write;

     -- cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l81_c7_7183] LATENCY=0
     VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l81_c7_7183_return_output := cpu_step_result.is_ram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l74_l81_DUPLICATE_deb8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l74_l81_DUPLICATE_deb8_return_output := cpu_step_result.vram_write_layer;

     -- BIN_OP_EQ[uxn_c_l81_c11_acec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l81_c11_acec_left <= VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_left;
     BIN_OP_EQ_uxn_c_l81_c11_acec_right <= VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_return_output := BIN_OP_EQ_uxn_c_l81_c11_acec_return_output;

     -- BIN_OP_PLUS[uxn_c_l102_c44_365b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l102_c44_365b_left <= VAR_BIN_OP_PLUS_uxn_c_l102_c44_365b_left;
     BIN_OP_PLUS_uxn_c_l102_c44_365b_right <= VAR_BIN_OP_PLUS_uxn_c_l102_c44_365b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l102_c44_365b_return_output := BIN_OP_PLUS_uxn_c_l102_c44_365b_return_output;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l74_l81_DUPLICATE_422e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l74_l81_DUPLICATE_422e_return_output := cpu_step_result.device_ram_address;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l74_l81_DUPLICATE_ac0f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l74_l81_DUPLICATE_ac0f_return_output := cpu_step_result.u8_value;

     -- BIN_OP_EQ[uxn_c_l85_c9_fe24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l85_c9_fe24_left <= VAR_BIN_OP_EQ_uxn_c_l85_c9_fe24_left;
     BIN_OP_EQ_uxn_c_l85_c9_fe24_right <= VAR_BIN_OP_EQ_uxn_c_l85_c9_fe24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l85_c9_fe24_return_output := BIN_OP_EQ_uxn_c_l85_c9_fe24_return_output;

     -- BIN_OP_MINUS[uxn_c_l86_c64_4cfd] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l86_c64_4cfd_left <= VAR_BIN_OP_MINUS_uxn_c_l86_c64_4cfd_left;
     BIN_OP_MINUS_uxn_c_l86_c64_4cfd_right <= VAR_BIN_OP_MINUS_uxn_c_l86_c64_4cfd_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l86_c64_4cfd_return_output := BIN_OP_MINUS_uxn_c_l86_c64_4cfd_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_return_output;

     -- BIN_OP_EQ[uxn_c_l74_c6_b482] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l74_c6_b482_left <= VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_left;
     BIN_OP_EQ_uxn_c_l74_c6_b482_right <= VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_return_output := BIN_OP_EQ_uxn_c_l74_c6_b482_return_output;

     -- cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l81_c7_7183] LATENCY=0
     VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l81_c7_7183_return_output := cpu_step_result.is_device_ram_write;

     -- Submodule level 1
     VAR_MUX_uxn_c_l71_c8_dbd1_cond := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_return_output;
     VAR_ins_MUX_uxn_c_l74_c2_ec3d_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c2_ec3d_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_return_output;
     VAR_is_waiting_MUX_uxn_c_l74_c2_ec3d_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_return_output;
     VAR_pc_MUX_uxn_c_l74_c2_ec3d_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_b482_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_return_output;
     VAR_ins_MUX_uxn_c_l81_c7_7183_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_return_output;
     VAR_is_ins_done_MUX_uxn_c_l81_c7_7183_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_return_output;
     VAR_is_waiting_MUX_uxn_c_l81_c7_7183_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_return_output;
     VAR_pc_MUX_uxn_c_l81_c7_7183_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_acec_return_output;
     VAR_MUX_uxn_c_l85_c9_2178_cond := VAR_BIN_OP_EQ_uxn_c_l85_c9_fe24_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c45_4976_phase := VAR_BIN_OP_MINUS_uxn_c_l86_c64_4cfd_return_output;
     VAR_MUX_uxn_c_l102_c21_de45_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l102_c44_365b_return_output, 8);
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l74_l81_DUPLICATE_deb8_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l74_l81_DUPLICATE_deb8_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l74_l81_DUPLICATE_422e_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l74_l81_DUPLICATE_422e_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l74_l81_DUPLICATE_ac0f_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l74_l81_DUPLICATE_ac0f_return_output;
     VAR_is_waiting_MUX_uxn_c_l74_c2_ec3d_iftrue := VAR_MUX_uxn_c_l72_c15_f61e_return_output;
     VAR_is_waiting_MUX_uxn_c_l81_c7_7183_iftrue := VAR_MUX_uxn_c_l72_c15_f61e_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_iftrue := VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l81_c7_7183_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_iftrue := VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l81_c7_7183_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_iftrue := VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l81_c7_7183_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_iftrue := VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l81_c7_7183_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c7_7183] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_return_output;

     -- MUX[uxn_c_l85_c9_2178] LATENCY=0
     -- Inputs
     MUX_uxn_c_l85_c9_2178_cond <= VAR_MUX_uxn_c_l85_c9_2178_cond;
     MUX_uxn_c_l85_c9_2178_iftrue <= VAR_MUX_uxn_c_l85_c9_2178_iftrue;
     MUX_uxn_c_l85_c9_2178_iffalse <= VAR_MUX_uxn_c_l85_c9_2178_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l85_c9_2178_return_output := MUX_uxn_c_l85_c9_2178_return_output;

     -- MUX[uxn_c_l71_c8_dbd1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l71_c8_dbd1_cond <= VAR_MUX_uxn_c_l71_c8_dbd1_cond;
     MUX_uxn_c_l71_c8_dbd1_iftrue <= VAR_MUX_uxn_c_l71_c8_dbd1_iftrue;
     MUX_uxn_c_l71_c8_dbd1_iffalse <= VAR_MUX_uxn_c_l71_c8_dbd1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l71_c8_dbd1_return_output := MUX_uxn_c_l71_c8_dbd1_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_7183_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_b060_left := VAR_MUX_uxn_c_l71_c8_dbd1_return_output;
     VAR_MUX_uxn_c_l87_c8_59c5_iffalse := VAR_MUX_uxn_c_l71_c8_dbd1_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_iftrue := VAR_MUX_uxn_c_l71_c8_dbd1_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c45_4976_pc := VAR_MUX_uxn_c_l71_c8_dbd1_return_output;
     VAR_pc_MUX_uxn_c_l74_c2_ec3d_iftrue := VAR_MUX_uxn_c_l71_c8_dbd1_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c45_4976_ins := VAR_MUX_uxn_c_l85_c9_2178_return_output;
     VAR_ins_MUX_uxn_c_l81_c7_7183_iffalse := VAR_MUX_uxn_c_l85_c9_2178_return_output;
     -- ins_MUX[uxn_c_l81_c7_7183] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l81_c7_7183_cond <= VAR_ins_MUX_uxn_c_l81_c7_7183_cond;
     ins_MUX_uxn_c_l81_c7_7183_iftrue <= VAR_ins_MUX_uxn_c_l81_c7_7183_iftrue;
     ins_MUX_uxn_c_l81_c7_7183_iffalse <= VAR_ins_MUX_uxn_c_l81_c7_7183_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l81_c7_7183_return_output := ins_MUX_uxn_c_l81_c7_7183_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l84_c1_dd85] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_return_output;

     -- BIN_OP_PLUS[uxn_c_l82_c3_b060] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l82_c3_b060_left <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_b060_left;
     BIN_OP_PLUS_uxn_c_l82_c3_b060_right <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_b060_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_b060_return_output := BIN_OP_PLUS_uxn_c_l82_c3_b060_return_output;

     -- Submodule level 3
     VAR_pc_uxn_c_l82_c3_4b4f := resize(VAR_BIN_OP_PLUS_uxn_c_l82_c3_b060_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l86_c45_4976_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_dd85_return_output;
     VAR_ins_MUX_uxn_c_l74_c2_ec3d_iffalse := VAR_ins_MUX_uxn_c_l81_c7_7183_return_output;
     VAR_pc_MUX_uxn_c_l81_c7_7183_iftrue := VAR_pc_uxn_c_l82_c3_4b4f;
     -- eval_opcode_phased[uxn_c_l86_c45_4976] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l86_c45_4976_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l86_c45_4976_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l86_c45_4976_phase <= VAR_eval_opcode_phased_uxn_c_l86_c45_4976_phase;
     eval_opcode_phased_uxn_c_l86_c45_4976_ins <= VAR_eval_opcode_phased_uxn_c_l86_c45_4976_ins;
     eval_opcode_phased_uxn_c_l86_c45_4976_pc <= VAR_eval_opcode_phased_uxn_c_l86_c45_4976_pc;
     eval_opcode_phased_uxn_c_l86_c45_4976_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l86_c45_4976_previous_ram_read;
     eval_opcode_phased_uxn_c_l86_c45_4976_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l86_c45_4976_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l86_c45_4976_return_output := eval_opcode_phased_uxn_c_l86_c45_4976_return_output;

     -- ins_MUX[uxn_c_l74_c2_ec3d] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l74_c2_ec3d_cond <= VAR_ins_MUX_uxn_c_l74_c2_ec3d_cond;
     ins_MUX_uxn_c_l74_c2_ec3d_iftrue <= VAR_ins_MUX_uxn_c_l74_c2_ec3d_iftrue;
     ins_MUX_uxn_c_l74_c2_ec3d_iffalse <= VAR_ins_MUX_uxn_c_l74_c2_ec3d_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l74_c2_ec3d_return_output := ins_MUX_uxn_c_l74_c2_ec3d_return_output;

     -- Submodule level 4
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l74_c2_ec3d_return_output;
     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l92_c40_d546] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l92_c40_d546_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_4976_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l88_c34_4385] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l88_c34_4385_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_4976_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l90_c35_e1e6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l90_c35_e1e6_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_4976_return_output.is_vram_write;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l87_l89_DUPLICATE_dd49 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l87_l89_DUPLICATE_dd49_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_4976_return_output.u16_value;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l94_c30_e51b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l94_c30_e51b_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_4976_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l91_c38_4ec2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l91_c38_4ec2_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_4976_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l95_c16_267d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l95_c16_267d_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_4976_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l93_c41_ace0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l93_c41_ace0_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_4976_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l87_c8_7319] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_7319_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_4976_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l96_c17_60a2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l96_c17_60a2_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_4976_return_output.is_opc_done;

     -- Submodule level 5
     VAR_MUX_uxn_c_l87_c8_59c5_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l87_l89_DUPLICATE_dd49_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_iffalse := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l87_l89_DUPLICATE_dd49_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l93_c41_ace0_return_output;
     VAR_is_ins_done_MUX_uxn_c_l81_c7_7183_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l96_c17_60a2_return_output;
     VAR_MUX_uxn_c_l87_c8_59c5_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_7319_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l88_c34_4385_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l90_c35_e1e6_return_output;
     VAR_is_waiting_MUX_uxn_c_l81_c7_7183_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l95_c16_267d_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l91_c38_4ec2_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l92_c40_d546_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l94_c30_e51b_return_output;
     -- is_waiting_MUX[uxn_c_l81_c7_7183] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l81_c7_7183_cond <= VAR_is_waiting_MUX_uxn_c_l81_c7_7183_cond;
     is_waiting_MUX_uxn_c_l81_c7_7183_iftrue <= VAR_is_waiting_MUX_uxn_c_l81_c7_7183_iftrue;
     is_waiting_MUX_uxn_c_l81_c7_7183_iffalse <= VAR_is_waiting_MUX_uxn_c_l81_c7_7183_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l81_c7_7183_return_output := is_waiting_MUX_uxn_c_l81_c7_7183_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l81_c7_7183] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l81_c7_7183] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_return_output := cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_return_output;

     -- is_ins_done_MUX[uxn_c_l81_c7_7183] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l81_c7_7183_cond <= VAR_is_ins_done_MUX_uxn_c_l81_c7_7183_cond;
     is_ins_done_MUX_uxn_c_l81_c7_7183_iftrue <= VAR_is_ins_done_MUX_uxn_c_l81_c7_7183_iftrue;
     is_ins_done_MUX_uxn_c_l81_c7_7183_iffalse <= VAR_is_ins_done_MUX_uxn_c_l81_c7_7183_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l81_c7_7183_return_output := is_ins_done_MUX_uxn_c_l81_c7_7183_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l81_c7_7183] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l81_c7_7183] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l81_c7_7183] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l81_c7_7183] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_return_output;

     -- MUX[uxn_c_l87_c8_59c5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l87_c8_59c5_cond <= VAR_MUX_uxn_c_l87_c8_59c5_cond;
     MUX_uxn_c_l87_c8_59c5_iftrue <= VAR_MUX_uxn_c_l87_c8_59c5_iftrue;
     MUX_uxn_c_l87_c8_59c5_iffalse <= VAR_MUX_uxn_c_l87_c8_59c5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l87_c8_59c5_return_output := MUX_uxn_c_l87_c8_59c5_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l81_c7_7183] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l81_c7_7183_iffalse := VAR_MUX_uxn_c_l87_c8_59c5_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_iffalse := VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_7183_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_iffalse := VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_7183_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_iffalse := VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_7183_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_iffalse := VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_7183_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_iffalse := VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_7183_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_iffalse := VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_7183_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_iffalse := VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_7183_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c2_ec3d_iffalse := VAR_is_ins_done_MUX_uxn_c_l81_c7_7183_return_output;
     VAR_is_waiting_MUX_uxn_c_l74_c2_ec3d_iffalse := VAR_is_waiting_MUX_uxn_c_l81_c7_7183_return_output;
     -- cpu_step_result_u16_addr_MUX[uxn_c_l74_c2_ec3d] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l74_c2_ec3d] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l74_c2_ec3d] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l74_c2_ec3d] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l74_c2_ec3d] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_return_output;

     -- pc_MUX[uxn_c_l81_c7_7183] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l81_c7_7183_cond <= VAR_pc_MUX_uxn_c_l81_c7_7183_cond;
     pc_MUX_uxn_c_l81_c7_7183_iftrue <= VAR_pc_MUX_uxn_c_l81_c7_7183_iftrue;
     pc_MUX_uxn_c_l81_c7_7183_iffalse <= VAR_pc_MUX_uxn_c_l81_c7_7183_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l81_c7_7183_return_output := pc_MUX_uxn_c_l81_c7_7183_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l74_c2_ec3d] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_return_output := cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l74_c2_ec3d] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_return_output;

     -- is_ins_done_MUX[uxn_c_l74_c2_ec3d] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l74_c2_ec3d_cond <= VAR_is_ins_done_MUX_uxn_c_l74_c2_ec3d_cond;
     is_ins_done_MUX_uxn_c_l74_c2_ec3d_iftrue <= VAR_is_ins_done_MUX_uxn_c_l74_c2_ec3d_iftrue;
     is_ins_done_MUX_uxn_c_l74_c2_ec3d_iffalse <= VAR_is_ins_done_MUX_uxn_c_l74_c2_ec3d_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l74_c2_ec3d_return_output := is_ins_done_MUX_uxn_c_l74_c2_ec3d_return_output;

     -- is_waiting_MUX[uxn_c_l74_c2_ec3d] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l74_c2_ec3d_cond <= VAR_is_waiting_MUX_uxn_c_l74_c2_ec3d_cond;
     is_waiting_MUX_uxn_c_l74_c2_ec3d_iftrue <= VAR_is_waiting_MUX_uxn_c_l74_c2_ec3d_iftrue;
     is_waiting_MUX_uxn_c_l74_c2_ec3d_iffalse <= VAR_is_waiting_MUX_uxn_c_l74_c2_ec3d_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l74_c2_ec3d_return_output := is_waiting_MUX_uxn_c_l74_c2_ec3d_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_c_l99_c6_02f6_left := VAR_is_ins_done_MUX_uxn_c_l74_c2_ec3d_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l74_c2_ec3d_return_output;
     VAR_BIN_OP_OR_uxn_c_l99_c6_02f6_right := VAR_is_waiting_MUX_uxn_c_l74_c2_ec3d_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l74_c2_ec3d_return_output;
     VAR_pc_MUX_uxn_c_l74_c2_ec3d_iffalse := VAR_pc_MUX_uxn_c_l81_c7_7183_return_output;
     -- BIN_OP_OR[uxn_c_l99_c6_02f6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l99_c6_02f6_left <= VAR_BIN_OP_OR_uxn_c_l99_c6_02f6_left;
     BIN_OP_OR_uxn_c_l99_c6_02f6_right <= VAR_BIN_OP_OR_uxn_c_l99_c6_02f6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l99_c6_02f6_return_output := BIN_OP_OR_uxn_c_l99_c6_02f6_return_output;

     -- pc_MUX[uxn_c_l74_c2_ec3d] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l74_c2_ec3d_cond <= VAR_pc_MUX_uxn_c_l74_c2_ec3d_cond;
     pc_MUX_uxn_c_l74_c2_ec3d_iftrue <= VAR_pc_MUX_uxn_c_l74_c2_ec3d_iftrue;
     pc_MUX_uxn_c_l74_c2_ec3d_iffalse <= VAR_pc_MUX_uxn_c_l74_c2_ec3d_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l74_c2_ec3d_return_output := pc_MUX_uxn_c_l74_c2_ec3d_return_output;

     -- CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a9b2_uxn_c_l105_l63_DUPLICATE_e94c LATENCY=0
     VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a9b2_uxn_c_l105_l63_DUPLICATE_e94c_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a9b2(
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_af7c_return_output,
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_ec3d_return_output,
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_ec3d_return_output,
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_ec3d_return_output,
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_ec3d_return_output,
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_ec3d_return_output,
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_ec3d_return_output,
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_ec3d_return_output);

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_cond := VAR_BIN_OP_OR_uxn_c_l99_c6_02f6_return_output;
     REG_VAR_cpu_step_result := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a9b2_uxn_c_l105_l63_DUPLICATE_e94c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_a9b2_uxn_c_l105_l63_DUPLICATE_e94c_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l74_c2_ec3d_return_output;
     -- uint16_15_8[uxn_c_l102_c21_3388] LATENCY=0
     VAR_uint16_15_8_uxn_c_l102_c21_3388_return_output := uint16_15_8(
     VAR_pc_MUX_uxn_c_l74_c2_ec3d_return_output);

     -- Submodule level 9
     VAR_BIN_OP_EQ_uxn_c_l102_c21_54e5_left := VAR_uint16_15_8_uxn_c_l102_c21_3388_return_output;
     -- BIN_OP_EQ[uxn_c_l102_c21_54e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l102_c21_54e5_left <= VAR_BIN_OP_EQ_uxn_c_l102_c21_54e5_left;
     BIN_OP_EQ_uxn_c_l102_c21_54e5_right <= VAR_BIN_OP_EQ_uxn_c_l102_c21_54e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l102_c21_54e5_return_output := BIN_OP_EQ_uxn_c_l102_c21_54e5_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l102_c21_de45_cond := VAR_BIN_OP_EQ_uxn_c_l102_c21_54e5_return_output;
     -- MUX[uxn_c_l102_c21_de45] LATENCY=0
     -- Inputs
     MUX_uxn_c_l102_c21_de45_cond <= VAR_MUX_uxn_c_l102_c21_de45_cond;
     MUX_uxn_c_l102_c21_de45_iftrue <= VAR_MUX_uxn_c_l102_c21_de45_iftrue;
     MUX_uxn_c_l102_c21_de45_iffalse <= VAR_MUX_uxn_c_l102_c21_de45_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l102_c21_de45_return_output := MUX_uxn_c_l102_c21_de45_return_output;

     -- Submodule level 11
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_iffalse := VAR_MUX_uxn_c_l102_c21_de45_return_output;
     -- step_cpu_phase_MUX[uxn_c_l99_c2_f0ce] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_cond <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_cond;
     step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_iftrue;
     step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_return_output := step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_return_output;

     -- Submodule level 12
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l99_c2_f0ce_return_output;
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
