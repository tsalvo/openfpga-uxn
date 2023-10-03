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
-- Submodules: 164
entity deo2_0CLK_29335e8f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_29335e8f;
architecture arch of deo2_0CLK_29335e8f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal current_deo_phase : unsigned(7 downto 0) := to_unsigned(0, 8);
signal deo_param0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal deo_param1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal is_second_deo : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_current_deo_phase : unsigned(7 downto 0);
signal REG_COMB_deo_param0 : unsigned(7 downto 0);
signal REG_COMB_deo_param1 : unsigned(7 downto 0);
signal REG_COMB_is_second_deo : unsigned(0 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l533_c6_2da7]
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c1_96e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l543_c7_7000]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l533_c2_e02f]
signal l8_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l533_c2_e02f]
signal t8_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l533_c2_e02f]
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l533_c2_e02f]
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l533_c2_e02f]
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l533_c2_e02f]
signal n8_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l533_c2_e02f]
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l533_c2_e02f]
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l533_c2_e02f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l533_c2_e02f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l533_c2_e02f]
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l533_c2_e02f]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l533_c2_e02f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l533_c2_e02f]
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(31 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l533_c2_e02f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l533_c2_e02f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l533_c2_e02f]
signal result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(1 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c2_e02f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c2_e02f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l533_c2_e02f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c2_e02f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c2_e02f]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l534_c3_728b[uxn_opcodes_h_l534_c3_728b]
signal printf_uxn_opcodes_h_l534_c3_728b_uxn_opcodes_h_l534_c3_728b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l543_c11_5431]
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c7_0209]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l543_c7_7000]
signal l8_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l543_c7_7000]
signal t8_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l543_c7_7000]
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l543_c7_7000]
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l543_c7_7000]
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l543_c7_7000]
signal n8_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l543_c7_7000]
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l543_c7_7000]
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l543_c7_7000]
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l543_c7_7000]
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l543_c7_7000]
signal result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l543_c7_7000]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l543_c7_7000]
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l543_c7_7000]
signal result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l543_c7_7000]
signal result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(1 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l543_c7_7000]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l543_c7_7000]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l543_c7_7000]
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l543_c7_7000]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l543_c7_7000]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l547_c11_9a6f]
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l552_c7_69b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l547_c7_0209]
signal l8_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l547_c7_0209]
signal t8_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l547_c7_0209]
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l547_c7_0209]
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l547_c7_0209]
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l547_c7_0209]
signal n8_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l547_c7_0209]
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l547_c7_0209]
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l547_c7_0209]
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l547_c7_0209]
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l547_c7_0209]
signal result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l547_c7_0209]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l547_c7_0209]
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l547_c7_0209]
signal result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l547_c7_0209]
signal result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(1 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l547_c7_0209]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l547_c7_0209]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l547_c7_0209]
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l547_c7_0209]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l547_c7_0209]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l552_c11_a836]
signal BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l552_c7_69b7]
signal l8_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l552_c7_69b7]
signal is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l552_c7_69b7]
signal deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l552_c7_69b7]
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l552_c7_69b7]
signal n8_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l552_c7_69b7]
signal deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l552_c7_69b7]
signal current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l552_c7_69b7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l552_c7_69b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l552_c7_69b7]
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l552_c7_69b7]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l552_c7_69b7]
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l552_c7_69b7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l552_c7_69b7]
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(1 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l552_c7_69b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l552_c7_69b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l552_c7_69b7]
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l552_c7_69b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l552_c7_69b7]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l556_c11_8310]
signal BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c7_5803]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal l8_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal n8_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(1 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l556_c7_d1a4]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l561_c11_846e]
signal BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l565_c7_b384]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l561_c7_5803]
signal l8_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l561_c7_5803]
signal is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l561_c7_5803]
signal deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l561_c7_5803]
signal device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_return_output : device_out_result_t;

-- deo_param0_MUX[uxn_opcodes_h_l561_c7_5803]
signal deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l561_c7_5803]
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l561_c7_5803]
signal result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l561_c7_5803]
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l561_c7_5803]
signal result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l561_c7_5803]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l561_c7_5803]
signal result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l561_c7_5803]
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l561_c7_5803]
signal result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(1 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l561_c7_5803]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l561_c7_5803]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l561_c7_5803]
signal result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l561_c7_5803]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l561_c7_5803]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l565_c11_5038]
signal BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l572_c1_f713]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l565_c7_b384]
signal l8_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l565_c7_b384]
signal is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l565_c7_b384]
signal deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l565_c7_b384]
signal device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_return_output : device_out_result_t;

