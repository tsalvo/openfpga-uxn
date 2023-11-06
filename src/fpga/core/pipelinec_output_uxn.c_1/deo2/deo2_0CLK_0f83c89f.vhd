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
-- BIN_OP_EQ[uxn_opcodes_h_l533_c6_38f6]
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c1_c4a6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l533_c2_3467]
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l533_c2_3467]
signal n8_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l533_c2_3467]
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l533_c2_3467]
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l533_c2_3467]
signal result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l533_c2_3467]
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l533_c2_3467]
signal result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c2_3467]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l533_c2_3467]
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c2_3467]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l533_c2_3467]
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l533_c2_3467]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c2_3467]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l533_c2_3467]
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c2_3467]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(3 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l533_c2_3467]
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l533_c2_3467]
signal t8_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l533_c2_3467]
signal l8_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l533_c2_3467]
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l534_c3_bf1a[uxn_opcodes_h_l534_c3_bf1a]
signal printf_uxn_opcodes_h_l534_c3_bf1a_uxn_opcodes_h_l534_c3_bf1a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l540_c11_c742]
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l543_c7_d373]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal n8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(3 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal t8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal l8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l540_c7_0b2d]
signal deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l543_c11_4472]
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c7_f783]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l543_c7_d373]
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l543_c7_d373]
signal n8_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l543_c7_d373]
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l543_c7_d373]
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l543_c7_d373]
signal result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l543_c7_d373]
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l543_c7_d373]
signal result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l543_c7_d373]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l543_c7_d373]
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l543_c7_d373]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l543_c7_d373]
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l543_c7_d373]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l543_c7_d373]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l543_c7_d373]
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l543_c7_d373]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(3 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l543_c7_d373]
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l543_c7_d373]
signal t8_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l543_c7_d373]
signal l8_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l543_c7_d373]
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l547_c11_af7c]
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l550_c7_d97e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l547_c7_f783]
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l547_c7_f783]
signal n8_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l547_c7_f783]
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l547_c7_f783]
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l547_c7_f783]
signal result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l547_c7_f783]
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l547_c7_f783]
signal result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l547_c7_f783]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l547_c7_f783]
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l547_c7_f783]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l547_c7_f783]
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l547_c7_f783]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l547_c7_f783]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l547_c7_f783]
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l547_c7_f783]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(3 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l547_c7_f783]
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l547_c7_f783]
signal l8_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l547_c7_f783]
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l550_c11_e974]
signal BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l556_c1_c9e4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l550_c7_d97e]
signal is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l550_c7_d97e]
signal current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l550_c7_d97e]
signal deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l550_c7_d97e]
signal result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l550_c7_d97e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l550_c7_d97e]
signal result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l550_c7_d97e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l550_c7_d97e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l550_c7_d97e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l550_c7_d97e]
signal result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l550_c7_d97e]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l550_c7_d97e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l550_c7_d97e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l550_c7_d97e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(3 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l550_c7_d97e]
signal device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l550_c7_d97e]
signal l8_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l550_c7_d97e]
signal deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l554_c30_c570]
signal sp_relative_shift_uxn_opcodes_h_l554_c30_c570_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l554_c30_c570_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l554_c30_c570_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l554_c30_c570_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l558_c32_b9ec]
signal BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l558_c16_a7dc]
signal MUX_uxn_opcodes_h_l558_c16_a7dc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l558_c16_a7dc_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l558_c16_a7dc_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l558_c16_a7dc_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l559_c16_327d]
signal MUX_uxn_opcodes_h_l559_c16_327d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l559_c16_327d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l559_c16_327d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l559_c16_327d_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l560_c23_a7b8]
signal device_out_uxn_opcodes_h_l560_c23_a7b8_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_a7b8_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_a7b8_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_a7b8_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_a7b8_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_a7b8_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_a7b8_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l568_c24_62e9]
signal BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l569_c3_1dac]
signal is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l569_c3_1dac]
signal current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l573_c4_afda]
signal BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_3b39( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.vram_address := ref_toks_7;
      base.vram_write_layer := ref_toks_8;
      base.is_sp_shift := ref_toks_9;
      base.is_opc_done := ref_toks_10;
      base.stack_address_sp_offset := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6
BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_left,
BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_right,
BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467
is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_cond,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- n8_MUX_uxn_opcodes_h_l533_c2_3467
n8_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l533_c2_3467_cond,
n8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
n8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
n8_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_cond,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l533_c2_3467
deo_param1_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_cond,
deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467
result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_cond,
result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467
result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_cond,
result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467
result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_cond,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l533_c2_3467
device_out_result_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_cond,
device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- t8_MUX_uxn_opcodes_h_l533_c2_3467
t8_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l533_c2_3467_cond,
t8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
t8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
t8_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- l8_MUX_uxn_opcodes_h_l533_c2_3467
l8_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l533_c2_3467_cond,
l8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
l8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
l8_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l533_c2_3467
deo_param0_MUX_uxn_opcodes_h_l533_c2_3467 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_cond,
deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_iftrue,
deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_iffalse,
deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

-- printf_uxn_opcodes_h_l534_c3_bf1a_uxn_opcodes_h_l534_c3_bf1a
printf_uxn_opcodes_h_l534_c3_bf1a_uxn_opcodes_h_l534_c3_bf1a : entity work.printf_uxn_opcodes_h_l534_c3_bf1a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l534_c3_bf1a_uxn_opcodes_h_l534_c3_bf1a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742
BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_left,
BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_right,
BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d
is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- n8_MUX_uxn_opcodes_h_l540_c7_0b2d
n8_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
n8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
n8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
n8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d
current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d
deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d
result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d
result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d
result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d
device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- t8_MUX_uxn_opcodes_h_l540_c7_0b2d
t8_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
t8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
t8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
t8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- l8_MUX_uxn_opcodes_h_l540_c7_0b2d
l8_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
l8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
l8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
l8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d
deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_cond,
deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue,
deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse,
deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472
BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_left,
BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_right,
BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373
is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_cond,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- n8_MUX_uxn_opcodes_h_l543_c7_d373
n8_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l543_c7_d373_cond,
n8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
n8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
n8_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_cond,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l543_c7_d373
deo_param1_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_cond,
deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373
result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_cond,
result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373
result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_cond,
result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373
result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_cond,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373
result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l543_c7_d373
device_out_result_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_cond,
device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- t8_MUX_uxn_opcodes_h_l543_c7_d373
t8_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l543_c7_d373_cond,
t8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
t8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
t8_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- l8_MUX_uxn_opcodes_h_l543_c7_d373
l8_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l543_c7_d373_cond,
l8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
l8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
l8_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l543_c7_d373
deo_param0_MUX_uxn_opcodes_h_l543_c7_d373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_cond,
deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_iftrue,
deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_iffalse,
deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c
BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_left,
BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_right,
BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783
is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_cond,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- n8_MUX_uxn_opcodes_h_l547_c7_f783
n8_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l547_c7_f783_cond,
n8_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
n8_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
n8_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_cond,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l547_c7_f783
deo_param1_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_cond,
deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783
result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_cond,
result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783
result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_cond,
result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783
result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_cond,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783
result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l547_c7_f783
device_out_result_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_cond,
device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- l8_MUX_uxn_opcodes_h_l547_c7_f783
l8_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l547_c7_f783_cond,
l8_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
l8_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
l8_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l547_c7_f783
deo_param0_MUX_uxn_opcodes_h_l547_c7_f783 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_cond,
deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_iftrue,
deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_iffalse,
deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974
BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_left,
BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_right,
BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e
is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e
current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e
deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e
result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e
result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e
result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e
result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e
result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e
result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e
result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e
result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e
result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e
result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e
device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- l8_MUX_uxn_opcodes_h_l550_c7_d97e
l8_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
l8_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
l8_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
l8_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e
deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_cond,
deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue,
deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse,
deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l554_c30_c570
sp_relative_shift_uxn_opcodes_h_l554_c30_c570 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l554_c30_c570_ins,
sp_relative_shift_uxn_opcodes_h_l554_c30_c570_x,
sp_relative_shift_uxn_opcodes_h_l554_c30_c570_y,
sp_relative_shift_uxn_opcodes_h_l554_c30_c570_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec
BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_left,
BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_right,
BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_return_output);

