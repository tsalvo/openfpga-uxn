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
entity deo2_0CLK_1477f047 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_1477f047;
architecture arch of deo2_0CLK_1477f047 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l561_c6_95c1]
signal BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l576_c7_8c89]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l561_c2_0883]
signal is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l561_c2_0883]
signal l8_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l561_c2_0883]
signal device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l561_c2_0883]
signal t8_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l561_c2_0883]
signal deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l561_c2_0883]
signal n8_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l561_c2_0883]
signal result_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l561_c2_0883_return_output : opcode_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l561_c2_0883]
signal deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l561_c2_0883]
signal is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l561_c2_0883]
signal is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l561_c2_0883]
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l576_c11_c007]
signal BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l579_c7_7381]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l576_c7_8c89]
signal is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l576_c7_8c89]
signal l8_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l576_c7_8c89]
signal device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l576_c7_8c89]
signal t8_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l576_c7_8c89]
signal deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l576_c7_8c89]
signal n8_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l576_c7_8c89]
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l576_c7_8c89]
signal result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l576_c7_8c89]
signal result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l576_c7_8c89]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l576_c7_8c89]
signal result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l576_c7_8c89]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l576_c7_8c89]
signal result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l576_c7_8c89]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l576_c7_8c89]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l576_c7_8c89]
signal deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l576_c7_8c89]
signal is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l576_c7_8c89]
signal is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l576_c7_8c89]
signal current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l579_c11_d028]
signal BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l583_c1_d1a1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l579_c7_7381]
signal is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l579_c7_7381]
signal l8_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l579_c7_7381]
signal device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l579_c7_7381]
signal t8_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l579_c7_7381]
signal deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l579_c7_7381]
signal n8_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l579_c7_7381]
signal result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l579_c7_7381]
signal result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l579_c7_7381]
signal result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l579_c7_7381]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l579_c7_7381]
signal result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l579_c7_7381]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l579_c7_7381]
signal result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l579_c7_7381]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l579_c7_7381]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l579_c7_7381]
signal deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l579_c7_7381]
signal is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l579_c7_7381]
signal is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l579_c7_7381]
signal current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l584_c17_9da7]
signal BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l584_c17_e7c7]
signal MUX_uxn_opcodes_h_l584_c17_e7c7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l584_c17_e7c7_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l584_c17_e7c7_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l584_c17_e7c7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l585_c17_67bc]
signal BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l585_c17_b06c]
signal MUX_uxn_opcodes_h_l585_c17_b06c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l585_c17_b06c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l585_c17_b06c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l585_c17_b06c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l586_c8_af22]
signal MUX_uxn_opcodes_h_l586_c8_af22_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l586_c8_af22_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l586_c8_af22_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l586_c8_af22_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l587_c8_cfd5]
signal MUX_uxn_opcodes_h_l587_c8_cfd5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l587_c8_cfd5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l587_c8_cfd5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l587_c8_cfd5_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l588_c32_cec1]
signal BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l588_c16_9be4]
signal MUX_uxn_opcodes_h_l588_c16_9be4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l588_c16_9be4_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l588_c16_9be4_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l588_c16_9be4_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l589_c16_5bc7]
signal MUX_uxn_opcodes_h_l589_c16_5bc7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l589_c16_5bc7_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l589_c16_5bc7_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l589_c16_5bc7_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l590_c43_4d61]
signal sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_return_output : signed(3 downto 0);

-- MUX[uxn_opcodes_h_l590_c30_5186]
signal MUX_uxn_opcodes_h_l590_c30_5186_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l590_c30_5186_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l590_c30_5186_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l590_c30_5186_return_output : signed(3 downto 0);

-- device_out[uxn_opcodes_h_l591_c23_7f13]
signal device_out_uxn_opcodes_h_l591_c23_7f13_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l591_c23_7f13_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l591_c23_7f13_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l591_c23_7f13_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l591_c23_7f13_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l591_c23_7f13_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l591_c23_7f13_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l598_c24_59ea]
signal BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l599_c3_4757]
signal is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l599_c3_4757]
signal current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l603_c4_8334]
signal BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_0bfb( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.vram_write_layer := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_device_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1
BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_left,
BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_right,
BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883
is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_cond,
is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_return_output);

