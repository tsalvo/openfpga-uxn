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
entity step_cpu_0CLK_61e92b05 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 previous_ram_read_value : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 use_vector : in unsigned(0 downto 0);
 vector : in unsigned(15 downto 0);
 return_output : out cpu_step_result_t);
end step_cpu_0CLK_61e92b05;
architecture arch of step_cpu_0CLK_61e92b05 is
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
-- MUX[uxn_c_l71_c8_236c]
signal MUX_uxn_c_l71_c8_236c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l71_c8_236c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l71_c8_236c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l71_c8_236c_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l72_c15_d272]
signal MUX_uxn_c_l72_c15_d272_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l72_c15_d272_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l72_c15_d272_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l72_c15_d272_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l74_c6_4460]
signal BIN_OP_EQ_uxn_c_l74_c6_4460_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c6_4460_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c6_4460_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c7_e2bc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l74_c2_1f58]
signal ins_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(7 downto 0);

-- is_waiting_MUX[uxn_c_l74_c2_1f58]
signal is_waiting_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l74_c2_1f58]
signal is_ins_done_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l74_c2_1f58]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l74_c2_1f58]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(0 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l74_c2_1f58]
signal cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(7 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l74_c2_1f58]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l74_c2_1f58]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(0 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l74_c2_1f58]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l74_c2_1f58]
signal cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(15 downto 0);

-- pc_MUX[uxn_c_l74_c2_1f58]
signal pc_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l81_c11_c5f2]
signal BIN_OP_EQ_uxn_c_l81_c11_c5f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c11_c5f2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l84_c1_896b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l81_c7_e2bc]
signal ins_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(7 downto 0);

-- is_waiting_MUX[uxn_c_l81_c7_e2bc]
signal is_waiting_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(0 downto 0);
signal is_waiting_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);

-- is_ins_done_MUX[uxn_c_l81_c7_e2bc]
signal is_ins_done_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(0 downto 0);
signal is_ins_done_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_device_ram_write_MUX[uxn_c_l81_c7_e2bc]
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);

-- cpu_step_result_is_vram_write_MUX[uxn_c_l81_c7_e2bc]
signal cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);

-- cpu_step_result_u8_value_MUX[uxn_c_l81_c7_e2bc]
signal cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(7 downto 0);
signal cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(7 downto 0);

-- cpu_step_result_device_ram_address_MUX[uxn_c_l81_c7_e2bc]
signal cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(7 downto 0);
signal cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(7 downto 0);

-- cpu_step_result_is_ram_write_MUX[uxn_c_l81_c7_e2bc]
signal cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(0 downto 0);
signal cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);

-- cpu_step_result_vram_write_layer_MUX[uxn_c_l81_c7_e2bc]
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(0 downto 0);
signal cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);

-- cpu_step_result_u16_addr_MUX[uxn_c_l81_c7_e2bc]
signal cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(15 downto 0);
signal cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(15 downto 0);

-- pc_MUX[uxn_c_l81_c7_e2bc]
signal pc_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l82_c3_40e8]
signal BIN_OP_PLUS_uxn_c_l82_c3_40e8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_40e8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l82_c3_40e8_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l85_c9_f772]
signal BIN_OP_EQ_uxn_c_l85_c9_f772_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l85_c9_f772_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l85_c9_f772_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l85_c9_4626]
signal MUX_uxn_c_l85_c9_4626_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l85_c9_4626_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l85_c9_4626_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l85_c9_4626_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l86_c64_6de9]
signal BIN_OP_MINUS_uxn_c_l86_c64_6de9_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c64_6de9_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_c_l86_c64_6de9_return_output : unsigned(7 downto 0);

-- eval_opcode_phased[uxn_c_l86_c45_c80c]
signal eval_opcode_phased_uxn_c_l86_c45_c80c_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_c80c_phase : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_c80c_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_c80c_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_c80c_previous_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_c80c_previous_device_ram_read : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l86_c45_c80c_return_output : eval_opcode_result_t;

-- MUX[uxn_c_l87_c8_b930]
signal MUX_uxn_c_l87_c8_b930_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l87_c8_b930_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_b930_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l87_c8_b930_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l99_c6_7226]
signal BIN_OP_OR_uxn_c_l99_c6_7226_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l99_c6_7226_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l99_c6_7226_return_output : unsigned(0 downto 0);

-- step_cpu_phase_MUX[uxn_c_l99_c2_ddb4]
signal step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_cond : unsigned(0 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_iftrue : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_iffalse : unsigned(7 downto 0);
signal step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l102_c21_57db]
signal BIN_OP_EQ_uxn_c_l102_c21_57db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c21_57db_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c21_57db_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l102_c44_c3dc]
signal BIN_OP_PLUS_uxn_c_l102_c44_c3dc_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c44_c3dc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l102_c44_c3dc_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l102_c21_6c27]
signal MUX_uxn_c_l102_c21_6c27_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l102_c21_6c27_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l102_c21_6c27_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l102_c21_6c27_return_output : unsigned(7 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_return_output : unsigned(0 downto 0);

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_83f4( ref_toks_0 : unsigned;
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
      base.is_device_ram_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.vram_write_layer := ref_toks_6;
      base.u16_addr := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- MUX_uxn_c_l71_c8_236c
MUX_uxn_c_l71_c8_236c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l71_c8_236c_cond,
MUX_uxn_c_l71_c8_236c_iftrue,
MUX_uxn_c_l71_c8_236c_iffalse,
MUX_uxn_c_l71_c8_236c_return_output);

-- MUX_uxn_c_l72_c15_d272
MUX_uxn_c_l72_c15_d272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l72_c15_d272_cond,
MUX_uxn_c_l72_c15_d272_iftrue,
MUX_uxn_c_l72_c15_d272_iffalse,
MUX_uxn_c_l72_c15_d272_return_output);

