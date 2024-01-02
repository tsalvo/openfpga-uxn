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
-- BIN_OP_EQ[uxn_opcodes_h_l450_c6_efc9]
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c7_a81a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal t8_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(7 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_a4e2]
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l467_c11_d00d]
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c1_1806]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_return_output : unsigned(0 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l467_c7_a81a]
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l467_c7_a81a]
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : device_in_result_t;

-- is_first_dei_done_MUX[uxn_opcodes_h_l467_c7_a81a]
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l467_c7_a81a]
signal t8_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(7 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l467_c7_a81a]
signal dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c7_a81a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l467_c7_a81a]
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l467_c7_a81a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l467_c7_a81a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l467_c7_a81a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c7_a81a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l468_c30_e2be]
signal sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l472_c9_3e38]
signal BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l472_c9_9fd6]
signal MUX_uxn_opcodes_h_l472_c9_9fd6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l472_c9_9fd6_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l472_c9_9fd6_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l472_c9_9fd6_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l473_c40_a639]
signal BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l473_c15_a6e8]
signal MUX_uxn_opcodes_h_l473_c15_a6e8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l473_c15_a6e8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l473_c15_a6e8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l473_c15_a6e8_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l474_c22_f46a]
signal device_in_uxn_opcodes_h_l474_c22_f46a_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_f46a_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_f46a_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_f46a_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_f46a_return_output : device_in_result_t;

-- current_dei_phase_MUX[uxn_opcodes_h_l475_c3_c325]
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_return_output : unsigned(7 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l475_c3_c325]
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l475_c3_c325]
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l475_c3_c325]
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l475_c3_c325]
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l475_c3_c325]
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c3_c325]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_return_output : unsigned(3 downto 0);

-- MUX[uxn_opcodes_h_l479_c37_4102]
signal MUX_uxn_opcodes_h_l479_c37_4102_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l479_c37_4102_iftrue : unsigned(3 downto 0);
signal MUX_uxn_opcodes_h_l479_c37_4102_iffalse : unsigned(3 downto 0);
signal MUX_uxn_opcodes_h_l479_c37_4102_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l485_c4_fbc2]
signal BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c644( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_device_ram_write := ref_toks_10;
      base.is_vram_write := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9
BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_left,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_right,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2
device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- t8_MUX_uxn_opcodes_h_l450_c2_a4e2
t8_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
t8_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
t8_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
t8_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2
dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2
result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d
BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_left,
BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_right,
BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_cond,
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a
device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_cond,
device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue,
device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse,
device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_return_output);

-- t8_MUX_uxn_opcodes_h_l467_c7_a81a
t8_MUX_uxn_opcodes_h_l467_c7_a81a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l467_c7_a81a_cond,
t8_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue,
t8_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse,
t8_MUX_uxn_opcodes_h_l467_c7_a81a_return_output);

-- dei_param_MUX_uxn_opcodes_h_l467_c7_a81a
dei_param_MUX_uxn_opcodes_h_l467_c7_a81a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_cond,
dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue,
dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse,
dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a
result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_cond,
result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l468_c30_e2be
sp_relative_shift_uxn_opcodes_h_l468_c30_e2be : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_ins,
sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_x,
sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_y,
sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38
BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_left,
BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_right,
BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_return_output);

-- MUX_uxn_opcodes_h_l472_c9_9fd6
MUX_uxn_opcodes_h_l472_c9_9fd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l472_c9_9fd6_cond,
MUX_uxn_opcodes_h_l472_c9_9fd6_iftrue,
MUX_uxn_opcodes_h_l472_c9_9fd6_iffalse,
MUX_uxn_opcodes_h_l472_c9_9fd6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_left,
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_right,
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_return_output);

-- MUX_uxn_opcodes_h_l473_c15_a6e8
MUX_uxn_opcodes_h_l473_c15_a6e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l473_c15_a6e8_cond,
MUX_uxn_opcodes_h_l473_c15_a6e8_iftrue,
MUX_uxn_opcodes_h_l473_c15_a6e8_iffalse,
MUX_uxn_opcodes_h_l473_c15_a6e8_return_output);

-- device_in_uxn_opcodes_h_l474_c22_f46a
device_in_uxn_opcodes_h_l474_c22_f46a : entity work.device_in_0CLK_c6b159da port map (
clk,
device_in_uxn_opcodes_h_l474_c22_f46a_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l474_c22_f46a_device_address,
device_in_uxn_opcodes_h_l474_c22_f46a_phase,
device_in_uxn_opcodes_h_l474_c22_f46a_previous_device_ram_read,
device_in_uxn_opcodes_h_l474_c22_f46a_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_cond,
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325
result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_cond,
result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_return_output);