-- l8_MUX_uxn_opcodes_h_l561_c2_0883
l8_MUX_uxn_opcodes_h_l561_c2_0883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l561_c2_0883_cond,
l8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue,
l8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse,
l8_MUX_uxn_opcodes_h_l561_c2_0883_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l561_c2_0883
device_out_result_MUX_uxn_opcodes_h_l561_c2_0883 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_cond,
device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_iftrue,
device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_iffalse,
device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_return_output);

-- t8_MUX_uxn_opcodes_h_l561_c2_0883
t8_MUX_uxn_opcodes_h_l561_c2_0883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l561_c2_0883_cond,
t8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue,
t8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse,
t8_MUX_uxn_opcodes_h_l561_c2_0883_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l561_c2_0883
deo_param0_MUX_uxn_opcodes_h_l561_c2_0883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_cond,
deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_iftrue,
deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_iffalse,
deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_return_output);

-- n8_MUX_uxn_opcodes_h_l561_c2_0883
n8_MUX_uxn_opcodes_h_l561_c2_0883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l561_c2_0883_cond,
n8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue,
n8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse,
n8_MUX_uxn_opcodes_h_l561_c2_0883_return_output);

-- result_MUX_uxn_opcodes_h_l561_c2_0883
result_MUX_uxn_opcodes_h_l561_c2_0883 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l561_c2_0883_cond,
result_MUX_uxn_opcodes_h_l561_c2_0883_iftrue,
result_MUX_uxn_opcodes_h_l561_c2_0883_iffalse,
result_MUX_uxn_opcodes_h_l561_c2_0883_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l561_c2_0883
deo_param1_MUX_uxn_opcodes_h_l561_c2_0883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_cond,
deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_iftrue,
deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_iffalse,
deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883
is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_cond,
is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883
is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_cond,
is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883
current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_cond,
current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007
BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_left,
BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_right,
BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89
is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- l8_MUX_uxn_opcodes_h_l576_c7_8c89
l8_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
l8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
l8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
l8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89
device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- t8_MUX_uxn_opcodes_h_l576_c7_8c89
t8_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
t8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
t8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
t8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89
deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- n8_MUX_uxn_opcodes_h_l576_c7_8c89
n8_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
n8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
n8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
n8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89
result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89
result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89
result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89
result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89
result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89
result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89
result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89
deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89
is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89
is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89
current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_cond,
current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028
BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_left,
BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_right,
BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381
is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_cond,
is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- l8_MUX_uxn_opcodes_h_l579_c7_7381
l8_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l579_c7_7381_cond,
l8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
l8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
l8_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l579_c7_7381
device_out_result_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_cond,
device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- t8_MUX_uxn_opcodes_h_l579_c7_7381
t8_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l579_c7_7381_cond,
t8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
t8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
t8_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l579_c7_7381
deo_param0_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_cond,
deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- n8_MUX_uxn_opcodes_h_l579_c7_7381
n8_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l579_c7_7381_cond,
n8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
n8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
n8_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381
result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381
result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_cond,
result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381
result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381
result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381
result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381
result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381
result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_cond,
result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381
result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l579_c7_7381
deo_param1_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_cond,
deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381
is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_cond,
is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381
is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_cond,
is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381
current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_cond,
current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7
BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_left,
BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_right,
BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_return_output);

-- MUX_uxn_opcodes_h_l584_c17_e7c7
MUX_uxn_opcodes_h_l584_c17_e7c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l584_c17_e7c7_cond,
MUX_uxn_opcodes_h_l584_c17_e7c7_iftrue,
MUX_uxn_opcodes_h_l584_c17_e7c7_iffalse,
MUX_uxn_opcodes_h_l584_c17_e7c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc
BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_left,
BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_right,
BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_return_output);

-- MUX_uxn_opcodes_h_l585_c17_b06c
MUX_uxn_opcodes_h_l585_c17_b06c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l585_c17_b06c_cond,
MUX_uxn_opcodes_h_l585_c17_b06c_iftrue,
MUX_uxn_opcodes_h_l585_c17_b06c_iffalse,
MUX_uxn_opcodes_h_l585_c17_b06c_return_output);

