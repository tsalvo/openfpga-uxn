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
-- Submodules: 48
entity dei2_0CLK_0f8c9c15 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei2_0CLK_0f8c9c15;
architecture arch of dei2_0CLK_0f8c9c15 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal current_dei_phase : unsigned(7 downto 0) := to_unsigned(0, 8);
signal dei_param : unsigned(7 downto 0) := to_unsigned(0, 8);
signal is_first_dei_done : unsigned(0 downto 0) := to_unsigned(0, 1);
signal device_in_result : device_in_result_t := device_in_result_t_NULL;
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_current_dei_phase : unsigned(7 downto 0);
signal REG_COMB_dei_param : unsigned(7 downto 0);
signal REG_COMB_is_first_dei_done : unsigned(0 downto 0);
signal REG_COMB_device_in_result : device_in_result_t;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l450_c6_d048]
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c7_4850]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l450_c2_72a3]
signal dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_72a3]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_72a3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_72a3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_72a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l450_c2_72a3]
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_72a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_72a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_72a3]
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_72a3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_72a3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_72a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(3 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_72a3]
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l450_c2_72a3]
signal t8_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_72a3]
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l450_c2_72a3]
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l467_c11_4146]
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c1_597a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l467_c7_4850]
signal dei_param_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l467_c7_4850]
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c7_4850]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l467_c7_4850]
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l467_c7_4850]
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l467_c7_4850]
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c7_4850]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(3 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l467_c7_4850]
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l467_c7_4850]
signal t8_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l467_c7_4850]
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l467_c7_4850]
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_return_output : device_in_result_t;

-- sp_relative_shift[uxn_opcodes_h_l468_c30_9477]
signal sp_relative_shift_uxn_opcodes_h_l468_c30_9477_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l468_c30_9477_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l468_c30_9477_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l468_c30_9477_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l472_c9_57e2]
signal BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l472_c9_3aab]
signal MUX_uxn_opcodes_h_l472_c9_3aab_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l472_c9_3aab_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l472_c9_3aab_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l472_c9_3aab_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l473_c40_fe58]
signal BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l473_c15_176b]
signal MUX_uxn_opcodes_h_l473_c15_176b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l473_c15_176b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l473_c15_176b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l473_c15_176b_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l474_c22_71bc]
signal device_in_uxn_opcodes_h_l474_c22_71bc_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_71bc_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_71bc_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_71bc_controller0_buttons : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_71bc_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_71bc_return_output : device_in_result_t;

-- result_is_stack_write_MUX[uxn_opcodes_h_l475_c3_e410]
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l475_c3_e410]
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l475_c3_e410]
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l475_c3_e410]
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c3_e410]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_return_output : unsigned(3 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l475_c3_e410]
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l475_c3_e410]
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l479_c37_ef61]
signal MUX_uxn_opcodes_h_l479_c37_ef61_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l479_c37_ef61_iftrue : unsigned(3 downto 0);
signal MUX_uxn_opcodes_h_l479_c37_ef61_iffalse : unsigned(3 downto 0);
signal MUX_uxn_opcodes_h_l479_c37_ef61_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l485_c4_90b3]
signal BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_return_output : unsigned(8 downto 0);

function CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6( ref_toks_0 : device_in_result_t;
 ref_toks_1 : unsigned) return device_in_result_t is
 
  variable base : device_in_result_t; 
  variable return_output : device_in_result_t;
begin
      base := ref_toks_0;
      base.is_dei_done := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_2652( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.device_ram_address := ref_toks_8;
      base.is_vram_write := ref_toks_9;
      base.is_ram_write := ref_toks_10;
      base.stack_address_sp_offset := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048
BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_left,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_right,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_return_output);

-- dei_param_MUX_uxn_opcodes_h_l450_c2_72a3
dei_param_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3
result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- t8_MUX_uxn_opcodes_h_l450_c2_72a3
t8_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
t8_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
t8_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
t8_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3
device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_cond,
device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue,
device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse,
device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146
BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_left,
BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_right,
BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_return_output);

