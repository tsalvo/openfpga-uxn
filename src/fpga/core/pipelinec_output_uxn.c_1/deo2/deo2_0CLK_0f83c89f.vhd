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
-- BIN_OP_EQ[uxn_opcodes_h_l533_c6_63fd]
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c1_1166]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l540_c7_d67a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l533_c2_0045]
signal t8_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l533_c2_0045]
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l533_c2_0045]
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l533_c2_0045]
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l533_c2_0045]
signal n8_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l533_c2_0045]
signal l8_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l533_c2_0045]
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c2_0045]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l533_c2_0045]
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l533_c2_0045]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l533_c2_0045]
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l533_c2_0045]
signal result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c2_0045]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c2_0045]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l533_c2_0045]
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l533_c2_0045]
signal result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l533_c2_0045]
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c2_0045]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_return_output : signed(3 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l533_c2_0045]
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l534_c3_573b[uxn_opcodes_h_l534_c3_573b]
signal printf_uxn_opcodes_h_l534_c3_573b_uxn_opcodes_h_l534_c3_573b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l540_c11_58bd]
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l540_c7_d67a]
signal t8_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l540_c7_d67a]
signal deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l540_c7_d67a]
signal is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l540_c7_d67a]
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l540_c7_d67a]
signal n8_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l540_c7_d67a]
signal l8_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l540_c7_d67a]
signal deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l540_c7_d67a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l540_c7_d67a]
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l540_c7_d67a]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l540_c7_d67a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l540_c7_d67a]
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l540_c7_d67a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l540_c7_d67a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l540_c7_d67a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l540_c7_d67a]
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l540_c7_d67a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l540_c7_d67a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : signed(3 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l540_c7_d67a]
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l543_c11_26d4]
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c7_75d5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal t8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal n8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal l8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : signed(3 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l543_c7_c8f5]
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l547_c11_0866]
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l550_c7_afd9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l547_c7_75d5]
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l547_c7_75d5]
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l547_c7_75d5]
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l547_c7_75d5]
signal n8_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l547_c7_75d5]
signal l8_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l547_c7_75d5]
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l547_c7_75d5]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l547_c7_75d5]
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l547_c7_75d5]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l547_c7_75d5]
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l547_c7_75d5]
signal result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l547_c7_75d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l547_c7_75d5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l547_c7_75d5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l547_c7_75d5]
signal result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l547_c7_75d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l547_c7_75d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : signed(3 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l547_c7_75d5]
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l550_c11_422c]
signal BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l556_c1_c363]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l550_c7_afd9]
signal deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l550_c7_afd9]
signal is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l550_c7_afd9]
signal device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l550_c7_afd9]
signal l8_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l550_c7_afd9]
signal deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l550_c7_afd9]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l550_c7_afd9]
signal result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l550_c7_afd9]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l550_c7_afd9]
signal result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l550_c7_afd9]
signal result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l550_c7_afd9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l550_c7_afd9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l550_c7_afd9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l550_c7_afd9]
signal result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l550_c7_afd9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l550_c7_afd9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : signed(3 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l550_c7_afd9]
signal current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l554_c30_8566]
signal sp_relative_shift_uxn_opcodes_h_l554_c30_8566_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l554_c30_8566_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l554_c30_8566_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l554_c30_8566_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l558_c32_d969]
signal BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l558_c16_0cdd]
signal MUX_uxn_opcodes_h_l558_c16_0cdd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l558_c16_0cdd_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l558_c16_0cdd_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l558_c16_0cdd_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l559_c16_e659]
signal MUX_uxn_opcodes_h_l559_c16_e659_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l559_c16_e659_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l559_c16_e659_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l559_c16_e659_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l560_c23_b3eb]
signal device_out_uxn_opcodes_h_l560_c23_b3eb_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_b3eb_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_b3eb_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_b3eb_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_b3eb_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_b3eb_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l560_c23_b3eb_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l568_c24_5cff]
signal BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l569_c3_31f0]
signal is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l569_c3_31f0]
signal current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l573_c4_5c56]
signal BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ac3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.vram_address := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_sp_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.u8_value := ref_toks_9;
      base.is_opc_done := ref_toks_10;
      base.sp_relative_shift := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd
BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_left,
BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_right,
BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- t8_MUX_uxn_opcodes_h_l533_c2_0045
t8_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l533_c2_0045_cond,
t8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
t8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
t8_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l533_c2_0045
deo_param0_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_cond,
deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045
is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_cond,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l533_c2_0045
device_out_result_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_cond,
device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- n8_MUX_uxn_opcodes_h_l533_c2_0045
n8_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l533_c2_0045_cond,
n8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
n8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
n8_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- l8_MUX_uxn_opcodes_h_l533_c2_0045
l8_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l533_c2_0045_cond,
l8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
l8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
l8_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l533_c2_0045
deo_param1_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_cond,
deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045
result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_cond,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045
result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_cond,
result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045
result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_cond,
result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_cond,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

-- printf_uxn_opcodes_h_l534_c3_573b_uxn_opcodes_h_l534_c3_573b
printf_uxn_opcodes_h_l534_c3_573b_uxn_opcodes_h_l534_c3_573b : entity work.printf_uxn_opcodes_h_l534_c3_573b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l534_c3_573b_uxn_opcodes_h_l534_c3_573b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd
BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_left,
BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_right,
BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- t8_MUX_uxn_opcodes_h_l540_c7_d67a
t8_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
t8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
t8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
t8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a
deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a
is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a
device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- n8_MUX_uxn_opcodes_h_l540_c7_d67a
n8_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
n8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
n8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
n8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- l8_MUX_uxn_opcodes_h_l540_c7_d67a
l8_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
l8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
l8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
l8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a
deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a
result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a
result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a
result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a
current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_cond,
current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4
BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_left,
BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_right,
BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- t8_MUX_uxn_opcodes_h_l543_c7_c8f5
t8_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
t8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
t8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
t8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5
deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5
is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5
device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- n8_MUX_uxn_opcodes_h_l543_c7_c8f5
n8_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
n8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
n8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
n8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- l8_MUX_uxn_opcodes_h_l543_c7_c8f5
l8_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
l8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
l8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
l8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5
deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5
result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5
result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5
result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5
result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_cond,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866
BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_left,
BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_right,
BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5
deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5
is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5
device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- n8_MUX_uxn_opcodes_h_l547_c7_75d5
n8_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
n8_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
n8_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
n8_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- l8_MUX_uxn_opcodes_h_l547_c7_75d5
l8_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
l8_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
l8_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
l8_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5
deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5
result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5
result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5
result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5
result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_cond,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c
BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_left,
BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_right,
BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9
deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9
is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9
device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- l8_MUX_uxn_opcodes_h_l550_c7_afd9
l8_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
l8_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
l8_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
l8_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9
deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9
result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9
result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9
result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9
result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9
result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9
result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9
result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9
result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9
result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9
result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9
current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_cond,
current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l554_c30_8566
sp_relative_shift_uxn_opcodes_h_l554_c30_8566 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l554_c30_8566_ins,
sp_relative_shift_uxn_opcodes_h_l554_c30_8566_x,
sp_relative_shift_uxn_opcodes_h_l554_c30_8566_y,
sp_relative_shift_uxn_opcodes_h_l554_c30_8566_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969
BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_left,
BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_right,
BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_return_output);

-- MUX_uxn_opcodes_h_l558_c16_0cdd
MUX_uxn_opcodes_h_l558_c16_0cdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l558_c16_0cdd_cond,
MUX_uxn_opcodes_h_l558_c16_0cdd_iftrue,
MUX_uxn_opcodes_h_l558_c16_0cdd_iffalse,
MUX_uxn_opcodes_h_l558_c16_0cdd_return_output);

-- MUX_uxn_opcodes_h_l559_c16_e659
MUX_uxn_opcodes_h_l559_c16_e659 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l559_c16_e659_cond,
MUX_uxn_opcodes_h_l559_c16_e659_iftrue,
MUX_uxn_opcodes_h_l559_c16_e659_iffalse,
MUX_uxn_opcodes_h_l559_c16_e659_return_output);

