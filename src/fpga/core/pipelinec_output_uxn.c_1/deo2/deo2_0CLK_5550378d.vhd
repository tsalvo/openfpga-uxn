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
entity deo2_0CLK_5550378d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(11 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_5550378d;
architecture arch of deo2_0CLK_5550378d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l539_c6_888a]
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c7_1450]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l539_c2_d373]
signal l8_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l539_c2_d373]
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l539_c2_d373]
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l539_c2_d373]
signal result_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l539_c2_d373_return_output : opcode_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l539_c2_d373]
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l539_c2_d373]
signal n8_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(7 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l539_c2_d373]
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l539_c2_d373]
signal t8_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l539_c2_d373]
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_return_output : device_out_result_t;

-- is_phase_4_MUX[uxn_opcodes_h_l539_c2_d373]
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l539_c2_d373]
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l554_c11_3faa]
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l554_c7_1450]
signal l8_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l554_c7_1450]
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l554_c7_1450]
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l554_c7_1450]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l554_c7_1450]
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l554_c7_1450]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l554_c7_1450]
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c7_1450]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l554_c7_1450]
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l554_c7_1450]
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l554_c7_1450]
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c7_1450]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(3 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l554_c7_1450]
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l554_c7_1450]
signal n8_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l554_c7_1450]
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l554_c7_1450]
signal t8_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l554_c7_1450]
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_return_output : device_out_result_t;

-- is_phase_4_MUX[uxn_opcodes_h_l554_c7_1450]
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l554_c7_1450]
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l557_c11_30e5]
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_0a57]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal l8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(3 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal n8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal t8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : device_out_result_t;

-- is_phase_4_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l557_c7_4d1a]
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l562_c17_1dec]
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l562_c17_75e6]
signal MUX_uxn_opcodes_h_l562_c17_75e6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_75e6_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_75e6_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_75e6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l563_c17_d18d]
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l563_c17_d394]
signal MUX_uxn_opcodes_h_l563_c17_d394_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_d394_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_d394_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_d394_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l564_c8_515b]
signal MUX_uxn_opcodes_h_l564_c8_515b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_515b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_515b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_515b_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l565_c8_7ebb]
signal MUX_uxn_opcodes_h_l565_c8_7ebb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_7ebb_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_7ebb_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_7ebb_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l566_c32_66d1]
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l566_c16_b4c0]
signal MUX_uxn_opcodes_h_l566_c16_b4c0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_b4c0_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_b4c0_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_b4c0_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l567_c16_5790]
signal MUX_uxn_opcodes_h_l567_c16_5790_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_5790_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_5790_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_5790_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l568_c43_f40a]
signal sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_return_output : signed(3 downto 0);

-- MUX[uxn_opcodes_h_l568_c30_533f]
signal MUX_uxn_opcodes_h_l568_c30_533f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_533f_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_533f_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_533f_return_output : signed(3 downto 0);

-- device_out[uxn_opcodes_h_l569_c23_6a6e]
signal device_out_uxn_opcodes_h_l569_c23_6a6e_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_6a6e_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_6a6e_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_6a6e_phase : unsigned(11 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_6a6e_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_6a6e_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_6a6e_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l576_c24_6e9d]
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l577_c3_66b8]
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l577_c3_66b8]
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l581_c4_6dff]
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_2d49( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a
BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_left,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_right,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- l8_MUX_uxn_opcodes_h_l539_c2_d373
l8_MUX_uxn_opcodes_h_l539_c2_d373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l539_c2_d373_cond,
l8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue,
l8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse,
l8_MUX_uxn_opcodes_h_l539_c2_d373_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373
is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_cond,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l539_c2_d373
deo_param0_MUX_uxn_opcodes_h_l539_c2_d373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_cond,
deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_iftrue,
deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_iffalse,
deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_return_output);

-- result_MUX_uxn_opcodes_h_l539_c2_d373
result_MUX_uxn_opcodes_h_l539_c2_d373 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l539_c2_d373_cond,
result_MUX_uxn_opcodes_h_l539_c2_d373_iftrue,
result_MUX_uxn_opcodes_h_l539_c2_d373_iffalse,
result_MUX_uxn_opcodes_h_l539_c2_d373_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l539_c2_d373
deo_param1_MUX_uxn_opcodes_h_l539_c2_d373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_cond,
deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_iftrue,
deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_iffalse,
deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_return_output);