-- MUX_uxn_opcodes_h_l479_c37_4102
MUX_uxn_opcodes_h_l479_c37_4102 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l479_c37_4102_cond,
MUX_uxn_opcodes_h_l479_c37_4102_iftrue,
MUX_uxn_opcodes_h_l479_c37_4102_iffalse,
MUX_uxn_opcodes_h_l479_c37_4102_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_left,
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_right,
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 t8_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_return_output,
 device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_return_output,
 t8_MUX_uxn_opcodes_h_l467_c7_a81a_return_output,
 dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_return_output,
 sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_return_output,
 MUX_uxn_opcodes_h_l472_c9_9fd6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_return_output,
 MUX_uxn_opcodes_h_l473_c15_a6e8_return_output,
 device_in_uxn_opcodes_h_l474_c22_f46a_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_return_output,
 MUX_uxn_opcodes_h_l479_c37_4102_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l455_c3_541b : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_a4e2_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l456_c3_8aa4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_e69f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_iffalse : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l471_c3_a98d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_c7_a81a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_9fd6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_9fd6_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_9fd6_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_9fd6_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_a6e8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_a6e8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_a6e8_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_a6e8_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_f46a_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_f46a_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_f46a_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_f46a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_f46a_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_acd3_return_output : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l476_c4_3d47 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l485_c4_6403 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_4102_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_4102_iftrue : unsigned(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_4102_iffalse : unsigned(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_4102_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_c22_b7c5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l483_c32_8322_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_925c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_fc91_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_80aa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_1078_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c644_uxn_opcodes_h_l489_l444_DUPLICATE_cbdd_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l456_c3_8aa4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l456_c3_8aa4;
     VAR_MUX_uxn_opcodes_h_l479_c37_4102_iftrue := resize(to_unsigned(2, 2), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_right := to_unsigned(2, 2);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_iffalse := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l471_c3_a98d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l471_c3_a98d;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_e69f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_e69f;
     VAR_MUX_uxn_opcodes_h_l479_c37_4102_iffalse := resize(to_unsigned(1, 1), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_right := to_unsigned(1, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l455_c3_541b := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l455_c3_541b;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l476_c4_3d47 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l476_c4_3d47;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l474_c22_f46a_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue := device_in_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l473_c15_a6e8_cond := is_first_dei_done;
     VAR_MUX_uxn_opcodes_h_l479_c37_4102_cond := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_iffalse := is_first_dei_done;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_iftrue := is_first_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l474_c22_f46a_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_opcodes_h_l472_c9_9fd6_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l472_c9_9fd6_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue := t8;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_a4e2_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l472_c9_3e38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_left;
     BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_return_output := BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_80aa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_80aa_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l485_c4_fbc2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_a4e2_return_output := result.is_stack_index_flipped;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_a4e2_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_fc91 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_fc91_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l467_c11_d00d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_left;
     BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output := BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l468_c30_e2be] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_ins;
     sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_x <= VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_x;
     sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_y <= VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_return_output := sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_a4e2_return_output := result.is_pc_updated;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_a4e2_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_1078 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_1078_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_a4e2_return_output := result.is_ram_write;

     -- result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l467_c7_a81a] LATENCY=0
     VAR_result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_c7_a81a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l450_c6_efc9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_left;
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output := BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;

     -- MUX[uxn_opcodes_h_l479_c37_4102] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l479_c37_4102_cond <= VAR_MUX_uxn_opcodes_h_l479_c37_4102_cond;
     MUX_uxn_opcodes_h_l479_c37_4102_iftrue <= VAR_MUX_uxn_opcodes_h_l479_c37_4102_iftrue;
     MUX_uxn_opcodes_h_l479_c37_4102_iffalse <= VAR_MUX_uxn_opcodes_h_l479_c37_4102_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l479_c37_4102_return_output := MUX_uxn_opcodes_h_l479_c37_4102_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_925c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_925c_return_output := result.device_ram_address;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_efc9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_a81a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_d00d_return_output;
     VAR_MUX_uxn_opcodes_h_l472_c9_9fd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_3e38_return_output;
     VAR_current_dei_phase_uxn_opcodes_h_l485_c4_6403 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_fbc2_return_output, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_80aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_80aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_1078_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_1078_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_925c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_925c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_925c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_fc91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_fc91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_fc91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_iftrue := VAR_MUX_uxn_opcodes_h_l479_c37_4102_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_a4e2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_a4e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_a4e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_a4e2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_a4e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue := VAR_result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_c7_a81a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_a4e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_e2be_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_iffalse := VAR_current_dei_phase_uxn_opcodes_h_l485_c4_6403;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c7_a81a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;

     -- MUX[uxn_opcodes_h_l472_c9_9fd6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l472_c9_9fd6_cond <= VAR_MUX_uxn_opcodes_h_l472_c9_9fd6_cond;
     MUX_uxn_opcodes_h_l472_c9_9fd6_iftrue <= VAR_MUX_uxn_opcodes_h_l472_c9_9fd6_iftrue;
     MUX_uxn_opcodes_h_l472_c9_9fd6_iffalse <= VAR_MUX_uxn_opcodes_h_l472_c9_9fd6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l472_c9_9fd6_return_output := MUX_uxn_opcodes_h_l472_c9_9fd6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c7_a81a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_left := VAR_MUX_uxn_opcodes_h_l472_c9_9fd6_return_output;
     VAR_MUX_uxn_opcodes_h_l473_c15_a6e8_iftrue := VAR_MUX_uxn_opcodes_h_l472_c9_9fd6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse := VAR_MUX_uxn_opcodes_h_l472_c9_9fd6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l473_c40_a639] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_left;
     BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_return_output := BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_return_output;

     -- t8_MUX[uxn_opcodes_h_l467_c7_a81a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l467_c7_a81a_cond <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_a81a_cond;
     t8_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue;
     t8_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_a81a_return_output := t8_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c1_1806] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l473_c15_a6e8_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_a639_return_output, 8);
     VAR_device_in_uxn_opcodes_h_l474_c22_f46a_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_1806_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;
     -- t8_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     t8_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     t8_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := t8_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- MUX[uxn_opcodes_h_l473_c15_a6e8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l473_c15_a6e8_cond <= VAR_MUX_uxn_opcodes_h_l473_c15_a6e8_cond;
     MUX_uxn_opcodes_h_l473_c15_a6e8_iftrue <= VAR_MUX_uxn_opcodes_h_l473_c15_a6e8_iftrue;
     MUX_uxn_opcodes_h_l473_c15_a6e8_iffalse <= VAR_MUX_uxn_opcodes_h_l473_c15_a6e8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l473_c15_a6e8_return_output := MUX_uxn_opcodes_h_l473_c15_a6e8_return_output;

     -- Submodule level 4
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse := VAR_MUX_uxn_opcodes_h_l473_c15_a6e8_return_output;
     VAR_device_in_uxn_opcodes_h_l474_c22_f46a_device_address := VAR_MUX_uxn_opcodes_h_l473_c15_a6e8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;
     -- dei_param_MUX[uxn_opcodes_h_l467_c7_a81a] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_cond;
     dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue;
     dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_return_output := dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;

     -- device_in[uxn_opcodes_h_l474_c22_f46a] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l474_c22_f46a_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l474_c22_f46a_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l474_c22_f46a_device_address <= VAR_device_in_uxn_opcodes_h_l474_c22_f46a_device_address;
     device_in_uxn_opcodes_h_l474_c22_f46a_phase <= VAR_device_in_uxn_opcodes_h_l474_c22_f46a_phase;
     device_in_uxn_opcodes_h_l474_c22_f46a_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l474_c22_f46a_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l474_c22_f46a_return_output := device_in_uxn_opcodes_h_l474_c22_f46a_return_output;

     -- Submodule level 5
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse := VAR_device_in_uxn_opcodes_h_l474_c22_f46a_return_output;
     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l483_c32_8322] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l483_c32_8322_return_output := VAR_device_in_uxn_opcodes_h_l474_c22_f46a_return_output.device_ram_address;

     -- dei_param_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l467_c7_a81a] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_cond;
     device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_return_output := device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l480_c22_b7c5] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_c22_b7c5_return_output := VAR_device_in_uxn_opcodes_h_l474_c22_f46a_return_output.dei_value;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l475_c7_acd3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_acd3_return_output := VAR_device_in_uxn_opcodes_h_l474_c22_f46a_return_output.is_dei_done;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_acd3_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_acd3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_acd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_acd3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_acd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_acd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_acd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_c22_b7c5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_iffalse := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l483_c32_8322_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c3_c325] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l475_c3_c325] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_return_output := current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l475_c3_c325] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_cond;
     result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_return_output := result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l475_c3_c325] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l475_c3_c325] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l475_c3_c325] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l475_c3_c325] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_return_output;

     -- Submodule level 7
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c325_return_output;
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c325_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c325_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c325_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c325_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c325_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c325_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c7_a81a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l467_c7_a81a] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l467_c7_a81a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l467_c7_a81a] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_return_output := current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l467_c7_a81a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l467_c7_a81a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l467_c7_a81a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_return_output := result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;

     -- Submodule level 8
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_a81a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_a4e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;

     -- Submodule level 9
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c644_uxn_opcodes_h_l489_l444_DUPLICATE_cbdd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c644_uxn_opcodes_h_l489_l444_DUPLICATE_cbdd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c644(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_a4e2_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c644_uxn_opcodes_h_l489_l444_DUPLICATE_cbdd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c644_uxn_opcodes_h_l489_l444_DUPLICATE_cbdd_return_output;
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
