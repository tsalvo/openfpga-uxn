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
-- BIN_OP_EQ[uxn_opcodes_h_l450_c6_7307]
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c7_4d16]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_3036]
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_3036]
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l450_c2_3036]
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_3036]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_3036]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_3036]
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_3036]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_3036]
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_3036]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_3036]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_3036]
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_3036]
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_3036]
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l450_c2_3036]
signal dei_param_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l450_c2_3036]
signal t8_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l450_c2_3036]
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l467_c11_9397]
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c1_a3fd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l467_c7_4d16]
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l467_c7_4d16]
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l467_c7_4d16]
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c7_4d16]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c7_4d16]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l467_c7_4d16]
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l467_c7_4d16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l467_c7_4d16]
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l467_c7_4d16]
signal dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l467_c7_4d16]
signal t8_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l467_c7_4d16]
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : device_in_result_t;

-- sp_relative_shift[uxn_opcodes_h_l468_c30_5cee]
signal sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l472_c9_e571]
signal BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l472_c9_e29e]
signal MUX_uxn_opcodes_h_l472_c9_e29e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l472_c9_e29e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l472_c9_e29e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l472_c9_e29e_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l473_c40_f5bd]
signal BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l473_c15_2a14]
signal MUX_uxn_opcodes_h_l473_c15_2a14_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l473_c15_2a14_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l473_c15_2a14_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l473_c15_2a14_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l474_c22_699b]
signal device_in_uxn_opcodes_h_l474_c22_699b_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_699b_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_699b_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_699b_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_699b_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l475_c3_f231]
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l475_c3_f231]
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l475_c3_f231]
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c3_f231]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l475_c3_f231]
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l475_c3_f231]
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l475_c3_f231]
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l479_c37_abd7]
signal MUX_uxn_opcodes_h_l479_c37_abd7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l479_c37_abd7_iftrue : unsigned(3 downto 0);
signal MUX_uxn_opcodes_h_l479_c37_abd7_iffalse : unsigned(3 downto 0);
signal MUX_uxn_opcodes_h_l479_c37_abd7_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l485_c4_b7d6]
signal BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c65b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;
      base.is_opc_done := ref_toks_9;
      base.is_ram_write := ref_toks_10;
      base.is_stack_write := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307
BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_left,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_right,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_cond,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036
result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_cond,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- dei_param_MUX_uxn_opcodes_h_l450_c2_3036
dei_param_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l450_c2_3036_cond,
dei_param_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
dei_param_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
dei_param_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- t8_MUX_uxn_opcodes_h_l450_c2_3036
t8_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l450_c2_3036_cond,
t8_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
t8_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
t8_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l450_c2_3036
device_in_result_MUX_uxn_opcodes_h_l450_c2_3036 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_cond,
device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_iftrue,
device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_iffalse,
device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397
BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_left,
BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_right,
BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_cond,
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16
result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_cond,
result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_return_output);

-- dei_param_MUX_uxn_opcodes_h_l467_c7_4d16
dei_param_MUX_uxn_opcodes_h_l467_c7_4d16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_cond,
dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue,
dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse,
dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_return_output);

-- t8_MUX_uxn_opcodes_h_l467_c7_4d16
t8_MUX_uxn_opcodes_h_l467_c7_4d16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l467_c7_4d16_cond,
t8_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue,
t8_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse,
t8_MUX_uxn_opcodes_h_l467_c7_4d16_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16
device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_cond,
device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue,
device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse,
device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_return_output);

-- sp_relative_shift_uxn_opcodes_h_l468_c30_5cee
sp_relative_shift_uxn_opcodes_h_l468_c30_5cee : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_ins,
sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_x,
sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_y,
sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571
BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_left,
BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_right,
BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_return_output);

-- MUX_uxn_opcodes_h_l472_c9_e29e
MUX_uxn_opcodes_h_l472_c9_e29e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l472_c9_e29e_cond,
MUX_uxn_opcodes_h_l472_c9_e29e_iftrue,
MUX_uxn_opcodes_h_l472_c9_e29e_iffalse,
MUX_uxn_opcodes_h_l472_c9_e29e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_left,
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_right,
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_return_output);

-- MUX_uxn_opcodes_h_l473_c15_2a14
MUX_uxn_opcodes_h_l473_c15_2a14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l473_c15_2a14_cond,
MUX_uxn_opcodes_h_l473_c15_2a14_iftrue,
MUX_uxn_opcodes_h_l473_c15_2a14_iffalse,
MUX_uxn_opcodes_h_l473_c15_2a14_return_output);

-- device_in_uxn_opcodes_h_l474_c22_699b
device_in_uxn_opcodes_h_l474_c22_699b : entity work.device_in_0CLK_c6b159da port map (
clk,
device_in_uxn_opcodes_h_l474_c22_699b_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l474_c22_699b_device_address,
device_in_uxn_opcodes_h_l474_c22_699b_phase,
device_in_uxn_opcodes_h_l474_c22_699b_previous_device_ram_read,
device_in_uxn_opcodes_h_l474_c22_699b_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_cond,
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231
result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_cond,
result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_return_output);

