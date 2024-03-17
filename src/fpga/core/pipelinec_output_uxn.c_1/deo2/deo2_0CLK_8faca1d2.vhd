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
entity deo2_0CLK_8faca1d2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(11 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_8faca1d2;
architecture arch of deo2_0CLK_8faca1d2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal deo_param0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal deo_param1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal current_deo_phase : unsigned(11 downto 0) := to_unsigned(0, 12);
signal is_second_deo : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_phase_3 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_phase_4 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_deo_param0 : unsigned(7 downto 0);
signal REG_COMB_deo_param1 : unsigned(7 downto 0);
signal REG_COMB_current_deo_phase : unsigned(11 downto 0);
signal REG_COMB_is_second_deo : unsigned(0 downto 0);
signal REG_COMB_is_phase_3 : unsigned(0 downto 0);
signal REG_COMB_is_phase_4 : unsigned(0 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l540_c6_861b]
signal BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l540_c2_4286]
signal result_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l540_c2_4286_return_output : opcode_result_t;

-- is_phase_4_MUX[uxn_opcodes_h_l540_c2_4286]
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l540_c2_4286]
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l540_c2_4286]
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l540_c2_4286]
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l540_c2_4286]
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(11 downto 0);

-- n8_MUX[uxn_opcodes_h_l540_c2_4286]
signal n8_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(7 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l540_c2_4286]
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l540_c2_4286]
signal t8_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l540_c2_4286]
signal l8_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l540_c2_4286]
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l555_c11_c9be]
signal BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l558_c7_0082]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(11 downto 0);

-- n8_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal n8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(7 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal t8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal l8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l555_c7_fcb2]
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l558_c11_4522]
signal BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l562_c1_f9cd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l558_c7_0082]
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l558_c7_0082]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l558_c7_0082]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l558_c7_0082]
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l558_c7_0082]
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l558_c7_0082]
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l558_c7_0082]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l558_c7_0082]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l558_c7_0082]
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l558_c7_0082]
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l558_c7_0082]
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l558_c7_0082]
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_return_output : device_out_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l558_c7_0082]
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l558_c7_0082]
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(11 downto 0);

-- n8_MUX[uxn_opcodes_h_l558_c7_0082]
signal n8_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(7 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l558_c7_0082]
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l558_c7_0082]
signal t8_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l558_c7_0082]
signal l8_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l558_c7_0082]
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l563_c17_0dad]
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l563_c17_c3a9]
signal MUX_uxn_opcodes_h_l563_c17_c3a9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_c3a9_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_c3a9_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_c3a9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l564_c17_8afa]
signal BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l564_c17_b9d4]
signal MUX_uxn_opcodes_h_l564_c17_b9d4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c17_b9d4_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c17_b9d4_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c17_b9d4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l565_c8_2a8d]
signal MUX_uxn_opcodes_h_l565_c8_2a8d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_2a8d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_2a8d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_2a8d_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l566_c8_9572]
signal MUX_uxn_opcodes_h_l566_c8_9572_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l566_c8_9572_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c8_9572_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c8_9572_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l567_c32_56a6]
signal BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l567_c16_ebd9]
signal MUX_uxn_opcodes_h_l567_c16_ebd9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_ebd9_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_ebd9_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_ebd9_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l568_c16_0ddf]
signal MUX_uxn_opcodes_h_l568_c16_0ddf_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l568_c16_0ddf_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l568_c16_0ddf_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l568_c16_0ddf_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l569_c43_6491]
signal sp_relative_shift_uxn_opcodes_h_l569_c43_6491_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l569_c43_6491_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l569_c43_6491_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l569_c43_6491_return_output : signed(3 downto 0);

-- MUX[uxn_opcodes_h_l569_c30_ed82]
signal MUX_uxn_opcodes_h_l569_c30_ed82_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l569_c30_ed82_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l569_c30_ed82_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l569_c30_ed82_return_output : signed(3 downto 0);

