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
-- Submodules: 73
entity deo2_0CLK_5952a5d7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_5952a5d7;
architecture arch of deo2_0CLK_5952a5d7 is
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
signal is_phase_3 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_phase_4 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_current_deo_phase : unsigned(7 downto 0);
signal REG_COMB_deo_param0 : unsigned(7 downto 0);
signal REG_COMB_deo_param1 : unsigned(7 downto 0);
signal REG_COMB_is_second_deo : unsigned(0 downto 0);
signal REG_COMB_is_phase_3 : unsigned(0 downto 0);
signal REG_COMB_is_phase_4 : unsigned(0 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l539_c6_e714]
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l539_c2_6730]
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l539_c2_6730]
signal n8_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l539_c2_6730]
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_return_output : device_out_result_t;

-- deo_param0_MUX[uxn_opcodes_h_l539_c2_6730]
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l539_c2_6730]
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l539_c2_6730]
signal t8_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l539_c2_6730]
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l539_c2_6730]
signal l8_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l539_c2_6730]
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l539_c2_6730]
signal result_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l539_c2_6730_return_output : opcode_result_t;

-- is_phase_4_MUX[uxn_opcodes_h_l539_c2_6730]
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l554_c11_b596]
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_fef1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal n8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : device_out_result_t;

-- deo_param0_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal t8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal l8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l554_c7_e9b5]
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l557_c11_60e6]
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_13b3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l557_c7_fef1]
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l557_c7_fef1]
signal n8_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l557_c7_fef1]
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : device_out_result_t;

-- deo_param0_MUX[uxn_opcodes_h_l557_c7_fef1]
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l557_c7_fef1]
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l557_c7_fef1]
signal t8_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l557_c7_fef1]
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l557_c7_fef1]
signal l8_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l557_c7_fef1]
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_fef1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l557_c7_fef1]
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l557_c7_fef1]
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_fef1]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l557_c7_fef1]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_fef1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_fef1]
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_fef1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_fef1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l557_c7_fef1]
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l562_c17_acd4]
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l562_c17_05a6]
signal MUX_uxn_opcodes_h_l562_c17_05a6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_05a6_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_05a6_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_05a6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l563_c17_62fa]
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l563_c17_1dd1]
signal MUX_uxn_opcodes_h_l563_c17_1dd1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_1dd1_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_1dd1_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_1dd1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l564_c8_af16]
signal MUX_uxn_opcodes_h_l564_c8_af16_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_af16_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_af16_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_af16_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l565_c8_0a0d]
signal MUX_uxn_opcodes_h_l565_c8_0a0d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_0a0d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_0a0d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_0a0d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l566_c32_bf35]
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l566_c16_de71]
signal MUX_uxn_opcodes_h_l566_c16_de71_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_de71_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_de71_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_de71_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l567_c16_a7ac]
signal MUX_uxn_opcodes_h_l567_c16_a7ac_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_a7ac_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_a7ac_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_a7ac_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l568_c43_ede0]
signal sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_return_output : signed(3 downto 0);

-- MUX[uxn_opcodes_h_l568_c30_3798]
signal MUX_uxn_opcodes_h_l568_c30_3798_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_3798_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_3798_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_3798_return_output : signed(3 downto 0);

-- device_out[uxn_opcodes_h_l569_c23_2072]
signal device_out_uxn_opcodes_h_l569_c23_2072_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_2072_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_2072_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_2072_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_2072_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_2072_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_2072_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l576_c24_f278]
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l577_c3_3e19]
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l577_c3_3e19]
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l581_c4_c8a2]
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_4770( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_b9e9( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.vram_write_layer := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.device_ram_address := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714
BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_left,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_right,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730
is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_cond,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_return_output);

-- n8_MUX_uxn_opcodes_h_l539_c2_6730
n8_MUX_uxn_opcodes_h_l539_c2_6730 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l539_c2_6730_cond,
n8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue,
n8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse,
n8_MUX_uxn_opcodes_h_l539_c2_6730_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l539_c2_6730
device_out_result_MUX_uxn_opcodes_h_l539_c2_6730 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_cond,
device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_iftrue,
device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_iffalse,
device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l539_c2_6730
deo_param0_MUX_uxn_opcodes_h_l539_c2_6730 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_cond,
deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_iftrue,
deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_iffalse,
deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_cond,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_return_output);

