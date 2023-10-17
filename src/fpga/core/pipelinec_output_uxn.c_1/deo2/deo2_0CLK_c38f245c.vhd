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
-- Submodules: 146
entity deo2_0CLK_c38f245c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_c38f245c;
architecture arch of deo2_0CLK_c38f245c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l564_c6_2179]
signal BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l564_c1_ca52]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l571_c7_a66c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l564_c2_4908]
signal deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l564_c2_4908]
signal l8_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l564_c2_4908]
signal t8_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l564_c2_4908]
signal result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l564_c2_4908]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l564_c2_4908]
signal result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l564_c2_4908]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l564_c2_4908]
signal result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l564_c2_4908]
signal result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l564_c2_4908]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l564_c2_4908]
signal result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l564_c2_4908]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l564_c2_4908]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l564_c2_4908]
signal current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l564_c2_4908]
signal is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l564_c2_4908]
signal n8_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l564_c2_4908]
signal deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l564_c2_4908]
signal device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_return_output : device_out_result_t;

-- printf_uxn_opcodes_h_l565_c3_0e51[uxn_opcodes_h_l565_c3_0e51]
signal printf_uxn_opcodes_h_l565_c3_0e51_uxn_opcodes_h_l565_c3_0e51_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l571_c11_dad0]
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l574_c7_0af8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l571_c7_a66c]
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l571_c7_a66c]
signal l8_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l571_c7_a66c]
signal t8_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l571_c7_a66c]
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l571_c7_a66c]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l571_c7_a66c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l571_c7_a66c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l571_c7_a66c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l571_c7_a66c]
signal result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l571_c7_a66c]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l571_c7_a66c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l571_c7_a66c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l571_c7_a66c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l571_c7_a66c]
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l571_c7_a66c]
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l571_c7_a66c]
signal n8_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l571_c7_a66c]
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l571_c7_a66c]
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l574_c11_2cd9]
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c7_a191]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l574_c7_0af8]
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l574_c7_0af8]
signal l8_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l574_c7_0af8]
signal t8_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l574_c7_0af8]
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l574_c7_0af8]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l574_c7_0af8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l574_c7_0af8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l574_c7_0af8]
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l574_c7_0af8]
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l574_c7_0af8]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l574_c7_0af8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l574_c7_0af8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l574_c7_0af8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l574_c7_0af8]
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l574_c7_0af8]
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l574_c7_0af8]
signal n8_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l574_c7_0af8]
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l574_c7_0af8]
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l578_c11_6d42]
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l578_c7_a191]
signal deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l578_c7_a191]
signal l8_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l578_c7_a191]
signal result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l578_c7_a191]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l578_c7_a191]
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l578_c7_a191]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l578_c7_a191]
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l578_c7_a191]
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l578_c7_a191]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l578_c7_a191]
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l578_c7_a191]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l578_c7_a191]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l578_c7_a191]
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l578_c7_a191]
signal is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l578_c7_a191]
signal n8_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l578_c7_a191]
signal deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l578_c7_a191]
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l581_c11_c6f2]
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l585_c7_f31d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal l8_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal n8_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l581_c7_f5ec]
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l585_c11_9775]
signal BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l585_c7_f31d]
signal deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l585_c7_f31d]
signal l8_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l585_c7_f31d]
signal result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l585_c7_f31d]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l585_c7_f31d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l585_c7_f31d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l585_c7_f31d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l585_c7_f31d]
signal result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l585_c7_f31d]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l585_c7_f31d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l585_c7_f31d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l585_c7_f31d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l585_c7_f31d]
signal current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l585_c7_f31d]
signal is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l585_c7_f31d]
signal deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l585_c7_f31d]
signal device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l588_c11_b8d1]
signal BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l594_c1_faff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal l8_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l588_c7_dfd8]
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : device_out_result_t;

