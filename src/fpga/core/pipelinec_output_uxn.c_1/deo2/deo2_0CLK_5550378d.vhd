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
-- BIN_OP_EQ[uxn_opcodes_h_l539_c6_24cf]
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c7_6591]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l539_c2_b34a]
signal n8_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l539_c2_b34a]
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l539_c2_b34a]
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l539_c2_b34a]
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l539_c2_b34a]
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l539_c2_b34a]
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l539_c2_b34a]
signal l8_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l539_c2_b34a]
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l539_c2_b34a]
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l539_c2_b34a]
signal result_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : opcode_result_t;

-- t8_MUX[uxn_opcodes_h_l539_c2_b34a]
signal t8_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l554_c11_5476]
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_01f8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l554_c7_6591]
signal n8_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l554_c7_6591]
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l554_c7_6591]
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l554_c7_6591]
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l554_c7_6591]
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l554_c7_6591]
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l554_c7_6591]
signal l8_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l554_c7_6591]
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l554_c7_6591]
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l554_c7_6591]
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l554_c7_6591]
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c7_6591]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l554_c7_6591]
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l554_c7_6591]
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(15 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l554_c7_6591]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l554_c7_6591]
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c7_6591]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_return_output : signed(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l554_c7_6591]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l554_c7_6591]
signal t8_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l557_c11_c4bc]
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_6561]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l557_c7_01f8]
signal n8_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l557_c7_01f8]
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l557_c7_01f8]
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l557_c7_01f8]
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l557_c7_01f8]
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l557_c7_01f8]
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l557_c7_01f8]
signal l8_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l557_c7_01f8]
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l557_c7_01f8]
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l557_c7_01f8]
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_01f8]
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_01f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_01f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l557_c7_01f8]
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(15 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l557_c7_01f8]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_01f8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_01f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : signed(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_01f8]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l557_c7_01f8]
signal t8_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l562_c17_ce91]
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l562_c17_8b53]
signal MUX_uxn_opcodes_h_l562_c17_8b53_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_8b53_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_8b53_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_8b53_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l563_c17_748c]
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l563_c17_ff17]
signal MUX_uxn_opcodes_h_l563_c17_ff17_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_ff17_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_ff17_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_ff17_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l564_c8_e8ef]
signal MUX_uxn_opcodes_h_l564_c8_e8ef_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_e8ef_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_e8ef_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_e8ef_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l565_c8_9123]
signal MUX_uxn_opcodes_h_l565_c8_9123_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_9123_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_9123_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_9123_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l566_c32_54d3]
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l566_c16_2f37]
signal MUX_uxn_opcodes_h_l566_c16_2f37_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_2f37_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_2f37_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_2f37_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l567_c16_3131]
signal MUX_uxn_opcodes_h_l567_c16_3131_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_3131_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_3131_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_3131_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l568_c43_7692]
signal sp_relative_shift_uxn_opcodes_h_l568_c43_7692_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_7692_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_7692_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_7692_return_output : signed(3 downto 0);

-- MUX[uxn_opcodes_h_l568_c30_6fe1]
signal MUX_uxn_opcodes_h_l568_c30_6fe1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_6fe1_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_6fe1_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_6fe1_return_output : signed(3 downto 0);

-- device_out[uxn_opcodes_h_l569_c23_097f]
signal device_out_uxn_opcodes_h_l569_c23_097f_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_097f_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_097f_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_097f_phase : unsigned(11 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_097f_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_097f_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_097f_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l576_c24_3e91]
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l577_c3_009a]
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l577_c3_009a]
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l581_c4_aee4]
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5713( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.vram_write_layer := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_device_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf
BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_left,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_right,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- n8_MUX_uxn_opcodes_h_l539_c2_b34a
n8_MUX_uxn_opcodes_h_l539_c2_b34a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l539_c2_b34a_cond,
n8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue,
n8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse,
n8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a
is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_cond,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a
is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_cond,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a
deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_cond,
deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue,
deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse,
deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a
deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_cond,
deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue,
deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse,
deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a
device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_cond,
device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_return_output);

-- l8_MUX_uxn_opcodes_h_l539_c2_b34a
l8_MUX_uxn_opcodes_h_l539_c2_b34a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l539_c2_b34a_cond,
l8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue,
l8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse,
l8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a
is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_cond,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_cond,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_return_output);