-- device_out[uxn_opcodes_h_l570_c23_6066]
signal device_out_uxn_opcodes_h_l570_c23_6066_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_6066_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_6066_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_6066_phase : unsigned(11 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_6066_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_6066_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_6066_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l577_c24_8e93]
signal BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l578_c3_4131]
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_return_output : unsigned(11 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l578_c3_4131]
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l582_c4_b50f]
signal BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_return_output : unsigned(12 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_99b3( ref_toks_0 : opcode_result_t;
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
      base.vram_write_layer := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.is_device_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b
BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_left,
BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_right,
BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- result_MUX_uxn_opcodes_h_l540_c2_4286
result_MUX_uxn_opcodes_h_l540_c2_4286 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l540_c2_4286_cond,
result_MUX_uxn_opcodes_h_l540_c2_4286_iftrue,
result_MUX_uxn_opcodes_h_l540_c2_4286_iffalse,
result_MUX_uxn_opcodes_h_l540_c2_4286_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286
is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_cond,
is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l540_c2_4286
deo_param0_MUX_uxn_opcodes_h_l540_c2_4286 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_cond,
deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_iftrue,
deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_iffalse,
deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l540_c2_4286
device_out_result_MUX_uxn_opcodes_h_l540_c2_4286 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_cond,
device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_iftrue,
device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_iffalse,
device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l540_c2_4286
deo_param1_MUX_uxn_opcodes_h_l540_c2_4286 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_cond,
deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_iftrue,
deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_iffalse,
deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_cond,
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_return_output);

-- n8_MUX_uxn_opcodes_h_l540_c2_4286
n8_MUX_uxn_opcodes_h_l540_c2_4286 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l540_c2_4286_cond,
n8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue,
n8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse,
n8_MUX_uxn_opcodes_h_l540_c2_4286_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286
is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_cond,
is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_return_output);

-- t8_MUX_uxn_opcodes_h_l540_c2_4286
t8_MUX_uxn_opcodes_h_l540_c2_4286 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l540_c2_4286_cond,
t8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue,
t8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse,
t8_MUX_uxn_opcodes_h_l540_c2_4286_return_output);

-- l8_MUX_uxn_opcodes_h_l540_c2_4286
l8_MUX_uxn_opcodes_h_l540_c2_4286 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l540_c2_4286_cond,
l8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue,
l8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse,
l8_MUX_uxn_opcodes_h_l540_c2_4286_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286
is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_cond,
is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be
BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_left,
BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_right,
BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2
result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2
result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2
is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2
deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2
device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2
deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- n8_MUX_uxn_opcodes_h_l555_c7_fcb2
n8_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
n8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
n8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
n8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2
is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- t8_MUX_uxn_opcodes_h_l555_c7_fcb2
t8_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
t8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
t8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
t8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- l8_MUX_uxn_opcodes_h_l555_c7_fcb2
l8_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
l8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
l8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
l8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2
is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_cond,
is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522
BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_left,
BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_right,
BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082
result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_cond,
result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082
result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_cond,
result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082
is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_cond,
is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l558_c7_0082
deo_param0_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_cond,
deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l558_c7_0082
device_out_result_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_cond,
device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l558_c7_0082
deo_param1_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_cond,
deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_cond,
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- n8_MUX_uxn_opcodes_h_l558_c7_0082
n8_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l558_c7_0082_cond,
n8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
n8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
n8_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082
is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_cond,
is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- t8_MUX_uxn_opcodes_h_l558_c7_0082
t8_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l558_c7_0082_cond,
t8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
t8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
t8_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- l8_MUX_uxn_opcodes_h_l558_c7_0082
l8_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l558_c7_0082_cond,
l8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
l8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
l8_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082
is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_cond,
is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad
BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_left,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_right,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_return_output);

-- MUX_uxn_opcodes_h_l563_c17_c3a9
MUX_uxn_opcodes_h_l563_c17_c3a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l563_c17_c3a9_cond,
MUX_uxn_opcodes_h_l563_c17_c3a9_iftrue,
MUX_uxn_opcodes_h_l563_c17_c3a9_iffalse,
MUX_uxn_opcodes_h_l563_c17_c3a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa
BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_left,
BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_right,
BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_return_output);

-- MUX_uxn_opcodes_h_l564_c17_b9d4
MUX_uxn_opcodes_h_l564_c17_b9d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l564_c17_b9d4_cond,
MUX_uxn_opcodes_h_l564_c17_b9d4_iftrue,
MUX_uxn_opcodes_h_l564_c17_b9d4_iffalse,
MUX_uxn_opcodes_h_l564_c17_b9d4_return_output);