-- dei_param_MUX_uxn_opcodes_h_l467_c7_4850
dei_param_MUX_uxn_opcodes_h_l467_c7_4850 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l467_c7_4850_cond,
dei_param_MUX_uxn_opcodes_h_l467_c7_4850_iftrue,
dei_param_MUX_uxn_opcodes_h_l467_c7_4850_iffalse,
dei_param_MUX_uxn_opcodes_h_l467_c7_4850_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850
result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_cond,
result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_return_output);

-- t8_MUX_uxn_opcodes_h_l467_c7_4850
t8_MUX_uxn_opcodes_h_l467_c7_4850 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l467_c7_4850_cond,
t8_MUX_uxn_opcodes_h_l467_c7_4850_iftrue,
t8_MUX_uxn_opcodes_h_l467_c7_4850_iffalse,
t8_MUX_uxn_opcodes_h_l467_c7_4850_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_cond,
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l467_c7_4850
device_in_result_MUX_uxn_opcodes_h_l467_c7_4850 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_cond,
device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_iftrue,
device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_iffalse,
device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_return_output);

-- sp_relative_shift_uxn_opcodes_h_l468_c30_9477
sp_relative_shift_uxn_opcodes_h_l468_c30_9477 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l468_c30_9477_ins,
sp_relative_shift_uxn_opcodes_h_l468_c30_9477_x,
sp_relative_shift_uxn_opcodes_h_l468_c30_9477_y,
sp_relative_shift_uxn_opcodes_h_l468_c30_9477_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2
BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_left,
BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_right,
BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_return_output);

-- MUX_uxn_opcodes_h_l472_c9_3aab
MUX_uxn_opcodes_h_l472_c9_3aab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l472_c9_3aab_cond,
MUX_uxn_opcodes_h_l472_c9_3aab_iftrue,
MUX_uxn_opcodes_h_l472_c9_3aab_iffalse,
MUX_uxn_opcodes_h_l472_c9_3aab_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_left,
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_right,
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_return_output);

-- MUX_uxn_opcodes_h_l473_c15_176b
MUX_uxn_opcodes_h_l473_c15_176b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l473_c15_176b_cond,
MUX_uxn_opcodes_h_l473_c15_176b_iftrue,
MUX_uxn_opcodes_h_l473_c15_176b_iffalse,
MUX_uxn_opcodes_h_l473_c15_176b_return_output);

-- device_in_uxn_opcodes_h_l474_c22_71bc
device_in_uxn_opcodes_h_l474_c22_71bc : entity work.device_in_0CLK_1cf980b6 port map (
clk,
device_in_uxn_opcodes_h_l474_c22_71bc_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l474_c22_71bc_device_address,
device_in_uxn_opcodes_h_l474_c22_71bc_phase,
device_in_uxn_opcodes_h_l474_c22_71bc_controller0_buttons,
device_in_uxn_opcodes_h_l474_c22_71bc_previous_device_ram_read,
device_in_uxn_opcodes_h_l474_c22_71bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410
result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_cond,
result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_cond,
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_return_output);