-- MUX_uxn_opcodes_h_l558_c16_a7dc
MUX_uxn_opcodes_h_l558_c16_a7dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l558_c16_a7dc_cond,
MUX_uxn_opcodes_h_l558_c16_a7dc_iftrue,
MUX_uxn_opcodes_h_l558_c16_a7dc_iffalse,
MUX_uxn_opcodes_h_l558_c16_a7dc_return_output);

-- MUX_uxn_opcodes_h_l559_c16_327d
MUX_uxn_opcodes_h_l559_c16_327d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l559_c16_327d_cond,
MUX_uxn_opcodes_h_l559_c16_327d_iftrue,
MUX_uxn_opcodes_h_l559_c16_327d_iffalse,
MUX_uxn_opcodes_h_l559_c16_327d_return_output);

-- device_out_uxn_opcodes_h_l560_c23_a7b8
device_out_uxn_opcodes_h_l560_c23_a7b8 : entity work.device_out_0CLK_f5486376 port map (
clk,
device_out_uxn_opcodes_h_l560_c23_a7b8_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l560_c23_a7b8_device_address,
device_out_uxn_opcodes_h_l560_c23_a7b8_value,
device_out_uxn_opcodes_h_l560_c23_a7b8_phase,
device_out_uxn_opcodes_h_l560_c23_a7b8_previous_device_ram_read,
device_out_uxn_opcodes_h_l560_c23_a7b8_previous_ram_read,
device_out_uxn_opcodes_h_l560_c23_a7b8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9
BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_left,
BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_right,
BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac
is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_cond,
is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac
current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_cond,
current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda
BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_left,
BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_right,
BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 n8_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 t8_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 l8_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 n8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 t8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 l8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 n8_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 t8_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 l8_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 n8_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 l8_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 l8_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_return_output,
 sp_relative_shift_uxn_opcodes_h_l554_c30_c570_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_return_output,
 MUX_uxn_opcodes_h_l558_c16_a7dc_return_output,
 MUX_uxn_opcodes_h_l559_c16_327d_return_output,
 device_out_uxn_opcodes_h_l560_c23_a7b8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l538_c3_7ab5 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_d2ac : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l534_c3_bf1a_uxn_opcodes_h_l534_c3_bf1a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l541_c3_fc9f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l544_c3_01e6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l552_c3_dceb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_c570_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_c570_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_c570_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_c570_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l558_c16_a7dc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l558_c16_a7dc_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l558_c16_a7dc_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l558_c16_a7dc_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c16_327d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c16_327d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c16_327d_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c16_327d_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l561_c32_6dec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l562_c31_29e6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l563_c26_1b55_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l564_c29_bf48_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l565_c25_46c3_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l566_c22_ad69_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l567_c21_cc87_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l570_c4_b20c : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l573_c4_d072 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_4f9f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_de07_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_cdb0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_43f0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_6e85_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_00f0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_f4b4_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_1b6a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l547_l543_l540_l533_DUPLICATE_2344_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l550_l547_l543_l540_DUPLICATE_9263_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l550_l547_DUPLICATE_f784_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l568_l569_DUPLICATE_2598_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b39_uxn_opcodes_h_l577_l527_DUPLICATE_e723_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l552_c3_dceb := resize(to_unsigned(0, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l552_c3_dceb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_d2ac := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_d2ac;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_right := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l538_c3_7ab5 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l538_c3_7ab5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_c570_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_c570_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_right := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l570_c4_b20c := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l570_c4_b20c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l541_c3_fc9f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l541_c3_fc9f;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l544_c3_01e6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l544_c3_01e6;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_right := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_c570_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l558_c16_a7dc_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l559_c16_327d_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l559_c16_327d_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l559_c16_327d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_previous_ram_read := VAR_previous_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_left := t8;
     VAR_MUX_uxn_opcodes_h_l558_c16_a7dc_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l550_c11_e974] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_left;
     BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output := BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_1b6a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_1b6a_return_output := result.vram_write_layer;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_00f0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_00f0_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l547_l543_l540_l533_DUPLICATE_2344 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l547_l543_l540_l533_DUPLICATE_2344_return_output := result.is_sp_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l558_c32_b9ec] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_left;
     BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_return_output := BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l533_c6_38f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_cdb0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_cdb0_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_4f9f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_4f9f_return_output := result.u16_value;

     -- MUX[uxn_opcodes_h_l559_c16_327d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l559_c16_327d_cond <= VAR_MUX_uxn_opcodes_h_l559_c16_327d_cond;
     MUX_uxn_opcodes_h_l559_c16_327d_iftrue <= VAR_MUX_uxn_opcodes_h_l559_c16_327d_iftrue;
     MUX_uxn_opcodes_h_l559_c16_327d_iffalse <= VAR_MUX_uxn_opcodes_h_l559_c16_327d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l559_c16_327d_return_output := MUX_uxn_opcodes_h_l559_c16_327d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l550_l547_l543_l540_DUPLICATE_9263 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l550_l547_l543_l540_DUPLICATE_9263_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l573_c4_afda] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_left;
     BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_return_output := BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_de07 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_de07_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_6e85 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_6e85_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l550_l547_DUPLICATE_f784 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l550_l547_DUPLICATE_f784_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_43f0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_43f0_return_output := result.is_device_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l554_c30_c570] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l554_c30_c570_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_c570_ins;
     sp_relative_shift_uxn_opcodes_h_l554_c30_c570_x <= VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_c570_x;
     sp_relative_shift_uxn_opcodes_h_l554_c30_c570_y <= VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_c570_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_c570_return_output := sp_relative_shift_uxn_opcodes_h_l554_c30_c570_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l540_c11_c742] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_left;
     BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output := BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_f4b4 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_f4b4_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l547_c11_af7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l543_c11_4472] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_left;
     BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output := BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_38f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_c742_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_d373_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_4472_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_af7c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_e974_return_output;
     VAR_MUX_uxn_opcodes_h_l558_c16_a7dc_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_b9ec_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l573_c4_d072 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_afda_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_00f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_00f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_00f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_00f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_00f0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_4f9f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_4f9f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_4f9f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_4f9f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_4f9f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_43f0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_43f0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_43f0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_43f0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_43f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l550_l547_l543_l540_DUPLICATE_9263_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l550_l547_l543_l540_DUPLICATE_9263_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l550_l547_l543_l540_DUPLICATE_9263_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l550_l547_l543_l540_DUPLICATE_9263_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l547_l543_l540_l533_DUPLICATE_2344_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l547_l543_l540_l533_DUPLICATE_2344_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l547_l543_l540_l533_DUPLICATE_2344_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l547_l543_l540_l533_DUPLICATE_2344_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_de07_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_de07_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_de07_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_de07_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_de07_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_1b6a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_1b6a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_1b6a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_1b6a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_1b6a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_f4b4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_f4b4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_f4b4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_f4b4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_f4b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l550_l547_DUPLICATE_f784_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l550_l547_DUPLICATE_f784_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_6e85_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_6e85_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_6e85_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_6e85_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_6e85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_cdb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_cdb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_cdb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_cdb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l543_l533_l547_l540_DUPLICATE_cdb0_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_MUX_uxn_opcodes_h_l559_c16_327d_return_output;
     VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_value := VAR_MUX_uxn_opcodes_h_l559_c16_327d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_c570_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l573_c4_d072;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- n8_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     n8_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     n8_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_f783_return_output := n8_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- MUX[uxn_opcodes_h_l558_c16_a7dc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l558_c16_a7dc_cond <= VAR_MUX_uxn_opcodes_h_l558_c16_a7dc_cond;
     MUX_uxn_opcodes_h_l558_c16_a7dc_iftrue <= VAR_MUX_uxn_opcodes_h_l558_c16_a7dc_iftrue;
     MUX_uxn_opcodes_h_l558_c16_a7dc_iffalse <= VAR_MUX_uxn_opcodes_h_l558_c16_a7dc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l558_c16_a7dc_return_output := MUX_uxn_opcodes_h_l558_c16_a7dc_return_output;

     -- l8_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_l8_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     l8_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     l8_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := l8_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- t8_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     t8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     t8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_d373_return_output := t8_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c1_c4a6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_MUX_uxn_opcodes_h_l558_c16_a7dc_return_output;
     VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_device_address := VAR_MUX_uxn_opcodes_h_l558_c16_a7dc_return_output;
     VAR_printf_uxn_opcodes_h_l534_c3_bf1a_uxn_opcodes_h_l534_c3_bf1a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_c4a6_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_l8_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_n8_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     -- t8_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_t8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     t8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     t8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := t8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- printf_uxn_opcodes_h_l534_c3_bf1a[uxn_opcodes_h_l534_c3_bf1a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l534_c3_bf1a_uxn_opcodes_h_l534_c3_bf1a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l534_c3_bf1a_uxn_opcodes_h_l534_c3_bf1a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     n8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     n8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_d373_return_output := n8_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- l8_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     l8_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     l8_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_f783_return_output := l8_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_return_output := deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_l8_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_t8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     -- n8_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     n8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     n8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := n8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_return_output := deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_return_output := deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- l8_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     l8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     l8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_d373_return_output := l8_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- t8_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     t8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     t8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_3467_return_output := t8_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_l8_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_n8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l533_c2_3467_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_return_output := deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- n8_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     n8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     n8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_3467_return_output := n8_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- l8_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_l8_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     l8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     l8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := l8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_l8_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l533_c2_3467_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     -- l8_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     l8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     l8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_3467_return_output := l8_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l556_c1_c9e4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_return_output := deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c9e4_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_3467_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l533_c2_3467_return_output;
     -- device_out[uxn_opcodes_h_l560_c23_a7b8] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l560_c23_a7b8_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l560_c23_a7b8_device_address <= VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_device_address;
     device_out_uxn_opcodes_h_l560_c23_a7b8_value <= VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_value;
     device_out_uxn_opcodes_h_l560_c23_a7b8_phase <= VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_phase;
     device_out_uxn_opcodes_h_l560_c23_a7b8_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_previous_device_ram_read;
     device_out_uxn_opcodes_h_l560_c23_a7b8_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_return_output := device_out_uxn_opcodes_h_l560_c23_a7b8_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_return_output := deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- Submodule level 7
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_3467_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l561_c32_6dec] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l561_c32_6dec_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_return_output.is_device_ram_write;

     -- device_out_result_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d[uxn_opcodes_h_l566_c22_ad69] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l566_c22_ad69_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l563_c26_1b55] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l563_c26_1b55_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l567_c21_cc87] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l567_c21_cc87_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_return_output.u8_value;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l562_c31_29e6] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l562_c31_29e6_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_return_output.device_ram_address;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l565_c25_46c3] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l565_c25_46c3_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l568_l569_DUPLICATE_2598 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l568_l569_DUPLICATE_2598_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l564_c29_bf48] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l564_c29_bf48_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_a7b8_return_output.vram_write_layer;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l566_c22_ad69_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l568_l569_DUPLICATE_2598_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l568_l569_DUPLICATE_2598_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l568_l569_DUPLICATE_2598_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l561_c32_6dec_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l563_c26_1b55_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l564_c29_bf48_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l565_c25_46c3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l562_c31_29e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l567_c21_cc87_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     -- BIN_OP_AND[uxn_opcodes_h_l568_c24_62e9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_left;
     BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_return_output := BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l569_c3_1dac] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_return_output := current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_return_output := device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l569_c3_1dac] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_cond;
     is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_return_output := is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_62e9_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_1dac_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_1dac_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_return_output := result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_return_output := device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_return_output := result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_return_output := result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l550_c7_d97e] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_cond;
     is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_return_output := is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- Submodule level 10
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_d97e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_return_output := result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_return_output := current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_return_output := is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_return_output := result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_return_output := result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l547_c7_f783] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_return_output;

     -- Submodule level 11
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_f783_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_return_output := device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_return_output := current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l543_c7_d373] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_cond;
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_return_output := is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_3467_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d373_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_return_output := result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_return_output := result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l540_c7_0b2d] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_cond;
     is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output := is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_return_output := result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_0b2d_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_return_output := current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l533_c2_3467] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_cond;
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_return_output := is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_return_output;

     -- Submodule level 14
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_3467_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_3467_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3b39_uxn_opcodes_h_l577_l527_DUPLICATE_e723 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b39_uxn_opcodes_h_l577_l527_DUPLICATE_e723_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3b39(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_3467_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_3467_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b39_uxn_opcodes_h_l577_l527_DUPLICATE_e723_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b39_uxn_opcodes_h_l577_l527_DUPLICATE_e723_return_output;
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
