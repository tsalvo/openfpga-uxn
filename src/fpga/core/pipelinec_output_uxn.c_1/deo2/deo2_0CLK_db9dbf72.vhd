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
entity deo2_0CLK_db9dbf72 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(11 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_db9dbf72;
architecture arch of deo2_0CLK_db9dbf72 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l540_c6_096e]
signal BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l540_c2_da15]
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_return_output : device_out_result_t;

-- is_phase_3_MUX[uxn_opcodes_h_l540_c2_da15]
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l540_c2_da15]
signal t8_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l540_c2_da15]
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l540_c2_da15]
signal result_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l540_c2_da15_return_output : opcode_result_t;

-- l8_MUX[uxn_opcodes_h_l540_c2_da15]
signal l8_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l540_c2_da15]
signal n8_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l540_c2_da15]
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l540_c2_da15]
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l540_c2_da15]
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(11 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l540_c2_da15]
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l555_c11_2f32]
signal BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : device_out_result_t;

-- is_phase_3_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal t8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : signed(3 downto 0);

-- l8_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal l8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal n8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(11 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l555_c7_0fd9]
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l558_c11_2aeb]
signal BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l562_c1_9008]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : device_out_result_t;

-- is_phase_3_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal t8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : signed(3 downto 0);

-- l8_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal l8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal n8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(11 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l558_c7_6f7b]
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l563_c17_0fec]
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l563_c17_a2d8]
signal MUX_uxn_opcodes_h_l563_c17_a2d8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_a2d8_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_a2d8_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_a2d8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l564_c17_c253]
signal BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l564_c17_2ede]
signal MUX_uxn_opcodes_h_l564_c17_2ede_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c17_2ede_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c17_2ede_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c17_2ede_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l565_c8_f932]
signal MUX_uxn_opcodes_h_l565_c8_f932_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_f932_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_f932_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_f932_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l566_c8_5308]
signal MUX_uxn_opcodes_h_l566_c8_5308_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l566_c8_5308_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c8_5308_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c8_5308_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l567_c32_891c]
signal BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l567_c16_4c6e]
signal MUX_uxn_opcodes_h_l567_c16_4c6e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_4c6e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_4c6e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_4c6e_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l568_c16_4ab5]
signal MUX_uxn_opcodes_h_l568_c16_4ab5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l568_c16_4ab5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l568_c16_4ab5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l568_c16_4ab5_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l569_c43_cb11]
signal sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_return_output : signed(3 downto 0);

-- MUX[uxn_opcodes_h_l569_c30_f8d4]
signal MUX_uxn_opcodes_h_l569_c30_f8d4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l569_c30_f8d4_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l569_c30_f8d4_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l569_c30_f8d4_return_output : signed(3 downto 0);

-- device_out[uxn_opcodes_h_l570_c23_89f5]
signal device_out_uxn_opcodes_h_l570_c23_89f5_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_89f5_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_89f5_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_89f5_phase : unsigned(11 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_89f5_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_89f5_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l570_c23_89f5_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l577_c24_9efa]
signal BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l578_c3_ab39]
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l578_c3_ab39]
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_iftrue : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_iffalse : unsigned(11 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_return_output : unsigned(11 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l582_c4_9024]
signal BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_return_output : unsigned(12 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_cfe0( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.vram_write_layer := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e
BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_left,
BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_right,
BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l540_c2_da15
device_out_result_MUX_uxn_opcodes_h_l540_c2_da15 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_cond,
device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_iftrue,
device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_iffalse,
device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15
is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_cond,
is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_return_output);

-- t8_MUX_uxn_opcodes_h_l540_c2_da15
t8_MUX_uxn_opcodes_h_l540_c2_da15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l540_c2_da15_cond,
t8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue,
t8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse,
t8_MUX_uxn_opcodes_h_l540_c2_da15_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15
is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_cond,
is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_return_output);

-- result_MUX_uxn_opcodes_h_l540_c2_da15
result_MUX_uxn_opcodes_h_l540_c2_da15 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l540_c2_da15_cond,
result_MUX_uxn_opcodes_h_l540_c2_da15_iftrue,
result_MUX_uxn_opcodes_h_l540_c2_da15_iffalse,
result_MUX_uxn_opcodes_h_l540_c2_da15_return_output);