-- sp_relative_shift[uxn_opcodes_h_l592_c30_e1ec]
signal sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l596_c32_20eb]
signal BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l596_c16_137c]
signal MUX_uxn_opcodes_h_l596_c16_137c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l596_c16_137c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l596_c16_137c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l596_c16_137c_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l597_c16_2f10]
signal MUX_uxn_opcodes_h_l597_c16_2f10_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l597_c16_2f10_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l597_c16_2f10_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l597_c16_2f10_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l598_c23_e87a]
signal device_out_uxn_opcodes_h_l598_c23_e87a_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l598_c23_e87a_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l598_c23_e87a_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l598_c23_e87a_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l598_c23_e87a_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l598_c23_e87a_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l605_c24_c3b8]
signal BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l606_c3_e433]
signal current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l606_c3_e433]
signal is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l610_c4_cb3a]
signal BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_aa08( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.vram_address := ref_toks_6;
      base.vram_write_layer := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.is_sp_shift := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179
BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_left,
BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_right,
BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l564_c2_4908
deo_param0_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_cond,
deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- l8_MUX_uxn_opcodes_h_l564_c2_4908
l8_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l564_c2_4908_cond,
l8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
l8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
l8_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- t8_MUX_uxn_opcodes_h_l564_c2_4908
t8_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l564_c2_4908_cond,
t8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
t8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
t8_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908
result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_cond,
result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908
result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908
result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908
result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908
result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_cond,
result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908
result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908
result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908
result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908
result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908
current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_cond,
current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908
is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_cond,
is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- n8_MUX_uxn_opcodes_h_l564_c2_4908
n8_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l564_c2_4908_cond,
n8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
n8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
n8_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l564_c2_4908
deo_param1_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_cond,
deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l564_c2_4908
device_out_result_MUX_uxn_opcodes_h_l564_c2_4908 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_cond,
device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_iftrue,
device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_iffalse,
device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

-- printf_uxn_opcodes_h_l565_c3_0e51_uxn_opcodes_h_l565_c3_0e51
printf_uxn_opcodes_h_l565_c3_0e51_uxn_opcodes_h_l565_c3_0e51 : entity work.printf_uxn_opcodes_h_l565_c3_0e51_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l565_c3_0e51_uxn_opcodes_h_l565_c3_0e51_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0
BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_left,
BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_right,
BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c
deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- l8_MUX_uxn_opcodes_h_l571_c7_a66c
l8_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
l8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
l8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
l8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- t8_MUX_uxn_opcodes_h_l571_c7_a66c
t8_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
t8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
t8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
t8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c
result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c
result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c
is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- n8_MUX_uxn_opcodes_h_l571_c7_a66c
n8_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
n8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
n8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
n8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c
deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c
device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_cond,
device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue,
device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse,
device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9
BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_left,
BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_right,
BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8
deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- l8_MUX_uxn_opcodes_h_l574_c7_0af8
l8_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
l8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
l8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
l8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- t8_MUX_uxn_opcodes_h_l574_c7_0af8
t8_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
t8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
t8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
t8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8
result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8
result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8
is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- n8_MUX_uxn_opcodes_h_l574_c7_0af8
n8_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
n8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
n8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
n8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8
deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8
device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_cond,
device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue,
device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse,
device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42
BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_left,
BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_right,
BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l578_c7_a191
deo_param0_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_cond,
deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- l8_MUX_uxn_opcodes_h_l578_c7_a191
l8_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l578_c7_a191_cond,
l8_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
l8_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
l8_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191
result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_cond,
result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191
result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_cond,
result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191
result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191
current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_cond,
current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191
is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_cond,
is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- n8_MUX_uxn_opcodes_h_l578_c7_a191
n8_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l578_c7_a191_cond,
n8_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
n8_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
n8_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l578_c7_a191
deo_param1_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_cond,
deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l578_c7_a191
device_out_result_MUX_uxn_opcodes_h_l578_c7_a191 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_cond,
device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_iftrue,
device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_iffalse,
device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2
BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_left,
BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_right,
BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec
deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- l8_MUX_uxn_opcodes_h_l581_c7_f5ec
l8_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
l8_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
l8_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
l8_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec
result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec
result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec
result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec
is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- n8_MUX_uxn_opcodes_h_l581_c7_f5ec
n8_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
n8_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
n8_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
n8_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec
deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec
device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_cond,
device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue,
device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse,
device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775
BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_left,
BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_right,
BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d
deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- l8_MUX_uxn_opcodes_h_l585_c7_f31d
l8_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
l8_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
l8_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
l8_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d
result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d
result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d
result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d
result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d
result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d
result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d
result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d
result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d
result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d
current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d
is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d
deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d
device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_cond,
device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue,
device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse,
device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1
BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_left,
BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_right,
BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8
deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- l8_MUX_uxn_opcodes_h_l588_c7_dfd8
l8_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
l8_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
l8_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
l8_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8
result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8
result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8
result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8
is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8
deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8
device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_cond,
device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue,
device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse,
device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec
sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_ins,
sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_x,
sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_y,
sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb
BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_left,
BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_right,
BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_return_output);

-- MUX_uxn_opcodes_h_l596_c16_137c
MUX_uxn_opcodes_h_l596_c16_137c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l596_c16_137c_cond,
MUX_uxn_opcodes_h_l596_c16_137c_iftrue,
MUX_uxn_opcodes_h_l596_c16_137c_iffalse,
MUX_uxn_opcodes_h_l596_c16_137c_return_output);

