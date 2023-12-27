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
entity dei2_0CLK_919eceda is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei2_0CLK_919eceda;
architecture arch of dei2_0CLK_919eceda is
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
-- BIN_OP_EQ[uxn_opcodes_h_l450_c6_bd64]
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c7_4037]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l450_c2_bd13]
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_bd13]
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_bd13]
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l450_c2_bd13]
signal t8_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(7 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l450_c2_bd13]
signal dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_bd13]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l450_c2_bd13]
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_bd13]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_bd13]
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_bd13]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_bd13]
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_bd13]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_bd13]
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_bd13]
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_bd13]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_bd13]
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l467_c11_d79d]
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c1_392c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_return_output : unsigned(0 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l467_c7_4037]
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l467_c7_4037]
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l467_c7_4037]
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l467_c7_4037]
signal t8_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(7 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l467_c7_4037]
signal dei_param_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l467_c7_4037]
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c7_4037]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l467_c7_4037]
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l467_c7_4037]
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c7_4037]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l467_c7_4037]
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l468_c30_f2b3]
signal sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l472_c9_8fa0]
signal BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l472_c9_ac89]
signal MUX_uxn_opcodes_h_l472_c9_ac89_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l472_c9_ac89_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l472_c9_ac89_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l472_c9_ac89_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l473_c40_0ab9]
signal BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l473_c15_6977]
signal MUX_uxn_opcodes_h_l473_c15_6977_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l473_c15_6977_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l473_c15_6977_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l473_c15_6977_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l474_c22_2467]
signal device_in_uxn_opcodes_h_l474_c22_2467_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_2467_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_2467_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_2467_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_2467_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l475_c3_c259]
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l475_c3_c259]
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l475_c3_c259]
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c3_c259]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l475_c3_c259]
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l475_c3_c259]
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l475_c3_c259]
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l479_c37_2a3a]
signal MUX_uxn_opcodes_h_l479_c37_2a3a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l479_c37_2a3a_iftrue : unsigned(3 downto 0);
signal MUX_uxn_opcodes_h_l479_c37_2a3a_iffalse : unsigned(3 downto 0);
signal MUX_uxn_opcodes_h_l479_c37_2a3a_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l485_c4_e789]
signal BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8fbf( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.device_ram_address := ref_toks_8;
      base.is_vram_write := ref_toks_9;
      base.is_pc_updated := ref_toks_10;
      base.is_opc_done := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64
BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_left,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_right,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13
device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- t8_MUX_uxn_opcodes_h_l450_c2_bd13
t8_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
t8_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
t8_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
t8_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- dei_param_MUX_uxn_opcodes_h_l450_c2_bd13
dei_param_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13
result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d
BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_left,
BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_right,
BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l467_c7_4037
device_in_result_MUX_uxn_opcodes_h_l467_c7_4037 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_cond,
device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_iftrue,
device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_iffalse,
device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_cond,
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_return_output);

-- t8_MUX_uxn_opcodes_h_l467_c7_4037
t8_MUX_uxn_opcodes_h_l467_c7_4037 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l467_c7_4037_cond,
t8_MUX_uxn_opcodes_h_l467_c7_4037_iftrue,
t8_MUX_uxn_opcodes_h_l467_c7_4037_iffalse,
t8_MUX_uxn_opcodes_h_l467_c7_4037_return_output);

-- dei_param_MUX_uxn_opcodes_h_l467_c7_4037
dei_param_MUX_uxn_opcodes_h_l467_c7_4037 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l467_c7_4037_cond,
dei_param_MUX_uxn_opcodes_h_l467_c7_4037_iftrue,
dei_param_MUX_uxn_opcodes_h_l467_c7_4037_iffalse,
dei_param_MUX_uxn_opcodes_h_l467_c7_4037_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037
result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_cond,
result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_return_output);

-- sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3
sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_ins,
sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_x,
sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_y,
sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0
BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_left,
BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_right,
BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_return_output);