-- device_out_uxn_opcodes_h_l560_c23_b3eb
device_out_uxn_opcodes_h_l560_c23_b3eb : entity work.device_out_0CLK_f5486376 port map (
clk,
device_out_uxn_opcodes_h_l560_c23_b3eb_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l560_c23_b3eb_device_address,
device_out_uxn_opcodes_h_l560_c23_b3eb_value,
device_out_uxn_opcodes_h_l560_c23_b3eb_phase,
device_out_uxn_opcodes_h_l560_c23_b3eb_previous_device_ram_read,
device_out_uxn_opcodes_h_l560_c23_b3eb_previous_ram_read,
device_out_uxn_opcodes_h_l560_c23_b3eb_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff
BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_left,
BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_right,
BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0
is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_cond,
is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0
current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_cond,
current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56
BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_left,
BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_right,
BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 t8_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 n8_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 l8_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 t8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 n8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 l8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 t8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 n8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 l8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 n8_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 l8_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_return_output,
 deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 l8_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_return_output,
 sp_relative_shift_uxn_opcodes_h_l554_c30_8566_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_return_output,
 MUX_uxn_opcodes_h_l558_c16_0cdd_return_output,
 MUX_uxn_opcodes_h_l559_c16_e659_return_output,
 device_out_uxn_opcodes_h_l560_c23_b3eb_return_output,
 BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_a794 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l538_c3_7bcd : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l534_c3_573b_uxn_opcodes_h_l534_c3_573b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l541_c3_fac4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l544_c3_71cb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l552_c3_dd90 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_8566_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_8566_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_8566_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_8566_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l558_c16_0cdd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l558_c16_0cdd_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l558_c16_0cdd_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l558_c16_0cdd_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c16_e659_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c16_e659_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c16_e659_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l559_c16_e659_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l561_c32_e76e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l562_c31_b8e5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l563_c26_a6e3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l564_c29_acd3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l565_c25_9fbb_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l566_c22_11c4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l567_c21_1285_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l570_c4_4b93 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l573_c4_1ed8 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_9c0c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_a446_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_5ac5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_fedc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_0d50_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l543_l533_l547_l540_DUPLICATE_01f7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_6730_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_b909_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_53d0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l543_l547_l540_l550_DUPLICATE_ec65_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l547_l550_DUPLICATE_40c3_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l569_l568_DUPLICATE_1264_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ac3_uxn_opcodes_h_l577_l527_DUPLICATE_9573_return_output : opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_a794 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l535_c3_a794;
     VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_8566_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_iftrue := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l541_c3_fac4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l541_c3_fac4;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l544_c3_71cb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l544_c3_71cb;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_right := to_unsigned(4, 3);
     VAR_current_deo_phase_uxn_opcodes_h_l570_c4_4b93 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l570_c4_4b93;
     VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_8566_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l552_c3_dd90 := resize(to_unsigned(0, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l552_c3_dd90;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l538_c3_7bcd := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l538_c3_7bcd;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_8566_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l558_c16_0cdd_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l559_c16_e659_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l559_c16_e659_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l559_c16_e659_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_previous_ram_read := VAR_previous_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_left := t8;
     VAR_MUX_uxn_opcodes_h_l558_c16_0cdd_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_5ac5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_5ac5_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_9c0c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_9c0c_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_6730 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_6730_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l533_c6_63fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_0d50 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_0d50_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l543_l533_l547_l540_DUPLICATE_01f7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l543_l533_l547_l540_DUPLICATE_01f7_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l547_c11_0866] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_left;
     BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output := BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;

     -- MUX[uxn_opcodes_h_l559_c16_e659] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l559_c16_e659_cond <= VAR_MUX_uxn_opcodes_h_l559_c16_e659_cond;
     MUX_uxn_opcodes_h_l559_c16_e659_iftrue <= VAR_MUX_uxn_opcodes_h_l559_c16_e659_iftrue;
     MUX_uxn_opcodes_h_l559_c16_e659_iffalse <= VAR_MUX_uxn_opcodes_h_l559_c16_e659_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l559_c16_e659_return_output := MUX_uxn_opcodes_h_l559_c16_e659_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l558_c32_d969] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_left;
     BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_return_output := BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_a446 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_a446_return_output := result.vram_address;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_53d0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_53d0_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_fedc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_fedc_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l543_l547_l540_l550_DUPLICATE_ec65 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l543_l547_l540_l550_DUPLICATE_ec65_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l550_c11_422c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_left;
     BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output := BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_b909 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_b909_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l543_c11_26d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l554_c30_8566] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l554_c30_8566_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_8566_ins;
     sp_relative_shift_uxn_opcodes_h_l554_c30_8566_x <= VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_8566_x;
     sp_relative_shift_uxn_opcodes_h_l554_c30_8566_y <= VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_8566_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_8566_return_output := sp_relative_shift_uxn_opcodes_h_l554_c30_8566_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l547_l550_DUPLICATE_40c3 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l547_l550_DUPLICATE_40c3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l540_c11_58bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l573_c4_5c56] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_left;
     BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_return_output := BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_0045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l533_c6_63fd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l540_c7_d67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c11_58bd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l543_c11_26d4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l547_c11_0866_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l550_c11_422c_return_output;
     VAR_MUX_uxn_opcodes_h_l558_c16_0cdd_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l558_c32_d969_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l573_c4_1ed8 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l573_c4_5c56_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_53d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_53d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_53d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_53d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_53d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_0d50_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_0d50_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_0d50_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_0d50_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_0d50_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_9c0c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_9c0c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_9c0c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_9c0c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_9c0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l543_l547_l540_l550_DUPLICATE_ec65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l543_l547_l540_l550_DUPLICATE_ec65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l543_l547_l540_l550_DUPLICATE_ec65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l543_l547_l540_l550_DUPLICATE_ec65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l543_l533_l547_l540_DUPLICATE_01f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l543_l533_l547_l540_DUPLICATE_01f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l543_l533_l547_l540_DUPLICATE_01f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l543_l533_l547_l540_DUPLICATE_01f7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_6730_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_6730_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_6730_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_6730_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_6730_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_5ac5_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_5ac5_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_5ac5_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_5ac5_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_5ac5_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_a446_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_a446_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_a446_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_a446_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_a446_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l547_l550_DUPLICATE_40c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l547_l550_DUPLICATE_40c3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_fedc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_fedc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_fedc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_fedc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_fedc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_b909_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_b909_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_b909_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_b909_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l550_l547_l543_l540_l533_DUPLICATE_b909_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_MUX_uxn_opcodes_h_l559_c16_e659_return_output;
     VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_value := VAR_MUX_uxn_opcodes_h_l559_c16_e659_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l554_c30_8566_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l573_c4_1ed8;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- t8_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     t8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     t8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := t8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- l8_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_l8_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     l8_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     l8_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := l8_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l533_c1_1166] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- n8_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     n8_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     n8_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := n8_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- MUX[uxn_opcodes_h_l558_c16_0cdd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l558_c16_0cdd_cond <= VAR_MUX_uxn_opcodes_h_l558_c16_0cdd_cond;
     MUX_uxn_opcodes_h_l558_c16_0cdd_iftrue <= VAR_MUX_uxn_opcodes_h_l558_c16_0cdd_iftrue;
     MUX_uxn_opcodes_h_l558_c16_0cdd_iffalse <= VAR_MUX_uxn_opcodes_h_l558_c16_0cdd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l558_c16_0cdd_return_output := MUX_uxn_opcodes_h_l558_c16_0cdd_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_MUX_uxn_opcodes_h_l558_c16_0cdd_return_output;
     VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_device_address := VAR_MUX_uxn_opcodes_h_l558_c16_0cdd_return_output;
     VAR_printf_uxn_opcodes_h_l534_c3_573b_uxn_opcodes_h_l534_c3_573b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l533_c1_1166_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_l8_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- n8_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     n8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     n8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := n8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- printf_uxn_opcodes_h_l534_c3_573b[uxn_opcodes_h_l534_c3_573b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l534_c3_573b_uxn_opcodes_h_l534_c3_573b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l534_c3_573b_uxn_opcodes_h_l534_c3_573b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- deo_param0_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- l8_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     l8_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     l8_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := l8_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- t8_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_t8_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     t8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     t8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := t8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_l8_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_t8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     -- l8_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     l8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     l8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := l8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- t8_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     t8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     t8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l533_c2_0045_return_output := t8_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- n8_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     n8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     n8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := n8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_l8_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_n8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l533_c2_0045_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- l8_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_l8_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     l8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     l8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := l8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- n8_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     n8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     n8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l533_c2_0045_return_output := n8_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_l8_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l533_c2_0045_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_return_output := deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- l8_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     l8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     l8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l533_c2_0045_return_output := l8_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l556_c1_c363] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l556_c1_c363_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l533_c2_0045_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l533_c2_0045_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_return_output := deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- device_out[uxn_opcodes_h_l560_c23_b3eb] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l560_c23_b3eb_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l560_c23_b3eb_device_address <= VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_device_address;
     device_out_uxn_opcodes_h_l560_c23_b3eb_value <= VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_value;
     device_out_uxn_opcodes_h_l560_c23_b3eb_phase <= VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_phase;
     device_out_uxn_opcodes_h_l560_c23_b3eb_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_previous_device_ram_read;
     device_out_uxn_opcodes_h_l560_c23_b3eb_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_return_output := device_out_uxn_opcodes_h_l560_c23_b3eb_return_output;

     -- Submodule level 7
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l533_c2_0045_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l562_c31_b8e5] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l562_c31_b8e5_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l569_l568_DUPLICATE_1264 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l569_l568_DUPLICATE_1264_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_return_output.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l567_c21_1285] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l567_c21_1285_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l564_c29_acd3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l564_c29_acd3_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_return_output.vram_write_layer;

     -- device_out_result_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l561_c32_e76e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l561_c32_e76e_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l565_c25_9fbb] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l565_c25_9fbb_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_return_output.vram_address;

     -- CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d[uxn_opcodes_h_l566_c22_11c4] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l566_c22_11c4_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l563_c26_a6e3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l563_c26_a6e3_return_output := VAR_device_out_uxn_opcodes_h_l560_c23_b3eb_return_output.is_vram_write;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l566_c22_11c4_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l569_l568_DUPLICATE_1264_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l569_l568_DUPLICATE_1264_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l569_l568_DUPLICATE_1264_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l561_c32_e76e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l563_c26_a6e3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l564_c29_acd3_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l565_c25_9fbb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l562_c31_b8e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l567_c21_1285_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l569_c3_31f0] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_return_output := current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l568_c24_5cff] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_left;
     BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_return_output := BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l569_c3_31f0] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_cond;
     is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_return_output := is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l568_c24_5cff_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l569_c3_31f0_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l569_c3_31f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l550_c7_afd9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- Submodule level 10
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l550_c7_afd9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l547_c7_75d5] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_return_output := current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- Submodule level 11
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l547_c7_75d5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_return_output := device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l543_c7_c8f5] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_cond;
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output := is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l533_c2_0045_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l543_c7_c8f5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_return_output := result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_return_output := result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_return_output := result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l540_c7_d67a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l540_c7_d67a_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_return_output := current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l533_c2_0045] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_cond;
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_return_output := is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_return_output;

     -- Submodule level 14
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l533_c2_0045_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l533_c2_0045_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ac3_uxn_opcodes_h_l577_l527_DUPLICATE_9573 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ac3_uxn_opcodes_h_l577_l527_DUPLICATE_9573_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ac3(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l533_c2_0045_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l533_c2_0045_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ac3_uxn_opcodes_h_l577_l527_DUPLICATE_9573_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ac3_uxn_opcodes_h_l577_l527_DUPLICATE_9573_return_output;
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