-- n8_MUX_uxn_opcodes_h_l539_c2_d373
n8_MUX_uxn_opcodes_h_l539_c2_d373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l539_c2_d373_cond,
n8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue,
n8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse,
n8_MUX_uxn_opcodes_h_l539_c2_d373_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373
is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_cond,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_return_output);

-- t8_MUX_uxn_opcodes_h_l539_c2_d373
t8_MUX_uxn_opcodes_h_l539_c2_d373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l539_c2_d373_cond,
t8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue,
t8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse,
t8_MUX_uxn_opcodes_h_l539_c2_d373_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l539_c2_d373
device_out_result_MUX_uxn_opcodes_h_l539_c2_d373 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_cond,
device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_iftrue,
device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_iffalse,
device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373
is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_cond,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_cond,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa
BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_left,
BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_right,
BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- l8_MUX_uxn_opcodes_h_l554_c7_1450
l8_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l554_c7_1450_cond,
l8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
l8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
l8_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450
is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_cond,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l554_c7_1450
deo_param0_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_cond,
deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450
result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_cond,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450
result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_cond,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l554_c7_1450
deo_param1_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_cond,
deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- n8_MUX_uxn_opcodes_h_l554_c7_1450
n8_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l554_c7_1450_cond,
n8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
n8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
n8_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450
is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_cond,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- t8_MUX_uxn_opcodes_h_l554_c7_1450
t8_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l554_c7_1450_cond,
t8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
t8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
t8_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l554_c7_1450
device_out_result_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_cond,
device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450
is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_cond,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_cond,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5
BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_left,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_right,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_return_output);

-- l8_MUX_uxn_opcodes_h_l557_c7_4d1a
l8_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
l8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
l8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
l8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a
is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a
deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a
result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a
result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a
deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- n8_MUX_uxn_opcodes_h_l557_c7_4d1a
n8_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
n8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
n8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
n8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a
is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- t8_MUX_uxn_opcodes_h_l557_c7_4d1a
t8_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
t8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
t8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
t8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a
device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a
is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_cond,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec
BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_left,
BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_right,
BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_return_output);

-- MUX_uxn_opcodes_h_l562_c17_75e6
MUX_uxn_opcodes_h_l562_c17_75e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l562_c17_75e6_cond,
MUX_uxn_opcodes_h_l562_c17_75e6_iftrue,
MUX_uxn_opcodes_h_l562_c17_75e6_iffalse,
MUX_uxn_opcodes_h_l562_c17_75e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d
BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_left,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_right,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_return_output);

-- MUX_uxn_opcodes_h_l563_c17_d394
MUX_uxn_opcodes_h_l563_c17_d394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l563_c17_d394_cond,
MUX_uxn_opcodes_h_l563_c17_d394_iftrue,
MUX_uxn_opcodes_h_l563_c17_d394_iffalse,
MUX_uxn_opcodes_h_l563_c17_d394_return_output);

-- MUX_uxn_opcodes_h_l564_c8_515b
MUX_uxn_opcodes_h_l564_c8_515b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l564_c8_515b_cond,
MUX_uxn_opcodes_h_l564_c8_515b_iftrue,
MUX_uxn_opcodes_h_l564_c8_515b_iffalse,
MUX_uxn_opcodes_h_l564_c8_515b_return_output);

-- MUX_uxn_opcodes_h_l565_c8_7ebb
MUX_uxn_opcodes_h_l565_c8_7ebb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l565_c8_7ebb_cond,
MUX_uxn_opcodes_h_l565_c8_7ebb_iftrue,
MUX_uxn_opcodes_h_l565_c8_7ebb_iffalse,
MUX_uxn_opcodes_h_l565_c8_7ebb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_left,
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_right,
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_return_output);

-- MUX_uxn_opcodes_h_l566_c16_b4c0
MUX_uxn_opcodes_h_l566_c16_b4c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l566_c16_b4c0_cond,
MUX_uxn_opcodes_h_l566_c16_b4c0_iftrue,
MUX_uxn_opcodes_h_l566_c16_b4c0_iffalse,
MUX_uxn_opcodes_h_l566_c16_b4c0_return_output);