-- MUX_uxn_opcodes_h_l472_c9_ac89
MUX_uxn_opcodes_h_l472_c9_ac89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l472_c9_ac89_cond,
MUX_uxn_opcodes_h_l472_c9_ac89_iftrue,
MUX_uxn_opcodes_h_l472_c9_ac89_iffalse,
MUX_uxn_opcodes_h_l472_c9_ac89_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_left,
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_right,
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_return_output);

-- MUX_uxn_opcodes_h_l473_c15_6977
MUX_uxn_opcodes_h_l473_c15_6977 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l473_c15_6977_cond,
MUX_uxn_opcodes_h_l473_c15_6977_iftrue,
MUX_uxn_opcodes_h_l473_c15_6977_iffalse,
MUX_uxn_opcodes_h_l473_c15_6977_return_output);

-- device_in_uxn_opcodes_h_l474_c22_2467
device_in_uxn_opcodes_h_l474_c22_2467 : entity work.device_in_0CLK_c6b159da port map (
clk,
device_in_uxn_opcodes_h_l474_c22_2467_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l474_c22_2467_device_address,
device_in_uxn_opcodes_h_l474_c22_2467_phase,
device_in_uxn_opcodes_h_l474_c22_2467_previous_device_ram_read,
device_in_uxn_opcodes_h_l474_c22_2467_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_cond,
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259
result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_cond,
result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_return_output);

