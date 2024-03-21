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
entity dei2_0CLK_898867fd is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 stack_ptr0 : in unsigned(7 downto 0);
 stack_ptr1 : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dei2_0CLK_898867fd;
architecture arch of dei2_0CLK_898867fd is
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
-- BIN_OP_EQ[uxn_opcodes_h_l450_c6_7b1a]
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c7_9ba6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal t8_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : device_in_result_t;

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l450_c2_dcfc]
signal dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l467_c11_f67e]
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c1_5818]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l467_c7_9ba6]
signal t8_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(7 downto 0);

-- current_dei_phase_MUX[uxn_opcodes_h_l467_c7_9ba6]
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(7 downto 0);

-- device_in_result_MUX[uxn_opcodes_h_l467_c7_9ba6]
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : device_in_result_t;
signal device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : device_in_result_t;

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c7_9ba6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c7_9ba6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l467_c7_9ba6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l467_c7_9ba6]
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l467_c7_9ba6]
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l467_c7_9ba6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l467_c7_9ba6]
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(0 downto 0);

-- dei_param_MUX[uxn_opcodes_h_l467_c7_9ba6]
signal dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(7 downto 0);
signal dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l468_c30_dfbd]
signal sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l472_c9_866c]
signal BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l472_c9_35df]
signal MUX_uxn_opcodes_h_l472_c9_35df_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l472_c9_35df_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l472_c9_35df_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l472_c9_35df_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l473_c40_094e]
signal BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l473_c15_e5cf]
signal MUX_uxn_opcodes_h_l473_c15_e5cf_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l473_c15_e5cf_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l473_c15_e5cf_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l473_c15_e5cf_return_output : unsigned(7 downto 0);

-- device_in[uxn_opcodes_h_l474_c22_07f7]
signal device_in_uxn_opcodes_h_l474_c22_07f7_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_07f7_device_address : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_07f7_phase : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_07f7_controller0_buttons : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_07f7_stack_ptr0 : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_07f7_stack_ptr1 : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_07f7_previous_device_ram_read : unsigned(7 downto 0);
signal device_in_uxn_opcodes_h_l474_c22_07f7_return_output : device_in_result_t;

-- current_dei_phase_MUX[uxn_opcodes_h_l475_c3_c7c4]
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_cond : unsigned(0 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse : unsigned(7 downto 0);
signal current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c3_c7c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l475_c3_c7c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l475_c3_c7c4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l475_c3_c7c4]
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l475_c3_c7c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output : unsigned(0 downto 0);

-- is_first_dei_done_MUX[uxn_opcodes_h_l475_c3_c7c4]
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_cond : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse : unsigned(0 downto 0);
signal is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l479_c37_019e]
signal MUX_uxn_opcodes_h_l479_c37_019e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l479_c37_019e_iftrue : unsigned(3 downto 0);
signal MUX_uxn_opcodes_h_l479_c37_019e_iffalse : unsigned(3 downto 0);
signal MUX_uxn_opcodes_h_l479_c37_019e_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l485_c4_387d]
signal BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_0b1f( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_ram_write := ref_toks_10;
      base.is_stack_write := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a
BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_left,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_right,
BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output);

-- t8_MUX_uxn_opcodes_h_l450_c2_dcfc
t8_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
t8_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
t8_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
t8_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc
device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc
result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc
dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_cond,
dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue,
dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse,
dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e
BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_left,
BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_right,
BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_return_output);

-- t8_MUX_uxn_opcodes_h_l467_c7_9ba6
t8_MUX_uxn_opcodes_h_l467_c7_9ba6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l467_c7_9ba6_cond,
t8_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue,
t8_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse,
t8_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_cond,
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output);

-- device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6
device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_cond,
device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue,
device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse,
device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6
result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_cond,
result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output);

-- dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6
dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_cond,
dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue,
dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse,
dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd
sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_ins,
sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_x,
sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_y,
sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c
BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_left,
BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_right,
BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_return_output);