-- result_MUX_uxn_opcodes_h_l539_c2_b34a
result_MUX_uxn_opcodes_h_l539_c2_b34a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l539_c2_b34a_cond,
result_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue,
result_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse,
result_MUX_uxn_opcodes_h_l539_c2_b34a_return_output);

-- t8_MUX_uxn_opcodes_h_l539_c2_b34a
t8_MUX_uxn_opcodes_h_l539_c2_b34a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l539_c2_b34a_cond,
t8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue,
t8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse,
t8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476
BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_left,
BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_right,
BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- n8_MUX_uxn_opcodes_h_l554_c7_6591
n8_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l554_c7_6591_cond,
n8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
n8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
n8_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591
is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_cond,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591
is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_cond,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l554_c7_6591
deo_param1_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_cond,
deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l554_c7_6591
deo_param0_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_cond,
deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l554_c7_6591
device_out_result_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_cond,
device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- l8_MUX_uxn_opcodes_h_l554_c7_6591
l8_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l554_c7_6591_cond,
l8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
l8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
l8_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591
is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_cond,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_cond,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591
result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_cond,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591
result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_cond,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- t8_MUX_uxn_opcodes_h_l554_c7_6591
t8_MUX_uxn_opcodes_h_l554_c7_6591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l554_c7_6591_cond,
t8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue,
t8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse,
t8_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc
BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_left,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_right,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_return_output);

-- n8_MUX_uxn_opcodes_h_l557_c7_01f8
n8_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
n8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
n8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
n8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8
is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8
is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8
deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8
deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8
device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- l8_MUX_uxn_opcodes_h_l557_c7_01f8
l8_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
l8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
l8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
l8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8
is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8
result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8
result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- t8_MUX_uxn_opcodes_h_l557_c7_01f8
t8_MUX_uxn_opcodes_h_l557_c7_01f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l557_c7_01f8_cond,
t8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue,
t8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse,
t8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91
BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_left,
BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_right,
BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_return_output);

-- MUX_uxn_opcodes_h_l562_c17_8b53
MUX_uxn_opcodes_h_l562_c17_8b53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l562_c17_8b53_cond,
MUX_uxn_opcodes_h_l562_c17_8b53_iftrue,
MUX_uxn_opcodes_h_l562_c17_8b53_iffalse,
MUX_uxn_opcodes_h_l562_c17_8b53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c
BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_left,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_right,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_return_output);

-- MUX_uxn_opcodes_h_l563_c17_ff17
MUX_uxn_opcodes_h_l563_c17_ff17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l563_c17_ff17_cond,
MUX_uxn_opcodes_h_l563_c17_ff17_iftrue,
MUX_uxn_opcodes_h_l563_c17_ff17_iffalse,
MUX_uxn_opcodes_h_l563_c17_ff17_return_output);

-- MUX_uxn_opcodes_h_l564_c8_e8ef
MUX_uxn_opcodes_h_l564_c8_e8ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l564_c8_e8ef_cond,
MUX_uxn_opcodes_h_l564_c8_e8ef_iftrue,
MUX_uxn_opcodes_h_l564_c8_e8ef_iffalse,
MUX_uxn_opcodes_h_l564_c8_e8ef_return_output);

-- MUX_uxn_opcodes_h_l565_c8_9123
MUX_uxn_opcodes_h_l565_c8_9123 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l565_c8_9123_cond,
MUX_uxn_opcodes_h_l565_c8_9123_iftrue,
MUX_uxn_opcodes_h_l565_c8_9123_iffalse,
MUX_uxn_opcodes_h_l565_c8_9123_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_left,
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_right,
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_return_output);

-- MUX_uxn_opcodes_h_l566_c16_2f37
MUX_uxn_opcodes_h_l566_c16_2f37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l566_c16_2f37_cond,
MUX_uxn_opcodes_h_l566_c16_2f37_iftrue,
MUX_uxn_opcodes_h_l566_c16_2f37_iffalse,
MUX_uxn_opcodes_h_l566_c16_2f37_return_output);

