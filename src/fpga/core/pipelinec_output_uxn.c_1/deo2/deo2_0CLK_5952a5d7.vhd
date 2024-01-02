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
-- BIN_OP_EQ[uxn_opcodes_h_l539_c6_f813]
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c7_50fc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l539_c2_48b2]
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l539_c2_48b2]
signal n8_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l539_c2_48b2]
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l539_c2_48b2]
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l539_c2_48b2]
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l539_c2_48b2]
signal t8_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l539_c2_48b2]
signal result_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : opcode_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l539_c2_48b2]
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(7 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l539_c2_48b2]
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l539_c2_48b2]
signal l8_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l539_c2_48b2]
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l554_c11_6157]
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l554_c7_50fc]
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l554_c7_50fc]
signal n8_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l554_c7_50fc]
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l554_c7_50fc]
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l554_c7_50fc]
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l554_c7_50fc]
signal t8_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c7_50fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l554_c7_50fc]
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l554_c7_50fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l554_c7_50fc]
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c7_50fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l554_c7_50fc]
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l554_c7_50fc]
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l554_c7_50fc]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l554_c7_50fc]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l554_c7_50fc]
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l554_c7_50fc]
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l554_c7_50fc]
signal l8_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l554_c7_50fc]
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l557_c11_77eb]
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_cf54]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal n8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal t8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal l8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l557_c7_4aa3]
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l562_c17_f60d]
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l562_c17_1567]
signal MUX_uxn_opcodes_h_l562_c17_1567_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_1567_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_1567_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_1567_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l563_c17_d4cb]
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l563_c17_f1e7]
signal MUX_uxn_opcodes_h_l563_c17_f1e7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_f1e7_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_f1e7_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_f1e7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l564_c8_a840]
signal MUX_uxn_opcodes_h_l564_c8_a840_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_a840_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_a840_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_a840_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l565_c8_6974]
signal MUX_uxn_opcodes_h_l565_c8_6974_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_6974_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_6974_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_6974_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l566_c32_5dab]
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l566_c16_1133]
signal MUX_uxn_opcodes_h_l566_c16_1133_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_1133_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_1133_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_1133_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l567_c16_1f73]
signal MUX_uxn_opcodes_h_l567_c16_1f73_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_1f73_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_1f73_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_1f73_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l568_c43_d0b4]
signal sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_return_output : signed(3 downto 0);

-- MUX[uxn_opcodes_h_l568_c30_62fe]
signal MUX_uxn_opcodes_h_l568_c30_62fe_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_62fe_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_62fe_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_62fe_return_output : signed(3 downto 0);

-- device_out[uxn_opcodes_h_l569_c23_bb0b]
signal device_out_uxn_opcodes_h_l569_c23_bb0b_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_bb0b_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_bb0b_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_bb0b_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_bb0b_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_bb0b_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_bb0b_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l576_c24_3dc9]
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l577_c3_fc24]
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l577_c3_fc24]
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l581_c4_639a]
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_06d2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;
      base.vram_write_layer := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813
BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_left,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_right,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2
is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_cond,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_return_output);

-- n8_MUX_uxn_opcodes_h_l539_c2_48b2
n8_MUX_uxn_opcodes_h_l539_c2_48b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l539_c2_48b2_cond,
n8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue,
n8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse,
n8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_cond,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2
device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_cond,
device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue,
device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse,
device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2
is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_cond,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_return_output);

-- t8_MUX_uxn_opcodes_h_l539_c2_48b2
t8_MUX_uxn_opcodes_h_l539_c2_48b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l539_c2_48b2_cond,
t8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue,
t8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse,
t8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output);

-- result_MUX_uxn_opcodes_h_l539_c2_48b2
result_MUX_uxn_opcodes_h_l539_c2_48b2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l539_c2_48b2_cond,
result_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue,
result_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse,
result_MUX_uxn_opcodes_h_l539_c2_48b2_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2
deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_cond,
deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue,
deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse,
deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2
is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_cond,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_return_output);