-- deo_param0_MUX[uxn_opcodes_h_l565_c7_b384]
signal deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l565_c7_b384]
signal current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l565_c7_b384]
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l565_c7_b384]
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l565_c7_b384]
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l565_c7_b384]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l565_c7_b384]
signal result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l565_c7_b384]
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l565_c7_b384]
signal result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(1 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l565_c7_b384]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l565_c7_b384]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l565_c7_b384]
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l565_c7_b384]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l565_c7_b384]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l570_c32_b170]
signal BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l570_c32_7d1a]
signal BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l570_c32_9680]
signal MUX_uxn_opcodes_h_l570_c32_9680_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l570_c32_9680_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l570_c32_9680_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l570_c32_9680_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l575_c32_150d]
signal BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l575_c16_f361]
signal MUX_uxn_opcodes_h_l575_c16_f361_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l575_c16_f361_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l575_c16_f361_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l575_c16_f361_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l576_c16_e3f2]
signal MUX_uxn_opcodes_h_l576_c16_e3f2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l576_c16_e3f2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l576_c16_e3f2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l576_c16_e3f2_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l577_c23_6e0a]
signal device_out_uxn_opcodes_h_l577_c23_6e0a_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l577_c23_6e0a_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l577_c23_6e0a_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l577_c23_6e0a_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l577_c23_6e0a_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l577_c23_6e0a_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l585_c24_19b7]
signal BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l586_c3_ef12]
signal is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l586_c3_ef12]
signal current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l590_c4_1d5e]
signal BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_ab2e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : signed;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned;
 ref_toks_13 : unsigned;
 ref_toks_14 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.device_ram_value := ref_toks_3;
      base.is_device_ram_read := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.vram_address := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_stack_read := ref_toks_8;
      base.vram_value := ref_toks_9;
      base.sp_relative_shift := ref_toks_10;
      base.stack_address_sp_offset := ref_toks_11;
      base.device_ram_address := ref_toks_12;
      base.is_sp_shift := ref_toks_13;
      base.is_device_ram_write := ref_toks_14;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7
BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_left,
BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_right,
BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- l8_MUX_uxn_opcodes_h_l533_c2_e02f
l8_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
l8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
l8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
l8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- t8_MUX_uxn_opcodes_h_l533_c2_e02f
t8_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
t8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
t8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
t8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f
is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f
deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f
device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- n8_MUX_uxn_opcodes_h_l533_c2_e02f
n8_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
n8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
n8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
n8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f
deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f
result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f
result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f
result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f
result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f
result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f
result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