-- MUX_uxn_opcodes_h_l586_c8_af22
MUX_uxn_opcodes_h_l586_c8_af22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l586_c8_af22_cond,
MUX_uxn_opcodes_h_l586_c8_af22_iftrue,
MUX_uxn_opcodes_h_l586_c8_af22_iffalse,
MUX_uxn_opcodes_h_l586_c8_af22_return_output);

-- MUX_uxn_opcodes_h_l587_c8_cfd5
MUX_uxn_opcodes_h_l587_c8_cfd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l587_c8_cfd5_cond,
MUX_uxn_opcodes_h_l587_c8_cfd5_iftrue,
MUX_uxn_opcodes_h_l587_c8_cfd5_iffalse,
MUX_uxn_opcodes_h_l587_c8_cfd5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1
BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_left,
BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_right,
BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_return_output);

-- MUX_uxn_opcodes_h_l588_c16_9be4
MUX_uxn_opcodes_h_l588_c16_9be4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l588_c16_9be4_cond,
MUX_uxn_opcodes_h_l588_c16_9be4_iftrue,
MUX_uxn_opcodes_h_l588_c16_9be4_iffalse,
MUX_uxn_opcodes_h_l588_c16_9be4_return_output);

-- MUX_uxn_opcodes_h_l589_c16_5bc7
MUX_uxn_opcodes_h_l589_c16_5bc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l589_c16_5bc7_cond,
MUX_uxn_opcodes_h_l589_c16_5bc7_iftrue,
MUX_uxn_opcodes_h_l589_c16_5bc7_iffalse,
MUX_uxn_opcodes_h_l589_c16_5bc7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l590_c43_4d61
sp_relative_shift_uxn_opcodes_h_l590_c43_4d61 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_ins,
sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_x,
sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_y,
sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_return_output);

-- MUX_uxn_opcodes_h_l590_c30_5186
MUX_uxn_opcodes_h_l590_c30_5186 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l590_c30_5186_cond,
MUX_uxn_opcodes_h_l590_c30_5186_iftrue,
MUX_uxn_opcodes_h_l590_c30_5186_iffalse,
MUX_uxn_opcodes_h_l590_c30_5186_return_output);

