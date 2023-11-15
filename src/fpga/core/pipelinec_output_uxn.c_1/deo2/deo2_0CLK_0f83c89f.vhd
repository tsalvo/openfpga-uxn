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
-- Submodules: 114
entity deo2_0CLK_0f83c89f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_0f83c89f;
architecture arch of deo2_0CLK_0f83c89f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l527_c6_f93a]
signal BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l527_c1_44d2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l534_c7_0106]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l527_c2_28e4]
signal n8_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l527_c2_28e4]
signal t8_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l527_c2_28e4]
signal is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l527_c2_28e4]
signal deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l527_c2_28e4]
signal l8_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l527_c2_28e4]
signal deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l527_c2_28e4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c2_28e4]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c2_28e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l527_c2_28e4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c2_28e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l527_c2_28e4]
signal result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(23 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l527_c2_28e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l527_c2_28e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l527_c2_28e4]
signal result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c2_28e4]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l527_c2_28e4]
signal result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(15 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l527_c2_28e4]
signal current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l527_c2_28e4]
signal device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : device_out_result_t;

-- printf_uxn_opcodes_h_l528_c3_c591[uxn_opcodes_h_l528_c3_c591]
signal printf_uxn_opcodes_h_l528_c3_c591_uxn_opcodes_h_l528_c3_c591_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l534_c11_e568]
signal BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l534_c7_0106]
signal n8_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l534_c7_0106]
signal t8_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l534_c7_0106]
signal is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l534_c7_0106]
signal deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l534_c7_0106]
signal l8_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l534_c7_0106]
signal deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l534_c7_0106]
signal result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l534_c7_0106]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l534_c7_0106]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l534_c7_0106]
signal result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l534_c7_0106]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l534_c7_0106]
signal result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(23 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l534_c7_0106]
signal result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l534_c7_0106]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l534_c7_0106]
signal result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l534_c7_0106]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l534_c7_0106]
signal result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(15 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l534_c7_0106]
signal current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l534_c7_0106]
signal device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l537_c11_3322]
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l541_c7_30ce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal n8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal t8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal l8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(23 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(15 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l537_c7_d1c5]
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l541_c11_2541]
signal BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l541_c7_30ce]
signal n8_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l541_c7_30ce]
signal is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l541_c7_30ce]
signal deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l541_c7_30ce]
signal l8_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l541_c7_30ce]
signal deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l541_c7_30ce]
signal result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l541_c7_30ce]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l541_c7_30ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l541_c7_30ce]
signal result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l541_c7_30ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l541_c7_30ce]
signal result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(23 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l541_c7_30ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l541_c7_30ce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l541_c7_30ce]
signal result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l541_c7_30ce]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l541_c7_30ce]
signal result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(15 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l541_c7_30ce]
signal current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l541_c7_30ce]
signal device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l544_c11_797f]
signal BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l550_c1_07dd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal l8_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(23 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(15 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l544_c7_ccdc]
signal device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : device_out_result_t;

-- sp_relative_shift[uxn_opcodes_h_l548_c30_f68b]
signal sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l552_c32_12b2]
signal BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l552_c16_1ece]
signal MUX_uxn_opcodes_h_l552_c16_1ece_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l552_c16_1ece_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l552_c16_1ece_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l552_c16_1ece_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l553_c16_f52a]
signal MUX_uxn_opcodes_h_l553_c16_f52a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l553_c16_f52a_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l553_c16_f52a_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l553_c16_f52a_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l554_c23_5445]
signal device_out_uxn_opcodes_h_l554_c23_5445_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l554_c23_5445_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l554_c23_5445_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l554_c23_5445_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l554_c23_5445_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l554_c23_5445_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l554_c23_5445_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l562_c24_3751]
signal BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l563_c3_f6b0]
signal is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l563_c3_f6b0]
signal current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l567_c4_d114]
signal BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_f727( ref_toks_0 : opcode_result_t;
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
      base.device_ram_address := ref_toks_1;
      base.vram_write_layer := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.vram_address := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.u8_value := ref_toks_9;
      base.is_device_ram_write := ref_toks_10;
      base.u16_value := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a
BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_left,
BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_right,
BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- n8_MUX_uxn_opcodes_h_l527_c2_28e4
n8_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
n8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
n8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
n8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- t8_MUX_uxn_opcodes_h_l527_c2_28e4
t8_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
t8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
t8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
t8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4
is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4
deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- l8_MUX_uxn_opcodes_h_l527_c2_28e4
l8_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
l8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
l8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
l8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4
deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4
result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4
result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4
result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4
result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4
result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4
result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4
current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4
device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_cond,
device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue,
device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse,
device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

-- printf_uxn_opcodes_h_l528_c3_c591_uxn_opcodes_h_l528_c3_c591
printf_uxn_opcodes_h_l528_c3_c591_uxn_opcodes_h_l528_c3_c591 : entity work.printf_uxn_opcodes_h_l528_c3_c591_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l528_c3_c591_uxn_opcodes_h_l528_c3_c591_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568
BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_left,
BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_right,
BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- n8_MUX_uxn_opcodes_h_l534_c7_0106
n8_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l534_c7_0106_cond,
n8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
n8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
n8_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- t8_MUX_uxn_opcodes_h_l534_c7_0106
t8_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l534_c7_0106_cond,
t8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
t8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
t8_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106
is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_cond,
is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l534_c7_0106
deo_param0_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_cond,
deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- l8_MUX_uxn_opcodes_h_l534_c7_0106
l8_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l534_c7_0106_cond,
l8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
l8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
l8_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l534_c7_0106
deo_param1_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_cond,
deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106
result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106
result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106
result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106
result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106
result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_cond,
result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106
result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106
result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106
result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_cond,
result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106
result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106
result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_cond,
result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106
current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_cond,
current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l534_c7_0106
device_out_result_MUX_uxn_opcodes_h_l534_c7_0106 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_cond,
device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_iftrue,
device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_iffalse,
device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322
BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_left,
BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_right,
BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- n8_MUX_uxn_opcodes_h_l537_c7_d1c5
n8_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
n8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
n8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
n8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- t8_MUX_uxn_opcodes_h_l537_c7_d1c5
t8_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
t8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
t8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
t8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5
is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5
deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- l8_MUX_uxn_opcodes_h_l537_c7_d1c5
l8_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
l8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
l8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
l8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5
deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5
result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5
result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5
result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5
current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5
device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_cond,
device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue,
device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse,
device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541
BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_left,
BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_right,
BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- n8_MUX_uxn_opcodes_h_l541_c7_30ce
n8_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
n8_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
n8_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
n8_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce
is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce
deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- l8_MUX_uxn_opcodes_h_l541_c7_30ce
l8_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
l8_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
l8_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
l8_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce
deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce
result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce
result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce
result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce
result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce
result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce
result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce
result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce
result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce
result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce
current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce
device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_cond,
device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue,
device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse,
device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f
BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_left,
BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_right,
BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc
is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc
deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- l8_MUX_uxn_opcodes_h_l544_c7_ccdc
l8_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
l8_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
l8_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
l8_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc
deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc
result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc
result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc
result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc
result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc
result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc
result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc
result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc
result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc
result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc
result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc
current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc
device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_cond,
device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue,
device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse,
device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l548_c30_f68b
sp_relative_shift_uxn_opcodes_h_l548_c30_f68b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_ins,
sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_x,
sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_y,
sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2
BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_left,
BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_right,
BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_return_output);