-- printf_uxn_opcodes_h_l534_c3_728b_uxn_opcodes_h_l534_c3_728b
printf_uxn_opcodes_h_l534_c3_728b_uxn_opcodes_h_l534_c3_728b : entity work.printf_uxn_opcodes_h_l534_c3_728b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l534_c3_728b_uxn_opcodes_h_l534_c3_728b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431
BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_left,
BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_right,
BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- l8_MUX_uxn_opcodes_h_l543_c7_7000
l8_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l543_c7_7000_cond,
l8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
l8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
l8_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- t8_MUX_uxn_opcodes_h_l543_c7_7000
t8_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l543_c7_7000_cond,
t8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
t8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
t8_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000
is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_cond,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l543_c7_7000
deo_param1_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_cond,
deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l543_c7_7000
device_out_result_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_cond,
device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- n8_MUX_uxn_opcodes_h_l543_c7_7000
n8_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l543_c7_7000_cond,
n8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
n8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
n8_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l543_c7_7000
deo_param0_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_cond,
deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_cond,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000
result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000
result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000
result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_cond,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000
result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000
result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_cond,
result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f
BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_left,
BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_right,
BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- l8_MUX_uxn_opcodes_h_l547_c7_0209
l8_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l547_c7_0209_cond,
l8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
l8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
l8_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- t8_MUX_uxn_opcodes_h_l547_c7_0209
t8_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l547_c7_0209_cond,
t8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
t8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
t8_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209
is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_cond,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l547_c7_0209
deo_param1_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_cond,
deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l547_c7_0209
device_out_result_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_cond,
device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- n8_MUX_uxn_opcodes_h_l547_c7_0209
n8_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l547_c7_0209_cond,
n8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
n8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
n8_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l547_c7_0209
deo_param0_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_cond,
deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_cond,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209
result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209
result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209
result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_cond,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209
result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209
result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_cond,
result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836
BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_left,
BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_right,
BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- l8_MUX_uxn_opcodes_h_l552_c7_69b7
l8_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
l8_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
l8_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
l8_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7
is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7
deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7
device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- n8_MUX_uxn_opcodes_h_l552_c7_69b7
n8_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
n8_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
n8_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
n8_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7
deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7
current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7
result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7
result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310
BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_left,
BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_right,
BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- l8_MUX_uxn_opcodes_h_l556_c7_d1a4
l8_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
l8_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
l8_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
l8_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4
is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4
deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4
device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- n8_MUX_uxn_opcodes_h_l556_c7_d1a4
n8_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
n8_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
n8_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
n8_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4
deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4
current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4
result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4
result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4
result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4
result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4
result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4
result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4
result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4
result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4
result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4
result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e
BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_left,
BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_right,
BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- l8_MUX_uxn_opcodes_h_l561_c7_5803
l8_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l561_c7_5803_cond,
l8_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
l8_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
l8_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803
is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_cond,
is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l561_c7_5803
deo_param1_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_cond,
deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l561_c7_5803
device_out_result_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_cond,
device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l561_c7_5803
deo_param0_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_cond,
deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803
current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_cond,
current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803
result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803
result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803
result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803
result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803
result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_cond,
result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803
result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803
result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_cond,
result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803
result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803
result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038
BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_left,
BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_right,
BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_return_output);

-- l8_MUX_uxn_opcodes_h_l565_c7_b384
l8_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l565_c7_b384_cond,
l8_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
l8_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
l8_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384
is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_cond,
is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l565_c7_b384
deo_param1_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_cond,
deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l565_c7_b384
device_out_result_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_cond,
device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l565_c7_b384
deo_param0_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_cond,
deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384
current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_cond,
current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384
result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384
result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384
result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384
result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_cond,
result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384
result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384
result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_cond,
result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384
result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l570_c32_b170
BIN_OP_AND_uxn_opcodes_h_l570_c32_b170 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_left,
BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_right,
BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a
BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_left,
BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_right,
BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_return_output);

-- MUX_uxn_opcodes_h_l570_c32_9680
MUX_uxn_opcodes_h_l570_c32_9680 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l570_c32_9680_cond,
MUX_uxn_opcodes_h_l570_c32_9680_iftrue,
MUX_uxn_opcodes_h_l570_c32_9680_iffalse,
MUX_uxn_opcodes_h_l570_c32_9680_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d
BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_left,
BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_right,
BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_return_output);

-- MUX_uxn_opcodes_h_l575_c16_f361
MUX_uxn_opcodes_h_l575_c16_f361 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l575_c16_f361_cond,
MUX_uxn_opcodes_h_l575_c16_f361_iftrue,
MUX_uxn_opcodes_h_l575_c16_f361_iffalse,
MUX_uxn_opcodes_h_l575_c16_f361_return_output);

-- MUX_uxn_opcodes_h_l576_c16_e3f2
MUX_uxn_opcodes_h_l576_c16_e3f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l576_c16_e3f2_cond,
MUX_uxn_opcodes_h_l576_c16_e3f2_iftrue,
MUX_uxn_opcodes_h_l576_c16_e3f2_iffalse,
MUX_uxn_opcodes_h_l576_c16_e3f2_return_output);