-- BIN_OP_EQ_uxn_c_l74_c6_4460
BIN_OP_EQ_uxn_c_l74_c6_4460 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l74_c6_4460_left,
BIN_OP_EQ_uxn_c_l74_c6_4460_right,
BIN_OP_EQ_uxn_c_l74_c6_4460_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_return_output);

-- ins_MUX_uxn_c_l74_c2_1f58
ins_MUX_uxn_c_l74_c2_1f58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l74_c2_1f58_cond,
ins_MUX_uxn_c_l74_c2_1f58_iftrue,
ins_MUX_uxn_c_l74_c2_1f58_iffalse,
ins_MUX_uxn_c_l74_c2_1f58_return_output);

-- is_waiting_MUX_uxn_c_l74_c2_1f58
is_waiting_MUX_uxn_c_l74_c2_1f58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l74_c2_1f58_cond,
is_waiting_MUX_uxn_c_l74_c2_1f58_iftrue,
is_waiting_MUX_uxn_c_l74_c2_1f58_iffalse,
is_waiting_MUX_uxn_c_l74_c2_1f58_return_output);

-- is_ins_done_MUX_uxn_c_l74_c2_1f58
is_ins_done_MUX_uxn_c_l74_c2_1f58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l74_c2_1f58_cond,
is_ins_done_MUX_uxn_c_l74_c2_1f58_iftrue,
is_ins_done_MUX_uxn_c_l74_c2_1f58_iffalse,
is_ins_done_MUX_uxn_c_l74_c2_1f58_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58
cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58
cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58
cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_cond,
cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58
cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58
cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58
cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58
cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_return_output);

-- pc_MUX_uxn_c_l74_c2_1f58
pc_MUX_uxn_c_l74_c2_1f58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l74_c2_1f58_cond,
pc_MUX_uxn_c_l74_c2_1f58_iftrue,
pc_MUX_uxn_c_l74_c2_1f58_iffalse,
pc_MUX_uxn_c_l74_c2_1f58_return_output);

-- BIN_OP_EQ_uxn_c_l81_c11_c5f2
BIN_OP_EQ_uxn_c_l81_c11_c5f2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l81_c11_c5f2_left,
BIN_OP_EQ_uxn_c_l81_c11_c5f2_right,
BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_return_output);

-- ins_MUX_uxn_c_l81_c7_e2bc
ins_MUX_uxn_c_l81_c7_e2bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l81_c7_e2bc_cond,
ins_MUX_uxn_c_l81_c7_e2bc_iftrue,
ins_MUX_uxn_c_l81_c7_e2bc_iffalse,
ins_MUX_uxn_c_l81_c7_e2bc_return_output);

-- is_waiting_MUX_uxn_c_l81_c7_e2bc
is_waiting_MUX_uxn_c_l81_c7_e2bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_waiting_MUX_uxn_c_l81_c7_e2bc_cond,
is_waiting_MUX_uxn_c_l81_c7_e2bc_iftrue,
is_waiting_MUX_uxn_c_l81_c7_e2bc_iffalse,
is_waiting_MUX_uxn_c_l81_c7_e2bc_return_output);

-- is_ins_done_MUX_uxn_c_l81_c7_e2bc
is_ins_done_MUX_uxn_c_l81_c7_e2bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ins_done_MUX_uxn_c_l81_c7_e2bc_cond,
is_ins_done_MUX_uxn_c_l81_c7_e2bc_iftrue,
is_ins_done_MUX_uxn_c_l81_c7_e2bc_iffalse,
is_ins_done_MUX_uxn_c_l81_c7_e2bc_return_output);

-- cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc
cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_cond,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_iftrue,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_iffalse,
cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_return_output);

-- cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc
cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_cond,
cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_iftrue,
cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_iffalse,
cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_return_output);

-- cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc
cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_cond,
cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_iftrue,
cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_iffalse,
cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_return_output);

-- cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc
cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_cond,
cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_iftrue,
cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_iffalse,
cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_return_output);

-- cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc
cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_cond,
cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_iftrue,
cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_iffalse,
cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_return_output);

-- cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc
cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_cond,
cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_iftrue,
cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_iffalse,
cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_return_output);

-- cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc
cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_cond,
cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_iftrue,
cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_iffalse,
cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_return_output);

-- pc_MUX_uxn_c_l81_c7_e2bc
pc_MUX_uxn_c_l81_c7_e2bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l81_c7_e2bc_cond,
pc_MUX_uxn_c_l81_c7_e2bc_iftrue,
pc_MUX_uxn_c_l81_c7_e2bc_iffalse,
pc_MUX_uxn_c_l81_c7_e2bc_return_output);

-- BIN_OP_PLUS_uxn_c_l82_c3_40e8
BIN_OP_PLUS_uxn_c_l82_c3_40e8 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l82_c3_40e8_left,
BIN_OP_PLUS_uxn_c_l82_c3_40e8_right,
BIN_OP_PLUS_uxn_c_l82_c3_40e8_return_output);

-- BIN_OP_EQ_uxn_c_l85_c9_f772
BIN_OP_EQ_uxn_c_l85_c9_f772 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l85_c9_f772_left,
BIN_OP_EQ_uxn_c_l85_c9_f772_right,
BIN_OP_EQ_uxn_c_l85_c9_f772_return_output);

-- MUX_uxn_c_l85_c9_4626
MUX_uxn_c_l85_c9_4626 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l85_c9_4626_cond,
MUX_uxn_c_l85_c9_4626_iftrue,
MUX_uxn_c_l85_c9_4626_iffalse,
MUX_uxn_c_l85_c9_4626_return_output);