-- MUX_uxn_opcodes_h_l565_c8_2a8d
MUX_uxn_opcodes_h_l565_c8_2a8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l565_c8_2a8d_cond,
MUX_uxn_opcodes_h_l565_c8_2a8d_iftrue,
MUX_uxn_opcodes_h_l565_c8_2a8d_iffalse,
MUX_uxn_opcodes_h_l565_c8_2a8d_return_output);

-- MUX_uxn_opcodes_h_l566_c8_9572
MUX_uxn_opcodes_h_l566_c8_9572 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l566_c8_9572_cond,
MUX_uxn_opcodes_h_l566_c8_9572_iftrue,
MUX_uxn_opcodes_h_l566_c8_9572_iffalse,
MUX_uxn_opcodes_h_l566_c8_9572_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_left,
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_right,
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_return_output);

-- MUX_uxn_opcodes_h_l567_c16_ebd9
MUX_uxn_opcodes_h_l567_c16_ebd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l567_c16_ebd9_cond,
MUX_uxn_opcodes_h_l567_c16_ebd9_iftrue,
MUX_uxn_opcodes_h_l567_c16_ebd9_iffalse,
MUX_uxn_opcodes_h_l567_c16_ebd9_return_output);

-- MUX_uxn_opcodes_h_l568_c16_0ddf
MUX_uxn_opcodes_h_l568_c16_0ddf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l568_c16_0ddf_cond,
MUX_uxn_opcodes_h_l568_c16_0ddf_iftrue,
MUX_uxn_opcodes_h_l568_c16_0ddf_iffalse,
MUX_uxn_opcodes_h_l568_c16_0ddf_return_output);

-- sp_relative_shift_uxn_opcodes_h_l569_c43_6491
sp_relative_shift_uxn_opcodes_h_l569_c43_6491 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l569_c43_6491_ins,
sp_relative_shift_uxn_opcodes_h_l569_c43_6491_x,
sp_relative_shift_uxn_opcodes_h_l569_c43_6491_y,
sp_relative_shift_uxn_opcodes_h_l569_c43_6491_return_output);

-- MUX_uxn_opcodes_h_l569_c30_ed82
MUX_uxn_opcodes_h_l569_c30_ed82 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l569_c30_ed82_cond,
MUX_uxn_opcodes_h_l569_c30_ed82_iftrue,
MUX_uxn_opcodes_h_l569_c30_ed82_iffalse,
MUX_uxn_opcodes_h_l569_c30_ed82_return_output);