-- device_out_uxn_opcodes_h_l577_c23_6e0a
device_out_uxn_opcodes_h_l577_c23_6e0a : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l577_c23_6e0a_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l577_c23_6e0a_device_address,
device_out_uxn_opcodes_h_l577_c23_6e0a_value,
device_out_uxn_opcodes_h_l577_c23_6e0a_phase,
device_out_uxn_opcodes_h_l577_c23_6e0a_previous_device_ram_read,
device_out_uxn_opcodes_h_l577_c23_6e0a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7
BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_left,
BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_right,
BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12
is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_cond,
is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12
current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_cond,
current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e
BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_left,
BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_right,
BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 previous_device_ram_read,
 -- Registers
 t8,
 n8,
 l8,
 current_deo_phase,
 deo_param0,
 deo_param1,
 is_second_deo,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 l8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 t8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 n8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 l8_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 t8_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 n8_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 l8_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 t8_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 n8_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 l8_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 n8_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 l8_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 n8_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 l8_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_return_output,
 l8_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_return_output,
 BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_return_output,
 BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_return_output,
 MUX_uxn_opcodes_h_l570_c32_9680_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_return_output,
 MUX_uxn_opcodes_h_l575_c16_f361_return_output,
 MUX_uxn_opcodes_h_l576_c16_e3f2_return_output,
 device_out_uxn_opcodes_h_l577_c23_6e0a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l541_c3_6538 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l537_c3_2a7c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l534_c3_728b_uxn_opcodes_h_l534_c3_728b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l545_c3_b1ea : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_d860 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l554_c3_6e36 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_f6e0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l563_c3_deeb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l574_c3_963d : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_0f3d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l565_c7_b384_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l570_c32_9680_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l570_c32_9680_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l570_c32_9680_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l570_c32_9680_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l575_c16_f361_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l575_c16_f361_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l575_c16_f361_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l575_c16_f361_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l576_c16_e3f2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l576_c16_e3f2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l576_c16_e3f2_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l576_c16_e3f2_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_c32_1680_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l579_c31_91ed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l580_c31_0975_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l581_c29_a740_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_c26_cc19_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l583_c25_1c4b_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l584_c23_0667_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l587_c4_eb98 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l590_c4_b719 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_bd77_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ffe5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_1599_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_289a_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c14b_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_8213_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c893_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_ec0c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3d7a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_8fe9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l586_l585_DUPLICATE_754a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ab2e_uxn_opcodes_h_l594_l526_DUPLICATE_cfac_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_current_deo_phase : unsigned(7 downto 0);