-- BIN_OP_MINUS_uxn_c_l86_c64_6de9
BIN_OP_MINUS_uxn_c_l86_c64_6de9 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l86_c64_6de9_left,
BIN_OP_MINUS_uxn_c_l86_c64_6de9_right,
BIN_OP_MINUS_uxn_c_l86_c64_6de9_return_output);

-- eval_opcode_phased_uxn_c_l86_c45_c80c
eval_opcode_phased_uxn_c_l86_c45_c80c : entity work.eval_opcode_phased_0CLK_65a1a6bb port map (
clk,
eval_opcode_phased_uxn_c_l86_c45_c80c_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l86_c45_c80c_phase,
eval_opcode_phased_uxn_c_l86_c45_c80c_ins,
eval_opcode_phased_uxn_c_l86_c45_c80c_pc,
eval_opcode_phased_uxn_c_l86_c45_c80c_previous_ram_read,
eval_opcode_phased_uxn_c_l86_c45_c80c_previous_device_ram_read,
eval_opcode_phased_uxn_c_l86_c45_c80c_return_output);

-- MUX_uxn_c_l87_c8_b930
MUX_uxn_c_l87_c8_b930 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l87_c8_b930_cond,
MUX_uxn_c_l87_c8_b930_iftrue,
MUX_uxn_c_l87_c8_b930_iffalse,
MUX_uxn_c_l87_c8_b930_return_output);

-- BIN_OP_OR_uxn_c_l99_c6_7226
BIN_OP_OR_uxn_c_l99_c6_7226 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l99_c6_7226_left,
BIN_OP_OR_uxn_c_l99_c6_7226_right,
BIN_OP_OR_uxn_c_l99_c6_7226_return_output);

-- step_cpu_phase_MUX_uxn_c_l99_c2_ddb4
step_cpu_phase_MUX_uxn_c_l99_c2_ddb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_cond,
step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_iftrue,
step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_iffalse,
step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_return_output);

-- BIN_OP_EQ_uxn_c_l102_c21_57db
BIN_OP_EQ_uxn_c_l102_c21_57db : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l102_c21_57db_left,
BIN_OP_EQ_uxn_c_l102_c21_57db_right,
BIN_OP_EQ_uxn_c_l102_c21_57db_return_output);

-- BIN_OP_PLUS_uxn_c_l102_c44_c3dc
BIN_OP_PLUS_uxn_c_l102_c44_c3dc : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l102_c44_c3dc_left,
BIN_OP_PLUS_uxn_c_l102_c44_c3dc_right,
BIN_OP_PLUS_uxn_c_l102_c44_c3dc_return_output);