-- MUX_uxn_opcodes_h_l567_c16_3131
MUX_uxn_opcodes_h_l567_c16_3131 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l567_c16_3131_cond,
MUX_uxn_opcodes_h_l567_c16_3131_iftrue,
MUX_uxn_opcodes_h_l567_c16_3131_iffalse,
MUX_uxn_opcodes_h_l567_c16_3131_return_output);

-- sp_relative_shift_uxn_opcodes_h_l568_c43_7692
sp_relative_shift_uxn_opcodes_h_l568_c43_7692 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l568_c43_7692_ins,
sp_relative_shift_uxn_opcodes_h_l568_c43_7692_x,
sp_relative_shift_uxn_opcodes_h_l568_c43_7692_y,
sp_relative_shift_uxn_opcodes_h_l568_c43_7692_return_output);

-- MUX_uxn_opcodes_h_l568_c30_6fe1
MUX_uxn_opcodes_h_l568_c30_6fe1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l568_c30_6fe1_cond,
MUX_uxn_opcodes_h_l568_c30_6fe1_iftrue,
MUX_uxn_opcodes_h_l568_c30_6fe1_iffalse,
MUX_uxn_opcodes_h_l568_c30_6fe1_return_output);

-- device_out_uxn_opcodes_h_l569_c23_097f
device_out_uxn_opcodes_h_l569_c23_097f : entity work.device_out_0CLK_001791d5 port map (
clk,
device_out_uxn_opcodes_h_l569_c23_097f_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l569_c23_097f_device_address,
device_out_uxn_opcodes_h_l569_c23_097f_value,
device_out_uxn_opcodes_h_l569_c23_097f_phase,
device_out_uxn_opcodes_h_l569_c23_097f_previous_device_ram_read,
device_out_uxn_opcodes_h_l569_c23_097f_previous_ram_read,
device_out_uxn_opcodes_h_l569_c23_097f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91
BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_left,
BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_right,
BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a
is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_cond,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_cond,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_left,
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_right,
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 n8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_return_output,
 deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_return_output,
 deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_return_output,
 l8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_return_output,
 result_MUX_uxn_opcodes_h_l539_c2_b34a_return_output,
 t8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 n8_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 l8_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 t8_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_return_output,
 n8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 l8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 t8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_return_output,
 MUX_uxn_opcodes_h_l562_c17_8b53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_return_output,
 MUX_uxn_opcodes_h_l563_c17_ff17_return_output,
 MUX_uxn_opcodes_h_l564_c8_e8ef_return_output,
 MUX_uxn_opcodes_h_l565_c8_9123_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_return_output,
 MUX_uxn_opcodes_h_l566_c16_2f37_return_output,
 MUX_uxn_opcodes_h_l567_c16_3131_return_output,
 sp_relative_shift_uxn_opcodes_h_l568_c43_7692_return_output,
 MUX_uxn_opcodes_h_l568_c30_6fe1_return_output,
 device_out_uxn_opcodes_h_l569_c23_097f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l552_c3_fe11 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_b34a_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_5713_uxn_opcodes_h_l539_c2_b34a_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_b34a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_49b2 : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_2d59 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_2f15 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_6591_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_3f6c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_01f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_01f8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_8b53_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_8b53_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_8b53_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_8b53_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_ff17_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_ff17_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_ff17_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_ff17_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_e8ef_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_e8ef_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_e8ef_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_e8ef_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_9123_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_9123_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_9123_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_9123_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_2f37_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_2f37_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_2f37_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_2f37_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_3131_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_3131_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_3131_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_3131_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_6fe1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_6fe1_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_6fe1_iffalse : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_7692_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_7692_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_7692_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_7692_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_6fe1_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_097f_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_097f_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_097f_phase : unsigned(11 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_097f_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_097f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_097f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_097f_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_a3f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_5391_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_d540_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_2580_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_5c48_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_dc14_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l578_c4_d5a8 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l581_c4_7ec1 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_78cf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_27ef_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_025f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_b129_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_6541_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_a747_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_fb31_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_1542_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_bc1b_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l563_c17_ff17_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l563_c17_ff17_iffalse := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_49b2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_right := to_unsigned(2, 2);
     VAR_current_deo_phase_uxn_opcodes_h_l552_c3_fe11 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l552_c3_fe11;
     VAR_current_deo_phase_uxn_opcodes_h_l578_c4_d5a8 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l578_c4_d5a8;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_2f15 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_2f15;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l562_c17_8b53_iftrue := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_2d59 := resize(to_unsigned(1, 1), 4);
     VAR_MUX_uxn_opcodes_h_l562_c17_8b53_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_7692_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_3f6c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_3f6c;
     VAR_MUX_uxn_opcodes_h_l568_c30_6fe1_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_7692_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_right := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l569_c23_097f_phase := resize(current_deo_phase, 12);
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_7692_ins := VAR_ins;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := is_phase_3;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := is_phase_4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l566_c16_2f37_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l567_c16_3131_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l564_c8_e8ef_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l565_c8_9123_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l569_c23_097f_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l569_c23_097f_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l564_c8_e8ef_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l565_c8_9123_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_left := t8;
     VAR_MUX_uxn_opcodes_h_l566_c16_2f37_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l563_c17_748c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_left;
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_return_output := BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_1542 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_1542_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_025f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_025f_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_a747 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_a747_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_b129 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_b129_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_01f8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l562_c17_ce91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_left;
     BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_return_output := BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l581_c4_aee4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l539_c2_b34a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_b34a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_49b2,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_2d59,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_78cf LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_78cf_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_6541 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_6541_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_27ef LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_27ef_return_output := result.device_ram_address;

     -- BIN_OP_PLUS[uxn_opcodes_h_l566_c32_54d3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l539_c6_24cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l557_c11_c4bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l568_c43_7692] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l568_c43_7692_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_7692_ins;
     sp_relative_shift_uxn_opcodes_h_l568_c43_7692_x <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_7692_x;
     sp_relative_shift_uxn_opcodes_h_l568_c43_7692_y <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_7692_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_7692_return_output := sp_relative_shift_uxn_opcodes_h_l568_c43_7692_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l554_c11_5476] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_left;
     BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output := BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_fb31 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_fb31_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_b34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_b34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_b34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_b34a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_24cf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_6591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5476_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_01f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_c4bc_return_output;
     VAR_MUX_uxn_opcodes_h_l562_c17_8b53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_ce91_return_output;
     VAR_MUX_uxn_opcodes_h_l563_c17_ff17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_748c_return_output;
     VAR_MUX_uxn_opcodes_h_l566_c16_2f37_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_54d3_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l581_c4_7ec1 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_aee4_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_fb31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_fb31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_b129_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_b129_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_1542_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_1542_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_025f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_025f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_a747_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_a747_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_6541_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_6541_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_27ef_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_27ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_78cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_78cf_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_b34a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_01f8_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c30_6fe1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_7692_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l581_c4_7ec1;
     -- t8_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     t8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     t8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := t8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- MUX[uxn_opcodes_h_l563_c17_ff17] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l563_c17_ff17_cond <= VAR_MUX_uxn_opcodes_h_l563_c17_ff17_cond;
     MUX_uxn_opcodes_h_l563_c17_ff17_iftrue <= VAR_MUX_uxn_opcodes_h_l563_c17_ff17_iftrue;
     MUX_uxn_opcodes_h_l563_c17_ff17_iffalse <= VAR_MUX_uxn_opcodes_h_l563_c17_ff17_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l563_c17_ff17_return_output := MUX_uxn_opcodes_h_l563_c17_ff17_return_output;

     -- MUX[uxn_opcodes_h_l566_c16_2f37] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l566_c16_2f37_cond <= VAR_MUX_uxn_opcodes_h_l566_c16_2f37_cond;
     MUX_uxn_opcodes_h_l566_c16_2f37_iftrue <= VAR_MUX_uxn_opcodes_h_l566_c16_2f37_iftrue;
     MUX_uxn_opcodes_h_l566_c16_2f37_iffalse <= VAR_MUX_uxn_opcodes_h_l566_c16_2f37_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l566_c16_2f37_return_output := MUX_uxn_opcodes_h_l566_c16_2f37_return_output;

     -- MUX[uxn_opcodes_h_l562_c17_8b53] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l562_c17_8b53_cond <= VAR_MUX_uxn_opcodes_h_l562_c17_8b53_cond;
     MUX_uxn_opcodes_h_l562_c17_8b53_iftrue <= VAR_MUX_uxn_opcodes_h_l562_c17_8b53_iftrue;
     MUX_uxn_opcodes_h_l562_c17_8b53_iffalse <= VAR_MUX_uxn_opcodes_h_l562_c17_8b53_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l562_c17_8b53_return_output := MUX_uxn_opcodes_h_l562_c17_8b53_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_6591_return_output;
     VAR_MUX_uxn_opcodes_h_l564_c8_e8ef_cond := VAR_MUX_uxn_opcodes_h_l562_c17_8b53_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c30_6fe1_cond := VAR_MUX_uxn_opcodes_h_l562_c17_8b53_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_MUX_uxn_opcodes_h_l562_c17_8b53_return_output;
     VAR_MUX_uxn_opcodes_h_l565_c8_9123_cond := VAR_MUX_uxn_opcodes_h_l563_c17_ff17_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_MUX_uxn_opcodes_h_l563_c17_ff17_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_MUX_uxn_opcodes_h_l566_c16_2f37_return_output;
     VAR_device_out_uxn_opcodes_h_l569_c23_097f_device_address := VAR_MUX_uxn_opcodes_h_l566_c16_2f37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_t8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     -- is_phase_4_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- MUX[uxn_opcodes_h_l564_c8_e8ef] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l564_c8_e8ef_cond <= VAR_MUX_uxn_opcodes_h_l564_c8_e8ef_cond;
     MUX_uxn_opcodes_h_l564_c8_e8ef_iftrue <= VAR_MUX_uxn_opcodes_h_l564_c8_e8ef_iftrue;
     MUX_uxn_opcodes_h_l564_c8_e8ef_iffalse <= VAR_MUX_uxn_opcodes_h_l564_c8_e8ef_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l564_c8_e8ef_return_output := MUX_uxn_opcodes_h_l564_c8_e8ef_return_output;

     -- t8_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     t8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     t8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_6591_return_output := t8_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- MUX[uxn_opcodes_h_l565_c8_9123] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l565_c8_9123_cond <= VAR_MUX_uxn_opcodes_h_l565_c8_9123_cond;
     MUX_uxn_opcodes_h_l565_c8_9123_iftrue <= VAR_MUX_uxn_opcodes_h_l565_c8_9123_iftrue;
     MUX_uxn_opcodes_h_l565_c8_9123_iffalse <= VAR_MUX_uxn_opcodes_h_l565_c8_9123_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l565_c8_9123_return_output := MUX_uxn_opcodes_h_l565_c8_9123_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- MUX[uxn_opcodes_h_l568_c30_6fe1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l568_c30_6fe1_cond <= VAR_MUX_uxn_opcodes_h_l568_c30_6fe1_cond;
     MUX_uxn_opcodes_h_l568_c30_6fe1_iftrue <= VAR_MUX_uxn_opcodes_h_l568_c30_6fe1_iftrue;
     MUX_uxn_opcodes_h_l568_c30_6fe1_iffalse <= VAR_MUX_uxn_opcodes_h_l568_c30_6fe1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l568_c30_6fe1_return_output := MUX_uxn_opcodes_h_l568_c30_6fe1_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_3131_iffalse := VAR_MUX_uxn_opcodes_h_l564_c8_e8ef_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_MUX_uxn_opcodes_h_l564_c8_e8ef_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_3131_iftrue := VAR_MUX_uxn_opcodes_h_l565_c8_9123_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_MUX_uxn_opcodes_h_l565_c8_9123_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_MUX_uxn_opcodes_h_l568_c30_6fe1_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l554_c7_6591_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_return_output := deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- t8_MUX[uxn_opcodes_h_l539_c2_b34a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l539_c2_b34a_cond <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_b34a_cond;
     t8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue;
     t8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output := t8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_return_output := is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_6561] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_return_output;

     -- MUX[uxn_opcodes_h_l567_c16_3131] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l567_c16_3131_cond <= VAR_MUX_uxn_opcodes_h_l567_c16_3131_cond;
     MUX_uxn_opcodes_h_l567_c16_3131_iftrue <= VAR_MUX_uxn_opcodes_h_l567_c16_3131_iftrue;
     MUX_uxn_opcodes_h_l567_c16_3131_iffalse <= VAR_MUX_uxn_opcodes_h_l567_c16_3131_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l567_c16_3131_return_output := MUX_uxn_opcodes_h_l567_c16_3131_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- l8_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     l8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     l8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := l8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- n8_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     n8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     n8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := n8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_return_output := is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l569_c23_097f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_6561_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_MUX_uxn_opcodes_h_l567_c16_3131_return_output;
     VAR_device_out_uxn_opcodes_h_l569_c23_097f_value := VAR_MUX_uxn_opcodes_h_l567_c16_3131_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_6591_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_6591_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_6591_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_l8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_n8_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;
     -- l8_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     l8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     l8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_6591_return_output := l8_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l539_c2_b34a] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_cond;
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_return_output := is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;

     -- n8_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     n8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     n8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_6591_return_output := n8_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l539_c2_b34a] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_cond;
     deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_return_output := deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l539_c2_b34a] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_cond;
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_return_output := is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;

     -- device_out[uxn_opcodes_h_l569_c23_097f] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l569_c23_097f_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l569_c23_097f_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l569_c23_097f_device_address <= VAR_device_out_uxn_opcodes_h_l569_c23_097f_device_address;
     device_out_uxn_opcodes_h_l569_c23_097f_value <= VAR_device_out_uxn_opcodes_h_l569_c23_097f_value;
     device_out_uxn_opcodes_h_l569_c23_097f_phase <= VAR_device_out_uxn_opcodes_h_l569_c23_097f_phase;
     device_out_uxn_opcodes_h_l569_c23_097f_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l569_c23_097f_previous_device_ram_read;
     device_out_uxn_opcodes_h_l569_c23_097f_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l569_c23_097f_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l569_c23_097f_return_output := device_out_uxn_opcodes_h_l569_c23_097f_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_device_out_uxn_opcodes_h_l569_c23_097f_return_output;
     REG_VAR_is_phase_3 := VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;
     REG_VAR_is_phase_4 := VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse := VAR_l8_MUX_uxn_opcodes_h_l554_c7_6591_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l554_c7_6591_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l571_c31_5391] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_5391_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_097f_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l573_c29_2580] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_2580_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_097f_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_bc1b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_bc1b_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_097f_return_output.is_deo_done;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l574_c22_5c48] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_5c48_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_097f_return_output.u16_addr;

     -- deo_param1_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_return_output := deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l572_c26_d540] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_d540_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_097f_return_output.is_vram_write;

     -- l8_MUX[uxn_opcodes_h_l539_c2_b34a] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l539_c2_b34a_cond <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_b34a_cond;
     l8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue;
     l8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output := l8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l570_c32_a3f8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_a3f8_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_097f_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l575_c21_dc14] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_dc14_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_097f_return_output.u8_value;

     -- n8_MUX[uxn_opcodes_h_l539_c2_b34a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l539_c2_b34a_cond <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_b34a_cond;
     n8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue;
     n8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output := n8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_5c48_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_bc1b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_bc1b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_bc1b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_a3f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_d540_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_2580_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_5391_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_dc14_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_6591_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l539_c2_b34a] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_cond;
     deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_return_output := deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_return_output := device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l577_c3_009a] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_cond;
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_return_output := is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l576_c24_3e91] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_left;
     BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_return_output := BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l577_c3_009a] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_return_output := current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3e91_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_009a_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_6591_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_009a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_return_output := result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_01f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_return_output := result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l539_c2_b34a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_cond;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_return_output := device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_01f8_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_return_output := current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l554_c7_6591] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_cond;
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_return_output := is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_6591_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_6591_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l539_c2_b34a] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_cond;
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_return_output := is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_5713[uxn_opcodes_h_l539_c2_b34a] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_5713_uxn_opcodes_h_l539_c2_b34a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5713(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_6591_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_6591_return_output);

     -- current_deo_phase_MUX[uxn_opcodes_h_l539_c2_b34a] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_return_output := current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_5713_uxn_opcodes_h_l539_c2_b34a_return_output;
     -- result_MUX[uxn_opcodes_h_l539_c2_b34a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l539_c2_b34a_cond <= VAR_result_MUX_uxn_opcodes_h_l539_c2_b34a_cond;
     result_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l539_c2_b34a_iftrue;
     result_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l539_c2_b34a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l539_c2_b34a_return_output := result_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l539_c2_b34a_return_output;
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