-- MUX_uxn_opcodes_h_l552_c16_1ece
MUX_uxn_opcodes_h_l552_c16_1ece : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l552_c16_1ece_cond,
MUX_uxn_opcodes_h_l552_c16_1ece_iftrue,
MUX_uxn_opcodes_h_l552_c16_1ece_iffalse,
MUX_uxn_opcodes_h_l552_c16_1ece_return_output);

-- MUX_uxn_opcodes_h_l553_c16_f52a
MUX_uxn_opcodes_h_l553_c16_f52a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l553_c16_f52a_cond,
MUX_uxn_opcodes_h_l553_c16_f52a_iftrue,
MUX_uxn_opcodes_h_l553_c16_f52a_iffalse,
MUX_uxn_opcodes_h_l553_c16_f52a_return_output);

-- device_out_uxn_opcodes_h_l554_c23_5445
device_out_uxn_opcodes_h_l554_c23_5445 : entity work.device_out_0CLK_f5486376 port map (
clk,
device_out_uxn_opcodes_h_l554_c23_5445_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l554_c23_5445_device_address,
device_out_uxn_opcodes_h_l554_c23_5445_value,
device_out_uxn_opcodes_h_l554_c23_5445_phase,
device_out_uxn_opcodes_h_l554_c23_5445_previous_device_ram_read,
device_out_uxn_opcodes_h_l554_c23_5445_previous_ram_read,
device_out_uxn_opcodes_h_l554_c23_5445_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l562_c24_3751
BIN_OP_AND_uxn_opcodes_h_l562_c24_3751 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_left,
BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_right,
BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0
is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_cond,
is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0
current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_cond,
current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114
BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_left,
BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_right,
BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_return_output);



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
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 n8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 t8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 l8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 n8_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 t8_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 l8_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 n8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 t8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 l8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 n8_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 l8_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 l8_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output,
 sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_return_output,
 MUX_uxn_opcodes_h_l552_c16_1ece_return_output,
 MUX_uxn_opcodes_h_l553_c16_f52a_return_output,
 device_out_uxn_opcodes_h_l554_c23_5445_return_output,
 BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_1a8f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l532_c3_5897 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l528_c3_c591_uxn_opcodes_h_l528_c3_c591_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_5904 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l538_c3_6776 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l546_c3_ba7f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l552_c16_1ece_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l552_c16_1ece_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l552_c16_1ece_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l552_c16_1ece_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l553_c16_f52a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l553_c16_f52a_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l553_c16_f52a_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l553_c16_f52a_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l554_c23_5445_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l554_c23_5445_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l554_c23_5445_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l554_c23_5445_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l554_c23_5445_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l554_c23_5445_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l554_c23_5445_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_c32_382e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l556_c31_b98c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l557_c26_ad23_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l558_c29_17cd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l559_c25_66e1_return_output : unsigned(23 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l560_c22_1e28_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l561_c21_d305_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l564_c4_68f0 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l567_c4_294a : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_b058_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_2fa4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_dc9a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_00c6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_c8f0_return_output : unsigned(23 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l537_l527_l541_l534_DUPLICATE_70a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_f8c0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_6741_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_abfc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l541_l534_l544_DUPLICATE_2424_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l541_l544_DUPLICATE_892d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l562_l563_DUPLICATE_7cac_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f727_uxn_opcodes_h_l521_l571_DUPLICATE_511c_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_1a8f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_1a8f;
     VAR_current_deo_phase_uxn_opcodes_h_l532_c3_5897 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l532_c3_5897;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_5904 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_5904;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_right := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l564_c4_68f0 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l564_c4_68f0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_y := resize(to_signed(-3, 3), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l546_c3_ba7f := resize(to_unsigned(0, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l546_c3_ba7f;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l538_c3_6776 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l538_c3_6776;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_right := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l554_c23_5445_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l552_c16_1ece_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l553_c16_f52a_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l553_c16_f52a_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l553_c16_f52a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l554_c23_5445_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l554_c23_5445_previous_ram_read := VAR_previous_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_left := t8;
     VAR_MUX_uxn_opcodes_h_l552_c16_1ece_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l541_l534_l544_DUPLICATE_2424 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l541_l534_l544_DUPLICATE_2424_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l552_c32_12b2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l548_c30_f68b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_ins;
     sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_x;
     sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_return_output := sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_6741 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_6741_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l537_l527_l541_l534_DUPLICATE_70a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l537_l527_l541_l534_DUPLICATE_70a1_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l534_c11_e568] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_left;
     BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output := BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_00c6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_00c6_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_abfc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_abfc_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l541_c11_2541] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_left;
     BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output := BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l527_c6_f93a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_left;
     BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output := BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;

     -- MUX[uxn_opcodes_h_l553_c16_f52a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l553_c16_f52a_cond <= VAR_MUX_uxn_opcodes_h_l553_c16_f52a_cond;
     MUX_uxn_opcodes_h_l553_c16_f52a_iftrue <= VAR_MUX_uxn_opcodes_h_l553_c16_f52a_iftrue;
     MUX_uxn_opcodes_h_l553_c16_f52a_iffalse <= VAR_MUX_uxn_opcodes_h_l553_c16_f52a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l553_c16_f52a_return_output := MUX_uxn_opcodes_h_l553_c16_f52a_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l541_l544_DUPLICATE_892d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l541_l544_DUPLICATE_892d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_2fa4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_2fa4_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_dc9a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_dc9a_return_output := result.is_vram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l567_c4_d114] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_left;
     BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_return_output := BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_return_output;

     -- CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_c8f0 LATENCY=0
     VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_c8f0_return_output := result.vram_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_f8c0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_f8c0_return_output := result.u8_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_b058 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_b058_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l544_c11_797f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_left;
     BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output := BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l537_c11_3322] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_left;
     BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output := BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c2_28e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_f93a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l534_c7_0106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l534_c11_e568_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l537_c11_3322_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l541_c11_2541_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l544_c11_797f_return_output;
     VAR_MUX_uxn_opcodes_h_l552_c16_1ece_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l552_c32_12b2_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l567_c4_294a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c4_d114_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_00c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_00c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_00c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_00c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_00c6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_abfc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_abfc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_abfc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_abfc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_abfc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_6741_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_6741_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_6741_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_6741_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_6741_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l541_l534_l544_DUPLICATE_2424_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l541_l534_l544_DUPLICATE_2424_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l541_l534_l544_DUPLICATE_2424_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l537_l541_l534_l544_DUPLICATE_2424_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l537_l527_l541_l534_DUPLICATE_70a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l537_l527_l541_l534_DUPLICATE_70a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l537_l527_l541_l534_DUPLICATE_70a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l537_l527_l541_l534_DUPLICATE_70a1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_dc9a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_dc9a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_dc9a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_dc9a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_dc9a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_2fa4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_2fa4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_2fa4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_2fa4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_2fa4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_c8f0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_c8f0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_c8f0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_c8f0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_c8f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l541_l544_DUPLICATE_892d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l541_l544_DUPLICATE_892d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_b058_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_b058_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_b058_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_b058_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_b058_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_f8c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_f8c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_f8c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_f8c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l541_l537_l534_l527_l544_DUPLICATE_f8c0_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_MUX_uxn_opcodes_h_l553_c16_f52a_return_output;
     VAR_device_out_uxn_opcodes_h_l554_c23_5445_value := VAR_MUX_uxn_opcodes_h_l553_c16_f52a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l548_c30_f68b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l567_c4_294a;
     -- MUX[uxn_opcodes_h_l552_c16_1ece] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l552_c16_1ece_cond <= VAR_MUX_uxn_opcodes_h_l552_c16_1ece_cond;
     MUX_uxn_opcodes_h_l552_c16_1ece_iftrue <= VAR_MUX_uxn_opcodes_h_l552_c16_1ece_iftrue;
     MUX_uxn_opcodes_h_l552_c16_1ece_iffalse <= VAR_MUX_uxn_opcodes_h_l552_c16_1ece_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l552_c16_1ece_return_output := MUX_uxn_opcodes_h_l552_c16_1ece_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- t8_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_t8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     t8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     t8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := t8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- n8_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_n8_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     n8_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     n8_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := n8_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l527_c1_44d2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- l8_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_l8_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     l8_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     l8_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := l8_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_MUX_uxn_opcodes_h_l552_c16_1ece_return_output;
     VAR_device_out_uxn_opcodes_h_l554_c23_5445_device_address := VAR_MUX_uxn_opcodes_h_l552_c16_1ece_return_output;
     VAR_printf_uxn_opcodes_h_l528_c3_c591_uxn_opcodes_h_l528_c3_c591_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c1_44d2_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_l8_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_t8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- printf_uxn_opcodes_h_l528_c3_c591[uxn_opcodes_h_l528_c3_c591] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l528_c3_c591_uxn_opcodes_h_l528_c3_c591_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l528_c3_c591_uxn_opcodes_h_l528_c3_c591_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     n8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     n8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := n8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- l8_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_l8_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     l8_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     l8_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := l8_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- t8_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_t8_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     t8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     t8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l534_c7_0106_return_output := t8_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_l8_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_n8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     -- t8_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_t8_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     t8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     t8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := t8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- n8_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_n8_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     n8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     n8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l534_c7_0106_return_output := n8_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- l8_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_l8_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     l8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     l8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := l8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_l8_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;
     -- n8_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_n8_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     n8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     n8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := n8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_return_output := deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- l8_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_l8_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     l8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     l8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l534_c7_0106_return_output := l8_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_l8_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_return_output := deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- l8_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_l8_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     l8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     l8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := l8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l550_c1_07dd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l554_c23_5445_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c1_07dd_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- device_out[uxn_opcodes_h_l554_c23_5445] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l554_c23_5445_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l554_c23_5445_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l554_c23_5445_device_address <= VAR_device_out_uxn_opcodes_h_l554_c23_5445_device_address;
     device_out_uxn_opcodes_h_l554_c23_5445_value <= VAR_device_out_uxn_opcodes_h_l554_c23_5445_value;
     device_out_uxn_opcodes_h_l554_c23_5445_phase <= VAR_device_out_uxn_opcodes_h_l554_c23_5445_phase;
     device_out_uxn_opcodes_h_l554_c23_5445_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l554_c23_5445_previous_device_ram_read;
     device_out_uxn_opcodes_h_l554_c23_5445_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l554_c23_5445_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l554_c23_5445_return_output := device_out_uxn_opcodes_h_l554_c23_5445_return_output;

     -- Submodule level 7
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_device_out_uxn_opcodes_h_l554_c23_5445_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l561_c21_d305] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l561_c21_d305_return_output := VAR_device_out_uxn_opcodes_h_l554_c23_5445_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l557_c26_ad23] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l557_c26_ad23_return_output := VAR_device_out_uxn_opcodes_h_l554_c23_5445_return_output.is_vram_write;

     -- device_out_result_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l555_c32_382e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_c32_382e_return_output := VAR_device_out_uxn_opcodes_h_l554_c23_5445_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d[uxn_opcodes_h_l560_c22_1e28] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l560_c22_1e28_return_output := VAR_device_out_uxn_opcodes_h_l554_c23_5445_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l562_l563_DUPLICATE_7cac LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l562_l563_DUPLICATE_7cac_return_output := VAR_device_out_uxn_opcodes_h_l554_c23_5445_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l558_c29_17cd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l558_c29_17cd_return_output := VAR_device_out_uxn_opcodes_h_l554_c23_5445_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l556_c31_b98c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l556_c31_b98c_return_output := VAR_device_out_uxn_opcodes_h_l554_c23_5445_return_output.device_ram_address;

     -- CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l559_c25_66e1] LATENCY=0
     VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l559_c25_66e1_return_output := VAR_device_out_uxn_opcodes_h_l554_c23_5445_return_output.vram_address;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l560_c22_1e28_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l562_l563_DUPLICATE_7cac_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l562_l563_DUPLICATE_7cac_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l562_l563_DUPLICATE_7cac_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_c32_382e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l557_c26_ad23_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l558_c29_17cd_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l559_c25_66e1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l556_c31_b98c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l561_c21_d305_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l562_c24_3751] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_left;
     BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_return_output := BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l563_c3_f6b0] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_cond;
     is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_return_output := is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l563_c3_f6b0] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_return_output := current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l562_c24_3751_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l563_c3_f6b0_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l563_c3_f6b0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l544_c7_ccdc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- Submodule level 10
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l544_c7_ccdc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l541_c7_30ce] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_return_output := current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_return_output := device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- Submodule level 11
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l541_c7_30ce_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_return_output := result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l537_c7_d1c5] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_cond;
     is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output := is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_return_output := result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_return_output := result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l537_c7_d1c5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_return_output := current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l534_c7_0106] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_cond;
     is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_return_output := is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l534_c7_0106_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l527_c2_28e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;

     -- Submodule level 14
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l527_c2_28e4_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f727_uxn_opcodes_h_l521_l571_DUPLICATE_511c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f727_uxn_opcodes_h_l521_l571_DUPLICATE_511c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f727(
     result,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_28e4_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c2_28e4_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f727_uxn_opcodes_h_l521_l571_DUPLICATE_511c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f727_uxn_opcodes_h_l521_l571_DUPLICATE_511c_return_output;
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