variable REG_VAR_deo_param0 : unsigned(7 downto 0);
variable REG_VAR_deo_param1 : unsigned(7 downto 0);
variable REG_VAR_is_second_deo : unsigned(0 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_current_deo_phase := current_deo_phase;
  REG_VAR_deo_param0 := deo_param0;
  REG_VAR_deo_param1 := deo_param1;
  REG_VAR_is_second_deo := is_second_deo;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_d860 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_d860;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l563_c3_deeb := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l563_c3_deeb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l570_c32_9680_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l545_c3_b1ea := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l545_c3_b1ea;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l537_c3_2a7c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l537_c3_2a7c;
     VAR_current_deo_phase_uxn_opcodes_h_l587_c4_eb98 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l587_c4_eb98;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_right := to_unsigned(128, 8);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l574_c3_963d := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l574_c3_963d;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l570_c32_9680_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_iffalse := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l541_c3_6538 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l541_c3_6538;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_f6e0 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_f6e0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l554_c3_6e36 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l554_c3_6e36;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_0f3d := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l568_c3_0f3d;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l575_c16_f361_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l576_c16_e3f2_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l576_c16_e3f2_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l576_c16_e3f2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_left := t8;
     VAR_MUX_uxn_opcodes_h_l575_c16_f361_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := t8;
     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c14b LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c14b_return_output := result.vram_value;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_289a LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_289a_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l561_c11_846e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_left;
     BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output := BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_1599 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_1599_return_output := result.is_device_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l565_c11_5038] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_left;
     BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output := BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l533_c2_e02f_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ffe5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ffe5_return_output := result.device_ram_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c893 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c893_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_ec0c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_ec0c_return_output := result.is_sp_shift;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l565_c7_b384_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3d7a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3d7a_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_8213 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_8213_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l570_c32_b170] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_left;
     BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_return_output := BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l590_c4_1d5e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l556_c11_8310] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_left;
     BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output := BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l552_c11_a836] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_left;
     BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output := BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l533_c2_e02f_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_8fe9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_8fe9_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_bd77 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_bd77_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l543_c11_5431] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_left;
     BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output := BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l547_c11_9a6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l565_c7_b384_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l533_c6_2da7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_left;
     BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output := BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;

     -- MUX[uxn_opcodes_h_l576_c16_e3f2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l576_c16_e3f2_cond <= VAR_MUX_uxn_opcodes_h_l576_c16_e3f2_cond;
     MUX_uxn_opcodes_h_l576_c16_e3f2_iftrue <= VAR_MUX_uxn_opcodes_h_l576_c16_e3f2_iftrue;
     MUX_uxn_opcodes_h_l576_c16_e3f2_iffalse <= VAR_MUX_uxn_opcodes_h_l576_c16_e3f2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l576_c16_e3f2_return_output := MUX_uxn_opcodes_h_l576_c16_e3f2_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l575_c32_150d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l570_c32_b170_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_2da7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_7000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_5431_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l547_c7_0209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_9a6f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l552_c11_a836_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l556_c11_8310_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c11_846e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l565_c11_5038_return_output;
     VAR_MUX_uxn_opcodes_h_l575_c16_f361_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l575_c32_150d_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l590_c4_b719 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l590_c4_1d5e_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_8213_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_8213_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_8213_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_8213_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_8213_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_8213_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_1599_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_1599_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_1599_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_1599_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_1599_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_1599_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_1599_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3d7a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3d7a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3d7a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3d7a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3d7a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3d7a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_3d7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_8fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_8fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_8fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_8fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_8fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l565_l561_l556_l552_l547_l543_DUPLICATE_8fe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_ec0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_ec0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_ec0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_ec0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_ec0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l533_l561_l556_l552_l547_l543_DUPLICATE_ec0c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_bd77_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_bd77_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_bd77_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_bd77_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_bd77_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_bd77_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_bd77_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c14b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c14b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c14b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c14b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c14b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c14b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c14b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_289a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_289a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_289a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_289a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_289a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_289a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_289a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c893_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c893_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c893_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c893_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c893_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c893_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_c893_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ffe5_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ffe5_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ffe5_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ffe5_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ffe5_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ffe5_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l533_l565_l561_l556_l552_l547_l543_DUPLICATE_ffe5_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_MUX_uxn_opcodes_h_l576_c16_e3f2_return_output;
     VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_value := VAR_MUX_uxn_opcodes_h_l576_c16_e3f2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l533_c2_e02f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l533_c2_e02f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l590_c4_b719;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_return_output := deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- n8_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_n8_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     n8_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     n8_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := n8_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- t8_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_t8_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     t8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     t8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l547_c7_0209_return_output := t8_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- MUX[uxn_opcodes_h_l575_c16_f361] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l575_c16_f361_cond <= VAR_MUX_uxn_opcodes_h_l575_c16_f361_cond;
     MUX_uxn_opcodes_h_l575_c16_f361_iftrue <= VAR_MUX_uxn_opcodes_h_l575_c16_f361_iftrue;
     MUX_uxn_opcodes_h_l575_c16_f361_iffalse <= VAR_MUX_uxn_opcodes_h_l575_c16_f361_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l575_c16_f361_return_output := MUX_uxn_opcodes_h_l575_c16_f361_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l570_c32_7d1a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_left;
     BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_return_output := BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_return_output;

     -- l8_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_l8_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     l8_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     l8_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l565_c7_b384_return_output := l8_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c1_96e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l570_c32_9680_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l570_c32_7d1a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_MUX_uxn_opcodes_h_l575_c16_f361_return_output;
     VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_device_address := VAR_MUX_uxn_opcodes_h_l575_c16_f361_return_output;
     VAR_printf_uxn_opcodes_h_l534_c3_728b_uxn_opcodes_h_l534_c3_728b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_96e8_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_l8_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_t8_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     -- n8_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_n8_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     n8_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     n8_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := n8_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- printf_uxn_opcodes_h_l534_c3_728b[uxn_opcodes_h_l534_c3_728b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l534_c3_728b_uxn_opcodes_h_l534_c3_728b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l534_c3_728b_uxn_opcodes_h_l534_c3_728b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_return_output := deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- l8_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_l8_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     l8_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     l8_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l561_c7_5803_return_output := l8_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- t8_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     t8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     t8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_7000_return_output := t8_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_return_output := deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- MUX[uxn_opcodes_h_l570_c32_9680] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l570_c32_9680_cond <= VAR_MUX_uxn_opcodes_h_l570_c32_9680_cond;
     MUX_uxn_opcodes_h_l570_c32_9680_iftrue <= VAR_MUX_uxn_opcodes_h_l570_c32_9680_iftrue;
     MUX_uxn_opcodes_h_l570_c32_9680_iffalse <= VAR_MUX_uxn_opcodes_h_l570_c32_9680_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l570_c32_9680_return_output := MUX_uxn_opcodes_h_l570_c32_9680_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_iftrue := VAR_MUX_uxn_opcodes_h_l570_c32_9680_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_l8_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_n8_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- n8_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     n8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     n8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_0209_return_output := n8_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- l8_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_l8_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     l8_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     l8_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := l8_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- t8_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     t8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     t8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := t8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_return_output := deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_l8_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_n8_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;
     -- n8_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     n8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     n8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_7000_return_output := n8_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- l8_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_l8_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     l8_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     l8_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := l8_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_l8_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_return_output := deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- l8_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     l8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     l8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_0209_return_output := l8_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- n8_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     n8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     n8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := n8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_l8_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- l8_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     l8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     l8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_7000_return_output := l8_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_return_output := deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_return_output := deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_l8_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l572_c1_f713] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- l8_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     l8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     l8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := l8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_return_output := deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l572_c1_f713_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- device_out[uxn_opcodes_h_l577_c23_6e0a] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l577_c23_6e0a_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l577_c23_6e0a_device_address <= VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_device_address;
     device_out_uxn_opcodes_h_l577_c23_6e0a_value <= VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_value;
     device_out_uxn_opcodes_h_l577_c23_6e0a_phase <= VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_phase;
     device_out_uxn_opcodes_h_l577_c23_6e0a_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_return_output := device_out_uxn_opcodes_h_l577_c23_6e0a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l584_c23_0667] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l584_c23_0667_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_return_output.vram_value;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l583_c25_1c4b] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l583_c25_1c4b_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_return_output.vram_address;

     -- device_out_result_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_return_output := device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l581_c29_a740] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l581_c29_a740_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_return_output.device_ram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l586_l585_DUPLICATE_754a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l586_l585_DUPLICATE_754a_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_return_output.is_deo_done;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l579_c31_91ed] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l579_c31_91ed_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l578_c32_1680] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_c32_1680_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l580_c31_0975] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l580_c31_0975_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l582_c26_cc19] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_c26_cc19_return_output := VAR_device_out_uxn_opcodes_h_l577_c23_6e0a_return_output.is_vram_write;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l586_l585_DUPLICATE_754a_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l586_l585_DUPLICATE_754a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l586_l585_DUPLICATE_754a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l579_c31_91ed_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_c32_1680_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l582_c26_cc19_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l584_c23_0667_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l583_c25_1c4b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l580_c31_0975_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l581_c29_a740_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     -- result_vram_value_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_return_output := result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_return_output := device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_return_output := result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l585_c24_19b7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_left;
     BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_return_output := BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l586_c3_ef12] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_cond;
     is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_return_output := is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l586_c3_ef12] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_return_output := current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l585_c24_19b7_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l586_c3_ef12_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l586_c3_ef12_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_return_output := current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_return_output := result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_return_output := is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l565_c7_b384] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_return_output := result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l565_c7_b384_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     -- result_vram_value_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_return_output := is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l561_c7_5803] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_return_output := current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l561_c7_5803_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_return_output := device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l556_c7_d1a4] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_cond;
     is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output := is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l556_c7_d1a4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     -- result_vram_value_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_return_output := result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_return_output := result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l552_c7_69b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_return_output := device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l552_c7_69b7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_return_output := result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_return_output := result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_return_output := is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l547_c7_0209] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_return_output := current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_0209_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_return_output := is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l543_c7_7000] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_return_output := current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_7000_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l533_c2_e02f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_e02f_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ab2e_uxn_opcodes_h_l594_l526_DUPLICATE_cfac LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ab2e_uxn_opcodes_h_l594_l526_DUPLICATE_cfac_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ab2e(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_e02f_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_e02f_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ab2e_uxn_opcodes_h_l594_l526_DUPLICATE_cfac_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ab2e_uxn_opcodes_h_l594_l526_DUPLICATE_cfac_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_current_deo_phase <= REG_VAR_current_deo_phase;
REG_COMB_deo_param0 <= REG_VAR_deo_param0;
REG_COMB_deo_param1 <= REG_VAR_deo_param1;
REG_COMB_is_second_deo <= REG_VAR_is_second_deo;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     current_deo_phase <= REG_COMB_current_deo_phase;
     deo_param0 <= REG_COMB_deo_param0;
     deo_param1 <= REG_COMB_deo_param1;
     is_second_deo <= REG_COMB_is_second_deo;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