-- device_out_uxn_opcodes_h_l570_c23_6066
device_out_uxn_opcodes_h_l570_c23_6066 : entity work.device_out_0CLK_f7f35190 port map (
clk,
device_out_uxn_opcodes_h_l570_c23_6066_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l570_c23_6066_device_address,
device_out_uxn_opcodes_h_l570_c23_6066_value,
device_out_uxn_opcodes_h_l570_c23_6066_phase,
device_out_uxn_opcodes_h_l570_c23_6066_previous_device_ram_read,
device_out_uxn_opcodes_h_l570_c23_6066_previous_ram_read,
device_out_uxn_opcodes_h_l570_c23_6066_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93
BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_left,
BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_right,
BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_cond,
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131
is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_cond,
is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_left,
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_right,
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_return_output);



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
 deo_param0,
 deo_param1,
 current_deo_phase,
 is_second_deo,
 is_phase_3,
 is_phase_4,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 result_MUX_uxn_opcodes_h_l540_c2_4286_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_return_output,
 deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_return_output,
 device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_return_output,
 deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_return_output,
 n8_MUX_uxn_opcodes_h_l540_c2_4286_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_return_output,
 t8_MUX_uxn_opcodes_h_l540_c2_4286_return_output,
 l8_MUX_uxn_opcodes_h_l540_c2_4286_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 n8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 t8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 l8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 n8_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 t8_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 l8_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_return_output,
 MUX_uxn_opcodes_h_l563_c17_c3a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_return_output,
 MUX_uxn_opcodes_h_l564_c17_b9d4_return_output,
 MUX_uxn_opcodes_h_l565_c8_2a8d_return_output,
 MUX_uxn_opcodes_h_l566_c8_9572_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_return_output,
 MUX_uxn_opcodes_h_l567_c16_ebd9_return_output,
 MUX_uxn_opcodes_h_l568_c16_0ddf_return_output,
 sp_relative_shift_uxn_opcodes_h_l569_c43_6491_return_output,
 MUX_uxn_opcodes_h_l569_c30_ed82_return_output,
 device_out_uxn_opcodes_h_l570_c23_6066_return_output,
 BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l540_c2_4286_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_99b3_uxn_opcodes_h_l540_c2_4286_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_4286_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l553_c3_04f4 : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l545_c3_1dcb : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_0a1d : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l556_c3_ecfa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_d205 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l558_c7_0082_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_c3a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_c3a9_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_c3a9_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_c3a9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_b9d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_b9d4_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_b9d4_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_b9d4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_2a8d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_2a8d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_2a8d_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_2a8d_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_9572_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_9572_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_9572_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_9572_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_ebd9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_ebd9_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_ebd9_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_ebd9_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_0ddf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_0ddf_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_0ddf_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_0ddf_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_ed82_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_ed82_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_ed82_iffalse : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_6491_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_6491_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_6491_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_6491_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_ed82_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_6066_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_6066_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_6066_phase : unsigned(11 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_6066_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_6066_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_6066_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_6066_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_c32_f79d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l572_c31_3501_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l573_c26_e464_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l574_c29_4edc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l575_c22_dc93_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l576_c21_ac66_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l579_c4_5fad : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l582_c4_7677 : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_return_output : unsigned(12 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_729c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_61bb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_9f37_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_d1a8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_8af4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_9c80_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_393c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_40b0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l578_DUPLICATE_0a8e_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_deo_param0 : unsigned(7 downto 0);
variable REG_VAR_deo_param1 : unsigned(7 downto 0);
variable REG_VAR_current_deo_phase : unsigned(11 downto 0);
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
  REG_VAR_deo_param0 := deo_param0;
  REG_VAR_deo_param1 := deo_param1;
  REG_VAR_current_deo_phase := current_deo_phase;
  REG_VAR_is_second_deo := is_second_deo;
  REG_VAR_is_phase_3 := is_phase_3;
  REG_VAR_is_phase_4 := is_phase_4;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_current_deo_phase_uxn_opcodes_h_l579_c4_5fad := resize(to_unsigned(0, 1), 12);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l579_c4_5fad;
     VAR_MUX_uxn_opcodes_h_l564_c17_b9d4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l556_c3_ecfa := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l556_c3_ecfa;
     VAR_MUX_uxn_opcodes_h_l563_c17_c3a9_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_6491_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_d205 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_d205;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l545_c3_1dcb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_0a1d := resize(to_unsigned(1, 1), 4);
     VAR_MUX_uxn_opcodes_h_l569_c30_ed82_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_6491_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l563_c17_c3a9_iffalse := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l564_c17_b9d4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_right := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l553_c3_04f4 := resize(to_unsigned(0, 1), 12);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l553_c3_04f4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_right := to_unsigned(3, 2);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l570_c23_6066_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_6491_ins := VAR_ins;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := is_phase_3;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := is_phase_4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l567_c16_ebd9_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l568_c16_0ddf_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l565_c8_2a8d_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l566_c8_9572_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l570_c23_6066_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l570_c23_6066_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l565_c8_2a8d_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l566_c8_9572_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_left := t8;
     VAR_MUX_uxn_opcodes_h_l567_c16_ebd9_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l558_c7_0082_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l567_c32_56a6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l540_c6_861b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_left;
     BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output := BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_729c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_729c_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_d1a8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_d1a8_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_8af4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_8af4_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l558_c11_4522] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_left;
     BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output := BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l564_c17_8afa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_left;
     BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_return_output := BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l555_c11_c9be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_left;
     BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output := BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_40b0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_40b0_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_9f37 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_9f37_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l563_c17_0dad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_left;
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_return_output := BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l569_c43_6491] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l569_c43_6491_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_6491_ins;
     sp_relative_shift_uxn_opcodes_h_l569_c43_6491_x <= VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_6491_x;
     sp_relative_shift_uxn_opcodes_h_l569_c43_6491_y <= VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_6491_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_6491_return_output := sp_relative_shift_uxn_opcodes_h_l569_c43_6491_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l582_c4_b50f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_9c80 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_9c80_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_61bb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_61bb_return_output := result.vram_write_layer;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l540_c2_4286] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l540_c2_4286_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l545_c3_1dcb,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_0a1d,
     to_unsigned(0, 1));

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_393c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_393c_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_4286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_4286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l540_c2_4286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_4286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_861b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_c9be_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_0082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_4522_return_output;
     VAR_MUX_uxn_opcodes_h_l563_c17_c3a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0dad_return_output;
     VAR_MUX_uxn_opcodes_h_l564_c17_b9d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_8afa_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_ebd9_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_56a6_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l582_c4_7677 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_b50f_return_output, 12);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_393c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_393c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_d1a8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_d1a8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_9c80_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_9c80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_40b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_40b0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_9f37_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_9f37_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_61bb_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_61bb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_8af4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_8af4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_729c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_729c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l540_c2_4286_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l540_c2_4286_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l558_c7_0082_return_output;
     VAR_MUX_uxn_opcodes_h_l569_c30_ed82_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_6491_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l582_c4_7677;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- MUX[uxn_opcodes_h_l567_c16_ebd9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l567_c16_ebd9_cond <= VAR_MUX_uxn_opcodes_h_l567_c16_ebd9_cond;
     MUX_uxn_opcodes_h_l567_c16_ebd9_iftrue <= VAR_MUX_uxn_opcodes_h_l567_c16_ebd9_iftrue;
     MUX_uxn_opcodes_h_l567_c16_ebd9_iffalse <= VAR_MUX_uxn_opcodes_h_l567_c16_ebd9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l567_c16_ebd9_return_output := MUX_uxn_opcodes_h_l567_c16_ebd9_return_output;

     -- MUX[uxn_opcodes_h_l564_c17_b9d4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l564_c17_b9d4_cond <= VAR_MUX_uxn_opcodes_h_l564_c17_b9d4_cond;
     MUX_uxn_opcodes_h_l564_c17_b9d4_iftrue <= VAR_MUX_uxn_opcodes_h_l564_c17_b9d4_iftrue;
     MUX_uxn_opcodes_h_l564_c17_b9d4_iffalse <= VAR_MUX_uxn_opcodes_h_l564_c17_b9d4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l564_c17_b9d4_return_output := MUX_uxn_opcodes_h_l564_c17_b9d4_return_output;

     -- MUX[uxn_opcodes_h_l563_c17_c3a9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l563_c17_c3a9_cond <= VAR_MUX_uxn_opcodes_h_l563_c17_c3a9_cond;
     MUX_uxn_opcodes_h_l563_c17_c3a9_iftrue <= VAR_MUX_uxn_opcodes_h_l563_c17_c3a9_iftrue;
     MUX_uxn_opcodes_h_l563_c17_c3a9_iffalse <= VAR_MUX_uxn_opcodes_h_l563_c17_c3a9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l563_c17_c3a9_return_output := MUX_uxn_opcodes_h_l563_c17_c3a9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- t8_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_t8_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     t8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     t8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_0082_return_output := t8_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;
     VAR_MUX_uxn_opcodes_h_l565_c8_2a8d_cond := VAR_MUX_uxn_opcodes_h_l563_c17_c3a9_return_output;
     VAR_MUX_uxn_opcodes_h_l569_c30_ed82_cond := VAR_MUX_uxn_opcodes_h_l563_c17_c3a9_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_MUX_uxn_opcodes_h_l563_c17_c3a9_return_output;
     VAR_MUX_uxn_opcodes_h_l566_c8_9572_cond := VAR_MUX_uxn_opcodes_h_l564_c17_b9d4_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_MUX_uxn_opcodes_h_l564_c17_b9d4_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_MUX_uxn_opcodes_h_l567_c16_ebd9_return_output;
     VAR_device_out_uxn_opcodes_h_l570_c23_6066_device_address := VAR_MUX_uxn_opcodes_h_l567_c16_ebd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     -- is_phase_3_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_return_output := is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- MUX[uxn_opcodes_h_l566_c8_9572] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l566_c8_9572_cond <= VAR_MUX_uxn_opcodes_h_l566_c8_9572_cond;
     MUX_uxn_opcodes_h_l566_c8_9572_iftrue <= VAR_MUX_uxn_opcodes_h_l566_c8_9572_iftrue;
     MUX_uxn_opcodes_h_l566_c8_9572_iffalse <= VAR_MUX_uxn_opcodes_h_l566_c8_9572_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l566_c8_9572_return_output := MUX_uxn_opcodes_h_l566_c8_9572_return_output;

     -- t8_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_t8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     t8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     t8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := t8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- MUX[uxn_opcodes_h_l565_c8_2a8d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l565_c8_2a8d_cond <= VAR_MUX_uxn_opcodes_h_l565_c8_2a8d_cond;
     MUX_uxn_opcodes_h_l565_c8_2a8d_iftrue <= VAR_MUX_uxn_opcodes_h_l565_c8_2a8d_iftrue;
     MUX_uxn_opcodes_h_l565_c8_2a8d_iffalse <= VAR_MUX_uxn_opcodes_h_l565_c8_2a8d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l565_c8_2a8d_return_output := MUX_uxn_opcodes_h_l565_c8_2a8d_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_return_output := deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- MUX[uxn_opcodes_h_l569_c30_ed82] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l569_c30_ed82_cond <= VAR_MUX_uxn_opcodes_h_l569_c30_ed82_cond;
     MUX_uxn_opcodes_h_l569_c30_ed82_iftrue <= VAR_MUX_uxn_opcodes_h_l569_c30_ed82_iftrue;
     MUX_uxn_opcodes_h_l569_c30_ed82_iffalse <= VAR_MUX_uxn_opcodes_h_l569_c30_ed82_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l569_c30_ed82_return_output := MUX_uxn_opcodes_h_l569_c30_ed82_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_return_output := is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c16_0ddf_iffalse := VAR_MUX_uxn_opcodes_h_l565_c8_2a8d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_MUX_uxn_opcodes_h_l565_c8_2a8d_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c16_0ddf_iftrue := VAR_MUX_uxn_opcodes_h_l566_c8_9572_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_MUX_uxn_opcodes_h_l566_c8_9572_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_MUX_uxn_opcodes_h_l569_c30_ed82_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse := VAR_t8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;
     -- n8_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_n8_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     n8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     n8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_0082_return_output := n8_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- t8_MUX[uxn_opcodes_h_l540_c2_4286] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l540_c2_4286_cond <= VAR_t8_MUX_uxn_opcodes_h_l540_c2_4286_cond;
     t8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue;
     t8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_4286_return_output := t8_MUX_uxn_opcodes_h_l540_c2_4286_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- MUX[uxn_opcodes_h_l568_c16_0ddf] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l568_c16_0ddf_cond <= VAR_MUX_uxn_opcodes_h_l568_c16_0ddf_cond;
     MUX_uxn_opcodes_h_l568_c16_0ddf_iftrue <= VAR_MUX_uxn_opcodes_h_l568_c16_0ddf_iftrue;
     MUX_uxn_opcodes_h_l568_c16_0ddf_iffalse <= VAR_MUX_uxn_opcodes_h_l568_c16_0ddf_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l568_c16_0ddf_return_output := MUX_uxn_opcodes_h_l568_c16_0ddf_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- l8_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_l8_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     l8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     l8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_0082_return_output := l8_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l562_c1_f9cd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l570_c23_6066_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_f9cd_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_MUX_uxn_opcodes_h_l568_c16_0ddf_return_output;
     VAR_device_out_uxn_opcodes_h_l570_c23_6066_value := VAR_MUX_uxn_opcodes_h_l568_c16_0ddf_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_l8_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l540_c2_4286_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_return_output := deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l540_c2_4286] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_cond;
     is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_return_output := is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- n8_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_n8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     n8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     n8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := n8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l540_c2_4286] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_cond;
     is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_return_output := is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l540_c2_4286] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_cond;
     deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_return_output := deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_return_output;

     -- l8_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_l8_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     l8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     l8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := l8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- device_out[uxn_opcodes_h_l570_c23_6066] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l570_c23_6066_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l570_c23_6066_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l570_c23_6066_device_address <= VAR_device_out_uxn_opcodes_h_l570_c23_6066_device_address;
     device_out_uxn_opcodes_h_l570_c23_6066_value <= VAR_device_out_uxn_opcodes_h_l570_c23_6066_value;
     device_out_uxn_opcodes_h_l570_c23_6066_phase <= VAR_device_out_uxn_opcodes_h_l570_c23_6066_phase;
     device_out_uxn_opcodes_h_l570_c23_6066_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l570_c23_6066_previous_device_ram_read;
     device_out_uxn_opcodes_h_l570_c23_6066_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l570_c23_6066_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l570_c23_6066_return_output := device_out_uxn_opcodes_h_l570_c23_6066_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_4286_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_device_out_uxn_opcodes_h_l570_c23_6066_return_output;
     REG_VAR_is_phase_3 := VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_4286_return_output;
     REG_VAR_is_phase_4 := VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_4286_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse := VAR_l8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse := VAR_n8_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l573_c26_e464] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l573_c26_e464_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_6066_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l571_c32_f79d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_c32_f79d_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_6066_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l576_c21_ac66] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l576_c21_ac66_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_6066_return_output.u8_value;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l572_c31_3501] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l572_c31_3501_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_6066_return_output.device_ram_address;

     -- n8_MUX[uxn_opcodes_h_l540_c2_4286] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l540_c2_4286_cond <= VAR_n8_MUX_uxn_opcodes_h_l540_c2_4286_cond;
     n8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue;
     n8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_4286_return_output := n8_MUX_uxn_opcodes_h_l540_c2_4286_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l578_DUPLICATE_0a8e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l578_DUPLICATE_0a8e_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_6066_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l574_c29_4edc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l574_c29_4edc_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_6066_return_output.vram_write_layer;

     -- l8_MUX[uxn_opcodes_h_l540_c2_4286] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l540_c2_4286_cond <= VAR_l8_MUX_uxn_opcodes_h_l540_c2_4286_cond;
     l8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l540_c2_4286_iftrue;
     l8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l540_c2_4286_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_4286_return_output := l8_MUX_uxn_opcodes_h_l540_c2_4286_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l575_c22_dc93] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l575_c22_dc93_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_6066_return_output.u16_addr;

     -- deo_param1_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_return_output := device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l575_c22_dc93_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l578_DUPLICATE_0a8e_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l578_DUPLICATE_0a8e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l577_l578_DUPLICATE_0a8e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_c32_f79d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l573_c26_e464_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l574_c29_4edc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l572_c31_3501_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l576_c21_ac66_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l540_c2_4286_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l540_c2_4286_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l578_c3_4131] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_return_output := current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_return_output := result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l540_c2_4286] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_cond;
     deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_return_output := deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l578_c3_4131] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_cond;
     is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_return_output := is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l577_c24_8e93] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_left;
     BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_return_output := BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_return_output := result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_8e93_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_4131_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_4286_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_4131_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_return_output := current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_return_output := is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l540_c2_4286] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_cond;
     device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_return_output := device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l558_c7_0082] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_4286_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_0082_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l555_c7_fcb2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l540_c2_4286] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_return_output := current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l540_c2_4286] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_cond;
     is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_return_output := is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_99b3[uxn_opcodes_h_l540_c2_4286] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_99b3_uxn_opcodes_h_l540_c2_4286_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_99b3(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_fcb2_return_output);

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_4286_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_4286_return_output;
     VAR_result_MUX_uxn_opcodes_h_l540_c2_4286_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_99b3_uxn_opcodes_h_l540_c2_4286_return_output;
     -- result_MUX[uxn_opcodes_h_l540_c2_4286] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l540_c2_4286_cond <= VAR_result_MUX_uxn_opcodes_h_l540_c2_4286_cond;
     result_MUX_uxn_opcodes_h_l540_c2_4286_iftrue <= VAR_result_MUX_uxn_opcodes_h_l540_c2_4286_iftrue;
     result_MUX_uxn_opcodes_h_l540_c2_4286_iffalse <= VAR_result_MUX_uxn_opcodes_h_l540_c2_4286_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l540_c2_4286_return_output := result_MUX_uxn_opcodes_h_l540_c2_4286_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l540_c2_4286_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l540_c2_4286_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_deo_param0 <= REG_VAR_deo_param0;
REG_COMB_deo_param1 <= REG_VAR_deo_param1;
REG_COMB_current_deo_phase <= REG_VAR_current_deo_phase;
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
     deo_param0 <= REG_COMB_deo_param0;
     deo_param1 <= REG_COMB_deo_param1;
     current_deo_phase <= REG_COMB_current_deo_phase;
     is_second_deo <= REG_COMB_is_second_deo;
     is_phase_3 <= REG_COMB_is_phase_3;
     is_phase_4 <= REG_COMB_is_phase_4;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