-- device_out_uxn_opcodes_h_l591_c23_7f13
device_out_uxn_opcodes_h_l591_c23_7f13 : entity work.device_out_0CLK_95124a2a port map (
clk,
device_out_uxn_opcodes_h_l591_c23_7f13_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l591_c23_7f13_device_address,
device_out_uxn_opcodes_h_l591_c23_7f13_value,
device_out_uxn_opcodes_h_l591_c23_7f13_phase,
device_out_uxn_opcodes_h_l591_c23_7f13_previous_device_ram_read,
device_out_uxn_opcodes_h_l591_c23_7f13_previous_ram_read,
device_out_uxn_opcodes_h_l591_c23_7f13_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea
BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_left,
BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_right,
BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757
is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_cond,
is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757
current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_cond,
current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334
BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_left,
BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_right,
BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_return_output,
 l8_MUX_uxn_opcodes_h_l561_c2_0883_return_output,
 device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_return_output,
 t8_MUX_uxn_opcodes_h_l561_c2_0883_return_output,
 deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_return_output,
 n8_MUX_uxn_opcodes_h_l561_c2_0883_return_output,
 result_MUX_uxn_opcodes_h_l561_c2_0883_return_output,
 deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 l8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 t8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 n8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 l8_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 t8_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 n8_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_return_output,
 MUX_uxn_opcodes_h_l584_c17_e7c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_return_output,
 MUX_uxn_opcodes_h_l585_c17_b06c_return_output,
 MUX_uxn_opcodes_h_l586_c8_af22_return_output,
 MUX_uxn_opcodes_h_l587_c8_cfd5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_return_output,
 MUX_uxn_opcodes_h_l588_c16_9be4_return_output,
 MUX_uxn_opcodes_h_l589_c16_5bc7_return_output,
 sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_return_output,
 MUX_uxn_opcodes_h_l590_c30_5186_return_output,
 device_out_uxn_opcodes_h_l591_c23_7f13_return_output,
 BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l561_c2_0883_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_0bfb_uxn_opcodes_h_l561_c2_0883_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l561_c2_0883_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l574_c3_d078 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l566_c3_8f27 : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l571_c3_5949 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l577_c3_1bc4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l580_c3_1b2d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l579_c7_7381_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c17_e7c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c17_e7c7_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c17_e7c7_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l584_c17_e7c7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c17_b06c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c17_b06c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c17_b06c_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l585_c17_b06c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l586_c8_af22_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l586_c8_af22_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l586_c8_af22_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l586_c8_af22_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l587_c8_cfd5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l587_c8_cfd5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l587_c8_cfd5_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l587_c8_cfd5_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l588_c16_9be4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l588_c16_9be4_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l588_c16_9be4_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l588_c16_9be4_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l589_c16_5bc7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l589_c16_5bc7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l589_c16_5bc7_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l589_c16_5bc7_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l590_c30_5186_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l590_c30_5186_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l590_c30_5186_iffalse : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l590_c30_5186_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l591_c23_7f13_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l591_c23_7f13_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l591_c23_7f13_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l591_c23_7f13_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l591_c23_7f13_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l591_c23_7f13_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l591_c23_7f13_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l592_c32_718b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l593_c31_b04f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l594_c26_48c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l595_c29_3702_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l596_c22_0e73_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l597_c21_3103_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l600_c4_f610 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l603_c4_8d63 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_d004_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_89e1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_9488_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_d75b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_bebb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_425e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_20b1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_2f08_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l599_l598_DUPLICATE_d05b_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_right := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l574_c3_d078 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l574_c3_d078;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l584_c17_e7c7_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l566_c3_8f27 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l577_c3_1bc4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l577_c3_1bc4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l571_c3_5949 := resize(to_unsigned(1, 1), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_MUX_uxn_opcodes_h_l585_c17_b06c_iftrue := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l580_c3_1b2d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l580_c3_1b2d;
     VAR_current_deo_phase_uxn_opcodes_h_l600_c4_f610 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l600_c4_f610;
     VAR_MUX_uxn_opcodes_h_l585_c17_b06c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l590_c30_5186_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l584_c17_e7c7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_right := to_unsigned(4, 3);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l591_c23_7f13_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_ins := VAR_ins;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := is_phase_3;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := is_phase_4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l588_c16_9be4_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l589_c16_5bc7_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l586_c8_af22_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l587_c8_cfd5_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l591_c23_7f13_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l591_c23_7f13_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l586_c8_af22_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l587_c8_cfd5_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_left := t8;
     VAR_MUX_uxn_opcodes_h_l588_c16_9be4_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l576_c11_c007] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_left;
     BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output := BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_2f08 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_2f08_return_output := result.is_device_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l590_c43_4d61] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_ins;
     sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_x <= VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_x;
     sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_y <= VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_return_output := sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_d75b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_d75b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_bebb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_bebb_return_output := result.is_vram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l579_c7_7381_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_89e1 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_89e1_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l585_c17_67bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l603_c4_8334] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_left;
     BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_return_output := BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_9488 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_9488_return_output := result.device_ram_address;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l561_c2_0883] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l561_c2_0883_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l566_c3_8f27,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l571_c3_5949,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_d004 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_d004_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l561_c6_95c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l579_c11_d028] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_left;
     BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output := BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_425e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_425e_return_output := result.vram_write_layer;

     -- BIN_OP_PLUS[uxn_opcodes_h_l588_c32_cec1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_20b1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_20b1_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l584_c17_9da7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_left;
     BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_return_output := BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l561_c2_0883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l561_c2_0883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l561_c2_0883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_0883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l561_c6_95c1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l576_c7_8c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l576_c11_c007_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l579_c7_7381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l579_c11_d028_return_output;
     VAR_MUX_uxn_opcodes_h_l584_c17_e7c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c17_9da7_return_output;
     VAR_MUX_uxn_opcodes_h_l585_c17_b06c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c17_67bc_return_output;
     VAR_MUX_uxn_opcodes_h_l588_c16_9be4_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c32_cec1_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l603_c4_8d63 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l603_c4_8334_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_d75b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_d75b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_89e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_89e1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_2f08_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_2f08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_d004_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_d004_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_bebb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_bebb_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_425e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_425e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_9488_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_9488_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_20b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l579_l576_DUPLICATE_20b1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l561_c2_0883_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l561_c2_0883_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l579_c7_7381_return_output;
     VAR_MUX_uxn_opcodes_h_l590_c30_5186_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l590_c43_4d61_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l603_c4_8d63;
     -- t8_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_t8_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     t8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     t8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l579_c7_7381_return_output := t8_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- MUX[uxn_opcodes_h_l584_c17_e7c7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l584_c17_e7c7_cond <= VAR_MUX_uxn_opcodes_h_l584_c17_e7c7_cond;
     MUX_uxn_opcodes_h_l584_c17_e7c7_iftrue <= VAR_MUX_uxn_opcodes_h_l584_c17_e7c7_iftrue;
     MUX_uxn_opcodes_h_l584_c17_e7c7_iffalse <= VAR_MUX_uxn_opcodes_h_l584_c17_e7c7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l584_c17_e7c7_return_output := MUX_uxn_opcodes_h_l584_c17_e7c7_return_output;

     -- MUX[uxn_opcodes_h_l588_c16_9be4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l588_c16_9be4_cond <= VAR_MUX_uxn_opcodes_h_l588_c16_9be4_cond;
     MUX_uxn_opcodes_h_l588_c16_9be4_iftrue <= VAR_MUX_uxn_opcodes_h_l588_c16_9be4_iftrue;
     MUX_uxn_opcodes_h_l588_c16_9be4_iffalse <= VAR_MUX_uxn_opcodes_h_l588_c16_9be4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l588_c16_9be4_return_output := MUX_uxn_opcodes_h_l588_c16_9be4_return_output;

     -- MUX[uxn_opcodes_h_l585_c17_b06c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l585_c17_b06c_cond <= VAR_MUX_uxn_opcodes_h_l585_c17_b06c_cond;
     MUX_uxn_opcodes_h_l585_c17_b06c_iftrue <= VAR_MUX_uxn_opcodes_h_l585_c17_b06c_iftrue;
     MUX_uxn_opcodes_h_l585_c17_b06c_iffalse <= VAR_MUX_uxn_opcodes_h_l585_c17_b06c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l585_c17_b06c_return_output := MUX_uxn_opcodes_h_l585_c17_b06c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;
     VAR_MUX_uxn_opcodes_h_l586_c8_af22_cond := VAR_MUX_uxn_opcodes_h_l584_c17_e7c7_return_output;
     VAR_MUX_uxn_opcodes_h_l590_c30_5186_cond := VAR_MUX_uxn_opcodes_h_l584_c17_e7c7_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_MUX_uxn_opcodes_h_l584_c17_e7c7_return_output;
     VAR_MUX_uxn_opcodes_h_l587_c8_cfd5_cond := VAR_MUX_uxn_opcodes_h_l585_c17_b06c_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_MUX_uxn_opcodes_h_l585_c17_b06c_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_MUX_uxn_opcodes_h_l588_c16_9be4_return_output;
     VAR_device_out_uxn_opcodes_h_l591_c23_7f13_device_address := VAR_MUX_uxn_opcodes_h_l588_c16_9be4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_t8_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     -- is_phase_4_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_return_output := is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- MUX[uxn_opcodes_h_l590_c30_5186] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l590_c30_5186_cond <= VAR_MUX_uxn_opcodes_h_l590_c30_5186_cond;
     MUX_uxn_opcodes_h_l590_c30_5186_iftrue <= VAR_MUX_uxn_opcodes_h_l590_c30_5186_iftrue;
     MUX_uxn_opcodes_h_l590_c30_5186_iffalse <= VAR_MUX_uxn_opcodes_h_l590_c30_5186_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l590_c30_5186_return_output := MUX_uxn_opcodes_h_l590_c30_5186_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_return_output := is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- MUX[uxn_opcodes_h_l586_c8_af22] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l586_c8_af22_cond <= VAR_MUX_uxn_opcodes_h_l586_c8_af22_cond;
     MUX_uxn_opcodes_h_l586_c8_af22_iftrue <= VAR_MUX_uxn_opcodes_h_l586_c8_af22_iftrue;
     MUX_uxn_opcodes_h_l586_c8_af22_iffalse <= VAR_MUX_uxn_opcodes_h_l586_c8_af22_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l586_c8_af22_return_output := MUX_uxn_opcodes_h_l586_c8_af22_return_output;

     -- MUX[uxn_opcodes_h_l587_c8_cfd5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l587_c8_cfd5_cond <= VAR_MUX_uxn_opcodes_h_l587_c8_cfd5_cond;
     MUX_uxn_opcodes_h_l587_c8_cfd5_iftrue <= VAR_MUX_uxn_opcodes_h_l587_c8_cfd5_iftrue;
     MUX_uxn_opcodes_h_l587_c8_cfd5_iffalse <= VAR_MUX_uxn_opcodes_h_l587_c8_cfd5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l587_c8_cfd5_return_output := MUX_uxn_opcodes_h_l587_c8_cfd5_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_return_output := deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- t8_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_t8_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     t8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     t8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := t8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     VAR_MUX_uxn_opcodes_h_l589_c16_5bc7_iffalse := VAR_MUX_uxn_opcodes_h_l586_c8_af22_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_MUX_uxn_opcodes_h_l586_c8_af22_return_output;
     VAR_MUX_uxn_opcodes_h_l589_c16_5bc7_iftrue := VAR_MUX_uxn_opcodes_h_l587_c8_cfd5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_MUX_uxn_opcodes_h_l587_c8_cfd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_MUX_uxn_opcodes_h_l590_c30_5186_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse := VAR_t8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;
     -- n8_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_n8_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     n8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     n8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l579_c7_7381_return_output := n8_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- t8_MUX[uxn_opcodes_h_l561_c2_0883] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l561_c2_0883_cond <= VAR_t8_MUX_uxn_opcodes_h_l561_c2_0883_cond;
     t8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue;
     t8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l561_c2_0883_return_output := t8_MUX_uxn_opcodes_h_l561_c2_0883_return_output;

     -- l8_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_l8_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     l8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     l8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l579_c7_7381_return_output := l8_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- MUX[uxn_opcodes_h_l589_c16_5bc7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l589_c16_5bc7_cond <= VAR_MUX_uxn_opcodes_h_l589_c16_5bc7_cond;
     MUX_uxn_opcodes_h_l589_c16_5bc7_iftrue <= VAR_MUX_uxn_opcodes_h_l589_c16_5bc7_iftrue;
     MUX_uxn_opcodes_h_l589_c16_5bc7_iffalse <= VAR_MUX_uxn_opcodes_h_l589_c16_5bc7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l589_c16_5bc7_return_output := MUX_uxn_opcodes_h_l589_c16_5bc7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l583_c1_d1a1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l591_c23_7f13_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l583_c1_d1a1_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_MUX_uxn_opcodes_h_l589_c16_5bc7_return_output;
     VAR_device_out_uxn_opcodes_h_l591_c23_7f13_value := VAR_MUX_uxn_opcodes_h_l589_c16_5bc7_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_l8_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_n8_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l561_c2_0883_return_output;
     -- is_phase_3_MUX[uxn_opcodes_h_l561_c2_0883] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_cond;
     is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_return_output := is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_return_output;

     -- device_out[uxn_opcodes_h_l591_c23_7f13] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l591_c23_7f13_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l591_c23_7f13_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l591_c23_7f13_device_address <= VAR_device_out_uxn_opcodes_h_l591_c23_7f13_device_address;
     device_out_uxn_opcodes_h_l591_c23_7f13_value <= VAR_device_out_uxn_opcodes_h_l591_c23_7f13_value;
     device_out_uxn_opcodes_h_l591_c23_7f13_phase <= VAR_device_out_uxn_opcodes_h_l591_c23_7f13_phase;
     device_out_uxn_opcodes_h_l591_c23_7f13_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l591_c23_7f13_previous_device_ram_read;
     device_out_uxn_opcodes_h_l591_c23_7f13_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l591_c23_7f13_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l591_c23_7f13_return_output := device_out_uxn_opcodes_h_l591_c23_7f13_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_return_output := deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l561_c2_0883] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_cond;
     is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_return_output := is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_return_output;

     -- n8_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_n8_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     n8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     n8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := n8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l561_c2_0883] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_cond;
     deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_return_output := deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_return_output;

     -- l8_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_l8_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     l8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     l8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := l8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l561_c2_0883_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_device_out_uxn_opcodes_h_l591_c23_7f13_return_output;
     REG_VAR_is_phase_3 := VAR_is_phase_3_MUX_uxn_opcodes_h_l561_c2_0883_return_output;
     REG_VAR_is_phase_4 := VAR_is_phase_4_MUX_uxn_opcodes_h_l561_c2_0883_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse := VAR_l8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse := VAR_n8_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_return_output := device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- n8_MUX[uxn_opcodes_h_l561_c2_0883] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l561_c2_0883_cond <= VAR_n8_MUX_uxn_opcodes_h_l561_c2_0883_cond;
     n8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue;
     n8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l561_c2_0883_return_output := n8_MUX_uxn_opcodes_h_l561_c2_0883_return_output;

     -- l8_MUX[uxn_opcodes_h_l561_c2_0883] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l561_c2_0883_cond <= VAR_l8_MUX_uxn_opcodes_h_l561_c2_0883_cond;
     l8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l561_c2_0883_iftrue;
     l8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l561_c2_0883_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l561_c2_0883_return_output := l8_MUX_uxn_opcodes_h_l561_c2_0883_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l594_c26_48c0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l594_c26_48c0_return_output := VAR_device_out_uxn_opcodes_h_l591_c23_7f13_return_output.is_vram_write;

     -- deo_param1_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l596_c22_0e73] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l596_c22_0e73_return_output := VAR_device_out_uxn_opcodes_h_l591_c23_7f13_return_output.u16_addr;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l593_c31_b04f] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l593_c31_b04f_return_output := VAR_device_out_uxn_opcodes_h_l591_c23_7f13_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l599_l598_DUPLICATE_d05b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l599_l598_DUPLICATE_d05b_return_output := VAR_device_out_uxn_opcodes_h_l591_c23_7f13_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l592_c32_718b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l592_c32_718b_return_output := VAR_device_out_uxn_opcodes_h_l591_c23_7f13_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l595_c29_3702] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l595_c29_3702_return_output := VAR_device_out_uxn_opcodes_h_l591_c23_7f13_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l597_c21_3103] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l597_c21_3103_return_output := VAR_device_out_uxn_opcodes_h_l591_c23_7f13_return_output.u8_value;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l596_c22_0e73_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l599_l598_DUPLICATE_d05b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l599_l598_DUPLICATE_d05b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l599_l598_DUPLICATE_d05b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l592_c32_718b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l594_c26_48c0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l595_c29_3702_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l593_c31_b04f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l597_c21_3103_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l561_c2_0883_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l561_c2_0883_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_return_output := result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l598_c24_59ea] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_left;
     BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_return_output := BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l599_c3_4757] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_return_output := current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l561_c2_0883] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_cond;
     deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_return_output := deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_return_output := result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l599_c3_4757] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_cond;
     is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_return_output := is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l598_c24_59ea_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l599_c3_4757_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l561_c2_0883_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l599_c3_4757_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l561_c2_0883] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_cond;
     device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_return_output := device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_return_output := current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_return_output := is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l579_c7_7381] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l561_c2_0883_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l579_c7_7381_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l576_c7_8c89] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l576_c7_8c89_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l561_c2_0883] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_cond;
     is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_return_output := is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l561_c2_0883] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_return_output := current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_0bfb[uxn_opcodes_h_l561_c2_0883] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_0bfb_uxn_opcodes_h_l561_c2_0883_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0bfb(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l576_c7_8c89_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l576_c7_8c89_return_output);

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l561_c2_0883_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l561_c2_0883_return_output;
     VAR_result_MUX_uxn_opcodes_h_l561_c2_0883_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_0bfb_uxn_opcodes_h_l561_c2_0883_return_output;
     -- result_MUX[uxn_opcodes_h_l561_c2_0883] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l561_c2_0883_cond <= VAR_result_MUX_uxn_opcodes_h_l561_c2_0883_cond;
     result_MUX_uxn_opcodes_h_l561_c2_0883_iftrue <= VAR_result_MUX_uxn_opcodes_h_l561_c2_0883_iftrue;
     result_MUX_uxn_opcodes_h_l561_c2_0883_iffalse <= VAR_result_MUX_uxn_opcodes_h_l561_c2_0883_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l561_c2_0883_return_output := result_MUX_uxn_opcodes_h_l561_c2_0883_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l561_c2_0883_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l561_c2_0883_return_output;
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