-- l8_MUX_uxn_opcodes_h_l540_c2_da15
l8_MUX_uxn_opcodes_h_l540_c2_da15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l540_c2_da15_cond,
l8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue,
l8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse,
l8_MUX_uxn_opcodes_h_l540_c2_da15_return_output);

-- n8_MUX_uxn_opcodes_h_l540_c2_da15
n8_MUX_uxn_opcodes_h_l540_c2_da15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l540_c2_da15_cond,
n8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue,
n8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse,
n8_MUX_uxn_opcodes_h_l540_c2_da15_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l540_c2_da15
deo_param0_MUX_uxn_opcodes_h_l540_c2_da15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_cond,
deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_iftrue,
deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_iffalse,
deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15
is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_cond,
is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_cond,
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l540_c2_da15
deo_param1_MUX_uxn_opcodes_h_l540_c2_da15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_cond,
deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_iftrue,
deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_iffalse,
deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32
BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_left,
BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_right,
BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9
device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9
is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- t8_MUX_uxn_opcodes_h_l555_c7_0fd9
t8_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
t8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
t8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
t8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9
is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9
result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9
result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- l8_MUX_uxn_opcodes_h_l555_c7_0fd9
l8_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
l8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
l8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
l8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- n8_MUX_uxn_opcodes_h_l555_c7_0fd9
n8_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
n8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
n8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
n8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9
deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9
is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9
deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_cond,
deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue,
deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse,
deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb
BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_left,
BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_right,
BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b
device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b
is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- t8_MUX_uxn_opcodes_h_l558_c7_6f7b
t8_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
t8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
t8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
t8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b
is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b
result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b
result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- l8_MUX_uxn_opcodes_h_l558_c7_6f7b
l8_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
l8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
l8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
l8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- n8_MUX_uxn_opcodes_h_l558_c7_6f7b
n8_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
n8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
n8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
n8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b
deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b
is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b
deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_cond,
deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue,
deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse,
deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec
BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_left,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_right,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_return_output);

-- MUX_uxn_opcodes_h_l563_c17_a2d8
MUX_uxn_opcodes_h_l563_c17_a2d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l563_c17_a2d8_cond,
MUX_uxn_opcodes_h_l563_c17_a2d8_iftrue,
MUX_uxn_opcodes_h_l563_c17_a2d8_iffalse,
MUX_uxn_opcodes_h_l563_c17_a2d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253
BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_left,
BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_right,
BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_return_output);

-- MUX_uxn_opcodes_h_l564_c17_2ede
MUX_uxn_opcodes_h_l564_c17_2ede : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l564_c17_2ede_cond,
MUX_uxn_opcodes_h_l564_c17_2ede_iftrue,
MUX_uxn_opcodes_h_l564_c17_2ede_iffalse,
MUX_uxn_opcodes_h_l564_c17_2ede_return_output);

-- MUX_uxn_opcodes_h_l565_c8_f932
MUX_uxn_opcodes_h_l565_c8_f932 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l565_c8_f932_cond,
MUX_uxn_opcodes_h_l565_c8_f932_iftrue,
MUX_uxn_opcodes_h_l565_c8_f932_iffalse,
MUX_uxn_opcodes_h_l565_c8_f932_return_output);

-- MUX_uxn_opcodes_h_l566_c8_5308
MUX_uxn_opcodes_h_l566_c8_5308 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l566_c8_5308_cond,
MUX_uxn_opcodes_h_l566_c8_5308_iftrue,
MUX_uxn_opcodes_h_l566_c8_5308_iffalse,
MUX_uxn_opcodes_h_l566_c8_5308_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_left,
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_right,
BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_return_output);