-- l8_MUX_uxn_opcodes_h_l539_c2_48b2
l8_MUX_uxn_opcodes_h_l539_c2_48b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l539_c2_48b2_cond,
l8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue,
l8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse,
l8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2
deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_cond,
deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue,
deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse,
deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157
BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_left,
BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_right,
BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc
is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- n8_MUX_uxn_opcodes_h_l554_c7_50fc
n8_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
n8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
n8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
n8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc
device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc
is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- t8_MUX_uxn_opcodes_h_l554_c7_50fc
t8_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
t8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
t8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
t8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc
result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc
result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc
deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc
is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- l8_MUX_uxn_opcodes_h_l554_c7_50fc
l8_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
l8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
l8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
l8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc
deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_cond,
deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue,
deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse,
deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb
BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_left,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_right,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3
is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- n8_MUX_uxn_opcodes_h_l557_c7_4aa3
n8_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
n8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
n8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
n8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3
device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3
is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- t8_MUX_uxn_opcodes_h_l557_c7_4aa3
t8_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
t8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
t8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
t8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3
result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3
result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3
deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3
is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- l8_MUX_uxn_opcodes_h_l557_c7_4aa3
l8_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
l8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
l8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
l8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3
deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_cond,
deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue,
deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse,
deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d
BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_left,
BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_right,
BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_return_output);

-- MUX_uxn_opcodes_h_l562_c17_1567
MUX_uxn_opcodes_h_l562_c17_1567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l562_c17_1567_cond,
MUX_uxn_opcodes_h_l562_c17_1567_iftrue,
MUX_uxn_opcodes_h_l562_c17_1567_iffalse,
MUX_uxn_opcodes_h_l562_c17_1567_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb
BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_left,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_right,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_return_output);

-- MUX_uxn_opcodes_h_l563_c17_f1e7
MUX_uxn_opcodes_h_l563_c17_f1e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l563_c17_f1e7_cond,
MUX_uxn_opcodes_h_l563_c17_f1e7_iftrue,
MUX_uxn_opcodes_h_l563_c17_f1e7_iffalse,
MUX_uxn_opcodes_h_l563_c17_f1e7_return_output);

-- MUX_uxn_opcodes_h_l564_c8_a840
MUX_uxn_opcodes_h_l564_c8_a840 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l564_c8_a840_cond,
MUX_uxn_opcodes_h_l564_c8_a840_iftrue,
MUX_uxn_opcodes_h_l564_c8_a840_iffalse,
MUX_uxn_opcodes_h_l564_c8_a840_return_output);

-- MUX_uxn_opcodes_h_l565_c8_6974
MUX_uxn_opcodes_h_l565_c8_6974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l565_c8_6974_cond,
MUX_uxn_opcodes_h_l565_c8_6974_iftrue,
MUX_uxn_opcodes_h_l565_c8_6974_iffalse,
MUX_uxn_opcodes_h_l565_c8_6974_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_left,
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_right,
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_return_output);

-- MUX_uxn_opcodes_h_l566_c16_1133
MUX_uxn_opcodes_h_l566_c16_1133 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l566_c16_1133_cond,
MUX_uxn_opcodes_h_l566_c16_1133_iftrue,
MUX_uxn_opcodes_h_l566_c16_1133_iffalse,
MUX_uxn_opcodes_h_l566_c16_1133_return_output);

-- MUX_uxn_opcodes_h_l567_c16_1f73
MUX_uxn_opcodes_h_l567_c16_1f73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l567_c16_1f73_cond,
MUX_uxn_opcodes_h_l567_c16_1f73_iftrue,
MUX_uxn_opcodes_h_l567_c16_1f73_iffalse,
MUX_uxn_opcodes_h_l567_c16_1f73_return_output);

-- sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4
sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_ins,
sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_x,
sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_y,
sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_return_output);

-- MUX_uxn_opcodes_h_l568_c30_62fe
MUX_uxn_opcodes_h_l568_c30_62fe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l568_c30_62fe_cond,
MUX_uxn_opcodes_h_l568_c30_62fe_iftrue,
MUX_uxn_opcodes_h_l568_c30_62fe_iffalse,
MUX_uxn_opcodes_h_l568_c30_62fe_return_output);