-- MUX_uxn_opcodes_h_l479_c37_abd7
MUX_uxn_opcodes_h_l479_c37_abd7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l479_c37_abd7_cond,
MUX_uxn_opcodes_h_l479_c37_abd7_iftrue,
MUX_uxn_opcodes_h_l479_c37_abd7_iffalse,
MUX_uxn_opcodes_h_l479_c37_abd7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_left,
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_right,
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 dei_param_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 t8_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_return_output,
 dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_return_output,
 t8_MUX_uxn_opcodes_h_l467_c7_4d16_return_output,
 device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_return_output,
 sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_return_output,
 MUX_uxn_opcodes_h_l472_c9_e29e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_return_output,
 MUX_uxn_opcodes_h_l473_c15_2a14_return_output,
 device_in_uxn_opcodes_h_l474_c22_699b_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_return_output,
 MUX_uxn_opcodes_h_l479_c37_abd7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l455_c3_577f : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_1cf6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l456_c3_4504 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_3036_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_3036_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l471_c3_49b6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_c7_4d16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_e29e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_e29e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_e29e_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_e29e_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_2a14_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_2a14_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_2a14_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_2a14_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_699b_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_699b_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_699b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_699b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_699b_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_72a9_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l476_c4_b886 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l485_c4_ad20 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_abd7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_abd7_iftrue : unsigned(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_abd7_iffalse : unsigned(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_abd7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_c22_bdc4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l483_c32_f70c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_a522_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_54a8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_3fb7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_31f1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c65b_uxn_opcodes_h_l489_l444_DUPLICATE_3a40_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l476_c4_b886 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l476_c4_b886;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_1cf6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_1cf6;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l456_c3_4504 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l456_c3_4504;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l479_c37_abd7_iffalse := resize(to_unsigned(1, 1), 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l479_c37_abd7_iftrue := resize(to_unsigned(2, 2), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l471_c3_49b6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l471_c3_49b6;
     VAR_current_dei_phase_uxn_opcodes_h_l455_c3_577f := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l455_c3_577f;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l474_c22_699b_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue := device_in_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l473_c15_2a14_cond := is_first_dei_done;
     VAR_MUX_uxn_opcodes_h_l479_c37_abd7_cond := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_iffalse := is_first_dei_done;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_iftrue := is_first_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l474_c22_699b_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_opcodes_h_l472_c9_e29e_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l472_c9_e29e_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue := t8;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_3036_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l450_c6_7307] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_left;
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output := BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_a522 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_a522_return_output := result.u8_value;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_3036_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_opcodes_h_l472_c9_e571] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_left;
     BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_return_output := BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_3036_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_54a8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_54a8_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_31f1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_31f1_return_output := result.is_opc_done;

     -- MUX[uxn_opcodes_h_l479_c37_abd7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l479_c37_abd7_cond <= VAR_MUX_uxn_opcodes_h_l479_c37_abd7_cond;
     MUX_uxn_opcodes_h_l479_c37_abd7_iftrue <= VAR_MUX_uxn_opcodes_h_l479_c37_abd7_iftrue;
     MUX_uxn_opcodes_h_l479_c37_abd7_iffalse <= VAR_MUX_uxn_opcodes_h_l479_c37_abd7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l479_c37_abd7_return_output := MUX_uxn_opcodes_h_l479_c37_abd7_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_3036_return_output := result.is_stack_index_flipped;

     -- result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l467_c7_4d16] LATENCY=0
     VAR_result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_c7_4d16_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l485_c4_b7d6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_3fb7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_3fb7_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_3036_return_output := result.is_vram_write;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_3036_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l467_c11_9397] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_left;
     BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output := BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l468_c30_5cee] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_ins;
     sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_x <= VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_x;
     sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_y <= VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_return_output := sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_3036_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7307_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_4d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_9397_return_output;
     VAR_MUX_uxn_opcodes_h_l472_c9_e29e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_e571_return_output;
     VAR_current_dei_phase_uxn_opcodes_h_l485_c4_ad20 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_b7d6_return_output, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_31f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_31f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_3fb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_3fb7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_54a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_54a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_54a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_a522_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_a522_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_a522_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_iftrue := VAR_MUX_uxn_opcodes_h_l479_c37_abd7_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_3036_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_3036_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_3036_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_3036_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_3036_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue := VAR_result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_c7_4d16_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_3036_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_5cee_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_iffalse := VAR_current_dei_phase_uxn_opcodes_h_l485_c4_ad20;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c7_4d16] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c7_4d16] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- MUX[uxn_opcodes_h_l472_c9_e29e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l472_c9_e29e_cond <= VAR_MUX_uxn_opcodes_h_l472_c9_e29e_cond;
     MUX_uxn_opcodes_h_l472_c9_e29e_iftrue <= VAR_MUX_uxn_opcodes_h_l472_c9_e29e_iftrue;
     MUX_uxn_opcodes_h_l472_c9_e29e_iffalse <= VAR_MUX_uxn_opcodes_h_l472_c9_e29e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l472_c9_e29e_return_output := MUX_uxn_opcodes_h_l472_c9_e29e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_left := VAR_MUX_uxn_opcodes_h_l472_c9_e29e_return_output;
     VAR_MUX_uxn_opcodes_h_l473_c15_2a14_iftrue := VAR_MUX_uxn_opcodes_h_l472_c9_e29e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse := VAR_MUX_uxn_opcodes_h_l472_c9_e29e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l473_c40_f5bd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c1_a3fd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_return_output;

     -- t8_MUX[uxn_opcodes_h_l467_c7_4d16] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l467_c7_4d16_cond <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_4d16_cond;
     t8_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue;
     t8_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_4d16_return_output := t8_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l473_c15_2a14_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_f5bd_return_output, 8);
     VAR_device_in_uxn_opcodes_h_l474_c22_699b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_a3fd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_t8_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;
     -- MUX[uxn_opcodes_h_l473_c15_2a14] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l473_c15_2a14_cond <= VAR_MUX_uxn_opcodes_h_l473_c15_2a14_cond;
     MUX_uxn_opcodes_h_l473_c15_2a14_iftrue <= VAR_MUX_uxn_opcodes_h_l473_c15_2a14_iftrue;
     MUX_uxn_opcodes_h_l473_c15_2a14_iffalse <= VAR_MUX_uxn_opcodes_h_l473_c15_2a14_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l473_c15_2a14_return_output := MUX_uxn_opcodes_h_l473_c15_2a14_return_output;

     -- t8_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     t8_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     t8_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_3036_return_output := t8_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- Submodule level 4
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse := VAR_MUX_uxn_opcodes_h_l473_c15_2a14_return_output;
     VAR_device_in_uxn_opcodes_h_l474_c22_699b_device_address := VAR_MUX_uxn_opcodes_h_l473_c15_2a14_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l450_c2_3036_return_output;
     -- dei_param_MUX[uxn_opcodes_h_l467_c7_4d16] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_cond;
     dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue;
     dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_return_output := dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;

     -- device_in[uxn_opcodes_h_l474_c22_699b] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l474_c22_699b_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l474_c22_699b_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l474_c22_699b_device_address <= VAR_device_in_uxn_opcodes_h_l474_c22_699b_device_address;
     device_in_uxn_opcodes_h_l474_c22_699b_phase <= VAR_device_in_uxn_opcodes_h_l474_c22_699b_phase;
     device_in_uxn_opcodes_h_l474_c22_699b_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l474_c22_699b_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l474_c22_699b_return_output := device_in_uxn_opcodes_h_l474_c22_699b_return_output;

     -- Submodule level 5
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse := VAR_device_in_uxn_opcodes_h_l474_c22_699b_return_output;
     -- dei_param_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     dei_param_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     dei_param_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3036_return_output := dei_param_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l480_c22_bdc4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_c22_bdc4_return_output := VAR_device_in_uxn_opcodes_h_l474_c22_699b_return_output.dei_value;

     -- device_in_result_MUX[uxn_opcodes_h_l467_c7_4d16] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_cond;
     device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_return_output := device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l475_c7_72a9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_72a9_return_output := VAR_device_in_uxn_opcodes_h_l474_c22_699b_return_output.is_dei_done;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l483_c32_f70c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l483_c32_f70c_return_output := VAR_device_in_uxn_opcodes_h_l474_c22_699b_return_output.device_ram_address;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_72a9_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_72a9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_72a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_72a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_72a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_72a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_72a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_c22_bdc4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_iffalse := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l483_c32_f70c_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_3036_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l475_c3_f231] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l475_c3_f231] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l475_c3_f231] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l475_c3_f231] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_return_output := current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c3_f231] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_return_output := device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l475_c3_f231] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_cond;
     result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_return_output := result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l475_c3_f231] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_return_output;

     -- Submodule level 7
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_f231_return_output;
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_3036_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_f231_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_f231_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_f231_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_f231_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_f231_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_f231_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c7_4d16] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l467_c7_4d16] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l467_c7_4d16] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l467_c7_4d16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l467_c7_4d16] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_cond;
     result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_return_output := result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l467_c7_4d16] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_return_output := current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l467_c7_4d16] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;

     -- Submodule level 8
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_4d16_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_return_output := current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l450_c2_3036] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_cond;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_return_output := result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_return_output;

     -- Submodule level 9
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_3036_return_output;
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_3036_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c65b_uxn_opcodes_h_l489_l444_DUPLICATE_3a40 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c65b_uxn_opcodes_h_l489_l444_DUPLICATE_3a40_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c65b(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_3036_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c65b_uxn_opcodes_h_l489_l444_DUPLICATE_3a40_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c65b_uxn_opcodes_h_l489_l444_DUPLICATE_3a40_return_output;
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