-- MUX_uxn_opcodes_h_l567_c16_4c6e
MUX_uxn_opcodes_h_l567_c16_4c6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l567_c16_4c6e_cond,
MUX_uxn_opcodes_h_l567_c16_4c6e_iftrue,
MUX_uxn_opcodes_h_l567_c16_4c6e_iffalse,
MUX_uxn_opcodes_h_l567_c16_4c6e_return_output);

-- MUX_uxn_opcodes_h_l568_c16_4ab5
MUX_uxn_opcodes_h_l568_c16_4ab5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l568_c16_4ab5_cond,
MUX_uxn_opcodes_h_l568_c16_4ab5_iftrue,
MUX_uxn_opcodes_h_l568_c16_4ab5_iffalse,
MUX_uxn_opcodes_h_l568_c16_4ab5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l569_c43_cb11
sp_relative_shift_uxn_opcodes_h_l569_c43_cb11 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_ins,
sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_x,
sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_y,
sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_return_output);

-- MUX_uxn_opcodes_h_l569_c30_f8d4
MUX_uxn_opcodes_h_l569_c30_f8d4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l569_c30_f8d4_cond,
MUX_uxn_opcodes_h_l569_c30_f8d4_iftrue,
MUX_uxn_opcodes_h_l569_c30_f8d4_iffalse,
MUX_uxn_opcodes_h_l569_c30_f8d4_return_output);