-- device_out_uxn_opcodes_h_l569_c23_bb0b
device_out_uxn_opcodes_h_l569_c23_bb0b : entity work.device_out_0CLK_1666823b port map (
clk,
device_out_uxn_opcodes_h_l569_c23_bb0b_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l569_c23_bb0b_device_address,
device_out_uxn_opcodes_h_l569_c23_bb0b_value,
device_out_uxn_opcodes_h_l569_c23_bb0b_phase,
device_out_uxn_opcodes_h_l569_c23_bb0b_previous_device_ram_read,
device_out_uxn_opcodes_h_l569_c23_bb0b_previous_ram_read,
device_out_uxn_opcodes_h_l569_c23_bb0b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9
BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_left,
BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_right,
BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_cond,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24
is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_cond,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_left,
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_right,
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_return_output,
 n8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_return_output,
 device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_return_output,
 t8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output,
 result_MUX_uxn_opcodes_h_l539_c2_48b2_return_output,
 deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_return_output,
 l8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output,
 deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 n8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 t8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 l8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 n8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 t8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 l8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_return_output,
 MUX_uxn_opcodes_h_l562_c17_1567_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_return_output,
 MUX_uxn_opcodes_h_l563_c17_f1e7_return_output,
 MUX_uxn_opcodes_h_l564_c8_a840_return_output,
 MUX_uxn_opcodes_h_l565_c8_6974_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_return_output,
 MUX_uxn_opcodes_h_l566_c16_1133_return_output,
 MUX_uxn_opcodes_h_l567_c16_1f73_return_output,
 sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_return_output,
 MUX_uxn_opcodes_h_l568_c30_62fe_return_output,
 device_out_uxn_opcodes_h_l569_c23_bb0b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l552_c3_2fa7 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_48b2_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_06d2_uxn_opcodes_h_l539_c2_48b2_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_87bd : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_8424 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_4d44 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_e0b0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_4aa3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_1567_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_1567_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_1567_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_1567_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_f1e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_f1e7_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_f1e7_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_f1e7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_a840_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_a840_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_a840_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_a840_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_6974_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_6974_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_6974_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_6974_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_1133_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_1133_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_1133_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_1133_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_1f73_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_1f73_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_1f73_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_1f73_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_62fe_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_62fe_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_62fe_iffalse : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_62fe_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_9906_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_b259_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_7fe4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_8141_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_dcfc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_0f2c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l578_c4_aa0c : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l581_c4_9c43 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f6d2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_60de_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c740_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_d17a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f7a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_950c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_d0ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f3f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l576_DUPLICATE_ec74_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_right := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l578_c4_aa0c := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l578_c4_aa0c;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_87bd := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_e0b0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_e0b0;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_8424 := resize(to_unsigned(1, 1), 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l562_c17_1567_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l563_c17_f1e7_iftrue := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l552_c3_2fa7 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l552_c3_2fa7;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_right := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_4d44 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_4d44;
     VAR_MUX_uxn_opcodes_h_l568_c30_62fe_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_y := resize(to_signed(-3, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_MUX_uxn_opcodes_h_l563_c17_f1e7_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l562_c17_1567_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_ins := VAR_ins;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := is_phase_3;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := is_phase_4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l566_c16_1133_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l567_c16_1f73_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l564_c8_a840_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l565_c8_6974_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l564_c8_a840_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l565_c8_6974_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_left := t8;
     VAR_MUX_uxn_opcodes_h_l566_c16_1133_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f6d2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f6d2_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l566_c32_5dab] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_left;
     BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_return_output := BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_d0ec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_d0ec_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c740 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c740_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l581_c4_639a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l563_c17_d4cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_950c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_950c_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l562_c17_f60d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_left;
     BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_return_output := BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l568_c43_d0b4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_ins;
     sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_x;
     sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_return_output := sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_60de LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_60de_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l557_c11_77eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_d17a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_d17a_return_output := result.device_ram_address;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_4aa3_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f7a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f7a2_return_output := result.is_vram_write;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l539_c2_48b2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_48b2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_87bd,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_8424,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_opcodes_h_l539_c6_f813] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_left;
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output := BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l554_c11_6157] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_left;
     BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output := BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f3f9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f3f9_return_output := result.vram_write_layer;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_48b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_48b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_48b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_48b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_f813_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_50fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_6157_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_77eb_return_output;
     VAR_MUX_uxn_opcodes_h_l562_c17_1567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_f60d_return_output;
     VAR_MUX_uxn_opcodes_h_l563_c17_f1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_d4cb_return_output;
     VAR_MUX_uxn_opcodes_h_l566_c16_1133_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_5dab_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l581_c4_9c43 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_639a_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f6d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f6d2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_60de_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_60de_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_d0ec_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_d0ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c740_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c740_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f7a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f7a2_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f3f9_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_f3f9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_d17a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_d17a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_950c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_950c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_48b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_4aa3_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c30_62fe_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_d0b4_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l581_c4_9c43;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- MUX[uxn_opcodes_h_l562_c17_1567] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l562_c17_1567_cond <= VAR_MUX_uxn_opcodes_h_l562_c17_1567_cond;
     MUX_uxn_opcodes_h_l562_c17_1567_iftrue <= VAR_MUX_uxn_opcodes_h_l562_c17_1567_iftrue;
     MUX_uxn_opcodes_h_l562_c17_1567_iffalse <= VAR_MUX_uxn_opcodes_h_l562_c17_1567_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l562_c17_1567_return_output := MUX_uxn_opcodes_h_l562_c17_1567_return_output;

     -- MUX[uxn_opcodes_h_l566_c16_1133] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l566_c16_1133_cond <= VAR_MUX_uxn_opcodes_h_l566_c16_1133_cond;
     MUX_uxn_opcodes_h_l566_c16_1133_iftrue <= VAR_MUX_uxn_opcodes_h_l566_c16_1133_iftrue;
     MUX_uxn_opcodes_h_l566_c16_1133_iffalse <= VAR_MUX_uxn_opcodes_h_l566_c16_1133_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l566_c16_1133_return_output := MUX_uxn_opcodes_h_l566_c16_1133_return_output;

     -- MUX[uxn_opcodes_h_l563_c17_f1e7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l563_c17_f1e7_cond <= VAR_MUX_uxn_opcodes_h_l563_c17_f1e7_cond;
     MUX_uxn_opcodes_h_l563_c17_f1e7_iftrue <= VAR_MUX_uxn_opcodes_h_l563_c17_f1e7_iftrue;
     MUX_uxn_opcodes_h_l563_c17_f1e7_iffalse <= VAR_MUX_uxn_opcodes_h_l563_c17_f1e7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l563_c17_f1e7_return_output := MUX_uxn_opcodes_h_l563_c17_f1e7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- t8_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     t8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     t8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := t8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;
     VAR_MUX_uxn_opcodes_h_l564_c8_a840_cond := VAR_MUX_uxn_opcodes_h_l562_c17_1567_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c30_62fe_cond := VAR_MUX_uxn_opcodes_h_l562_c17_1567_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_MUX_uxn_opcodes_h_l562_c17_1567_return_output;
     VAR_MUX_uxn_opcodes_h_l565_c8_6974_cond := VAR_MUX_uxn_opcodes_h_l563_c17_f1e7_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_MUX_uxn_opcodes_h_l563_c17_f1e7_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_MUX_uxn_opcodes_h_l566_c16_1133_return_output;
     VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_device_address := VAR_MUX_uxn_opcodes_h_l566_c16_1133_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     -- MUX[uxn_opcodes_h_l568_c30_62fe] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l568_c30_62fe_cond <= VAR_MUX_uxn_opcodes_h_l568_c30_62fe_cond;
     MUX_uxn_opcodes_h_l568_c30_62fe_iftrue <= VAR_MUX_uxn_opcodes_h_l568_c30_62fe_iftrue;
     MUX_uxn_opcodes_h_l568_c30_62fe_iffalse <= VAR_MUX_uxn_opcodes_h_l568_c30_62fe_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l568_c30_62fe_return_output := MUX_uxn_opcodes_h_l568_c30_62fe_return_output;

     -- t8_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     t8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     t8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := t8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- MUX[uxn_opcodes_h_l565_c8_6974] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l565_c8_6974_cond <= VAR_MUX_uxn_opcodes_h_l565_c8_6974_cond;
     MUX_uxn_opcodes_h_l565_c8_6974_iftrue <= VAR_MUX_uxn_opcodes_h_l565_c8_6974_iftrue;
     MUX_uxn_opcodes_h_l565_c8_6974_iffalse <= VAR_MUX_uxn_opcodes_h_l565_c8_6974_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l565_c8_6974_return_output := MUX_uxn_opcodes_h_l565_c8_6974_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- MUX[uxn_opcodes_h_l564_c8_a840] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l564_c8_a840_cond <= VAR_MUX_uxn_opcodes_h_l564_c8_a840_cond;
     MUX_uxn_opcodes_h_l564_c8_a840_iftrue <= VAR_MUX_uxn_opcodes_h_l564_c8_a840_iftrue;
     MUX_uxn_opcodes_h_l564_c8_a840_iffalse <= VAR_MUX_uxn_opcodes_h_l564_c8_a840_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l564_c8_a840_return_output := MUX_uxn_opcodes_h_l564_c8_a840_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_1f73_iffalse := VAR_MUX_uxn_opcodes_h_l564_c8_a840_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_MUX_uxn_opcodes_h_l564_c8_a840_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_1f73_iftrue := VAR_MUX_uxn_opcodes_h_l565_c8_6974_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_MUX_uxn_opcodes_h_l565_c8_6974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_MUX_uxn_opcodes_h_l568_c30_62fe_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;
     -- is_phase_4_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- n8_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     n8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     n8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := n8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- l8_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     l8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     l8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := l8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- t8_MUX[uxn_opcodes_h_l539_c2_48b2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l539_c2_48b2_cond <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_48b2_cond;
     t8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue;
     t8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output := t8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_cf54] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_return_output;

     -- MUX[uxn_opcodes_h_l567_c16_1f73] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l567_c16_1f73_cond <= VAR_MUX_uxn_opcodes_h_l567_c16_1f73_cond;
     MUX_uxn_opcodes_h_l567_c16_1f73_iftrue <= VAR_MUX_uxn_opcodes_h_l567_c16_1f73_iftrue;
     MUX_uxn_opcodes_h_l567_c16_1f73_iffalse <= VAR_MUX_uxn_opcodes_h_l567_c16_1f73_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l567_c16_1f73_return_output := MUX_uxn_opcodes_h_l567_c16_1f73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_cf54_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_MUX_uxn_opcodes_h_l567_c16_1f73_return_output;
     VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_value := VAR_MUX_uxn_opcodes_h_l567_c16_1f73_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_l8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- n8_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     n8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     n8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := n8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l539_c2_48b2] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_cond;
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_return_output := is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;

     -- l8_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     l8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     l8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := l8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l539_c2_48b2] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_cond;
     deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_return_output := deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l539_c2_48b2] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_cond;
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_return_output := is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;

     -- device_out[uxn_opcodes_h_l569_c23_bb0b] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l569_c23_bb0b_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l569_c23_bb0b_device_address <= VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_device_address;
     device_out_uxn_opcodes_h_l569_c23_bb0b_value <= VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_value;
     device_out_uxn_opcodes_h_l569_c23_bb0b_phase <= VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_phase;
     device_out_uxn_opcodes_h_l569_c23_bb0b_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_previous_device_ram_read;
     device_out_uxn_opcodes_h_l569_c23_bb0b_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_return_output := device_out_uxn_opcodes_h_l569_c23_bb0b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_return_output;
     REG_VAR_is_phase_3 := VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;
     REG_VAR_is_phase_4 := VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse := VAR_l8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l572_c26_7fe4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_7fe4_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l576_DUPLICATE_ec74 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l576_DUPLICATE_ec74_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_return_output.is_deo_done;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l574_c22_dcfc] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_dcfc_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_return_output.u16_addr;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l575_c21_0f2c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_0f2c_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_return_output.u8_value;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l571_c31_b259] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_b259_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_return_output.device_ram_address;

     -- deo_param1_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- n8_MUX[uxn_opcodes_h_l539_c2_48b2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l539_c2_48b2_cond <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_48b2_cond;
     n8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue;
     n8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output := n8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l573_c29_8141] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_8141_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_return_output.vram_write_layer;

     -- l8_MUX[uxn_opcodes_h_l539_c2_48b2] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l539_c2_48b2_cond <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_48b2_cond;
     l8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue;
     l8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output := l8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l570_c32_9906] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_9906_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_bb0b_return_output.is_device_ram_write;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_dcfc_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l576_DUPLICATE_ec74_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l576_DUPLICATE_ec74_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l576_DUPLICATE_ec74_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_9906_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_7fe4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_8141_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_b259_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_0f2c_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l577_c3_fc24] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_return_output := current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l539_c2_48b2] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_cond;
     deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_return_output := deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l576_c24_3dc9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_left;
     BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_return_output := BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l577_c3_fc24] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_cond;
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_return_output := is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_3dc9_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_fc24_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_fc24_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l539_c2_48b2] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_cond;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_return_output := device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_4aa3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_4aa3_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l554_c7_50fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_50fc_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l539_c2_48b2] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_return_output := current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_06d2[uxn_opcodes_h_l539_c2_48b2] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_06d2_uxn_opcodes_h_l539_c2_48b2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_06d2(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_50fc_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_50fc_return_output);

     -- is_second_deo_MUX[uxn_opcodes_h_l539_c2_48b2] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_cond;
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_return_output := is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_06d2_uxn_opcodes_h_l539_c2_48b2_return_output;
     -- result_MUX[uxn_opcodes_h_l539_c2_48b2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l539_c2_48b2_cond <= VAR_result_MUX_uxn_opcodes_h_l539_c2_48b2_cond;
     result_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue <= VAR_result_MUX_uxn_opcodes_h_l539_c2_48b2_iftrue;
     result_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse <= VAR_result_MUX_uxn_opcodes_h_l539_c2_48b2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l539_c2_48b2_return_output := result_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l539_c2_48b2_return_output;
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