-- t8_MUX_uxn_opcodes_h_l539_c2_6730
t8_MUX_uxn_opcodes_h_l539_c2_6730 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l539_c2_6730_cond,
t8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue,
t8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse,
t8_MUX_uxn_opcodes_h_l539_c2_6730_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730
is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_cond,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_return_output);

-- l8_MUX_uxn_opcodes_h_l539_c2_6730
l8_MUX_uxn_opcodes_h_l539_c2_6730 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l539_c2_6730_cond,
l8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue,
l8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse,
l8_MUX_uxn_opcodes_h_l539_c2_6730_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l539_c2_6730
deo_param1_MUX_uxn_opcodes_h_l539_c2_6730 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_cond,
deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_iftrue,
deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_iffalse,
deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_return_output);

-- result_MUX_uxn_opcodes_h_l539_c2_6730
result_MUX_uxn_opcodes_h_l539_c2_6730 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l539_c2_6730_cond,
result_MUX_uxn_opcodes_h_l539_c2_6730_iftrue,
result_MUX_uxn_opcodes_h_l539_c2_6730_iffalse,
result_MUX_uxn_opcodes_h_l539_c2_6730_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730
is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_cond,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596
BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_left,
BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_right,
BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5
is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- n8_MUX_uxn_opcodes_h_l554_c7_e9b5
n8_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
n8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
n8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
n8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5
device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5
deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- t8_MUX_uxn_opcodes_h_l554_c7_e9b5
t8_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
t8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
t8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
t8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5
is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- l8_MUX_uxn_opcodes_h_l554_c7_e9b5
l8_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
l8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
l8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
l8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5
deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5
result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5
result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5
is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_cond,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6
BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_left,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_right,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1
is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- n8_MUX_uxn_opcodes_h_l557_c7_fef1
n8_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
n8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
n8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
n8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1
device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1
deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- t8_MUX_uxn_opcodes_h_l557_c7_fef1
t8_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
t8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
t8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
t8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1
is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- l8_MUX_uxn_opcodes_h_l557_c7_fef1
l8_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
l8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
l8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
l8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1
deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1
result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1
result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1
is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_cond,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4
BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_left,
BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_right,
BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_return_output);

-- MUX_uxn_opcodes_h_l562_c17_05a6
MUX_uxn_opcodes_h_l562_c17_05a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l562_c17_05a6_cond,
MUX_uxn_opcodes_h_l562_c17_05a6_iftrue,
MUX_uxn_opcodes_h_l562_c17_05a6_iffalse,
MUX_uxn_opcodes_h_l562_c17_05a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa
BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_left,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_right,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_return_output);

-- MUX_uxn_opcodes_h_l563_c17_1dd1
MUX_uxn_opcodes_h_l563_c17_1dd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l563_c17_1dd1_cond,
MUX_uxn_opcodes_h_l563_c17_1dd1_iftrue,
MUX_uxn_opcodes_h_l563_c17_1dd1_iffalse,
MUX_uxn_opcodes_h_l563_c17_1dd1_return_output);

-- MUX_uxn_opcodes_h_l564_c8_af16
MUX_uxn_opcodes_h_l564_c8_af16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l564_c8_af16_cond,
MUX_uxn_opcodes_h_l564_c8_af16_iftrue,
MUX_uxn_opcodes_h_l564_c8_af16_iffalse,
MUX_uxn_opcodes_h_l564_c8_af16_return_output);

-- MUX_uxn_opcodes_h_l565_c8_0a0d
MUX_uxn_opcodes_h_l565_c8_0a0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l565_c8_0a0d_cond,
MUX_uxn_opcodes_h_l565_c8_0a0d_iftrue,
MUX_uxn_opcodes_h_l565_c8_0a0d_iffalse,
MUX_uxn_opcodes_h_l565_c8_0a0d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_left,
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_right,
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_return_output);

-- MUX_uxn_opcodes_h_l566_c16_de71
MUX_uxn_opcodes_h_l566_c16_de71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l566_c16_de71_cond,
MUX_uxn_opcodes_h_l566_c16_de71_iftrue,
MUX_uxn_opcodes_h_l566_c16_de71_iffalse,
MUX_uxn_opcodes_h_l566_c16_de71_return_output);

-- MUX_uxn_opcodes_h_l567_c16_a7ac
MUX_uxn_opcodes_h_l567_c16_a7ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l567_c16_a7ac_cond,
MUX_uxn_opcodes_h_l567_c16_a7ac_iftrue,
MUX_uxn_opcodes_h_l567_c16_a7ac_iffalse,
MUX_uxn_opcodes_h_l567_c16_a7ac_return_output);