-- MUX_uxn_opcodes_h_l567_c16_5790
MUX_uxn_opcodes_h_l567_c16_5790 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l567_c16_5790_cond,
MUX_uxn_opcodes_h_l567_c16_5790_iftrue,
MUX_uxn_opcodes_h_l567_c16_5790_iffalse,
MUX_uxn_opcodes_h_l567_c16_5790_return_output);

-- sp_relative_shift_uxn_opcodes_h_l568_c43_f40a
sp_relative_shift_uxn_opcodes_h_l568_c43_f40a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_ins,
sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_x,
sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_y,
sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_return_output);

-- MUX_uxn_opcodes_h_l568_c30_533f
MUX_uxn_opcodes_h_l568_c30_533f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l568_c30_533f_cond,
MUX_uxn_opcodes_h_l568_c30_533f_iftrue,
MUX_uxn_opcodes_h_l568_c30_533f_iffalse,
MUX_uxn_opcodes_h_l568_c30_533f_return_output);

-- device_out_uxn_opcodes_h_l569_c23_6a6e
device_out_uxn_opcodes_h_l569_c23_6a6e : entity work.device_out_0CLK_001791d5 port map (
clk,
device_out_uxn_opcodes_h_l569_c23_6a6e_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l569_c23_6a6e_device_address,
device_out_uxn_opcodes_h_l569_c23_6a6e_value,
device_out_uxn_opcodes_h_l569_c23_6a6e_phase,
device_out_uxn_opcodes_h_l569_c23_6a6e_previous_device_ram_read,
device_out_uxn_opcodes_h_l569_c23_6a6e_previous_ram_read,
device_out_uxn_opcodes_h_l569_c23_6a6e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d
BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_left,
BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_right,
BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8
is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_cond,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_cond,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_left,
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_right,
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 l8_MUX_uxn_opcodes_h_l539_c2_d373_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_return_output,
 deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_return_output,
 result_MUX_uxn_opcodes_h_l539_c2_d373_return_output,
 deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_return_output,
 n8_MUX_uxn_opcodes_h_l539_c2_d373_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_return_output,
 t8_MUX_uxn_opcodes_h_l539_c2_d373_return_output,
 device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 l8_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 n8_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 t8_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_return_output,
 l8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 n8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 t8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_return_output,
 MUX_uxn_opcodes_h_l562_c17_75e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_return_output,
 MUX_uxn_opcodes_h_l563_c17_d394_return_output,
 MUX_uxn_opcodes_h_l564_c8_515b_return_output,
 MUX_uxn_opcodes_h_l565_c8_7ebb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_return_output,
 MUX_uxn_opcodes_h_l566_c16_b4c0_return_output,
 MUX_uxn_opcodes_h_l567_c16_5790_return_output,
 sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_return_output,
 MUX_uxn_opcodes_h_l568_c30_533f_return_output,
 device_out_uxn_opcodes_h_l569_c23_6a6e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_d373_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_2d49_uxn_opcodes_h_l539_c2_d373_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_d373_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l552_c3_9eb0 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_cdde : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_e22e : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_38ce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_7859 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_4d1a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_75e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_75e6_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_75e6_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_75e6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_d394_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_d394_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_d394_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_d394_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_515b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_515b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_515b_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_515b_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_7ebb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_7ebb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_7ebb_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_7ebb_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_b4c0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_b4c0_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_b4c0_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_b4c0_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_5790_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_5790_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_5790_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_5790_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_533f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_533f_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_533f_iffalse : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_533f_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_phase : unsigned(11 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_4579_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_3cfd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_bc20_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_64fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_3db9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_adfd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l578_c4_cba1 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l581_c4_2791 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_3646_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_83ab_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f748_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8175_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_338c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_ad40_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_22b7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8274_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_00d8_return_output : unsigned(0 downto 0);
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_38ce := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_38ce;
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_cdde := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l578_c4_cba1 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l578_c4_cba1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_e22e := resize(to_unsigned(1, 1), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_7859 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_7859;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l563_c17_d394_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l562_c17_75e6_iffalse := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_right := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_iftrue := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l552_c3_9eb0 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l552_c3_9eb0;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l568_c30_533f_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_MUX_uxn_opcodes_h_l562_c17_75e6_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l563_c17_d394_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_phase := resize(current_deo_phase, 12);
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_ins := VAR_ins;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := is_phase_3;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := is_phase_4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l566_c16_b4c0_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l567_c16_5790_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l564_c8_515b_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l565_c8_7ebb_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l564_c8_515b_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l565_c8_7ebb_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_left := t8;
     VAR_MUX_uxn_opcodes_h_l566_c16_b4c0_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8175 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8175_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l568_c43_f40a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_ins;
     sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_x;
     sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_return_output := sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_83ab LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_83ab_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l554_c11_3faa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_left;
     BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output := BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_4d1a_return_output := result.stack_address_sp_offset;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l539_c2_d373] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_d373_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_cdde,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_e22e,
     to_unsigned(0, 1));

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_338c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_338c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_22b7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_22b7_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_ad40 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_ad40_return_output := result.device_ram_address;

     -- BIN_OP_PLUS[uxn_opcodes_h_l566_c32_66d1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8274 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8274_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l557_c11_30e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l581_c4_6dff] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_left;
     BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_return_output := BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_3646 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_3646_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f748 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f748_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_opcodes_h_l539_c6_888a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_left;
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output := BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l562_c17_1dec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_left;
     BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_return_output := BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l563_c17_d18d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_left;
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_return_output := BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_888a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_1450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_3faa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_30e5_return_output;
     VAR_MUX_uxn_opcodes_h_l562_c17_75e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_1dec_return_output;
     VAR_MUX_uxn_opcodes_h_l563_c17_d394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d18d_return_output;
     VAR_MUX_uxn_opcodes_h_l566_c16_b4c0_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_66d1_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l581_c4_2791 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_6dff_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_338c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_338c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8274_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8274_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_3646_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_3646_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8175_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8175_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_22b7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_22b7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f748_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f748_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_ad40_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_ad40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_83ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_83ab_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_d373_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_d373_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_4d1a_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c30_533f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_f40a_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l581_c4_2791;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- MUX[uxn_opcodes_h_l562_c17_75e6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l562_c17_75e6_cond <= VAR_MUX_uxn_opcodes_h_l562_c17_75e6_cond;
     MUX_uxn_opcodes_h_l562_c17_75e6_iftrue <= VAR_MUX_uxn_opcodes_h_l562_c17_75e6_iftrue;
     MUX_uxn_opcodes_h_l562_c17_75e6_iffalse <= VAR_MUX_uxn_opcodes_h_l562_c17_75e6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l562_c17_75e6_return_output := MUX_uxn_opcodes_h_l562_c17_75e6_return_output;

     -- MUX[uxn_opcodes_h_l563_c17_d394] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l563_c17_d394_cond <= VAR_MUX_uxn_opcodes_h_l563_c17_d394_cond;
     MUX_uxn_opcodes_h_l563_c17_d394_iftrue <= VAR_MUX_uxn_opcodes_h_l563_c17_d394_iftrue;
     MUX_uxn_opcodes_h_l563_c17_d394_iffalse <= VAR_MUX_uxn_opcodes_h_l563_c17_d394_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l563_c17_d394_return_output := MUX_uxn_opcodes_h_l563_c17_d394_return_output;

     -- t8_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     t8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     t8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := t8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- MUX[uxn_opcodes_h_l566_c16_b4c0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l566_c16_b4c0_cond <= VAR_MUX_uxn_opcodes_h_l566_c16_b4c0_cond;
     MUX_uxn_opcodes_h_l566_c16_b4c0_iftrue <= VAR_MUX_uxn_opcodes_h_l566_c16_b4c0_iftrue;
     MUX_uxn_opcodes_h_l566_c16_b4c0_iffalse <= VAR_MUX_uxn_opcodes_h_l566_c16_b4c0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l566_c16_b4c0_return_output := MUX_uxn_opcodes_h_l566_c16_b4c0_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_1450_return_output;
     VAR_MUX_uxn_opcodes_h_l564_c8_515b_cond := VAR_MUX_uxn_opcodes_h_l562_c17_75e6_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c30_533f_cond := VAR_MUX_uxn_opcodes_h_l562_c17_75e6_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_MUX_uxn_opcodes_h_l562_c17_75e6_return_output;
     VAR_MUX_uxn_opcodes_h_l565_c8_7ebb_cond := VAR_MUX_uxn_opcodes_h_l563_c17_d394_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_MUX_uxn_opcodes_h_l563_c17_d394_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_MUX_uxn_opcodes_h_l566_c16_b4c0_return_output;
     VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_device_address := VAR_MUX_uxn_opcodes_h_l566_c16_b4c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_t8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- MUX[uxn_opcodes_h_l565_c8_7ebb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l565_c8_7ebb_cond <= VAR_MUX_uxn_opcodes_h_l565_c8_7ebb_cond;
     MUX_uxn_opcodes_h_l565_c8_7ebb_iftrue <= VAR_MUX_uxn_opcodes_h_l565_c8_7ebb_iftrue;
     MUX_uxn_opcodes_h_l565_c8_7ebb_iffalse <= VAR_MUX_uxn_opcodes_h_l565_c8_7ebb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l565_c8_7ebb_return_output := MUX_uxn_opcodes_h_l565_c8_7ebb_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- t8_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     t8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     t8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_1450_return_output := t8_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- MUX[uxn_opcodes_h_l568_c30_533f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l568_c30_533f_cond <= VAR_MUX_uxn_opcodes_h_l568_c30_533f_cond;
     MUX_uxn_opcodes_h_l568_c30_533f_iftrue <= VAR_MUX_uxn_opcodes_h_l568_c30_533f_iftrue;
     MUX_uxn_opcodes_h_l568_c30_533f_iffalse <= VAR_MUX_uxn_opcodes_h_l568_c30_533f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l568_c30_533f_return_output := MUX_uxn_opcodes_h_l568_c30_533f_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- MUX[uxn_opcodes_h_l564_c8_515b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l564_c8_515b_cond <= VAR_MUX_uxn_opcodes_h_l564_c8_515b_cond;
     MUX_uxn_opcodes_h_l564_c8_515b_iftrue <= VAR_MUX_uxn_opcodes_h_l564_c8_515b_iftrue;
     MUX_uxn_opcodes_h_l564_c8_515b_iffalse <= VAR_MUX_uxn_opcodes_h_l564_c8_515b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l564_c8_515b_return_output := MUX_uxn_opcodes_h_l564_c8_515b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_5790_iffalse := VAR_MUX_uxn_opcodes_h_l564_c8_515b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_MUX_uxn_opcodes_h_l564_c8_515b_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_5790_iftrue := VAR_MUX_uxn_opcodes_h_l565_c8_7ebb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_MUX_uxn_opcodes_h_l565_c8_7ebb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_MUX_uxn_opcodes_h_l568_c30_533f_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse := VAR_t8_MUX_uxn_opcodes_h_l554_c7_1450_return_output;
     -- is_phase_3_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_return_output := is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- MUX[uxn_opcodes_h_l567_c16_5790] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l567_c16_5790_cond <= VAR_MUX_uxn_opcodes_h_l567_c16_5790_cond;
     MUX_uxn_opcodes_h_l567_c16_5790_iftrue <= VAR_MUX_uxn_opcodes_h_l567_c16_5790_iftrue;
     MUX_uxn_opcodes_h_l567_c16_5790_iffalse <= VAR_MUX_uxn_opcodes_h_l567_c16_5790_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l567_c16_5790_return_output := MUX_uxn_opcodes_h_l567_c16_5790_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_return_output := deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- n8_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     n8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     n8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := n8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- l8_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     l8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     l8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := l8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_return_output := is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_0a57] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_return_output;

     -- t8_MUX[uxn_opcodes_h_l539_c2_d373] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l539_c2_d373_cond <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_d373_cond;
     t8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue;
     t8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_d373_return_output := t8_MUX_uxn_opcodes_h_l539_c2_d373_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_0a57_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_MUX_uxn_opcodes_h_l567_c16_5790_return_output;
     VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_value := VAR_MUX_uxn_opcodes_h_l567_c16_5790_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_1450_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_1450_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_1450_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_l8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_n8_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l539_c2_d373_return_output;
     -- n8_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     n8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     n8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_1450_return_output := n8_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- l8_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     l8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     l8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_1450_return_output := l8_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l539_c2_d373] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_cond;
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_return_output := is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l539_c2_d373] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_cond;
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_return_output := is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_return_output;

     -- device_out[uxn_opcodes_h_l569_c23_6a6e] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l569_c23_6a6e_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l569_c23_6a6e_device_address <= VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_device_address;
     device_out_uxn_opcodes_h_l569_c23_6a6e_value <= VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_value;
     device_out_uxn_opcodes_h_l569_c23_6a6e_phase <= VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_phase;
     device_out_uxn_opcodes_h_l569_c23_6a6e_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_previous_device_ram_read;
     device_out_uxn_opcodes_h_l569_c23_6a6e_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_return_output := device_out_uxn_opcodes_h_l569_c23_6a6e_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l539_c2_d373] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_cond;
     deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_return_output := deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_d373_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_return_output;
     REG_VAR_is_phase_3 := VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_d373_return_output;
     REG_VAR_is_phase_4 := VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_d373_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse := VAR_l8_MUX_uxn_opcodes_h_l554_c7_1450_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse := VAR_n8_MUX_uxn_opcodes_h_l554_c7_1450_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l570_c32_4579] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_4579_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_return_output.is_device_ram_write;

     -- n8_MUX[uxn_opcodes_h_l539_c2_d373] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l539_c2_d373_cond <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_d373_cond;
     n8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue;
     n8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_d373_return_output := n8_MUX_uxn_opcodes_h_l539_c2_d373_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_return_output := deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_00d8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_00d8_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l572_c26_bc20] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_bc20_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_return_output.is_vram_write;

     -- device_out_result_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l573_c29_64fa] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_64fa_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l571_c31_3cfd] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_3cfd_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_return_output.device_ram_address;

     -- l8_MUX[uxn_opcodes_h_l539_c2_d373] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l539_c2_d373_cond <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_d373_cond;
     l8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_d373_iftrue;
     l8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_d373_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_d373_return_output := l8_MUX_uxn_opcodes_h_l539_c2_d373_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l575_c21_adfd] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_adfd_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_return_output.u8_value;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l574_c22_3db9] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_3db9_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_6a6e_return_output.u16_addr;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_3db9_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_00d8_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_00d8_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_00d8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_4579_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_bc20_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_64fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_3cfd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_adfd_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_1450_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l539_c2_d373_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l539_c2_d373_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l576_c24_6e9d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_left;
     BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_return_output := BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l577_c3_66b8] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_cond;
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_return_output := is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_return_output := device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l539_c2_d373] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_cond;
     deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_return_output := deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l577_c3_66b8] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_return_output := current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_6e9d_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_66b8_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_d373_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_1450_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_66b8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_return_output := result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_return_output := result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l539_c2_d373] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_cond;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_return_output := device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l557_c7_4d1a] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output := current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_d373_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4d1a_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_return_output := current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_return_output := is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l554_c7_1450] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_1450_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_1450_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l539_c2_d373] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_cond;
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_return_output := is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_2d49[uxn_opcodes_h_l539_c2_d373] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_2d49_uxn_opcodes_h_l539_c2_d373_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2d49(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_1450_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_1450_return_output);

     -- current_deo_phase_MUX[uxn_opcodes_h_l539_c2_d373] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_return_output := current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_return_output;

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_d373_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_d373_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_d373_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_2d49_uxn_opcodes_h_l539_c2_d373_return_output;
     -- result_MUX[uxn_opcodes_h_l539_c2_d373] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l539_c2_d373_cond <= VAR_result_MUX_uxn_opcodes_h_l539_c2_d373_cond;
     result_MUX_uxn_opcodes_h_l539_c2_d373_iftrue <= VAR_result_MUX_uxn_opcodes_h_l539_c2_d373_iftrue;
     result_MUX_uxn_opcodes_h_l539_c2_d373_iffalse <= VAR_result_MUX_uxn_opcodes_h_l539_c2_d373_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l539_c2_d373_return_output := result_MUX_uxn_opcodes_h_l539_c2_d373_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l539_c2_d373_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l539_c2_d373_return_output;
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