-- MUX_uxn_c_l102_c21_6c27
MUX_uxn_c_l102_c21_6c27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l102_c21_6c27_cond,
MUX_uxn_c_l102_c21_6c27_iftrue,
MUX_uxn_c_l102_c21_6c27_iffalse,
MUX_uxn_c_l102_c21_6c27_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_return_output);



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
 MUX_uxn_c_l71_c8_236c_return_output,
 MUX_uxn_c_l72_c15_d272_return_output,
 BIN_OP_EQ_uxn_c_l74_c6_4460_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_return_output,
 ins_MUX_uxn_c_l74_c2_1f58_return_output,
 is_waiting_MUX_uxn_c_l74_c2_1f58_return_output,
 is_ins_done_MUX_uxn_c_l74_c2_1f58_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_return_output,
 pc_MUX_uxn_c_l74_c2_1f58_return_output,
 BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_return_output,
 ins_MUX_uxn_c_l81_c7_e2bc_return_output,
 is_waiting_MUX_uxn_c_l81_c7_e2bc_return_output,
 is_ins_done_MUX_uxn_c_l81_c7_e2bc_return_output,
 cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_return_output,
 cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_return_output,
 cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_return_output,
 cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_return_output,
 cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_return_output,
 cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_return_output,
 cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_return_output,
 pc_MUX_uxn_c_l81_c7_e2bc_return_output,
 BIN_OP_PLUS_uxn_c_l82_c3_40e8_return_output,
 BIN_OP_EQ_uxn_c_l85_c9_f772_return_output,
 MUX_uxn_c_l85_c9_4626_return_output,
 BIN_OP_MINUS_uxn_c_l86_c64_6de9_return_output,
 eval_opcode_phased_uxn_c_l86_c45_c80c_return_output,
 MUX_uxn_c_l87_c8_b930_return_output,
 BIN_OP_OR_uxn_c_l99_c6_7226_return_output,
 step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_return_output,
 BIN_OP_EQ_uxn_c_l102_c21_57db_return_output,
 BIN_OP_PLUS_uxn_c_l102_c44_c3dc_return_output,
 MUX_uxn_c_l102_c21_6c27_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : cpu_step_result_t;
 variable VAR_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_use_vector : unsigned(0 downto 0);
 variable VAR_vector : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l71_c8_236c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l71_c8_236c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l71_c8_236c_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l71_c8_236c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l72_c15_d272_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l72_c15_d272_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l72_c15_d272_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l72_c15_d272_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_1f58_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_1f58_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_e2bc_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_1f58_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l74_c2_1f58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(0 downto 0);
 variable VAR_is_waiting_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(0 downto 0);
 variable VAR_is_ins_done_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(7 downto 0);
 variable VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l81_c7_e2bc_return_output : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(0 downto 0);
 variable VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l81_c7_e2bc_return_output : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(15 downto 0);
 variable VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_e2bc_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l82_c3_a8e1 : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_e2bc_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l81_c7_e2bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_40e8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_40e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l82_c3_40e8_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_4626_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l85_c9_f772_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l85_c9_f772_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l85_c9_f772_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_4626_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_4626_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l85_c9_4626_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_result : eval_opcode_result_t;
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_phase : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c64_6de9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c64_6de9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l86_c64_6de9_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_return_output : eval_opcode_result_t;
 variable VAR_MUX_uxn_c_l87_c8_b930_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_dad7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_b930_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_b930_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l87_c8_b930_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l88_c34_50db_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l90_c35_8fd1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l91_c38_05d8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l92_c40_7e8b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l93_c41_8568_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l94_c30_4c0c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l95_c16_fb9c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l96_c17_f82f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l99_c6_7226_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l99_c6_7226_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l99_c6_7226_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_iftrue : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_uxn_c_l100_c3_8709 : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_iffalse : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_6c27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c21_57db_left : unsigned(7 downto 0);
 variable VAR_uint16_15_8_uxn_c_l102_c21_dde0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c21_57db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c21_57db_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_6c27_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_6c27_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c44_c3dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c44_c3dc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l102_c44_c3dc_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l102_c21_6c27_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l81_l74_DUPLICATE_cda7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l74_l81_DUPLICATE_a8e2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l81_l74_DUPLICATE_5f5b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l89_l87_DUPLICATE_ea38_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_83f4_uxn_c_l63_l105_DUPLICATE_e5fc_return_output : cpu_step_result_t;
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
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l86_c64_6de9_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l102_c21_57db_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l72_c15_d272_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_right := to_unsigned(1, 1);
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_iftrue := to_unsigned(0, 1);
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l85_c9_f772_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_iftrue := to_unsigned(0, 1);
     VAR_step_cpu_phase_uxn_c_l100_c3_8709 := resize(to_unsigned(0, 1), 8);
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_iftrue := VAR_step_cpu_phase_uxn_c_l100_c3_8709;
     VAR_is_ins_done_MUX_uxn_c_l74_c2_1f58_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l102_c21_6c27_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_40e8_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l102_c44_c3dc_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_iffalse := VAR_CLOCK_ENABLE;
     VAR_MUX_uxn_c_l85_c9_4626_iffalse := ins;
     VAR_ins_MUX_uxn_c_l74_c2_1f58_iftrue := ins;
     VAR_ins_MUX_uxn_c_l81_c7_e2bc_iftrue := ins;
     VAR_is_ins_done_MUX_uxn_c_l81_c7_e2bc_iftrue := is_ins_done;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_right := is_waiting;
     VAR_MUX_uxn_c_l72_c15_d272_iffalse := is_waiting;
     VAR_MUX_uxn_c_l71_c8_236c_iffalse := pc;
     VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_c_l85_c9_4626_iftrue := VAR_previous_ram_read_value;
     VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_previous_ram_read := VAR_previous_ram_read_value;
     VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_left := step_cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l85_c9_f772_left := step_cpu_phase;
     VAR_BIN_OP_MINUS_uxn_c_l86_c64_6de9_left := step_cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l102_c44_c3dc_left := step_cpu_phase;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_left := VAR_use_vector;
     VAR_MUX_uxn_c_l72_c15_d272_cond := VAR_use_vector;
     VAR_MUX_uxn_c_l71_c8_236c_iftrue := VAR_vector;
     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_return_output;

     -- BIN_OP_PLUS[uxn_c_l102_c44_c3dc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l102_c44_c3dc_left <= VAR_BIN_OP_PLUS_uxn_c_l102_c44_c3dc_left;
     BIN_OP_PLUS_uxn_c_l102_c44_c3dc_right <= VAR_BIN_OP_PLUS_uxn_c_l102_c44_c3dc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l102_c44_c3dc_return_output := BIN_OP_PLUS_uxn_c_l102_c44_c3dc_return_output;

     -- cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l81_c7_e2bc] LATENCY=0
     VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l81_c7_e2bc_return_output := cpu_step_result.is_vram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l74_l81_DUPLICATE_a8e2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l74_l81_DUPLICATE_a8e2_return_output := cpu_step_result.device_ram_address;

     -- MUX[uxn_c_l72_c15_d272] LATENCY=0
     -- Inputs
     MUX_uxn_c_l72_c15_d272_cond <= VAR_MUX_uxn_c_l72_c15_d272_cond;
     MUX_uxn_c_l72_c15_d272_iftrue <= VAR_MUX_uxn_c_l72_c15_d272_iftrue;
     MUX_uxn_c_l72_c15_d272_iffalse <= VAR_MUX_uxn_c_l72_c15_d272_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l72_c15_d272_return_output := MUX_uxn_c_l72_c15_d272_return_output;

     -- BIN_OP_EQ[uxn_c_l81_c11_c5f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l81_c11_c5f2_left <= VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_left;
     BIN_OP_EQ_uxn_c_l81_c11_c5f2_right <= VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output := BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output;

     -- cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l81_c7_e2bc] LATENCY=0
     VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l81_c7_e2bc_return_output := cpu_step_result.u16_addr;

     -- BIN_OP_EQ[uxn_c_l74_c6_4460] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l74_c6_4460_left <= VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_left;
     BIN_OP_EQ_uxn_c_l74_c6_4460_right <= VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_return_output := BIN_OP_EQ_uxn_c_l74_c6_4460_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l81_l74_DUPLICATE_5f5b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l81_l74_DUPLICATE_5f5b_return_output := cpu_step_result.vram_write_layer;

     -- cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l81_c7_e2bc] LATENCY=0
     VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l81_c7_e2bc_return_output := cpu_step_result.is_ram_write;

     -- BIN_OP_EQ[uxn_c_l85_c9_f772] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l85_c9_f772_left <= VAR_BIN_OP_EQ_uxn_c_l85_c9_f772_left;
     BIN_OP_EQ_uxn_c_l85_c9_f772_right <= VAR_BIN_OP_EQ_uxn_c_l85_c9_f772_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l85_c9_f772_return_output := BIN_OP_EQ_uxn_c_l85_c9_f772_return_output;

     -- BIN_OP_MINUS[uxn_c_l86_c64_6de9] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l86_c64_6de9_left <= VAR_BIN_OP_MINUS_uxn_c_l86_c64_6de9_left;
     BIN_OP_MINUS_uxn_c_l86_c64_6de9_right <= VAR_BIN_OP_MINUS_uxn_c_l86_c64_6de9_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l86_c64_6de9_return_output := BIN_OP_MINUS_uxn_c_l86_c64_6de9_return_output;

     -- cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l81_c7_e2bc] LATENCY=0
     VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l81_c7_e2bc_return_output := cpu_step_result.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l81_l74_DUPLICATE_cda7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l81_l74_DUPLICATE_cda7_return_output := cpu_step_result.u8_value;

     -- Submodule level 1
     VAR_MUX_uxn_c_l71_c8_236c_cond := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_return_output;
     VAR_ins_MUX_uxn_c_l74_c2_1f58_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c2_1f58_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_return_output;
     VAR_is_waiting_MUX_uxn_c_l74_c2_1f58_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_return_output;
     VAR_pc_MUX_uxn_c_l74_c2_1f58_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_4460_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output;
     VAR_ins_MUX_uxn_c_l81_c7_e2bc_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output;
     VAR_is_ins_done_MUX_uxn_c_l81_c7_e2bc_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output;
     VAR_is_waiting_MUX_uxn_c_l81_c7_e2bc_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output;
     VAR_pc_MUX_uxn_c_l81_c7_e2bc_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_c5f2_return_output;
     VAR_MUX_uxn_c_l85_c9_4626_cond := VAR_BIN_OP_EQ_uxn_c_l85_c9_f772_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_phase := VAR_BIN_OP_MINUS_uxn_c_l86_c64_6de9_return_output;
     VAR_MUX_uxn_c_l102_c21_6c27_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l102_c44_c3dc_return_output, 8);
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l81_l74_DUPLICATE_5f5b_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l81_l74_DUPLICATE_5f5b_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l74_l81_DUPLICATE_a8e2_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l74_l81_DUPLICATE_a8e2_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l81_l74_DUPLICATE_cda7_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l81_l74_DUPLICATE_cda7_return_output;
     VAR_is_waiting_MUX_uxn_c_l74_c2_1f58_iftrue := VAR_MUX_uxn_c_l72_c15_d272_return_output;
     VAR_is_waiting_MUX_uxn_c_l81_c7_e2bc_iftrue := VAR_MUX_uxn_c_l72_c15_d272_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_iftrue := VAR_cpu_step_result_is_device_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l81_c7_e2bc_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_iftrue := VAR_cpu_step_result_is_ram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l81_c7_e2bc_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_iftrue := VAR_cpu_step_result_is_vram_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l81_c7_e2bc_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_iftrue := VAR_cpu_step_result_u16_addr_TRUE_INPUT_MUX_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l81_c7_e2bc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c7_e2bc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_return_output;

     -- MUX[uxn_c_l71_c8_236c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l71_c8_236c_cond <= VAR_MUX_uxn_c_l71_c8_236c_cond;
     MUX_uxn_c_l71_c8_236c_iftrue <= VAR_MUX_uxn_c_l71_c8_236c_iftrue;
     MUX_uxn_c_l71_c8_236c_iffalse <= VAR_MUX_uxn_c_l71_c8_236c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l71_c8_236c_return_output := MUX_uxn_c_l71_c8_236c_return_output;

     -- MUX[uxn_c_l85_c9_4626] LATENCY=0
     -- Inputs
     MUX_uxn_c_l85_c9_4626_cond <= VAR_MUX_uxn_c_l85_c9_4626_cond;
     MUX_uxn_c_l85_c9_4626_iftrue <= VAR_MUX_uxn_c_l85_c9_4626_iftrue;
     MUX_uxn_c_l85_c9_4626_iffalse <= VAR_MUX_uxn_c_l85_c9_4626_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l85_c9_4626_return_output := MUX_uxn_c_l85_c9_4626_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_e2bc_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_40e8_left := VAR_MUX_uxn_c_l71_c8_236c_return_output;
     VAR_MUX_uxn_c_l87_c8_b930_iffalse := VAR_MUX_uxn_c_l71_c8_236c_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_iftrue := VAR_MUX_uxn_c_l71_c8_236c_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_pc := VAR_MUX_uxn_c_l71_c8_236c_return_output;
     VAR_pc_MUX_uxn_c_l74_c2_1f58_iftrue := VAR_MUX_uxn_c_l71_c8_236c_return_output;
     VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_ins := VAR_MUX_uxn_c_l85_c9_4626_return_output;
     VAR_ins_MUX_uxn_c_l81_c7_e2bc_iffalse := VAR_MUX_uxn_c_l85_c9_4626_return_output;
     -- BIN_OP_PLUS[uxn_c_l82_c3_40e8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l82_c3_40e8_left <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_40e8_left;
     BIN_OP_PLUS_uxn_c_l82_c3_40e8_right <= VAR_BIN_OP_PLUS_uxn_c_l82_c3_40e8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l82_c3_40e8_return_output := BIN_OP_PLUS_uxn_c_l82_c3_40e8_return_output;

     -- ins_MUX[uxn_c_l81_c7_e2bc] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l81_c7_e2bc_cond <= VAR_ins_MUX_uxn_c_l81_c7_e2bc_cond;
     ins_MUX_uxn_c_l81_c7_e2bc_iftrue <= VAR_ins_MUX_uxn_c_l81_c7_e2bc_iftrue;
     ins_MUX_uxn_c_l81_c7_e2bc_iffalse <= VAR_ins_MUX_uxn_c_l81_c7_e2bc_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l81_c7_e2bc_return_output := ins_MUX_uxn_c_l81_c7_e2bc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l84_c1_896b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_return_output;

     -- Submodule level 3
     VAR_pc_uxn_c_l82_c3_a8e1 := resize(VAR_BIN_OP_PLUS_uxn_c_l82_c3_40e8_return_output, 16);
     VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_896b_return_output;
     VAR_ins_MUX_uxn_c_l74_c2_1f58_iffalse := VAR_ins_MUX_uxn_c_l81_c7_e2bc_return_output;
     VAR_pc_MUX_uxn_c_l81_c7_e2bc_iftrue := VAR_pc_uxn_c_l82_c3_a8e1;
     -- ins_MUX[uxn_c_l74_c2_1f58] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l74_c2_1f58_cond <= VAR_ins_MUX_uxn_c_l74_c2_1f58_cond;
     ins_MUX_uxn_c_l74_c2_1f58_iftrue <= VAR_ins_MUX_uxn_c_l74_c2_1f58_iftrue;
     ins_MUX_uxn_c_l74_c2_1f58_iffalse <= VAR_ins_MUX_uxn_c_l74_c2_1f58_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l74_c2_1f58_return_output := ins_MUX_uxn_c_l74_c2_1f58_return_output;

     -- eval_opcode_phased[uxn_c_l86_c45_c80c] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l86_c45_c80c_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l86_c45_c80c_phase <= VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_phase;
     eval_opcode_phased_uxn_c_l86_c45_c80c_ins <= VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_ins;
     eval_opcode_phased_uxn_c_l86_c45_c80c_pc <= VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_pc;
     eval_opcode_phased_uxn_c_l86_c45_c80c_previous_ram_read <= VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_previous_ram_read;
     eval_opcode_phased_uxn_c_l86_c45_c80c_previous_device_ram_read <= VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_previous_device_ram_read;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_return_output := eval_opcode_phased_uxn_c_l86_c45_c80c_return_output;

     -- Submodule level 4
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l74_c2_1f58_return_output;
     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d[uxn_c_l95_c16_fb9c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l95_c16_fb9c_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_return_output.is_waiting;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d[uxn_c_l90_c35_8fd1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l90_c35_8fd1_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d[uxn_c_l87_c8_dad7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_dad7_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_return_output.is_pc_updated;

     -- CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l89_l87_DUPLICATE_ea38 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l89_l87_DUPLICATE_ea38_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_return_output.u16_value;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d[uxn_c_l92_c40_7e8b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l92_c40_7e8b_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d[uxn_c_l93_c41_8568] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l93_c41_8568_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d[uxn_c_l91_c38_05d8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l91_c38_05d8_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d[uxn_c_l94_c30_4c0c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l94_c30_4c0c_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d[uxn_c_l96_c17_f82f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l96_c17_f82f_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d[uxn_c_l88_c34_50db] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l88_c34_50db_return_output := VAR_eval_opcode_phased_uxn_c_l86_c45_c80c_return_output.is_ram_write;

     -- Submodule level 5
     VAR_MUX_uxn_c_l87_c8_b930_iftrue := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l89_l87_DUPLICATE_ea38_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_iffalse := VAR_CONST_REF_RD_uint16_t_eval_opcode_result_t_u16_value_d41d_uxn_c_l89_l87_DUPLICATE_ea38_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_device_ram_write_d41d_uxn_c_l93_c41_8568_return_output;
     VAR_is_ins_done_MUX_uxn_c_l81_c7_e2bc_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_opc_done_d41d_uxn_c_l96_c17_f82f_return_output;
     VAR_MUX_uxn_c_l87_c8_b930_cond := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_pc_updated_d41d_uxn_c_l87_c8_dad7_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_ram_write_d41d_uxn_c_l88_c34_50db_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_vram_write_d41d_uxn_c_l90_c35_8fd1_return_output;
     VAR_is_waiting_MUX_uxn_c_l81_c7_e2bc_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_is_waiting_d41d_uxn_c_l95_c16_fb9c_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_iffalse := VAR_CONST_REF_RD_uint1_t_eval_opcode_result_t_vram_write_layer_d41d_uxn_c_l91_c38_05d8_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_device_ram_address_d41d_uxn_c_l92_c40_7e8b_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_iffalse := VAR_CONST_REF_RD_uint8_t_eval_opcode_result_t_u8_value_d41d_uxn_c_l94_c30_4c0c_return_output;
     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l81_c7_e2bc] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_return_output;

     -- is_waiting_MUX[uxn_c_l81_c7_e2bc] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l81_c7_e2bc_cond <= VAR_is_waiting_MUX_uxn_c_l81_c7_e2bc_cond;
     is_waiting_MUX_uxn_c_l81_c7_e2bc_iftrue <= VAR_is_waiting_MUX_uxn_c_l81_c7_e2bc_iftrue;
     is_waiting_MUX_uxn_c_l81_c7_e2bc_iffalse <= VAR_is_waiting_MUX_uxn_c_l81_c7_e2bc_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l81_c7_e2bc_return_output := is_waiting_MUX_uxn_c_l81_c7_e2bc_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l81_c7_e2bc] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l81_c7_e2bc] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l81_c7_e2bc] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l81_c7_e2bc] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_return_output;

     -- MUX[uxn_c_l87_c8_b930] LATENCY=0
     -- Inputs
     MUX_uxn_c_l87_c8_b930_cond <= VAR_MUX_uxn_c_l87_c8_b930_cond;
     MUX_uxn_c_l87_c8_b930_iftrue <= VAR_MUX_uxn_c_l87_c8_b930_iftrue;
     MUX_uxn_c_l87_c8_b930_iffalse <= VAR_MUX_uxn_c_l87_c8_b930_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l87_c8_b930_return_output := MUX_uxn_c_l87_c8_b930_return_output;

     -- is_ins_done_MUX[uxn_c_l81_c7_e2bc] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l81_c7_e2bc_cond <= VAR_is_ins_done_MUX_uxn_c_l81_c7_e2bc_cond;
     is_ins_done_MUX_uxn_c_l81_c7_e2bc_iftrue <= VAR_is_ins_done_MUX_uxn_c_l81_c7_e2bc_iftrue;
     is_ins_done_MUX_uxn_c_l81_c7_e2bc_iffalse <= VAR_is_ins_done_MUX_uxn_c_l81_c7_e2bc_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l81_c7_e2bc_return_output := is_ins_done_MUX_uxn_c_l81_c7_e2bc_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l81_c7_e2bc] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l81_c7_e2bc] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_return_output := cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_return_output;

     -- Submodule level 6
     VAR_pc_MUX_uxn_c_l81_c7_e2bc_iffalse := VAR_MUX_uxn_c_l87_c8_b930_return_output;
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_iffalse := VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l81_c7_e2bc_return_output;
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_iffalse := VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l81_c7_e2bc_return_output;
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_iffalse := VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l81_c7_e2bc_return_output;
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_iffalse := VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l81_c7_e2bc_return_output;
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_iffalse := VAR_cpu_step_result_u16_addr_MUX_uxn_c_l81_c7_e2bc_return_output;
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_iffalse := VAR_cpu_step_result_u8_value_MUX_uxn_c_l81_c7_e2bc_return_output;
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_iffalse := VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l81_c7_e2bc_return_output;
     VAR_is_ins_done_MUX_uxn_c_l74_c2_1f58_iffalse := VAR_is_ins_done_MUX_uxn_c_l81_c7_e2bc_return_output;
     VAR_is_waiting_MUX_uxn_c_l74_c2_1f58_iffalse := VAR_is_waiting_MUX_uxn_c_l81_c7_e2bc_return_output;
     -- is_ins_done_MUX[uxn_c_l74_c2_1f58] LATENCY=0
     -- Inputs
     is_ins_done_MUX_uxn_c_l74_c2_1f58_cond <= VAR_is_ins_done_MUX_uxn_c_l74_c2_1f58_cond;
     is_ins_done_MUX_uxn_c_l74_c2_1f58_iftrue <= VAR_is_ins_done_MUX_uxn_c_l74_c2_1f58_iftrue;
     is_ins_done_MUX_uxn_c_l74_c2_1f58_iffalse <= VAR_is_ins_done_MUX_uxn_c_l74_c2_1f58_iffalse;
     -- Outputs
     VAR_is_ins_done_MUX_uxn_c_l74_c2_1f58_return_output := is_ins_done_MUX_uxn_c_l74_c2_1f58_return_output;

     -- cpu_step_result_u8_value_MUX[uxn_c_l74_c2_1f58] LATENCY=0
     -- Inputs
     cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_cond <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_cond;
     cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_iftrue <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_iftrue;
     cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_iffalse <= VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_iffalse;
     -- Outputs
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_return_output := cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_return_output;

     -- pc_MUX[uxn_c_l81_c7_e2bc] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l81_c7_e2bc_cond <= VAR_pc_MUX_uxn_c_l81_c7_e2bc_cond;
     pc_MUX_uxn_c_l81_c7_e2bc_iftrue <= VAR_pc_MUX_uxn_c_l81_c7_e2bc_iftrue;
     pc_MUX_uxn_c_l81_c7_e2bc_iffalse <= VAR_pc_MUX_uxn_c_l81_c7_e2bc_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l81_c7_e2bc_return_output := pc_MUX_uxn_c_l81_c7_e2bc_return_output;

     -- cpu_step_result_is_ram_write_MUX[uxn_c_l74_c2_1f58] LATENCY=0
     -- Inputs
     cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_cond <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_cond;
     cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_iftrue <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_iftrue;
     cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_iffalse <= VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_return_output := cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_return_output;

     -- cpu_step_result_vram_write_layer_MUX[uxn_c_l74_c2_1f58] LATENCY=0
     -- Inputs
     cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_cond <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_cond;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_iftrue <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_iftrue;
     cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_iffalse <= VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_iffalse;
     -- Outputs
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_return_output := cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_return_output;

     -- is_waiting_MUX[uxn_c_l74_c2_1f58] LATENCY=0
     -- Inputs
     is_waiting_MUX_uxn_c_l74_c2_1f58_cond <= VAR_is_waiting_MUX_uxn_c_l74_c2_1f58_cond;
     is_waiting_MUX_uxn_c_l74_c2_1f58_iftrue <= VAR_is_waiting_MUX_uxn_c_l74_c2_1f58_iftrue;
     is_waiting_MUX_uxn_c_l74_c2_1f58_iffalse <= VAR_is_waiting_MUX_uxn_c_l74_c2_1f58_iffalse;
     -- Outputs
     VAR_is_waiting_MUX_uxn_c_l74_c2_1f58_return_output := is_waiting_MUX_uxn_c_l74_c2_1f58_return_output;

     -- cpu_step_result_is_device_ram_write_MUX[uxn_c_l74_c2_1f58] LATENCY=0
     -- Inputs
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_cond <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_cond;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_iftrue <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_iftrue;
     cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_iffalse <= VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_return_output := cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_return_output;

     -- cpu_step_result_is_vram_write_MUX[uxn_c_l74_c2_1f58] LATENCY=0
     -- Inputs
     cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_cond <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_cond;
     cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_iftrue <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_iftrue;
     cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_iffalse <= VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_iffalse;
     -- Outputs
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_return_output := cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_return_output;

     -- cpu_step_result_device_ram_address_MUX[uxn_c_l74_c2_1f58] LATENCY=0
     -- Inputs
     cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_cond <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_cond;
     cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_iftrue <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_iftrue;
     cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_iffalse <= VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_iffalse;
     -- Outputs
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_return_output := cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_return_output;

     -- cpu_step_result_u16_addr_MUX[uxn_c_l74_c2_1f58] LATENCY=0
     -- Inputs
     cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_cond <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_cond;
     cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_iftrue <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_iftrue;
     cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_iffalse <= VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_iffalse;
     -- Outputs
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_return_output := cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_c_l99_c6_7226_left := VAR_is_ins_done_MUX_uxn_c_l74_c2_1f58_return_output;
     REG_VAR_is_ins_done := VAR_is_ins_done_MUX_uxn_c_l74_c2_1f58_return_output;
     VAR_BIN_OP_OR_uxn_c_l99_c6_7226_right := VAR_is_waiting_MUX_uxn_c_l74_c2_1f58_return_output;
     REG_VAR_is_waiting := VAR_is_waiting_MUX_uxn_c_l74_c2_1f58_return_output;
     VAR_pc_MUX_uxn_c_l74_c2_1f58_iffalse := VAR_pc_MUX_uxn_c_l81_c7_e2bc_return_output;
     -- BIN_OP_OR[uxn_c_l99_c6_7226] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l99_c6_7226_left <= VAR_BIN_OP_OR_uxn_c_l99_c6_7226_left;
     BIN_OP_OR_uxn_c_l99_c6_7226_right <= VAR_BIN_OP_OR_uxn_c_l99_c6_7226_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l99_c6_7226_return_output := BIN_OP_OR_uxn_c_l99_c6_7226_return_output;

     -- CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_83f4_uxn_c_l63_l105_DUPLICATE_e5fc LATENCY=0
     VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_83f4_uxn_c_l63_l105_DUPLICATE_e5fc_return_output := CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_83f4(
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l71_l70_DUPLICATE_229e_return_output,
     VAR_cpu_step_result_is_device_ram_write_MUX_uxn_c_l74_c2_1f58_return_output,
     VAR_cpu_step_result_is_vram_write_MUX_uxn_c_l74_c2_1f58_return_output,
     VAR_cpu_step_result_u8_value_MUX_uxn_c_l74_c2_1f58_return_output,
     VAR_cpu_step_result_device_ram_address_MUX_uxn_c_l74_c2_1f58_return_output,
     VAR_cpu_step_result_is_ram_write_MUX_uxn_c_l74_c2_1f58_return_output,
     VAR_cpu_step_result_vram_write_layer_MUX_uxn_c_l74_c2_1f58_return_output,
     VAR_cpu_step_result_u16_addr_MUX_uxn_c_l74_c2_1f58_return_output);

     -- pc_MUX[uxn_c_l74_c2_1f58] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l74_c2_1f58_cond <= VAR_pc_MUX_uxn_c_l74_c2_1f58_cond;
     pc_MUX_uxn_c_l74_c2_1f58_iftrue <= VAR_pc_MUX_uxn_c_l74_c2_1f58_iftrue;
     pc_MUX_uxn_c_l74_c2_1f58_iffalse <= VAR_pc_MUX_uxn_c_l74_c2_1f58_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l74_c2_1f58_return_output := pc_MUX_uxn_c_l74_c2_1f58_return_output;

     -- Submodule level 8
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_cond := VAR_BIN_OP_OR_uxn_c_l99_c6_7226_return_output;
     REG_VAR_cpu_step_result := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_83f4_uxn_c_l63_l105_DUPLICATE_e5fc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_cpu_step_result_t_cpu_step_result_t_83f4_uxn_c_l63_l105_DUPLICATE_e5fc_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l74_c2_1f58_return_output;
     -- uint16_15_8[uxn_c_l102_c21_dde0] LATENCY=0
     VAR_uint16_15_8_uxn_c_l102_c21_dde0_return_output := uint16_15_8(
     VAR_pc_MUX_uxn_c_l74_c2_1f58_return_output);

     -- Submodule level 9
     VAR_BIN_OP_EQ_uxn_c_l102_c21_57db_left := VAR_uint16_15_8_uxn_c_l102_c21_dde0_return_output;
     -- BIN_OP_EQ[uxn_c_l102_c21_57db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l102_c21_57db_left <= VAR_BIN_OP_EQ_uxn_c_l102_c21_57db_left;
     BIN_OP_EQ_uxn_c_l102_c21_57db_right <= VAR_BIN_OP_EQ_uxn_c_l102_c21_57db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l102_c21_57db_return_output := BIN_OP_EQ_uxn_c_l102_c21_57db_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l102_c21_6c27_cond := VAR_BIN_OP_EQ_uxn_c_l102_c21_57db_return_output;
     -- MUX[uxn_c_l102_c21_6c27] LATENCY=0
     -- Inputs
     MUX_uxn_c_l102_c21_6c27_cond <= VAR_MUX_uxn_c_l102_c21_6c27_cond;
     MUX_uxn_c_l102_c21_6c27_iftrue <= VAR_MUX_uxn_c_l102_c21_6c27_iftrue;
     MUX_uxn_c_l102_c21_6c27_iffalse <= VAR_MUX_uxn_c_l102_c21_6c27_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l102_c21_6c27_return_output := MUX_uxn_c_l102_c21_6c27_return_output;

     -- Submodule level 11
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_iffalse := VAR_MUX_uxn_c_l102_c21_6c27_return_output;
     -- step_cpu_phase_MUX[uxn_c_l99_c2_ddb4] LATENCY=0
     -- Inputs
     step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_cond <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_cond;
     step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_iftrue <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_iftrue;
     step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_iffalse <= VAR_step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_iffalse;
     -- Outputs
     VAR_step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_return_output := step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_return_output;

     -- Submodule level 12
     REG_VAR_step_cpu_phase := VAR_step_cpu_phase_MUX_uxn_c_l99_c2_ddb4_return_output;
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
