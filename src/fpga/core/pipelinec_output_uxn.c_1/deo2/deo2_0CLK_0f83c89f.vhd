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
-- BIN_OP_EQ[uxn_opcodes_h_l533_c6_5d22]
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c1_90f6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l533_c2_2689]
signal l8_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l533_c2_2689]
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l533_c2_2689]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c2_2689]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l533_c2_2689]
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l533_c2_2689]
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c2_2689]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c2_2689]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l533_c2_2689]
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l533_c2_2689]
signal result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c2_2689]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l533_c2_2689]
signal result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l533_c2_2689]
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l533_c2_2689]
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l533_c2_2689]
signal t8_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l533_c2_2689]
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l533_c2_2689]
signal n8_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l533_c2_2689]
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l533_c2_2689]
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l534_c3_3e44[uxn_opcodes_h_l534_c3_3e44]
signal printf_uxn_opcodes_h_l534_c3_3e44_uxn_opcodes_h_l534_c3_3e44_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l540_c11_b9f7]
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal l8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal t8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal n8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l540_c7_c8cd]
signal deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l543_c11_72b3]
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c7_c19f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal l8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal t8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal n8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l543_c7_d1e4]
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l547_c11_2ed3]
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l550_c7_54c0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l547_c7_c19f]
signal l8_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l547_c7_c19f]
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l547_c7_c19f]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l547_c7_c19f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l547_c7_c19f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l547_c7_c19f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l547_c7_c19f]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l547_c7_c19f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l547_c7_c19f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l547_c7_c19f]
signal result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l547_c7_c19f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l547_c7_c19f]
signal result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l547_c7_c19f]
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l547_c7_c19f]
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l547_c7_c19f]
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l547_c7_c19f]
signal n8_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l547_c7_c19f]
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l547_c7_c19f]
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l550_c11_4787]
signal BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l556_c1_48f6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l550_c7_54c0]
signal l8_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l550_c7_54c0]
signal result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l550_c7_54c0]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l550_c7_54c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l550_c7_54c0]
signal result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l550_c7_54c0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l550_c7_54c0]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l550_c7_54c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l550_c7_54c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l550_c7_54c0]
signal result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l550_c7_54c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l550_c7_54c0]
signal result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l550_c7_54c0]
signal device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l550_c7_54c0]
signal current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l550_c7_54c0]
signal deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l550_c7_54c0]
signal is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l550_c7_54c0]
signal deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l554_c30_581f]
signal sp_relative_shift_uxn_opcodes_h_l554_c30_581f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l554_c30_581f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l554_c30_581f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l554_c30_581f_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l558_c32_c0b4]
signal BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l558_c16_a2e5]
signal MUX_uxn_opcodes_h_l558_c16_a2e5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l558_c16_a2e5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l558_c16_a2e5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l558_c16_a2e5_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l559_c16_c8d6]
signal MUX_uxn_opcodes_h_l559_c16_c8d6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l559_c16_c8d6_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l559_c16_c8d6_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l559_c16_c8d6_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l560_c23_4cd8]
signal device_out_uxn_opcodes_h_l560_c23_4cd8_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_4cd8_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_4cd8_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_4cd8_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_4cd8_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_4cd8_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_4cd8_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l568_c24_9943]
signal BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l569_c3_6971]
signal current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l569_c3_6971]
signal is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l573_c4_7e02]
signal BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_55e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.vram_address := ref_toks_1;
      base.vram_write_layer := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.u16_value := ref_toks_9;
      base.is_sp_shift := ref_toks_10;
      base.u8_value := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22
BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_left,
BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_right,
BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- l8_MUX_uxn_opcodes_h_l533_c2_2689
l8_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l533_c2_2689_cond,
l8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
l8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
l8_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689
result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_cond,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689
result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_cond,
result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689
result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_cond,
result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l533_c2_2689
device_out_result_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_cond,
device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_cond,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- t8_MUX_uxn_opcodes_h_l533_c2_2689
t8_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l533_c2_2689_cond,
t8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
t8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
t8_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l533_c2_2689
deo_param0_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_cond,
deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- n8_MUX_uxn_opcodes_h_l533_c2_2689
n8_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l533_c2_2689_cond,
n8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
n8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
n8_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689
is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_cond,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l533_c2_2689
deo_param1_MUX_uxn_opcodes_h_l533_c2_2689 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_cond,
deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_iftrue,
deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_iffalse,
deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

-- printf_uxn_opcodes_h_l534_c3_3e44_uxn_opcodes_h_l534_c3_3e44
printf_uxn_opcodes_h_l534_c3_3e44_uxn_opcodes_h_l534_c3_3e44 : entity work.printf_uxn_opcodes_h_l534_c3_3e44_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l534_c3_3e44_uxn_opcodes_h_l534_c3_3e44_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7
BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_left,
BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_right,
BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- l8_MUX_uxn_opcodes_h_l540_c7_c8cd
l8_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
l8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
l8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
l8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd
result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd
result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd
result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd
device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd
current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- t8_MUX_uxn_opcodes_h_l540_c7_c8cd
t8_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
t8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
t8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
t8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd
deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- n8_MUX_uxn_opcodes_h_l540_c7_c8cd
n8_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
n8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
n8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
n8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd
is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd
deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_cond,
deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue,
deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse,
deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3
BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_left,
BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_right,
BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- l8_MUX_uxn_opcodes_h_l543_c7_d1e4
l8_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
l8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
l8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
l8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4
result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4
result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4
result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4
result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4
device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- t8_MUX_uxn_opcodes_h_l543_c7_d1e4
t8_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
t8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
t8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
t8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4
deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- n8_MUX_uxn_opcodes_h_l543_c7_d1e4
n8_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
n8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
n8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
n8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4
is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4
deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_cond,
deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue,
deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse,
deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3
BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_left,
BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_right,
BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- l8_MUX_uxn_opcodes_h_l547_c7_c19f
l8_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
l8_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
l8_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
l8_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f
result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f
result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f
result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f
result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f
device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f
deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- n8_MUX_uxn_opcodes_h_l547_c7_c19f
n8_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
n8_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
n8_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
n8_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f
is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f
deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_cond,
deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue,
deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse,
deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787
BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_left,
BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_right,
BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_return_output);

-- l8_MUX_uxn_opcodes_h_l550_c7_54c0
l8_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
l8_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
l8_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
l8_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0
result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0
result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0
result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0
result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0
result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0
result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0
result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0
result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0
result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0
device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0
current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0
deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0
is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0
deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_cond,
deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue,
deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse,
deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l554_c30_581f
sp_relative_shift_uxn_opcodes_h_l554_c30_581f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l554_c30_581f_ins,
sp_relative_shift_uxn_opcodes_h_l554_c30_581f_x,
sp_relative_shift_uxn_opcodes_h_l554_c30_581f_y,
sp_relative_shift_uxn_opcodes_h_l554_c30_581f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4
BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_left,
BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_right,
BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_return_output);

-- MUX_uxn_opcodes_h_l558_c16_a2e5
MUX_uxn_opcodes_h_l558_c16_a2e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l558_c16_a2e5_cond,
MUX_uxn_opcodes_h_l558_c16_a2e5_iftrue,
MUX_uxn_opcodes_h_l558_c16_a2e5_iffalse,
MUX_uxn_opcodes_h_l558_c16_a2e5_return_output);

-- MUX_uxn_opcodes_h_l559_c16_c8d6
MUX_uxn_opcodes_h_l559_c16_c8d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l559_c16_c8d6_cond,
MUX_uxn_opcodes_h_l559_c16_c8d6_iftrue,
MUX_uxn_opcodes_h_l559_c16_c8d6_iffalse,
MUX_uxn_opcodes_h_l559_c16_c8d6_return_output);