-- MUX_uxn_opcodes_h_l479_c37_ef61
MUX_uxn_opcodes_h_l479_c37_ef61 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l479_c37_ef61_cond,
MUX_uxn_opcodes_h_l479_c37_ef61_iftrue,
MUX_uxn_opcodes_h_l479_c37_ef61_iffalse,
MUX_uxn_opcodes_h_l479_c37_ef61_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_left,
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_right,
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 controller0_buttons,
 previous_stack_read,
 previous_device_ram_read,
 -- Registers
 t8,
 current_dei_phase,
 dei_param,
 is_first_dei_done,
 device_in_result,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_return_output,
 dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 t8_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_return_output,
 dei_param_MUX_uxn_opcodes_h_l467_c7_4850_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_return_output,
 t8_MUX_uxn_opcodes_h_l467_c7_4850_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_return_output,
 device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_return_output,
 sp_relative_shift_uxn_opcodes_h_l468_c30_9477_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_return_output,
 MUX_uxn_opcodes_h_l472_c9_3aab_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_return_output,
 MUX_uxn_opcodes_h_l473_c15_176b_return_output,
 device_in_uxn_opcodes_h_l474_c22_71bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_return_output,
 MUX_uxn_opcodes_h_l479_c37_ef61_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l456_c3_32ee : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_fe89 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l455_c3_ecfb : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_72a3_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_iffalse : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_c7_4850_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l471_c3_5503 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_9477_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_9477_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_9477_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_9477_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_3aab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_3aab_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_3aab_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_3aab_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_176b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_176b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_176b_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_176b_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_71bc_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_71bc_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_71bc_controller0_buttons : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_71bc_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_71bc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_71bc_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_4029_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l476_c4_771c : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l485_c4_d090 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_ef61_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_ef61_iftrue : unsigned(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_ef61_iffalse : unsigned(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_ef61_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_c22_62ab_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l483_c32_2f80_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l450_l467_l475_DUPLICATE_16bd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l467_l475_DUPLICATE_1a58_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_c17b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_8467_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2652_uxn_opcodes_h_l489_l444_DUPLICATE_f95b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_current_dei_phase : unsigned(7 downto 0);
variable REG_VAR_dei_param : unsigned(7 downto 0);
variable REG_VAR_is_first_dei_done : unsigned(0 downto 0);
variable REG_VAR_device_in_result : device_in_result_t;
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_current_dei_phase := current_dei_phase;
  REG_VAR_dei_param := dei_param;
  REG_VAR_is_first_dei_done := is_first_dei_done;
  REG_VAR_device_in_result := device_in_result;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_iftrue := to_unsigned(1, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l455_c3_ecfb := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l455_c3_ecfb;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l456_c3_32ee := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l456_c3_32ee;
     VAR_MUX_uxn_opcodes_h_l479_c37_ef61_iftrue := resize(to_unsigned(2, 2), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_iffalse := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_9477_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_9477_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l479_c37_ef61_iffalse := resize(to_unsigned(1, 1), 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_right := to_unsigned(1, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l476_c4_771c := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l476_c4_771c;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l471_c3_5503 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l471_c3_5503;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_fe89 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_fe89;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_controller0_buttons := controller0_buttons;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_in_uxn_opcodes_h_l474_c22_71bc_controller0_buttons := VAR_controller0_buttons;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_iftrue := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l474_c22_71bc_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4850_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_iftrue := device_in_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_9477_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l473_c15_176b_cond := is_first_dei_done;
     VAR_MUX_uxn_opcodes_h_l479_c37_ef61_cond := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_iffalse := is_first_dei_done;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_iftrue := is_first_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l474_c22_71bc_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_opcodes_h_l472_c9_3aab_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l472_c9_3aab_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_4850_iftrue := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_c17b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_c17b_return_output := result.is_opc_done;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_72a3_return_output := result.is_device_ram_write;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_72a3_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_opcodes_h_l450_c6_d048] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_left;
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output := BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;

     -- result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l467_c7_4850] LATENCY=0
     VAR_result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_c7_4850_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l472_c9_57e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l467_c11_4146] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_left;
     BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output := BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_72a3_return_output := result.is_ram_write;

     -- MUX[uxn_opcodes_h_l479_c37_ef61] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l479_c37_ef61_cond <= VAR_MUX_uxn_opcodes_h_l479_c37_ef61_cond;
     MUX_uxn_opcodes_h_l479_c37_ef61_iftrue <= VAR_MUX_uxn_opcodes_h_l479_c37_ef61_iftrue;
     MUX_uxn_opcodes_h_l479_c37_ef61_iffalse <= VAR_MUX_uxn_opcodes_h_l479_c37_ef61_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l479_c37_ef61_return_output := MUX_uxn_opcodes_h_l479_c37_ef61_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l485_c4_90b3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l467_l475_DUPLICATE_1a58 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l467_l475_DUPLICATE_1a58_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_8467 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_8467_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_72a3_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_72a3_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_72a3_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l450_l467_l475_DUPLICATE_16bd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l450_l467_l475_DUPLICATE_16bd_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l468_c30_9477] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l468_c30_9477_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_9477_ins;
     sp_relative_shift_uxn_opcodes_h_l468_c30_9477_x <= VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_9477_x;
     sp_relative_shift_uxn_opcodes_h_l468_c30_9477_y <= VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_9477_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_9477_return_output := sp_relative_shift_uxn_opcodes_h_l468_c30_9477_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_72a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_d048_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_4850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_4146_return_output;
     VAR_MUX_uxn_opcodes_h_l472_c9_3aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_57e2_return_output;
     VAR_current_dei_phase_uxn_opcodes_h_l485_c4_d090 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_90b3_return_output, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_c17b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_c17b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_8467_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_8467_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l467_l475_DUPLICATE_1a58_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l467_l475_DUPLICATE_1a58_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l450_l467_l475_DUPLICATE_1a58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l450_l467_l475_DUPLICATE_16bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l450_l467_l475_DUPLICATE_16bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l450_l467_l475_DUPLICATE_16bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_iftrue := VAR_MUX_uxn_opcodes_h_l479_c37_ef61_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_72a3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_72a3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_72a3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_72a3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_72a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_iftrue := VAR_result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_c7_4850_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_72a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_9477_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_iffalse := VAR_current_dei_phase_uxn_opcodes_h_l485_c4_d090;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c7_4850] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c7_4850] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- MUX[uxn_opcodes_h_l472_c9_3aab] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l472_c9_3aab_cond <= VAR_MUX_uxn_opcodes_h_l472_c9_3aab_cond;
     MUX_uxn_opcodes_h_l472_c9_3aab_iftrue <= VAR_MUX_uxn_opcodes_h_l472_c9_3aab_iftrue;
     MUX_uxn_opcodes_h_l472_c9_3aab_iffalse <= VAR_MUX_uxn_opcodes_h_l472_c9_3aab_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l472_c9_3aab_return_output := MUX_uxn_opcodes_h_l472_c9_3aab_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4850_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_left := VAR_MUX_uxn_opcodes_h_l472_c9_3aab_return_output;
     VAR_MUX_uxn_opcodes_h_l473_c15_176b_iftrue := VAR_MUX_uxn_opcodes_h_l472_c9_3aab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_4850_iffalse := VAR_MUX_uxn_opcodes_h_l472_c9_3aab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4850_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c1_597a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l473_c40_fe58] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_left;
     BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_return_output := BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- t8_MUX[uxn_opcodes_h_l467_c7_4850] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l467_c7_4850_cond <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_4850_cond;
     t8_MUX_uxn_opcodes_h_l467_c7_4850_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_4850_iftrue;
     t8_MUX_uxn_opcodes_h_l467_c7_4850_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_4850_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_4850_return_output := t8_MUX_uxn_opcodes_h_l467_c7_4850_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l473_c15_176b_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_fe58_return_output, 8);
     VAR_device_in_uxn_opcodes_h_l474_c22_71bc_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_597a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l467_c7_4850_return_output;
     -- t8_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     t8_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     t8_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := t8_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- MUX[uxn_opcodes_h_l473_c15_176b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l473_c15_176b_cond <= VAR_MUX_uxn_opcodes_h_l473_c15_176b_cond;
     MUX_uxn_opcodes_h_l473_c15_176b_iftrue <= VAR_MUX_uxn_opcodes_h_l473_c15_176b_iftrue;
     MUX_uxn_opcodes_h_l473_c15_176b_iffalse <= VAR_MUX_uxn_opcodes_h_l473_c15_176b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l473_c15_176b_return_output := MUX_uxn_opcodes_h_l473_c15_176b_return_output;

     -- Submodule level 4
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4850_iffalse := VAR_MUX_uxn_opcodes_h_l473_c15_176b_return_output;
     VAR_device_in_uxn_opcodes_h_l474_c22_71bc_device_address := VAR_MUX_uxn_opcodes_h_l473_c15_176b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;
     -- dei_param_MUX[uxn_opcodes_h_l467_c7_4850] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l467_c7_4850_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4850_cond;
     dei_param_MUX_uxn_opcodes_h_l467_c7_4850_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4850_iftrue;
     dei_param_MUX_uxn_opcodes_h_l467_c7_4850_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4850_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4850_return_output := dei_param_MUX_uxn_opcodes_h_l467_c7_4850_return_output;

     -- device_in[uxn_opcodes_h_l474_c22_71bc] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l474_c22_71bc_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l474_c22_71bc_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l474_c22_71bc_device_address <= VAR_device_in_uxn_opcodes_h_l474_c22_71bc_device_address;
     device_in_uxn_opcodes_h_l474_c22_71bc_phase <= VAR_device_in_uxn_opcodes_h_l474_c22_71bc_phase;
     device_in_uxn_opcodes_h_l474_c22_71bc_controller0_buttons <= VAR_device_in_uxn_opcodes_h_l474_c22_71bc_controller0_buttons;
     device_in_uxn_opcodes_h_l474_c22_71bc_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l474_c22_71bc_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l474_c22_71bc_return_output := device_in_uxn_opcodes_h_l474_c22_71bc_return_output;

     -- Submodule level 5
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4850_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_iffalse := VAR_device_in_uxn_opcodes_h_l474_c22_71bc_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l467_c7_4850] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_cond;
     device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_return_output := device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l475_c7_4029] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_4029_return_output := VAR_device_in_uxn_opcodes_h_l474_c22_71bc_return_output.is_dei_done;

     -- dei_param_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l483_c32_2f80] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l483_c32_2f80_return_output := VAR_device_in_uxn_opcodes_h_l474_c22_71bc_return_output.device_ram_address;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l480_c22_62ab] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_c22_62ab_return_output := VAR_device_in_uxn_opcodes_h_l474_c22_71bc_return_output.dei_value;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_4029_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_4029_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_4029_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_4029_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_4029_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_4029_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_4029_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_c22_62ab_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_iffalse := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l483_c32_2f80_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4850_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c3_e410] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l475_c3_e410] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l475_c3_e410] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l475_c3_e410] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_return_output := current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l475_c3_e410] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l475_c3_e410] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l475_c3_e410] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_cond;
     result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_return_output := result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_return_output;

     -- Submodule level 7
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_e410_return_output;
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_e410_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_e410_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_e410_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_e410_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_e410_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_e410_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l467_c7_4850] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l467_c7_4850] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_cond;
     result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_return_output := result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l467_c7_4850] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l467_c7_4850] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c7_4850] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l467_c7_4850] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l467_c7_4850] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_return_output := current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_return_output;

     -- Submodule level 8
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4850_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4850_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4850_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4850_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4850_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4850_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4850_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_72a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;

     -- Submodule level 9
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_72a3_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2652_uxn_opcodes_h_l489_l444_DUPLICATE_f95b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2652_uxn_opcodes_h_l489_l444_DUPLICATE_f95b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2652(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_72a3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_72a3_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2652_uxn_opcodes_h_l489_l444_DUPLICATE_f95b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2652_uxn_opcodes_h_l489_l444_DUPLICATE_f95b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_current_dei_phase <= REG_VAR_current_dei_phase;
REG_COMB_dei_param <= REG_VAR_dei_param;
REG_COMB_is_first_dei_done <= REG_VAR_is_first_dei_done;
REG_COMB_device_in_result <= REG_VAR_device_in_result;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     current_dei_phase <= REG_COMB_current_dei_phase;
     dei_param <= REG_COMB_dei_param;
     is_first_dei_done <= REG_COMB_is_first_dei_done;
     device_in_result <= REG_COMB_device_in_result;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