-- device_out_uxn_opcodes_h_l570_c23_89f5
device_out_uxn_opcodes_h_l570_c23_89f5 : entity work.device_out_0CLK_44a847cb port map (
clk,
device_out_uxn_opcodes_h_l570_c23_89f5_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l570_c23_89f5_device_address,
device_out_uxn_opcodes_h_l570_c23_89f5_value,
device_out_uxn_opcodes_h_l570_c23_89f5_phase,
device_out_uxn_opcodes_h_l570_c23_89f5_previous_device_ram_read,
device_out_uxn_opcodes_h_l570_c23_89f5_previous_ram_read,
device_out_uxn_opcodes_h_l570_c23_89f5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa
BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_left,
BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_right,
BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39
is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_cond,
is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_cond,
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024 : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_left,
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_right,
BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_return_output,
 t8_MUX_uxn_opcodes_h_l540_c2_da15_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_return_output,
 result_MUX_uxn_opcodes_h_l540_c2_da15_return_output,
 l8_MUX_uxn_opcodes_h_l540_c2_da15_return_output,
 n8_MUX_uxn_opcodes_h_l540_c2_da15_return_output,
 deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_return_output,
 deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 t8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 l8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 n8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_return_output,
 device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 t8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 l8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 n8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_return_output,
 MUX_uxn_opcodes_h_l563_c17_a2d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_return_output,
 MUX_uxn_opcodes_h_l564_c17_2ede_return_output,
 MUX_uxn_opcodes_h_l565_c8_f932_return_output,
 MUX_uxn_opcodes_h_l566_c8_5308_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_return_output,
 MUX_uxn_opcodes_h_l567_c16_4c6e_return_output,
 MUX_uxn_opcodes_h_l568_c16_4ab5_return_output,
 sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_return_output,
 MUX_uxn_opcodes_h_l569_c30_f8d4_return_output,
 device_out_uxn_opcodes_h_l570_c23_89f5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l540_c2_da15_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_cfe0_uxn_opcodes_h_l540_c2_da15_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_da15_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l553_c3_66f5 : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l545_c3_23c8 : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_f54d : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l556_c3_e5bd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_530e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l558_c7_6f7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_return_output : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_a2d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_a2d8_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_a2d8_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_a2d8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_2ede_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_2ede_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_2ede_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c17_2ede_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_f932_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_f932_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_f932_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_f932_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_5308_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_5308_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_5308_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c8_5308_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_4c6e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_4c6e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_4c6e_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_4c6e_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_4ab5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_4ab5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_4ab5_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c16_4ab5_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_f8d4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_f8d4_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_f8d4_iffalse : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l569_c30_f8d4_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_89f5_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_89f5_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_89f5_phase : unsigned(11 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_89f5_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_89f5_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_89f5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l570_c23_89f5_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_c32_1f78_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l572_c31_d6e1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l573_c26_80a9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l574_c29_0619_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l575_c22_cddf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l576_c21_46b3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_iftrue : unsigned(11 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l579_c4_6e9c : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_iffalse : unsigned(11 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l582_c4_560b : unsigned(11 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_return_output : unsigned(12 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_bdfa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_c991_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_6450_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_e407_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_e2e6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_a0ba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_9989_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_c10d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_6b56_return_output : unsigned(0 downto 0);
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
     VAR_MUX_uxn_opcodes_h_l564_c17_2ede_iftrue := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_right := to_unsigned(1, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_y := resize(to_signed(-3, 3), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_MUX_uxn_opcodes_h_l569_c30_f8d4_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_current_deo_phase_uxn_opcodes_h_l579_c4_6e9c := resize(to_unsigned(0, 1), 12);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l579_c4_6e9c;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l556_c3_e5bd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l556_c3_e5bd;
     VAR_MUX_uxn_opcodes_h_l563_c17_a2d8_iftrue := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l553_c3_66f5 := resize(to_unsigned(0, 1), 12);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l553_c3_66f5;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l545_c3_23c8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_530e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l559_c3_530e;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_f54d := resize(to_unsigned(1, 1), 4);
     VAR_MUX_uxn_opcodes_h_l563_c17_a2d8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l564_c17_2ede_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l570_c23_89f5_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_ins := VAR_ins;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := is_phase_3;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := is_phase_4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l567_c16_4c6e_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l568_c16_4ab5_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l565_c8_f932_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l566_c8_5308_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l570_c23_89f5_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l570_c23_89f5_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l565_c8_f932_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l566_c8_5308_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_left := t8;
     VAR_MUX_uxn_opcodes_h_l567_c16_4c6e_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_a0ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_a0ba_return_output := result.vram_write_layer;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_c10d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_c10d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_c991 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_c991_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_bdfa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_bdfa_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l564_c17_c253] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_left;
     BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_return_output := BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l540_c2_da15] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l540_c2_da15_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l545_c3_23c8,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l550_c3_f54d,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_6450 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_6450_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l558_c11_2aeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_left;
     BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output := BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l540_c6_096e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_left;
     BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output := BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_e407 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_e407_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l555_c11_2f32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_left;
     BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output := BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l582_c4_9024] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_left;
     BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_return_output := BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l569_c43_cb11] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_ins;
     sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_x <= VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_x;
     sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_y <= VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_return_output := sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l558_c7_6f7b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l563_c17_0fec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_left;
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_return_output := BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_e2e6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_e2e6_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l567_c32_891c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_9989 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_9989_return_output := result.is_device_ram_write;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_da15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_da15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l540_c2_da15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_da15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l540_c6_096e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l555_c11_2f32_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l558_c11_2aeb_return_output;
     VAR_MUX_uxn_opcodes_h_l563_c17_a2d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_0fec_return_output;
     VAR_MUX_uxn_opcodes_h_l564_c17_2ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c17_c253_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_4c6e_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l567_c32_891c_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l582_c4_560b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l582_c4_9024_return_output, 12);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_c10d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_c10d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_c991_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_c991_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_9989_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_9989_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_e407_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_e407_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_bdfa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_bdfa_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_a0ba_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_a0ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_6450_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_6450_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_e2e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l555_l558_DUPLICATE_e2e6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l540_c2_da15_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l540_c2_da15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l558_c7_6f7b_return_output;
     VAR_MUX_uxn_opcodes_h_l569_c30_f8d4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l569_c43_cb11_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l582_c4_560b;
     -- t8_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_t8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     t8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     t8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := t8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- MUX[uxn_opcodes_h_l563_c17_a2d8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l563_c17_a2d8_cond <= VAR_MUX_uxn_opcodes_h_l563_c17_a2d8_cond;
     MUX_uxn_opcodes_h_l563_c17_a2d8_iftrue <= VAR_MUX_uxn_opcodes_h_l563_c17_a2d8_iftrue;
     MUX_uxn_opcodes_h_l563_c17_a2d8_iffalse <= VAR_MUX_uxn_opcodes_h_l563_c17_a2d8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l563_c17_a2d8_return_output := MUX_uxn_opcodes_h_l563_c17_a2d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- MUX[uxn_opcodes_h_l564_c17_2ede] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l564_c17_2ede_cond <= VAR_MUX_uxn_opcodes_h_l564_c17_2ede_cond;
     MUX_uxn_opcodes_h_l564_c17_2ede_iftrue <= VAR_MUX_uxn_opcodes_h_l564_c17_2ede_iftrue;
     MUX_uxn_opcodes_h_l564_c17_2ede_iffalse <= VAR_MUX_uxn_opcodes_h_l564_c17_2ede_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l564_c17_2ede_return_output := MUX_uxn_opcodes_h_l564_c17_2ede_return_output;

     -- MUX[uxn_opcodes_h_l567_c16_4c6e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l567_c16_4c6e_cond <= VAR_MUX_uxn_opcodes_h_l567_c16_4c6e_cond;
     MUX_uxn_opcodes_h_l567_c16_4c6e_iftrue <= VAR_MUX_uxn_opcodes_h_l567_c16_4c6e_iftrue;
     MUX_uxn_opcodes_h_l567_c16_4c6e_iffalse <= VAR_MUX_uxn_opcodes_h_l567_c16_4c6e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l567_c16_4c6e_return_output := MUX_uxn_opcodes_h_l567_c16_4c6e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;
     VAR_MUX_uxn_opcodes_h_l565_c8_f932_cond := VAR_MUX_uxn_opcodes_h_l563_c17_a2d8_return_output;
     VAR_MUX_uxn_opcodes_h_l569_c30_f8d4_cond := VAR_MUX_uxn_opcodes_h_l563_c17_a2d8_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_MUX_uxn_opcodes_h_l563_c17_a2d8_return_output;
     VAR_MUX_uxn_opcodes_h_l566_c8_5308_cond := VAR_MUX_uxn_opcodes_h_l564_c17_2ede_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_MUX_uxn_opcodes_h_l564_c17_2ede_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_MUX_uxn_opcodes_h_l567_c16_4c6e_return_output;
     VAR_device_out_uxn_opcodes_h_l570_c23_89f5_device_address := VAR_MUX_uxn_opcodes_h_l567_c16_4c6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     -- t8_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_t8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     t8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     t8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := t8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- MUX[uxn_opcodes_h_l566_c8_5308] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l566_c8_5308_cond <= VAR_MUX_uxn_opcodes_h_l566_c8_5308_cond;
     MUX_uxn_opcodes_h_l566_c8_5308_iftrue <= VAR_MUX_uxn_opcodes_h_l566_c8_5308_iftrue;
     MUX_uxn_opcodes_h_l566_c8_5308_iffalse <= VAR_MUX_uxn_opcodes_h_l566_c8_5308_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l566_c8_5308_return_output := MUX_uxn_opcodes_h_l566_c8_5308_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- MUX[uxn_opcodes_h_l565_c8_f932] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l565_c8_f932_cond <= VAR_MUX_uxn_opcodes_h_l565_c8_f932_cond;
     MUX_uxn_opcodes_h_l565_c8_f932_iftrue <= VAR_MUX_uxn_opcodes_h_l565_c8_f932_iftrue;
     MUX_uxn_opcodes_h_l565_c8_f932_iffalse <= VAR_MUX_uxn_opcodes_h_l565_c8_f932_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l565_c8_f932_return_output := MUX_uxn_opcodes_h_l565_c8_f932_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- MUX[uxn_opcodes_h_l569_c30_f8d4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l569_c30_f8d4_cond <= VAR_MUX_uxn_opcodes_h_l569_c30_f8d4_cond;
     MUX_uxn_opcodes_h_l569_c30_f8d4_iftrue <= VAR_MUX_uxn_opcodes_h_l569_c30_f8d4_iftrue;
     MUX_uxn_opcodes_h_l569_c30_f8d4_iffalse <= VAR_MUX_uxn_opcodes_h_l569_c30_f8d4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l569_c30_f8d4_return_output := MUX_uxn_opcodes_h_l569_c30_f8d4_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c16_4ab5_iffalse := VAR_MUX_uxn_opcodes_h_l565_c8_f932_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_MUX_uxn_opcodes_h_l565_c8_f932_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c16_4ab5_iftrue := VAR_MUX_uxn_opcodes_h_l566_c8_5308_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_MUX_uxn_opcodes_h_l566_c8_5308_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_MUX_uxn_opcodes_h_l569_c30_f8d4_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse := VAR_t8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;
     -- MUX[uxn_opcodes_h_l568_c16_4ab5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l568_c16_4ab5_cond <= VAR_MUX_uxn_opcodes_h_l568_c16_4ab5_cond;
     MUX_uxn_opcodes_h_l568_c16_4ab5_iftrue <= VAR_MUX_uxn_opcodes_h_l568_c16_4ab5_iftrue;
     MUX_uxn_opcodes_h_l568_c16_4ab5_iffalse <= VAR_MUX_uxn_opcodes_h_l568_c16_4ab5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l568_c16_4ab5_return_output := MUX_uxn_opcodes_h_l568_c16_4ab5_return_output;

     -- t8_MUX[uxn_opcodes_h_l540_c2_da15] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l540_c2_da15_cond <= VAR_t8_MUX_uxn_opcodes_h_l540_c2_da15_cond;
     t8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue;
     t8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l540_c2_da15_return_output := t8_MUX_uxn_opcodes_h_l540_c2_da15_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l562_c1_9008] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- n8_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_n8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     n8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     n8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := n8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- l8_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_l8_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     l8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     l8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := l8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l570_c23_89f5_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l562_c1_9008_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_MUX_uxn_opcodes_h_l568_c16_4ab5_return_output;
     VAR_device_out_uxn_opcodes_h_l570_c23_89f5_value := VAR_MUX_uxn_opcodes_h_l568_c16_4ab5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_l8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l540_c2_da15_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- device_out[uxn_opcodes_h_l570_c23_89f5] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l570_c23_89f5_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l570_c23_89f5_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l570_c23_89f5_device_address <= VAR_device_out_uxn_opcodes_h_l570_c23_89f5_device_address;
     device_out_uxn_opcodes_h_l570_c23_89f5_value <= VAR_device_out_uxn_opcodes_h_l570_c23_89f5_value;
     device_out_uxn_opcodes_h_l570_c23_89f5_phase <= VAR_device_out_uxn_opcodes_h_l570_c23_89f5_phase;
     device_out_uxn_opcodes_h_l570_c23_89f5_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l570_c23_89f5_previous_device_ram_read;
     device_out_uxn_opcodes_h_l570_c23_89f5_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l570_c23_89f5_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l570_c23_89f5_return_output := device_out_uxn_opcodes_h_l570_c23_89f5_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l540_c2_da15] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_cond;
     deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_return_output := deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_return_output;

     -- l8_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_l8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     l8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     l8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := l8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l540_c2_da15] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_cond;
     is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_return_output := is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_return_output;

     -- n8_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_n8_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     n8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     n8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := n8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l540_c2_da15] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_cond;
     is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_return_output := is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l540_c2_da15_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_device_out_uxn_opcodes_h_l570_c23_89f5_return_output;
     REG_VAR_is_phase_3 := VAR_is_phase_3_MUX_uxn_opcodes_h_l540_c2_da15_return_output;
     REG_VAR_is_phase_4 := VAR_is_phase_4_MUX_uxn_opcodes_h_l540_c2_da15_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse := VAR_l8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse := VAR_n8_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l571_c32_1f78] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_c32_1f78_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_89f5_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l574_c29_0619] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l574_c29_0619_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_89f5_return_output.vram_write_layer;

     -- n8_MUX[uxn_opcodes_h_l540_c2_da15] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l540_c2_da15_cond <= VAR_n8_MUX_uxn_opcodes_h_l540_c2_da15_cond;
     n8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue;
     n8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l540_c2_da15_return_output := n8_MUX_uxn_opcodes_h_l540_c2_da15_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l575_c22_cddf] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l575_c22_cddf_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_89f5_return_output.u16_addr;

     -- l8_MUX[uxn_opcodes_h_l540_c2_da15] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l540_c2_da15_cond <= VAR_l8_MUX_uxn_opcodes_h_l540_c2_da15_cond;
     l8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l540_c2_da15_iftrue;
     l8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l540_c2_da15_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l540_c2_da15_return_output := l8_MUX_uxn_opcodes_h_l540_c2_da15_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l576_c21_46b3] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l576_c21_46b3_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_89f5_return_output.u8_value;

     -- device_out_result_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l572_c31_d6e1] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l572_c31_d6e1_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_89f5_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l573_c26_80a9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l573_c26_80a9_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_89f5_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_6b56 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_6b56_return_output := VAR_device_out_uxn_opcodes_h_l570_c23_89f5_return_output.is_deo_done;

     -- deo_param1_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l575_c22_cddf_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_6b56_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_6b56_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l578_l577_DUPLICATE_6b56_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l571_c32_1f78_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l573_c26_80a9_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l574_c29_0619_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l572_c31_d6e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l576_c21_46b3_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l540_c2_da15_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l540_c2_da15_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l577_c24_9efa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_left;
     BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_return_output := BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l578_c3_ab39] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_return_output := current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l578_c3_ab39] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_cond;
     is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_return_output := is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l540_c2_da15] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_cond;
     deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_return_output := deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l577_c24_9efa_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c3_ab39_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l540_c2_da15_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c3_ab39_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l540_c2_da15] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_cond;
     device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_return_output := device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l558_c7_6f7b] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output := current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l540_c2_da15_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l558_c7_6f7b_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l555_c7_0fd9] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_cond;
     is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output := is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l540_c2_da15] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_cond;
     is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_return_output := is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l540_c2_da15] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_return_output := current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_cfe0[uxn_opcodes_h_l540_c2_da15] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_cfe0_uxn_opcodes_h_l540_c2_da15_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cfe0(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l555_c7_0fd9_return_output);

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l540_c2_da15_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l540_c2_da15_return_output;
     VAR_result_MUX_uxn_opcodes_h_l540_c2_da15_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_cfe0_uxn_opcodes_h_l540_c2_da15_return_output;
     -- result_MUX[uxn_opcodes_h_l540_c2_da15] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l540_c2_da15_cond <= VAR_result_MUX_uxn_opcodes_h_l540_c2_da15_cond;
     result_MUX_uxn_opcodes_h_l540_c2_da15_iftrue <= VAR_result_MUX_uxn_opcodes_h_l540_c2_da15_iftrue;
     result_MUX_uxn_opcodes_h_l540_c2_da15_iffalse <= VAR_result_MUX_uxn_opcodes_h_l540_c2_da15_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l540_c2_da15_return_output := result_MUX_uxn_opcodes_h_l540_c2_da15_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l540_c2_da15_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l540_c2_da15_return_output;
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