-- MUX_uxn_opcodes_h_l472_c9_35df
MUX_uxn_opcodes_h_l472_c9_35df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l472_c9_35df_cond,
MUX_uxn_opcodes_h_l472_c9_35df_iftrue,
MUX_uxn_opcodes_h_l472_c9_35df_iffalse,
MUX_uxn_opcodes_h_l472_c9_35df_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_left,
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_right,
BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_return_output);

-- MUX_uxn_opcodes_h_l473_c15_e5cf
MUX_uxn_opcodes_h_l473_c15_e5cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l473_c15_e5cf_cond,
MUX_uxn_opcodes_h_l473_c15_e5cf_iftrue,
MUX_uxn_opcodes_h_l473_c15_e5cf_iffalse,
MUX_uxn_opcodes_h_l473_c15_e5cf_return_output);

-- device_in_uxn_opcodes_h_l474_c22_07f7
device_in_uxn_opcodes_h_l474_c22_07f7 : entity work.device_in_0CLK_c062f1e5 port map (
clk,
device_in_uxn_opcodes_h_l474_c22_07f7_CLOCK_ENABLE,
device_in_uxn_opcodes_h_l474_c22_07f7_device_address,
device_in_uxn_opcodes_h_l474_c22_07f7_phase,
device_in_uxn_opcodes_h_l474_c22_07f7_controller0_buttons,
device_in_uxn_opcodes_h_l474_c22_07f7_stack_ptr0,
device_in_uxn_opcodes_h_l474_c22_07f7_stack_ptr1,
device_in_uxn_opcodes_h_l474_c22_07f7_previous_device_ram_read,
device_in_uxn_opcodes_h_l474_c22_07f7_return_output);

-- current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_cond,
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue,
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse,
current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4
result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_cond,
result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output);

-- is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_cond,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse,
is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output);