-- MUX_uxn_opcodes_h_l479_c37_2a3a
MUX_uxn_opcodes_h_l479_c37_2a3a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l479_c37_2a3a_cond,
MUX_uxn_opcodes_h_l479_c37_2a3a_iftrue,
MUX_uxn_opcodes_h_l479_c37_2a3a_iffalse,
MUX_uxn_opcodes_h_l479_c37_2a3a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_left,
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_right,
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
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
 BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_return_output,
 device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 t8_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_return_output,
 device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_return_output,
 t8_MUX_uxn_opcodes_h_l467_c7_4037_return_output,
 dei_param_MUX_uxn_opcodes_h_l467_c7_4037_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_return_output,
 sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_return_output,
 MUX_uxn_opcodes_h_l472_c9_ac89_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_return_output,
 MUX_uxn_opcodes_h_l473_c15_6977_return_output,
 device_in_uxn_opcodes_h_l474_c22_2467_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_return_output,
 MUX_uxn_opcodes_h_l479_c37_2a3a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_bd13_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l455_c3_8334 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_e42d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l456_c3_b35e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_iffalse : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_c7_4037_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l471_c3_dcb7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_ac89_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_ac89_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_ac89_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_ac89_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_6977_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_6977_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_6977_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_6977_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_2467_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_2467_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_2467_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_2467_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_2467_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_79a8_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l476_c4_05da : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l485_c4_0dd6 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_2a3a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_2a3a_iftrue : unsigned(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_2a3a_iffalse : unsigned(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_2a3a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_c22_de14_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l483_c32_8c6c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_8899_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_0ef3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_7b44_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_5b8f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8fbf_uxn_opcodes_h_l444_l489_DUPLICATE_32ff_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l471_c3_dcb7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l471_c3_dcb7;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l456_c3_b35e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l456_c3_b35e;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l476_c4_05da := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l476_c4_05da;
     VAR_MUX_uxn_opcodes_h_l479_c37_2a3a_iftrue := resize(to_unsigned(2, 2), 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l455_c3_8334 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l455_c3_8334;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_iftrue := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l479_c37_2a3a_iffalse := resize(to_unsigned(1, 1), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_e42d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_e42d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_iftrue := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l474_c22_2467_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4037_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_iftrue := device_in_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l473_c15_6977_cond := is_first_dei_done;
     VAR_MUX_uxn_opcodes_h_l479_c37_2a3a_cond := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_iffalse := is_first_dei_done;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_iftrue := is_first_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l474_c22_2467_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_opcodes_h_l472_c9_ac89_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l472_c9_ac89_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_4037_iftrue := t8;
     -- MUX[uxn_opcodes_h_l479_c37_2a3a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l479_c37_2a3a_cond <= VAR_MUX_uxn_opcodes_h_l479_c37_2a3a_cond;
     MUX_uxn_opcodes_h_l479_c37_2a3a_iftrue <= VAR_MUX_uxn_opcodes_h_l479_c37_2a3a_iftrue;
     MUX_uxn_opcodes_h_l479_c37_2a3a_iffalse <= VAR_MUX_uxn_opcodes_h_l479_c37_2a3a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l479_c37_2a3a_return_output := MUX_uxn_opcodes_h_l479_c37_2a3a_return_output;

     -- result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l467_c7_4037] LATENCY=0
     VAR_result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_c7_4037_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_bd13_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_bd13_return_output := result.is_stack_index_flipped;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_bd13_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_opcodes_h_l467_c11_d79d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_left;
     BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output := BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_bd13_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l472_c9_8fa0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_left;
     BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_return_output := BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_8899 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_8899_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l485_c4_e789] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_left;
     BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_return_output := BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l468_c30_f2b3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_ins;
     sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_x;
     sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_return_output := sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_bd13_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_0ef3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_0ef3_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_7b44 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_7b44_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_bd13_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_5b8f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_5b8f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l450_c6_bd64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_left;
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output := BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_bd13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_bd64_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_4037_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d79d_return_output;
     VAR_MUX_uxn_opcodes_h_l472_c9_ac89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_8fa0_return_output;
     VAR_current_dei_phase_uxn_opcodes_h_l485_c4_0dd6 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_e789_return_output, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_5b8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_5b8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_7b44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_7b44_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_0ef3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_0ef3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_0ef3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_8899_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_8899_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_8899_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_iftrue := VAR_MUX_uxn_opcodes_h_l479_c37_2a3a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_bd13_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_bd13_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_bd13_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_bd13_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_bd13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_iftrue := VAR_result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_c7_4037_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_bd13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_f2b3_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_iffalse := VAR_current_dei_phase_uxn_opcodes_h_l485_c4_0dd6;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c7_4037] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c7_4037] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_return_output;

     -- MUX[uxn_opcodes_h_l472_c9_ac89] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l472_c9_ac89_cond <= VAR_MUX_uxn_opcodes_h_l472_c9_ac89_cond;
     MUX_uxn_opcodes_h_l472_c9_ac89_iftrue <= VAR_MUX_uxn_opcodes_h_l472_c9_ac89_iftrue;
     MUX_uxn_opcodes_h_l472_c9_ac89_iffalse <= VAR_MUX_uxn_opcodes_h_l472_c9_ac89_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l472_c9_ac89_return_output := MUX_uxn_opcodes_h_l472_c9_ac89_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4037_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_left := VAR_MUX_uxn_opcodes_h_l472_c9_ac89_return_output;
     VAR_MUX_uxn_opcodes_h_l473_c15_6977_iftrue := VAR_MUX_uxn_opcodes_h_l472_c9_ac89_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_4037_iffalse := VAR_MUX_uxn_opcodes_h_l472_c9_ac89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4037_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c1_392c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_return_output;

     -- t8_MUX[uxn_opcodes_h_l467_c7_4037] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l467_c7_4037_cond <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_4037_cond;
     t8_MUX_uxn_opcodes_h_l467_c7_4037_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_4037_iftrue;
     t8_MUX_uxn_opcodes_h_l467_c7_4037_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_4037_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_4037_return_output := t8_MUX_uxn_opcodes_h_l467_c7_4037_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l473_c40_0ab9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l473_c15_6977_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_0ab9_return_output, 8);
     VAR_device_in_uxn_opcodes_h_l474_c22_2467_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_392c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_t8_MUX_uxn_opcodes_h_l467_c7_4037_return_output;
     -- MUX[uxn_opcodes_h_l473_c15_6977] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l473_c15_6977_cond <= VAR_MUX_uxn_opcodes_h_l473_c15_6977_cond;
     MUX_uxn_opcodes_h_l473_c15_6977_iftrue <= VAR_MUX_uxn_opcodes_h_l473_c15_6977_iftrue;
     MUX_uxn_opcodes_h_l473_c15_6977_iffalse <= VAR_MUX_uxn_opcodes_h_l473_c15_6977_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l473_c15_6977_return_output := MUX_uxn_opcodes_h_l473_c15_6977_return_output;

     -- t8_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     t8_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     t8_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := t8_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- Submodule level 4
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4037_iffalse := VAR_MUX_uxn_opcodes_h_l473_c15_6977_return_output;
     VAR_device_in_uxn_opcodes_h_l474_c22_2467_device_address := VAR_MUX_uxn_opcodes_h_l473_c15_6977_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;
     -- device_in[uxn_opcodes_h_l474_c22_2467] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l474_c22_2467_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l474_c22_2467_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l474_c22_2467_device_address <= VAR_device_in_uxn_opcodes_h_l474_c22_2467_device_address;
     device_in_uxn_opcodes_h_l474_c22_2467_phase <= VAR_device_in_uxn_opcodes_h_l474_c22_2467_phase;
     device_in_uxn_opcodes_h_l474_c22_2467_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l474_c22_2467_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l474_c22_2467_return_output := device_in_uxn_opcodes_h_l474_c22_2467_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l467_c7_4037] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l467_c7_4037_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4037_cond;
     dei_param_MUX_uxn_opcodes_h_l467_c7_4037_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4037_iftrue;
     dei_param_MUX_uxn_opcodes_h_l467_c7_4037_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4037_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4037_return_output := dei_param_MUX_uxn_opcodes_h_l467_c7_4037_return_output;

     -- Submodule level 5
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4037_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_iffalse := VAR_device_in_uxn_opcodes_h_l474_c22_2467_return_output;
     -- dei_param_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l467_c7_4037] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_cond;
     device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_return_output := device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l483_c32_8c6c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l483_c32_8c6c_return_output := VAR_device_in_uxn_opcodes_h_l474_c22_2467_return_output.device_ram_address;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l480_c22_de14] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_c22_de14_return_output := VAR_device_in_uxn_opcodes_h_l474_c22_2467_return_output.dei_value;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l475_c7_79a8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_79a8_return_output := VAR_device_in_uxn_opcodes_h_l474_c22_2467_return_output.is_dei_done;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_79a8_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_79a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_79a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_79a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_79a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_79a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_79a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_c22_de14_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_iffalse := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l483_c32_8c6c_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4037_return_output;
     -- current_dei_phase_MUX[uxn_opcodes_h_l475_c3_c259] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_return_output := current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l475_c3_c259] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_cond;
     result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_return_output := result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c3_c259] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l475_c3_c259] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l475_c3_c259] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l475_c3_c259] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l475_c3_c259] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_return_output;

     -- Submodule level 7
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c259_return_output;
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c259_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c259_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c259_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c259_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c259_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l467_c7_4037] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_cond;
     result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_return_output := result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l467_c7_4037] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l467_c7_4037] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l467_c7_4037] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c7_4037] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l467_c7_4037] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_return_output := current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l467_c7_4037] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_return_output;

     -- Submodule level 8
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4037_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4037_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4037_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4037_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4037_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4037_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4037_return_output;
     -- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l450_c2_bd13] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_cond;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_return_output := result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;

     -- Submodule level 9
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_bd13_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8fbf_uxn_opcodes_h_l444_l489_DUPLICATE_32ff LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8fbf_uxn_opcodes_h_l444_l489_DUPLICATE_32ff_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8fbf(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_bd13_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_bd13_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8fbf_uxn_opcodes_h_l444_l489_DUPLICATE_32ff_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8fbf_uxn_opcodes_h_l444_l489_DUPLICATE_32ff_return_output;
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