-- sp_relative_shift_uxn_opcodes_h_l568_c43_ede0
sp_relative_shift_uxn_opcodes_h_l568_c43_ede0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_ins,
sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_x,
sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_y,
sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_return_output);

-- MUX_uxn_opcodes_h_l568_c30_3798
MUX_uxn_opcodes_h_l568_c30_3798 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l568_c30_3798_cond,
MUX_uxn_opcodes_h_l568_c30_3798_iftrue,
MUX_uxn_opcodes_h_l568_c30_3798_iffalse,
MUX_uxn_opcodes_h_l568_c30_3798_return_output);

-- device_out_uxn_opcodes_h_l569_c23_2072
device_out_uxn_opcodes_h_l569_c23_2072 : entity work.device_out_0CLK_1666823b port map (
clk,
device_out_uxn_opcodes_h_l569_c23_2072_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l569_c23_2072_device_address,
device_out_uxn_opcodes_h_l569_c23_2072_value,
device_out_uxn_opcodes_h_l569_c23_2072_phase,
device_out_uxn_opcodes_h_l569_c23_2072_previous_device_ram_read,
device_out_uxn_opcodes_h_l569_c23_2072_previous_ram_read,
device_out_uxn_opcodes_h_l569_c23_2072_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l576_c24_f278
BIN_OP_AND_uxn_opcodes_h_l576_c24_f278 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_left,
BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_right,
BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_cond,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19
is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_cond,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_left,
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_right,
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 t8,
 n8,
 l8,
 current_deo_phase,
 deo_param0,
 deo_param1,
 is_second_deo,
 is_phase_3,
 is_phase_4,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_return_output,
 n8_MUX_uxn_opcodes_h_l539_c2_6730_return_output,
 device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_return_output,
 deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_return_output,
 t8_MUX_uxn_opcodes_h_l539_c2_6730_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_return_output,
 l8_MUX_uxn_opcodes_h_l539_c2_6730_return_output,
 deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_return_output,
 result_MUX_uxn_opcodes_h_l539_c2_6730_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 n8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 t8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 l8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 n8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 t8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 l8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_return_output,
 MUX_uxn_opcodes_h_l562_c17_05a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_return_output,
 MUX_uxn_opcodes_h_l563_c17_1dd1_return_output,
 MUX_uxn_opcodes_h_l564_c8_af16_return_output,
 MUX_uxn_opcodes_h_l565_c8_0a0d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_return_output,
 MUX_uxn_opcodes_h_l566_c16_de71_return_output,
 MUX_uxn_opcodes_h_l567_c16_a7ac_return_output,
 sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_return_output,
 MUX_uxn_opcodes_h_l568_c30_3798_return_output,
 device_out_uxn_opcodes_h_l569_c23_2072_return_output,
 BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l552_c3_1b26 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_6730_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_b9e9_uxn_opcodes_h_l539_c2_6730_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_6730_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_9ade : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_8030 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_84ce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_b23b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_fef1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_05a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_05a6_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_05a6_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_05a6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_1dd1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_1dd1_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_1dd1_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_1dd1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_af16_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_af16_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_af16_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_af16_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_0a0d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_0a0d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_0a0d_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_0a0d_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_de71_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_de71_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_de71_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_de71_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_a7ac_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_a7ac_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_a7ac_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_a7ac_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_3798_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_3798_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_3798_iffalse : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_3798_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_2072_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_2072_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_2072_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_2072_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_2072_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_2072_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_2072_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_f010_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_0219_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_40e8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_4b36_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_9f2e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_1866_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l578_c4_846d : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l581_c4_02f2 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_effd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_fc01_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c46a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_76a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_98dc_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_6a1f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_e24e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8e70_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l576_DUPLICATE_48e7_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_current_deo_phase : unsigned(7 downto 0);
variable REG_VAR_deo_param0 : unsigned(7 downto 0);
variable REG_VAR_deo_param1 : unsigned(7 downto 0);
variable REG_VAR_is_second_deo : unsigned(0 downto 0);
variable REG_VAR_is_phase_3 : unsigned(0 downto 0);
variable REG_VAR_is_phase_4 : unsigned(0 downto 0);
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
  REG_VAR_is_phase_3 := is_phase_3;
  REG_VAR_is_phase_4 := is_phase_4;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_84ce := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_84ce;
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l562_c17_05a6_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l562_c17_05a6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_8030 := resize(to_unsigned(1, 1), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_right := to_unsigned(3, 2);
     VAR_current_deo_phase_uxn_opcodes_h_l552_c3_1b26 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l552_c3_1b26;
     VAR_current_deo_phase_uxn_opcodes_h_l578_c4_846d := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l578_c4_846d;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l563_c17_1dd1_iffalse := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_9ade := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_MUX_uxn_opcodes_h_l563_c17_1dd1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_b23b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_b23b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l568_c30_3798_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_right := to_unsigned(1, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l569_c23_2072_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_ins := VAR_ins;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := is_phase_3;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := is_phase_4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l566_c16_de71_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l567_c16_a7ac_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l564_c8_af16_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l565_c8_0a0d_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l569_c23_2072_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l569_c23_2072_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l564_c8_af16_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l565_c8_0a0d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_left := t8;
     VAR_MUX_uxn_opcodes_h_l566_c16_de71_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_effd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_effd_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l554_c11_b596] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_left;
     BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output := BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8e70 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8e70_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_6a1f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_6a1f_return_output := result.device_ram_address;

     -- BIN_OP_PLUS[uxn_opcodes_h_l566_c32_bf35] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_left;
     BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_return_output := BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l581_c4_c8a2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_fef1_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_e24e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_e24e_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l562_c17_acd4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_left;
     BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_return_output := BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l568_c43_ede0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_ins;
     sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_x;
     sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_return_output := sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l563_c17_62fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l539_c2_6730] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_6730_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_9ade,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_8030,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_fc01 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_fc01_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c46a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c46a_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l557_c11_60e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_98dc LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_98dc_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_76a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_76a8_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_opcodes_h_l539_c6_e714] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_left;
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output := BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_6730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_6730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_6730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_6730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e714_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_b596_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_fef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_60e6_return_output;
     VAR_MUX_uxn_opcodes_h_l562_c17_05a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_acd4_return_output;
     VAR_MUX_uxn_opcodes_h_l563_c17_1dd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_62fa_return_output;
     VAR_MUX_uxn_opcodes_h_l566_c16_de71_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_bf35_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l581_c4_02f2 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_c8a2_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_98dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_98dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_fc01_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_fc01_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c46a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c46a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8e70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8e70_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_e24e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_e24e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_76a8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_76a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_6a1f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_6a1f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_effd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_effd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_6730_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_6730_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_fef1_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c30_3798_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_ede0_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l581_c4_02f2;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- MUX[uxn_opcodes_h_l566_c16_de71] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l566_c16_de71_cond <= VAR_MUX_uxn_opcodes_h_l566_c16_de71_cond;
     MUX_uxn_opcodes_h_l566_c16_de71_iftrue <= VAR_MUX_uxn_opcodes_h_l566_c16_de71_iftrue;
     MUX_uxn_opcodes_h_l566_c16_de71_iffalse <= VAR_MUX_uxn_opcodes_h_l566_c16_de71_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l566_c16_de71_return_output := MUX_uxn_opcodes_h_l566_c16_de71_return_output;

     -- MUX[uxn_opcodes_h_l563_c17_1dd1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l563_c17_1dd1_cond <= VAR_MUX_uxn_opcodes_h_l563_c17_1dd1_cond;
     MUX_uxn_opcodes_h_l563_c17_1dd1_iftrue <= VAR_MUX_uxn_opcodes_h_l563_c17_1dd1_iftrue;
     MUX_uxn_opcodes_h_l563_c17_1dd1_iffalse <= VAR_MUX_uxn_opcodes_h_l563_c17_1dd1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l563_c17_1dd1_return_output := MUX_uxn_opcodes_h_l563_c17_1dd1_return_output;

     -- t8_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     t8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     t8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := t8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- MUX[uxn_opcodes_h_l562_c17_05a6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l562_c17_05a6_cond <= VAR_MUX_uxn_opcodes_h_l562_c17_05a6_cond;
     MUX_uxn_opcodes_h_l562_c17_05a6_iftrue <= VAR_MUX_uxn_opcodes_h_l562_c17_05a6_iftrue;
     MUX_uxn_opcodes_h_l562_c17_05a6_iffalse <= VAR_MUX_uxn_opcodes_h_l562_c17_05a6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l562_c17_05a6_return_output := MUX_uxn_opcodes_h_l562_c17_05a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;
     VAR_MUX_uxn_opcodes_h_l564_c8_af16_cond := VAR_MUX_uxn_opcodes_h_l562_c17_05a6_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c30_3798_cond := VAR_MUX_uxn_opcodes_h_l562_c17_05a6_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_MUX_uxn_opcodes_h_l562_c17_05a6_return_output;
     VAR_MUX_uxn_opcodes_h_l565_c8_0a0d_cond := VAR_MUX_uxn_opcodes_h_l563_c17_1dd1_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_MUX_uxn_opcodes_h_l563_c17_1dd1_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_MUX_uxn_opcodes_h_l566_c16_de71_return_output;
     VAR_device_out_uxn_opcodes_h_l569_c23_2072_device_address := VAR_MUX_uxn_opcodes_h_l566_c16_de71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     -- is_phase_3_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- MUX[uxn_opcodes_h_l565_c8_0a0d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l565_c8_0a0d_cond <= VAR_MUX_uxn_opcodes_h_l565_c8_0a0d_cond;
     MUX_uxn_opcodes_h_l565_c8_0a0d_iftrue <= VAR_MUX_uxn_opcodes_h_l565_c8_0a0d_iftrue;
     MUX_uxn_opcodes_h_l565_c8_0a0d_iffalse <= VAR_MUX_uxn_opcodes_h_l565_c8_0a0d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l565_c8_0a0d_return_output := MUX_uxn_opcodes_h_l565_c8_0a0d_return_output;

     -- t8_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     t8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     t8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := t8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- MUX[uxn_opcodes_h_l564_c8_af16] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l564_c8_af16_cond <= VAR_MUX_uxn_opcodes_h_l564_c8_af16_cond;
     MUX_uxn_opcodes_h_l564_c8_af16_iftrue <= VAR_MUX_uxn_opcodes_h_l564_c8_af16_iftrue;
     MUX_uxn_opcodes_h_l564_c8_af16_iffalse <= VAR_MUX_uxn_opcodes_h_l564_c8_af16_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l564_c8_af16_return_output := MUX_uxn_opcodes_h_l564_c8_af16_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- MUX[uxn_opcodes_h_l568_c30_3798] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l568_c30_3798_cond <= VAR_MUX_uxn_opcodes_h_l568_c30_3798_cond;
     MUX_uxn_opcodes_h_l568_c30_3798_iftrue <= VAR_MUX_uxn_opcodes_h_l568_c30_3798_iftrue;
     MUX_uxn_opcodes_h_l568_c30_3798_iffalse <= VAR_MUX_uxn_opcodes_h_l568_c30_3798_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l568_c30_3798_return_output := MUX_uxn_opcodes_h_l568_c30_3798_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_a7ac_iffalse := VAR_MUX_uxn_opcodes_h_l564_c8_af16_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_MUX_uxn_opcodes_h_l564_c8_af16_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_a7ac_iftrue := VAR_MUX_uxn_opcodes_h_l565_c8_0a0d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_MUX_uxn_opcodes_h_l565_c8_0a0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_MUX_uxn_opcodes_h_l568_c30_3798_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse := VAR_t8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- t8_MUX[uxn_opcodes_h_l539_c2_6730] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l539_c2_6730_cond <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_6730_cond;
     t8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue;
     t8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_6730_return_output := t8_MUX_uxn_opcodes_h_l539_c2_6730_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_13b3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_return_output;

     -- l8_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     l8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     l8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := l8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- n8_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     n8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     n8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := n8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- MUX[uxn_opcodes_h_l567_c16_a7ac] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l567_c16_a7ac_cond <= VAR_MUX_uxn_opcodes_h_l567_c16_a7ac_cond;
     MUX_uxn_opcodes_h_l567_c16_a7ac_iftrue <= VAR_MUX_uxn_opcodes_h_l567_c16_a7ac_iftrue;
     MUX_uxn_opcodes_h_l567_c16_a7ac_iffalse <= VAR_MUX_uxn_opcodes_h_l567_c16_a7ac_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l567_c16_a7ac_return_output := MUX_uxn_opcodes_h_l567_c16_a7ac_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l569_c23_2072_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_13b3_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_MUX_uxn_opcodes_h_l567_c16_a7ac_return_output;
     VAR_device_out_uxn_opcodes_h_l569_c23_2072_value := VAR_MUX_uxn_opcodes_h_l567_c16_a7ac_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_l8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l539_c2_6730_return_output;
     -- l8_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     l8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     l8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := l8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l539_c2_6730] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_cond;
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_return_output := is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l539_c2_6730] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_cond;
     deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_return_output := deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_return_output;

     -- device_out[uxn_opcodes_h_l569_c23_2072] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l569_c23_2072_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l569_c23_2072_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l569_c23_2072_device_address <= VAR_device_out_uxn_opcodes_h_l569_c23_2072_device_address;
     device_out_uxn_opcodes_h_l569_c23_2072_value <= VAR_device_out_uxn_opcodes_h_l569_c23_2072_value;
     device_out_uxn_opcodes_h_l569_c23_2072_phase <= VAR_device_out_uxn_opcodes_h_l569_c23_2072_phase;
     device_out_uxn_opcodes_h_l569_c23_2072_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l569_c23_2072_previous_device_ram_read;
     device_out_uxn_opcodes_h_l569_c23_2072_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l569_c23_2072_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l569_c23_2072_return_output := device_out_uxn_opcodes_h_l569_c23_2072_return_output;

     -- n8_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     n8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     n8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := n8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l539_c2_6730] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_cond;
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_return_output := is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_6730_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_device_out_uxn_opcodes_h_l569_c23_2072_return_output;
     REG_VAR_is_phase_3 := VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_6730_return_output;
     REG_VAR_is_phase_4 := VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_6730_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse := VAR_l8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse := VAR_n8_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l573_c29_4b36] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_4b36_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_2072_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l572_c26_40e8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_40e8_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_2072_return_output.is_vram_write;

     -- device_out_result_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l570_c32_f010] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_f010_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_2072_return_output.is_device_ram_write;

     -- l8_MUX[uxn_opcodes_h_l539_c2_6730] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l539_c2_6730_cond <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_6730_cond;
     l8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue;
     l8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_6730_return_output := l8_MUX_uxn_opcodes_h_l539_c2_6730_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l571_c31_0219] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_0219_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_2072_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l576_DUPLICATE_48e7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l576_DUPLICATE_48e7_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_2072_return_output.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l575_c21_1866] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_1866_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_2072_return_output.u8_value;

     -- n8_MUX[uxn_opcodes_h_l539_c2_6730] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l539_c2_6730_cond <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_6730_cond;
     n8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_6730_iftrue;
     n8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_6730_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_6730_return_output := n8_MUX_uxn_opcodes_h_l539_c2_6730_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l574_c22_9f2e] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_9f2e_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_2072_return_output.u16_addr;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_9f2e_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l576_DUPLICATE_48e7_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l576_DUPLICATE_48e7_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l576_DUPLICATE_48e7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_f010_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_40e8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_4b36_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_0219_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_1866_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l539_c2_6730_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l539_c2_6730_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l577_c3_3e19] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_cond;
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_return_output := is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l539_c2_6730] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_cond;
     deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_return_output := deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l576_c24_f278] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_left;
     BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_return_output := BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l577_c3_3e19] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_return_output := current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_f278_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_3e19_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_6730_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_3e19_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l539_c2_6730] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_cond;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_return_output := device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l557_c7_fef1] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_cond;
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_return_output := is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_6730_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_fef1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l554_c7_e9b5] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_cond;
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output := is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_b9e9[uxn_opcodes_h_l539_c2_6730] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_b9e9_uxn_opcodes_h_l539_c2_6730_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b9e9(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_e9b5_return_output);

     -- current_deo_phase_MUX[uxn_opcodes_h_l539_c2_6730] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_return_output := current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l539_c2_6730] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_cond;
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_return_output := is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_return_output;

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_6730_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_6730_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_6730_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_b9e9_uxn_opcodes_h_l539_c2_6730_return_output;
     -- result_MUX[uxn_opcodes_h_l539_c2_6730] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l539_c2_6730_cond <= VAR_result_MUX_uxn_opcodes_h_l539_c2_6730_cond;
     result_MUX_uxn_opcodes_h_l539_c2_6730_iftrue <= VAR_result_MUX_uxn_opcodes_h_l539_c2_6730_iftrue;
     result_MUX_uxn_opcodes_h_l539_c2_6730_iffalse <= VAR_result_MUX_uxn_opcodes_h_l539_c2_6730_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l539_c2_6730_return_output := result_MUX_uxn_opcodes_h_l539_c2_6730_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l539_c2_6730_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l539_c2_6730_return_output;
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
REG_COMB_is_phase_3 <= REG_VAR_is_phase_3;
REG_COMB_is_phase_4 <= REG_VAR_is_phase_4;
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
     is_phase_3 <= REG_COMB_is_phase_3;
     is_phase_4 <= REG_COMB_is_phase_4;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