-- MUX_uxn_opcodes_h_l479_c37_019e
MUX_uxn_opcodes_h_l479_c37_019e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l479_c37_019e_cond,
MUX_uxn_opcodes_h_l479_c37_019e_iftrue,
MUX_uxn_opcodes_h_l479_c37_019e_iffalse,
MUX_uxn_opcodes_h_l479_c37_019e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_left,
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_right,
BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 controller0_buttons,
 stack_ptr0,
 stack_ptr1,
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
 BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output,
 t8_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_return_output,
 t8_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output,
 device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output,
 dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output,
 sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_return_output,
 MUX_uxn_opcodes_h_l472_c9_35df_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_return_output,
 MUX_uxn_opcodes_h_l473_c15_e5cf_return_output,
 device_in_uxn_opcodes_h_l474_c22_07f7_return_output,
 current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output,
 is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output,
 MUX_uxn_opcodes_h_l479_c37_019e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l455_c3_2907 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : device_in_result_t;
 variable VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_dcfc_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l456_c3_7f45 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_5a9e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : device_in_result_t;
 variable VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l471_c3_fce6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_c7_9ba6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse : unsigned(7 downto 0);
 variable VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_35df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_35df_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_35df_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l472_c9_35df_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_e5cf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_e5cf_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_e5cf_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l473_c15_e5cf_return_output : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_07f7_device_address : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_07f7_phase : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_07f7_controller0_buttons : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_07f7_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_07f7_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_07f7_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_07f7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_in_uxn_opcodes_h_l474_c22_07f7_return_output : device_in_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_ecaa_return_output : unsigned(0 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l476_c4_ad99 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse : unsigned(7 downto 0);
 variable VAR_current_dei_phase_uxn_opcodes_h_l485_c4_71d9 : unsigned(7 downto 0);
 variable VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_cond : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse : unsigned(0 downto 0);
 variable VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_019e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_019e_iftrue : unsigned(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_019e_iffalse : unsigned(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l479_c37_019e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_c22_b46e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l483_c32_2270_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_a83e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_7a06_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_5bf7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_69ad_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0b1f_uxn_opcodes_h_l444_l489_DUPLICATE_31f5_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_5a9e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_5a9e;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_right := to_unsigned(1, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l479_c37_019e_iftrue := resize(to_unsigned(2, 2), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l471_c3_fce6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l471_c3_fce6;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l456_c3_7f45 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l456_c3_7f45;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := to_unsigned(0, 1);
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := to_unsigned(0, 1);
     VAR_current_dei_phase_uxn_opcodes_h_l476_c4_ad99 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l476_c4_ad99;
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_current_dei_phase_uxn_opcodes_h_l455_c3_2907 := resize(to_unsigned(0, 1), 8);
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := VAR_current_dei_phase_uxn_opcodes_h_l455_c3_2907;
     VAR_MUX_uxn_opcodes_h_l479_c37_019e_iffalse := resize(to_unsigned(1, 1), 4);

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
     VAR_stack_ptr0 := stack_ptr0;
     VAR_stack_ptr1 := stack_ptr1;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_in_uxn_opcodes_h_l474_c22_07f7_controller0_buttons := VAR_controller0_buttons;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_left := current_dei_phase;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue := current_dei_phase;
     VAR_device_in_uxn_opcodes_h_l474_c22_07f7_phase := current_dei_phase;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := dei_param;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue := dei_param;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue := device_in_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l473_c15_e5cf_cond := is_first_dei_done;
     VAR_MUX_uxn_opcodes_h_l479_c37_019e_cond := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue := is_first_dei_done;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse := is_first_dei_done;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue := is_first_dei_done;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_left := VAR_phase;
     VAR_device_in_uxn_opcodes_h_l474_c22_07f7_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_MUX_uxn_opcodes_h_l472_c9_35df_iftrue := VAR_previous_stack_read;
     VAR_device_in_uxn_opcodes_h_l474_c22_07f7_stack_ptr0 := VAR_stack_ptr0;
     VAR_device_in_uxn_opcodes_h_l474_c22_07f7_stack_ptr1 := VAR_stack_ptr1;
     VAR_MUX_uxn_opcodes_h_l472_c9_35df_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_a83e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_a83e_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_5bf7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_5bf7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l450_c6_7b1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l485_c4_387d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l467_c11_f67e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_left;
     BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output := BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l468_c30_dfbd] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_ins;
     sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_x <= VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_x;
     sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_y <= VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_return_output := sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_dcfc_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_dcfc_return_output := result.is_pc_updated;

     -- result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l467_c7_9ba6] LATENCY=0
     VAR_result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_c7_9ba6_return_output := result.is_stack_write;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_dcfc_return_output := result.is_device_ram_write;

     -- device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_dcfc_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6(
     device_in_result,
     to_unsigned(0, 1));

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_dcfc_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l472_c9_866c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_left;
     BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_return_output := BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_dcfc_return_output := result.is_stack_index_flipped;

     -- MUX[uxn_opcodes_h_l479_c37_019e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l479_c37_019e_cond <= VAR_MUX_uxn_opcodes_h_l479_c37_019e_cond;
     MUX_uxn_opcodes_h_l479_c37_019e_iftrue <= VAR_MUX_uxn_opcodes_h_l479_c37_019e_iftrue;
     MUX_uxn_opcodes_h_l479_c37_019e_iffalse <= VAR_MUX_uxn_opcodes_h_l479_c37_019e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l479_c37_019e_return_output := MUX_uxn_opcodes_h_l479_c37_019e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_7a06 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_7a06_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_69ad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_69ad_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_dcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l450_c6_7b1a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output;
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_9ba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l467_c11_f67e_return_output;
     VAR_MUX_uxn_opcodes_h_l472_c9_35df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l472_c9_866c_return_output;
     VAR_current_dei_phase_uxn_opcodes_h_l485_c4_71d9 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l485_c4_387d_return_output, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_69ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_69ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_5bf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l467_l475_DUPLICATE_5bf7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_a83e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_a83e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_a83e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_7a06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_7a06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l467_l475_l450_DUPLICATE_7a06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue := VAR_MUX_uxn_opcodes_h_l479_c37_019e_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue := VAR_device_in_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_6bb6_uxn_opcodes_h_l450_c2_dcfc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l450_c2_dcfc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l450_c2_dcfc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l450_c2_dcfc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l450_c2_dcfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue := VAR_result_is_stack_write_TRUE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l467_c7_9ba6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l450_c2_dcfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l468_c30_dfbd_return_output;
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse := VAR_current_dei_phase_uxn_opcodes_h_l485_c4_71d9;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l467_c7_9ba6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l467_c7_9ba6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;

     -- MUX[uxn_opcodes_h_l472_c9_35df] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l472_c9_35df_cond <= VAR_MUX_uxn_opcodes_h_l472_c9_35df_cond;
     MUX_uxn_opcodes_h_l472_c9_35df_iftrue <= VAR_MUX_uxn_opcodes_h_l472_c9_35df_iftrue;
     MUX_uxn_opcodes_h_l472_c9_35df_iffalse <= VAR_MUX_uxn_opcodes_h_l472_c9_35df_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l472_c9_35df_return_output := MUX_uxn_opcodes_h_l472_c9_35df_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_left := VAR_MUX_uxn_opcodes_h_l472_c9_35df_return_output;
     VAR_MUX_uxn_opcodes_h_l473_c15_e5cf_iftrue := VAR_MUX_uxn_opcodes_h_l472_c9_35df_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse := VAR_MUX_uxn_opcodes_h_l472_c9_35df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- t8_MUX[uxn_opcodes_h_l467_c7_9ba6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l467_c7_9ba6_cond <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_9ba6_cond;
     t8_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue;
     t8_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output := t8_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l470_c1_5818] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l473_c40_094e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l473_c15_e5cf_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l473_c40_094e_return_output, 8);
     VAR_device_in_uxn_opcodes_h_l474_c22_07f7_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l470_c1_5818_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;
     -- t8_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     t8_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     t8_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := t8_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- MUX[uxn_opcodes_h_l473_c15_e5cf] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l473_c15_e5cf_cond <= VAR_MUX_uxn_opcodes_h_l473_c15_e5cf_cond;
     MUX_uxn_opcodes_h_l473_c15_e5cf_iftrue <= VAR_MUX_uxn_opcodes_h_l473_c15_e5cf_iftrue;
     MUX_uxn_opcodes_h_l473_c15_e5cf_iffalse <= VAR_MUX_uxn_opcodes_h_l473_c15_e5cf_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l473_c15_e5cf_return_output := MUX_uxn_opcodes_h_l473_c15_e5cf_return_output;

     -- Submodule level 4
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse := VAR_MUX_uxn_opcodes_h_l473_c15_e5cf_return_output;
     VAR_device_in_uxn_opcodes_h_l474_c22_07f7_device_address := VAR_MUX_uxn_opcodes_h_l473_c15_e5cf_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;
     -- device_in[uxn_opcodes_h_l474_c22_07f7] LATENCY=0
     -- Clock enable
     device_in_uxn_opcodes_h_l474_c22_07f7_CLOCK_ENABLE <= VAR_device_in_uxn_opcodes_h_l474_c22_07f7_CLOCK_ENABLE;
     -- Inputs
     device_in_uxn_opcodes_h_l474_c22_07f7_device_address <= VAR_device_in_uxn_opcodes_h_l474_c22_07f7_device_address;
     device_in_uxn_opcodes_h_l474_c22_07f7_phase <= VAR_device_in_uxn_opcodes_h_l474_c22_07f7_phase;
     device_in_uxn_opcodes_h_l474_c22_07f7_controller0_buttons <= VAR_device_in_uxn_opcodes_h_l474_c22_07f7_controller0_buttons;
     device_in_uxn_opcodes_h_l474_c22_07f7_stack_ptr0 <= VAR_device_in_uxn_opcodes_h_l474_c22_07f7_stack_ptr0;
     device_in_uxn_opcodes_h_l474_c22_07f7_stack_ptr1 <= VAR_device_in_uxn_opcodes_h_l474_c22_07f7_stack_ptr1;
     device_in_uxn_opcodes_h_l474_c22_07f7_previous_device_ram_read <= VAR_device_in_uxn_opcodes_h_l474_c22_07f7_previous_device_ram_read;
     -- Outputs
     VAR_device_in_uxn_opcodes_h_l474_c22_07f7_return_output := device_in_uxn_opcodes_h_l474_c22_07f7_return_output;

     -- dei_param_MUX[uxn_opcodes_h_l467_c7_9ba6] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_cond;
     dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue;
     dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output := dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;

     -- Submodule level 5
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_dei_param_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse := VAR_device_in_uxn_opcodes_h_l474_c22_07f7_return_output;
     -- device_in_result_MUX[uxn_opcodes_h_l467_c7_9ba6] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_cond;
     device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output := device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d[uxn_opcodes_h_l480_c22_b46e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_c22_b46e_return_output := VAR_device_in_uxn_opcodes_h_l474_c22_07f7_return_output.dei_value;

     -- CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d[uxn_opcodes_h_l475_c7_ecaa] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_ecaa_return_output := VAR_device_in_uxn_opcodes_h_l474_c22_07f7_return_output.is_dei_done;

     -- dei_param_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d[uxn_opcodes_h_l483_c32_2270] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l483_c32_2270_return_output := VAR_device_in_uxn_opcodes_h_l474_c22_07f7_return_output.device_ram_address;

     -- Submodule level 6
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_ecaa_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_ecaa_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_ecaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_ecaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_ecaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_ecaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_cond := VAR_CONST_REF_RD_uint1_t_device_in_result_t_is_dei_done_d41d_uxn_opcodes_h_l475_c7_ecaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue := VAR_CONST_REF_RD_uint8_t_device_in_result_t_dei_value_d41d_uxn_opcodes_h_l480_c22_b46e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse := VAR_CONST_REF_RD_uint8_t_device_in_result_t_device_ram_address_d41d_uxn_opcodes_h_l483_c32_2270_return_output;
     REG_VAR_dei_param := VAR_dei_param_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_device_in_result_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l475_c3_c7c4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output := result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l475_c3_c7c4] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l475_c3_c7c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l475_c3_c7c4] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output := current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l475_c3_c7c4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output;

     -- device_in_result_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l475_c3_c7c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l475_c3_c7c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output;

     -- Submodule level 7
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output;
     REG_VAR_device_in_result := VAR_device_in_result_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l475_c3_c7c4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l467_c7_9ba6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output := result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l467_c7_9ba6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l467_c7_9ba6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l467_c7_9ba6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l467_c7_9ba6] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;

     -- current_dei_phase_MUX[uxn_opcodes_h_l467_c7_9ba6] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output := current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l467_c7_9ba6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;

     -- Submodule level 8
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_current_dei_phase_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l467_c7_9ba6_return_output;
     -- current_dei_phase_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- is_first_dei_done_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l450_c2_dcfc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output := result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;

     -- Submodule level 9
     REG_VAR_current_dei_phase := VAR_current_dei_phase_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;
     REG_VAR_is_first_dei_done := VAR_is_first_dei_done_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0b1f_uxn_opcodes_h_l444_l489_DUPLICATE_31f5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0b1f_uxn_opcodes_h_l444_l489_DUPLICATE_31f5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0b1f(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l450_c2_dcfc_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0b1f_uxn_opcodes_h_l444_l489_DUPLICATE_31f5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0b1f_uxn_opcodes_h_l444_l489_DUPLICATE_31f5_return_output;
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