-- MUX_uxn_opcodes_h_l597_c16_2f10
MUX_uxn_opcodes_h_l597_c16_2f10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l597_c16_2f10_cond,
MUX_uxn_opcodes_h_l597_c16_2f10_iftrue,
MUX_uxn_opcodes_h_l597_c16_2f10_iffalse,
MUX_uxn_opcodes_h_l597_c16_2f10_return_output);

-- device_out_uxn_opcodes_h_l598_c23_e87a
device_out_uxn_opcodes_h_l598_c23_e87a : entity work.device_out_0CLK_b285e9e3 port map (
clk,
device_out_uxn_opcodes_h_l598_c23_e87a_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l598_c23_e87a_device_address,
device_out_uxn_opcodes_h_l598_c23_e87a_value,
device_out_uxn_opcodes_h_l598_c23_e87a_phase,
device_out_uxn_opcodes_h_l598_c23_e87a_previous_device_ram_read,
device_out_uxn_opcodes_h_l598_c23_e87a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8
BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_left,
BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_right,
BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433
current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_cond,
current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433
is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_cond,
is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a
BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_left,
BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_right,
BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_return_output);



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
 n8,
 l8,
 current_deo_phase,
 deo_param0,
 deo_param1,
 is_second_deo,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 l8_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 t8_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 n8_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 l8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 t8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 n8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 l8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 t8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 n8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 l8_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 n8_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 l8_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 n8_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 l8_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_return_output,
 deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 l8_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output,
 sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_return_output,
 MUX_uxn_opcodes_h_l596_c16_137c_return_output,
 MUX_uxn_opcodes_h_l597_c16_2f10_return_output,
 device_out_uxn_opcodes_h_l598_c23_e87a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l566_c3_56f8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l569_c3_f4d5 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l565_c3_0e51_uxn_opcodes_h_l565_c3_0e51_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_41ea : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l576_c3_bcd5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_5c53 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l583_c3_cdfd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_b32f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_5a21 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l588_c7_dfd8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l596_c16_137c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l596_c16_137c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l596_c16_137c_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l596_c16_137c_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l597_c16_2f10_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l597_c16_2f10_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l597_c16_2f10_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l597_c16_2f10_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l598_c23_e87a_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l598_c23_e87a_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l598_c23_e87a_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l598_c23_e87a_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l598_c23_e87a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l598_c23_e87a_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l599_c32_8fe7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l600_c31_3098_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l601_c26_2add_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l602_c29_4e4d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l603_c25_b7ec_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l604_c21_1c99_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l607_c4_dd1c : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l610_c4_84c0 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_2267_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_5d8e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_10be_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_28e7_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_db44_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_fd44_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_471f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l585_l564_l581_l571_l574_DUPLICATE_bd71_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l585_l588_l581_l571_l574_DUPLICATE_ed90_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l605_l606_DUPLICATE_f222_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aa08_uxn_opcodes_h_l614_l557_DUPLICATE_5c6d_return_output : opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_right := to_unsigned(6, 3);
     VAR_current_deo_phase_uxn_opcodes_h_l607_c4_dd1c := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l607_c4_dd1c;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l569_c3_f4d5 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l569_c3_f4d5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l576_c3_bcd5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l576_c3_bcd5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l583_c3_cdfd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l583_c3_cdfd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l566_c3_56f8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l566_c3_56f8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_5c53 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_5c53;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_b32f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_b32f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_41ea := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_41ea;
     VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_y := resize(to_signed(-3, 3), 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_5a21 := resize(to_unsigned(0, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_5a21;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_right := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l598_c23_e87a_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l596_c16_137c_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l597_c16_2f10_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l597_c16_2f10_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l597_c16_2f10_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l598_c23_e87a_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_left := t8;
     VAR_MUX_uxn_opcodes_h_l596_c16_137c_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_10be LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_10be_return_output := result.device_ram_address;

     -- MUX[uxn_opcodes_h_l597_c16_2f10] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l597_c16_2f10_cond <= VAR_MUX_uxn_opcodes_h_l597_c16_2f10_cond;
     MUX_uxn_opcodes_h_l597_c16_2f10_iftrue <= VAR_MUX_uxn_opcodes_h_l597_c16_2f10_iftrue;
     MUX_uxn_opcodes_h_l597_c16_2f10_iffalse <= VAR_MUX_uxn_opcodes_h_l597_c16_2f10_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l597_c16_2f10_return_output := MUX_uxn_opcodes_h_l597_c16_2f10_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l585_l588_l581_l571_l574_DUPLICATE_ed90 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l585_l588_l581_l571_l574_DUPLICATE_ed90_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l581_c11_c6f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l585_l564_l581_l571_l574_DUPLICATE_bd71 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l585_l564_l581_l571_l574_DUPLICATE_bd71_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_fd44 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_fd44_return_output := result.is_vram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l596_c32_20eb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_471f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_471f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l564_c6_2179] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_left;
     BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output := BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l574_c11_2cd9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_left;
     BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output := BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_db44 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_db44_return_output := result.vram_write_layer;

     -- BIN_OP_PLUS[uxn_opcodes_h_l610_c4_cb3a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l592_c30_e1ec] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_ins;
     sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_x <= VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_x;
     sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_y <= VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_return_output := sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l571_c11_dad0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_left;
     BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output := BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_2267 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_2267_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_5d8e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_5d8e_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_28e7 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_28e7_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l578_c11_6d42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_left;
     BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output := BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l588_c11_b8d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l585_c11_9775] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_left;
     BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output := BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l588_c7_dfd8_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l564_c2_4908_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_2179_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_a66c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_dad0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_0af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_2cd9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_6d42_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_c6f2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_9775_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_b8d1_return_output;
     VAR_MUX_uxn_opcodes_h_l596_c16_137c_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_20eb_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l610_c4_84c0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_cb3a_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_471f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_471f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_471f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_471f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_471f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_471f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_471f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_5d8e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_5d8e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_5d8e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_5d8e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_5d8e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_5d8e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_5d8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l585_l588_l581_l571_l574_DUPLICATE_ed90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l585_l588_l581_l571_l574_DUPLICATE_ed90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l585_l588_l581_l571_l574_DUPLICATE_ed90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l585_l588_l581_l571_l574_DUPLICATE_ed90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l585_l588_l581_l571_l574_DUPLICATE_ed90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l585_l588_l581_l571_l574_DUPLICATE_ed90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l585_l564_l581_l571_l574_DUPLICATE_bd71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l585_l564_l581_l571_l574_DUPLICATE_bd71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l585_l564_l581_l571_l574_DUPLICATE_bd71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l585_l564_l581_l571_l574_DUPLICATE_bd71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l585_l564_l581_l571_l574_DUPLICATE_bd71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l585_l564_l581_l571_l574_DUPLICATE_bd71_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_fd44_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_fd44_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_fd44_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_fd44_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_fd44_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_fd44_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_fd44_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_db44_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_db44_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_db44_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_db44_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_db44_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_db44_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_db44_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_28e7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_28e7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_28e7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_28e7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_28e7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_28e7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_28e7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_10be_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_10be_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_10be_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_10be_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_10be_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_10be_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_10be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_2267_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_2267_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_2267_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_2267_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_2267_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_2267_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l585_l564_l588_l581_l571_l574_DUPLICATE_2267_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := VAR_MUX_uxn_opcodes_h_l597_c16_2f10_return_output;
     VAR_device_out_uxn_opcodes_h_l598_c23_e87a_value := VAR_MUX_uxn_opcodes_h_l597_c16_2f10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_e1ec_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l610_c4_84c0;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- l8_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_l8_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     l8_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     l8_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := l8_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- MUX[uxn_opcodes_h_l596_c16_137c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l596_c16_137c_cond <= VAR_MUX_uxn_opcodes_h_l596_c16_137c_cond;
     MUX_uxn_opcodes_h_l596_c16_137c_iftrue <= VAR_MUX_uxn_opcodes_h_l596_c16_137c_iftrue;
     MUX_uxn_opcodes_h_l596_c16_137c_iffalse <= VAR_MUX_uxn_opcodes_h_l596_c16_137c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l596_c16_137c_return_output := MUX_uxn_opcodes_h_l596_c16_137c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l564_c1_ca52] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_return_output;

     -- t8_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     t8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     t8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := t8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- n8_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_n8_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     n8_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     n8_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := n8_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := VAR_MUX_uxn_opcodes_h_l596_c16_137c_return_output;
     VAR_device_out_uxn_opcodes_h_l598_c23_e87a_device_address := VAR_MUX_uxn_opcodes_h_l596_c16_137c_return_output;
     VAR_printf_uxn_opcodes_h_l565_c3_0e51_uxn_opcodes_h_l565_c3_0e51_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_ca52_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_l8_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_n8_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     -- n8_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_n8_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     n8_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     n8_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_a191_return_output := n8_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- printf_uxn_opcodes_h_l565_c3_0e51[uxn_opcodes_h_l565_c3_0e51] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l565_c3_0e51_uxn_opcodes_h_l565_c3_0e51_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l565_c3_0e51_uxn_opcodes_h_l565_c3_0e51_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- t8_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_t8_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     t8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     t8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := t8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- l8_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_l8_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     l8_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     l8_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := l8_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_l8_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_t8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- l8_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_l8_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     l8_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     l8_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := l8_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- n8_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     n8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     n8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := n8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- t8_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_t8_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     t8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     t8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l564_c2_4908_return_output := t8_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_l8_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l564_c2_4908_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- l8_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_l8_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     l8_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     l8_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l578_c7_a191_return_output := l8_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_return_output := deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- n8_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_n8_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     n8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     n8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := n8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_l8_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_n8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- n8_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_n8_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     n8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     n8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l564_c2_4908_return_output := n8_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_return_output := deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- l8_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     l8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     l8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := l8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_l8_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l564_c2_4908_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- l8_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_l8_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     l8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     l8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := l8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_l8_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l594_c1_faff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_return_output := deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- l8_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_l8_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     l8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     l8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l564_c2_4908_return_output := l8_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l598_c23_e87a_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_faff_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_4908_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l564_c2_4908_return_output;
     -- device_out[uxn_opcodes_h_l598_c23_e87a] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l598_c23_e87a_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l598_c23_e87a_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l598_c23_e87a_device_address <= VAR_device_out_uxn_opcodes_h_l598_c23_e87a_device_address;
     device_out_uxn_opcodes_h_l598_c23_e87a_value <= VAR_device_out_uxn_opcodes_h_l598_c23_e87a_value;
     device_out_uxn_opcodes_h_l598_c23_e87a_phase <= VAR_device_out_uxn_opcodes_h_l598_c23_e87a_phase;
     device_out_uxn_opcodes_h_l598_c23_e87a_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l598_c23_e87a_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l598_c23_e87a_return_output := device_out_uxn_opcodes_h_l598_c23_e87a_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_return_output := deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_4908_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := VAR_device_out_uxn_opcodes_h_l598_c23_e87a_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l604_c21_1c99] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l604_c21_1c99_return_output := VAR_device_out_uxn_opcodes_h_l598_c23_e87a_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l605_l606_DUPLICATE_f222 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l605_l606_DUPLICATE_f222_return_output := VAR_device_out_uxn_opcodes_h_l598_c23_e87a_return_output.is_deo_done;

     -- device_out_result_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l602_c29_4e4d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l602_c29_4e4d_return_output := VAR_device_out_uxn_opcodes_h_l598_c23_e87a_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l600_c31_3098] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l600_c31_3098_return_output := VAR_device_out_uxn_opcodes_h_l598_c23_e87a_return_output.device_ram_address;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l603_c25_b7ec] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l603_c25_b7ec_return_output := VAR_device_out_uxn_opcodes_h_l598_c23_e87a_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l601_c26_2add] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l601_c26_2add_return_output := VAR_device_out_uxn_opcodes_h_l598_c23_e87a_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l599_c32_8fe7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l599_c32_8fe7_return_output := VAR_device_out_uxn_opcodes_h_l598_c23_e87a_return_output.is_device_ram_write;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l605_l606_DUPLICATE_f222_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l605_l606_DUPLICATE_f222_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l605_l606_DUPLICATE_f222_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l599_c32_8fe7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l601_c26_2add_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l602_c29_4e4d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l603_c25_b7ec_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l600_c31_3098_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l604_c21_1c99_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l606_c3_e433] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_return_output := current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l605_c24_c3b8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_left;
     BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_return_output := BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l606_c3_e433] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_cond;
     is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_return_output := is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_c3b8_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_e433_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_e433_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l588_c7_dfd8] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output := current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_dfd8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_return_output := device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l585_c7_f31d] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_return_output := current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_f31d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_return_output := result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_return_output := result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l581_c7_f5ec] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_cond;
     is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output := is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_f5ec_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_return_output := current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l578_c7_a191] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_cond;
     is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_return_output := is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_a191_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l574_c7_0af8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_return_output := device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_4908_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_0af8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l571_c7_a66c] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_return_output := current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_return_output := result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_return_output := result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_a66c_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_return_output := is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_return_output := current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l564_c2_4908] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_4908_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_4908_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_aa08_uxn_opcodes_h_l614_l557_DUPLICATE_5c6d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aa08_uxn_opcodes_h_l614_l557_DUPLICATE_5c6d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_aa08(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_4908_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_4908_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aa08_uxn_opcodes_h_l614_l557_DUPLICATE_5c6d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_aa08_uxn_opcodes_h_l614_l557_DUPLICATE_5c6d_return_output;
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