-- device_out_uxn_opcodes_h_l560_c23_4cd8
device_out_uxn_opcodes_h_l560_c23_4cd8 : entity work.device_out_0CLK_f5486376 port map (
clk,
device_out_uxn_opcodes_h_l560_c23_4cd8_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l560_c23_4cd8_device_address,
device_out_uxn_opcodes_h_l560_c23_4cd8_value,
device_out_uxn_opcodes_h_l560_c23_4cd8_phase,
device_out_uxn_opcodes_h_l560_c23_4cd8_previous_device_ram_read,
device_out_uxn_opcodes_h_l560_c23_4cd8_previous_ram_read,
device_out_uxn_opcodes_h_l560_c23_4cd8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l568_c24_9943
BIN_OP_AND_uxn_opcodes_h_l568_c24_9943 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_left,
BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_right,
BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971
current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_cond,
current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971
is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_cond,
is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02
BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_left,
BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_right,
BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 l8_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 t8_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 n8_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 l8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 t8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 n8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 l8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 t8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 n8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 l8_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 n8_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_return_output,
 l8_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_return_output,
 sp_relative_shift_uxn_opcodes_h_l554_c30_581f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_return_output,
 MUX_uxn_opcodes_h_l558_c16_a2e5_return_output,
 MUX_uxn_opcodes_h_l559_c16_c8d6_return_output,
 device_out_uxn_opcodes_h_l560_c23_4cd8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_3e91 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l538_c3_2fc0 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l534_c3_3e44_uxn_opcodes_h_l534_c3_3e44_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l541_c3_2dcf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l544_c3_1122 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l552_c3_0d19 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_581f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_581f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_581f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_581f_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l558_c16_a2e5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l558_c16_a2e5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l558_c16_a2e5_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l558_c16_a2e5_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c16_c8d6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c16_c8d6_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c16_c8d6_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c16_c8d6_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l561_c32_9ccd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l562_c31_ed7b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l563_c26_678f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l564_c29_52bd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l565_c25_035a_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l566_c22_c5c8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l567_c21_deba_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l570_c4_050b : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l573_c4_e936 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b418_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_3dd7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_169f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_49d4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_a9e7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b028_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_4cb3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l540_l543_l533_l547_DUPLICATE_a06e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_1ccd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l540_l550_l543_l547_DUPLICATE_a63b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l550_l547_DUPLICATE_2b2f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l568_l569_DUPLICATE_3cc6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_55e5_uxn_opcodes_h_l527_l577_DUPLICATE_6087_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_581f_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_right := to_unsigned(3, 2);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l552_c3_0d19 := resize(to_unsigned(0, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l552_c3_0d19;
     VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_581f_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_3e91 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_3e91;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_right := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l570_c4_050b := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l570_c4_050b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l541_c3_2dcf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l541_c3_2dcf;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l538_c3_2fc0 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l538_c3_2fc0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l544_c3_1122 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l544_c3_1122;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_581f_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l558_c16_a2e5_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l559_c16_c8d6_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l559_c16_c8d6_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l559_c16_c8d6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_previous_ram_read := VAR_previous_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_left := t8;
     VAR_MUX_uxn_opcodes_h_l558_c16_a2e5_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l554_c30_581f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l554_c30_581f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_581f_ins;
     sp_relative_shift_uxn_opcodes_h_l554_c30_581f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_581f_x;
     sp_relative_shift_uxn_opcodes_h_l554_c30_581f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_581f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_581f_return_output := sp_relative_shift_uxn_opcodes_h_l554_c30_581f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_1ccd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_1ccd_return_output := result.u8_value;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b418 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b418_return_output := result.vram_address;

     -- BIN_OP_PLUS[uxn_opcodes_h_l558_c32_c0b4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_4cb3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_4cb3_return_output := result.u16_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l573_c4_7e02] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_left;
     BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_return_output := BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_49d4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_49d4_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b028 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b028_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l540_c11_b9f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l547_c11_2ed3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_left;
     BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output := BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_3dd7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_3dd7_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l540_l543_l533_l547_DUPLICATE_a06e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l540_l543_l533_l547_DUPLICATE_a06e_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l550_l547_DUPLICATE_2b2f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l550_l547_DUPLICATE_2b2f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l540_l550_l543_l547_DUPLICATE_a63b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l540_l550_l543_l547_DUPLICATE_a63b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l550_c11_4787] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_left;
     BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output := BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_a9e7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_a9e7_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l533_c6_5d22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_left;
     BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output := BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;

     -- MUX[uxn_opcodes_h_l559_c16_c8d6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l559_c16_c8d6_cond <= VAR_MUX_uxn_opcodes_h_l559_c16_c8d6_cond;
     MUX_uxn_opcodes_h_l559_c16_c8d6_iftrue <= VAR_MUX_uxn_opcodes_h_l559_c16_c8d6_iftrue;
     MUX_uxn_opcodes_h_l559_c16_c8d6_iffalse <= VAR_MUX_uxn_opcodes_h_l559_c16_c8d6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l559_c16_c8d6_return_output := MUX_uxn_opcodes_h_l559_c16_c8d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l543_c11_72b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_169f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_169f_return_output := result.device_ram_address;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_2689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_5d22_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_b9f7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_72b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_2ed3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_4787_return_output;
     VAR_MUX_uxn_opcodes_h_l558_c16_a2e5_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_c0b4_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l573_c4_e936 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_7e02_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b028_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b028_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b028_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b028_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b028_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_4cb3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_4cb3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_4cb3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_4cb3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_4cb3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_a9e7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_a9e7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_a9e7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_a9e7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_a9e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l540_l550_l543_l547_DUPLICATE_a63b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l540_l550_l543_l547_DUPLICATE_a63b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l540_l550_l543_l547_DUPLICATE_a63b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l540_l550_l543_l547_DUPLICATE_a63b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l540_l543_l533_l547_DUPLICATE_a06e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l540_l543_l533_l547_DUPLICATE_a06e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l540_l543_l533_l547_DUPLICATE_a06e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l540_l543_l533_l547_DUPLICATE_a06e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_49d4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_49d4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_49d4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_49d4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_49d4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_3dd7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_3dd7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_3dd7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_3dd7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_3dd7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b418_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b418_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b418_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b418_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_b418_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l550_l547_DUPLICATE_2b2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l550_l547_DUPLICATE_2b2f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_169f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_169f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_169f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_169f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_169f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_1ccd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_1ccd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_1ccd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_1ccd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l540_l533_l550_l547_l543_DUPLICATE_1ccd_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_MUX_uxn_opcodes_h_l559_c16_c8d6_return_output;
     VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_value := VAR_MUX_uxn_opcodes_h_l559_c16_c8d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_581f_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l573_c4_e936;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c1_90f6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_return_output;

     -- l8_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_l8_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     l8_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     l8_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := l8_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- MUX[uxn_opcodes_h_l558_c16_a2e5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l558_c16_a2e5_cond <= VAR_MUX_uxn_opcodes_h_l558_c16_a2e5_cond;
     MUX_uxn_opcodes_h_l558_c16_a2e5_iftrue <= VAR_MUX_uxn_opcodes_h_l558_c16_a2e5_iftrue;
     MUX_uxn_opcodes_h_l558_c16_a2e5_iffalse <= VAR_MUX_uxn_opcodes_h_l558_c16_a2e5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l558_c16_a2e5_return_output := MUX_uxn_opcodes_h_l558_c16_a2e5_return_output;

     -- t8_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     t8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     t8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := t8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- n8_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     n8_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     n8_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := n8_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_MUX_uxn_opcodes_h_l558_c16_a2e5_return_output;
     VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_device_address := VAR_MUX_uxn_opcodes_h_l558_c16_a2e5_return_output;
     VAR_printf_uxn_opcodes_h_l534_c3_3e44_uxn_opcodes_h_l534_c3_3e44_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_90f6_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_l8_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- n8_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     n8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     n8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := n8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- t8_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_t8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     t8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     t8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := t8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- printf_uxn_opcodes_h_l534_c3_3e44[uxn_opcodes_h_l534_c3_3e44] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l534_c3_3e44_uxn_opcodes_h_l534_c3_3e44_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l534_c3_3e44_uxn_opcodes_h_l534_c3_3e44_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- l8_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     l8_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     l8_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := l8_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_l8_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_t8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     -- t8_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     t8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     t8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_2689_return_output := t8_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- l8_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     l8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     l8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := l8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- n8_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     n8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     n8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := n8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_l8_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_n8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l533_c2_2689_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- n8_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     n8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     n8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_2689_return_output := n8_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- l8_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_l8_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     l8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     l8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := l8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_l8_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l533_c2_2689_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     -- l8_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     l8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     l8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_2689_return_output := l8_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l556_c1_48f6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_return_output := deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_48f6_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_2689_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l533_c2_2689_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_return_output := deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- device_out[uxn_opcodes_h_l560_c23_4cd8] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l560_c23_4cd8_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l560_c23_4cd8_device_address <= VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_device_address;
     device_out_uxn_opcodes_h_l560_c23_4cd8_value <= VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_value;
     device_out_uxn_opcodes_h_l560_c23_4cd8_phase <= VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_phase;
     device_out_uxn_opcodes_h_l560_c23_4cd8_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_previous_device_ram_read;
     device_out_uxn_opcodes_h_l560_c23_4cd8_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_return_output := device_out_uxn_opcodes_h_l560_c23_4cd8_return_output;

     -- Submodule level 7
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_2689_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_return_output;
     -- CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d[uxn_opcodes_h_l566_c22_c5c8] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l566_c22_c5c8_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_return_output.ram_address;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l565_c25_035a] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l565_c25_035a_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l562_c31_ed7b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l562_c31_ed7b_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l568_l569_DUPLICATE_3cc6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l568_l569_DUPLICATE_3cc6_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_return_output.is_deo_done;

     -- device_out_result_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l564_c29_52bd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l564_c29_52bd_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l561_c32_9ccd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l561_c32_9ccd_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l567_c21_deba] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l567_c21_deba_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l563_c26_678f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l563_c26_678f_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_4cd8_return_output.is_vram_write;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l566_c22_c5c8_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l568_l569_DUPLICATE_3cc6_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l568_l569_DUPLICATE_3cc6_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l568_l569_DUPLICATE_3cc6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l561_c32_9ccd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l563_c26_678f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l564_c29_52bd_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l565_c25_035a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l562_c31_ed7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l567_c21_deba_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l569_c3_6971] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_cond;
     is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_return_output := is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l568_c24_9943] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_left;
     BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_return_output := BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l569_c3_6971] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_return_output := current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_9943_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_6971_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_6971_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l550_c7_54c0] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_return_output := current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- Submodule level 10
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_54c0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l547_c7_c19f] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_return_output := current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- Submodule level 11
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_c19f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_return_output := device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l543_c7_d1e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_2689_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_d1e4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_return_output := result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_return_output := result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_return_output := result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l540_c7_c8cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_c8cd_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_return_output := is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_return_output := current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l533_c2_2689] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_return_output;

     -- Submodule level 14
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_2689_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_2689_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_55e5_uxn_opcodes_h_l527_l577_DUPLICATE_6087 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_55e5_uxn_opcodes_h_l527_l577_DUPLICATE_6087_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_55e5(
     result,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_2689_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_2689_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_55e5_uxn_opcodes_h_l527_l577_DUPLICATE_6087_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_55e5_uxn_opcodes_h_l527_l577_DUPLICATE_6087_return_output;
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
