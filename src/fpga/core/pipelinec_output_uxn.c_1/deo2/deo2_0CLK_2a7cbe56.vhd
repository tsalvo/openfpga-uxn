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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 153
entity deo2_0CLK_2a7cbe56 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_2a7cbe56;
architecture arch of deo2_0CLK_2a7cbe56 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l570_c6_181b]
signal BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal n8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal l8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal t8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(31 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l570_c2_2ce4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l577_c11_1d72]
signal BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal n8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal l8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal t8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(31 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l577_c7_8bb7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l580_c11_934b]
signal BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal n8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal l8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal t8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(31 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l580_c7_ea1e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l584_c11_82de]
signal BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal n8_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal l8_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(31 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c7_ddcf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l587_c11_995d]
signal BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l591_c7_92c0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal n8_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal l8_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(31 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l587_c7_3b7e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l591_c11_7582]
signal BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l594_c7_db19]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l591_c7_92c0]
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l591_c7_92c0]
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l591_c7_92c0]
signal l8_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l591_c7_92c0]
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l591_c7_92c0]
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l591_c7_92c0]
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l591_c7_92c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l591_c7_92c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l591_c7_92c0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l591_c7_92c0]
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l591_c7_92c0]
signal result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l591_c7_92c0]
signal result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l591_c7_92c0]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l591_c7_92c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l591_c7_92c0]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l591_c7_92c0]
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(31 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l591_c7_92c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l594_c11_db20]
signal BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l600_c1_0ba7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l594_c7_db19]
signal device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_return_output : device_out_result_t;

-- is_second_deo_MUX[uxn_opcodes_h_l594_c7_db19]
signal is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l594_c7_db19]
signal l8_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l594_c7_db19]
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l594_c7_db19]
signal deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l594_c7_db19]
signal deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l594_c7_db19]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l594_c7_db19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l594_c7_db19]
signal result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l594_c7_db19]
signal result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l594_c7_db19]
signal result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l594_c7_db19]
signal result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l594_c7_db19]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l594_c7_db19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l594_c7_db19]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l594_c7_db19]
signal result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(31 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l594_c7_db19]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l598_c32_6611]
signal BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l598_c32_d41f]
signal BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l598_c32_6f36]
signal MUX_uxn_opcodes_h_l598_c32_6f36_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l598_c32_6f36_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l598_c32_6f36_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l598_c32_6f36_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l602_c32_e71c]
signal BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l602_c16_1b60]
signal MUX_uxn_opcodes_h_l602_c16_1b60_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l602_c16_1b60_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l602_c16_1b60_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l602_c16_1b60_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l603_c16_abee]
signal MUX_uxn_opcodes_h_l603_c16_abee_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l603_c16_abee_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l603_c16_abee_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l603_c16_abee_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l604_c23_b1c2]
signal device_out_uxn_opcodes_h_l604_c23_b1c2_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l604_c23_b1c2_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l604_c23_b1c2_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l604_c23_b1c2_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l604_c23_b1c2_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l604_c23_b1c2_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l612_c24_26f7]
signal BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l613_c3_f71f]
signal is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l613_c3_f71f]
signal current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l617_c4_72ce]
signal BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_6b0b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.device_ram_value := ref_toks_5;
      base.vram_value := ref_toks_6;
      base.is_device_ram_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.vram_write_layer := ref_toks_9;
      base.vram_address := ref_toks_10;
      base.is_sp_shift := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b
BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_left,
BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_right,
BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4
device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4
is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- n8_MUX_uxn_opcodes_h_l570_c2_2ce4
n8_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
n8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
n8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
n8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- l8_MUX_uxn_opcodes_h_l570_c2_2ce4
l8_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
l8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
l8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
l8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4
current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4
deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4
deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- t8_MUX_uxn_opcodes_h_l570_c2_2ce4
t8_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
t8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
t8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
t8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4
result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4
result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4
result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4
result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4
result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4
result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4
result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4
result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72
BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_left,
BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_right,
BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7
device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7
is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- n8_MUX_uxn_opcodes_h_l577_c7_8bb7
n8_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
n8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
n8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
n8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- l8_MUX_uxn_opcodes_h_l577_c7_8bb7
l8_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
l8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
l8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
l8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7
deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7
deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- t8_MUX_uxn_opcodes_h_l577_c7_8bb7
t8_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
t8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
t8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
t8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7
result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7
result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7
result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7
result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b
BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_left,
BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_right,
BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e
device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e
is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- n8_MUX_uxn_opcodes_h_l580_c7_ea1e
n8_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
n8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
n8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
n8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- l8_MUX_uxn_opcodes_h_l580_c7_ea1e
l8_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
l8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
l8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
l8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e
current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e
deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e
deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- t8_MUX_uxn_opcodes_h_l580_c7_ea1e
t8_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
t8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
t8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
t8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e
result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e
result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e
result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e
result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e
result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e
result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e
result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e
result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e
result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e
result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de
BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_left,
BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_right,
BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf
device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf
is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- n8_MUX_uxn_opcodes_h_l584_c7_ddcf
n8_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
n8_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
n8_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
n8_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- l8_MUX_uxn_opcodes_h_l584_c7_ddcf
l8_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
l8_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
l8_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
l8_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf
deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf
deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf
result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf
result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf
result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf
result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d
BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_left,
BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_right,
BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e
device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e
is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- n8_MUX_uxn_opcodes_h_l587_c7_3b7e
n8_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
n8_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
n8_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
n8_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- l8_MUX_uxn_opcodes_h_l587_c7_3b7e
l8_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
l8_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
l8_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
l8_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e
current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e
deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e
deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e
result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e
result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e
result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e
result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e
result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e
result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e
result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e
result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e
result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e
result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582
BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_left,
BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_right,
BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0
device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0
is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- l8_MUX_uxn_opcodes_h_l591_c7_92c0
l8_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
l8_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
l8_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
l8_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0
deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0
deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0
result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0
result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0
result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0
result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20
BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_left,
BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_right,
BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l594_c7_db19
device_out_result_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_cond,
device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19
is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_cond,
is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- l8_MUX_uxn_opcodes_h_l594_c7_db19
l8_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l594_c7_db19_cond,
l8_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
l8_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
l8_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19
current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_cond,
current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l594_c7_db19
deo_param0_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_cond,
deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l594_c7_db19
deo_param1_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_cond,
deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19
result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19
result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19
result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19
result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19
result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_cond,
result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19
result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19
result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19
result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19
result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_cond,
result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19
result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l598_c32_6611
BIN_OP_AND_uxn_opcodes_h_l598_c32_6611 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_left,
BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_right,
BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f
BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_left,
BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_right,
BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_return_output);

-- MUX_uxn_opcodes_h_l598_c32_6f36
MUX_uxn_opcodes_h_l598_c32_6f36 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l598_c32_6f36_cond,
MUX_uxn_opcodes_h_l598_c32_6f36_iftrue,
MUX_uxn_opcodes_h_l598_c32_6f36_iffalse,
MUX_uxn_opcodes_h_l598_c32_6f36_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c
BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_left,
BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_right,
BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_return_output);

-- MUX_uxn_opcodes_h_l602_c16_1b60
MUX_uxn_opcodes_h_l602_c16_1b60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l602_c16_1b60_cond,
MUX_uxn_opcodes_h_l602_c16_1b60_iftrue,
MUX_uxn_opcodes_h_l602_c16_1b60_iffalse,
MUX_uxn_opcodes_h_l602_c16_1b60_return_output);

-- MUX_uxn_opcodes_h_l603_c16_abee
MUX_uxn_opcodes_h_l603_c16_abee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l603_c16_abee_cond,
MUX_uxn_opcodes_h_l603_c16_abee_iftrue,
MUX_uxn_opcodes_h_l603_c16_abee_iffalse,
MUX_uxn_opcodes_h_l603_c16_abee_return_output);

-- device_out_uxn_opcodes_h_l604_c23_b1c2
device_out_uxn_opcodes_h_l604_c23_b1c2 : entity work.device_out_0CLK_45b69247 port map (
clk,
device_out_uxn_opcodes_h_l604_c23_b1c2_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l604_c23_b1c2_device_address,
device_out_uxn_opcodes_h_l604_c23_b1c2_value,
device_out_uxn_opcodes_h_l604_c23_b1c2_phase,
device_out_uxn_opcodes_h_l604_c23_b1c2_previous_device_ram_read,
device_out_uxn_opcodes_h_l604_c23_b1c2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7
BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_left,
BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_right,
BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f
is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_cond,
is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f
current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_cond,
current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce
BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_left,
BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_right,
BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 n8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 l8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 t8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 n8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 l8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 t8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 n8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 l8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 t8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 n8_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 l8_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 n8_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 l8_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 l8_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_return_output,
 device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 l8_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_return_output,
 BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_return_output,
 BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_return_output,
 MUX_uxn_opcodes_h_l598_c32_6f36_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_return_output,
 MUX_uxn_opcodes_h_l602_c16_1b60_return_output,
 MUX_uxn_opcodes_h_l603_c16_abee_return_output,
 device_out_uxn_opcodes_h_l604_c23_b1c2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l575_c3_aacf : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_31bb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l578_c3_6b22 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l582_c3_ee44 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l585_c3_d5a5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l589_c3_31dd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l592_c3_9b83 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l596_c3_7008 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l594_c7_db19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l598_c32_6f36_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l598_c32_6f36_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l598_c32_6f36_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l598_c32_6f36_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l602_c16_1b60_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l602_c16_1b60_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l602_c16_1b60_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l602_c16_1b60_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l603_c16_abee_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l603_c16_abee_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l603_c16_abee_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l603_c16_abee_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l605_c32_9ac7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_c31_ad3a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l607_c29_4105_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l608_c26_43fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l609_c29_d1d8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l610_c25_ffb1_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l611_c23_88ce_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l614_c4_8055 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l617_c4_ca04 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ff17_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ed9f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_429b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_b4e1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_22d5_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_24dc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_2d7a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_523c_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l570_l587_DUPLICATE_76fd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l587_DUPLICATE_c390_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l613_l612_DUPLICATE_b666_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6b0b_uxn_opcodes_h_l621_l563_DUPLICATE_ab5c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l596_c3_7008 := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l596_c3_7008;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l582_c3_ee44 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l582_c3_ee44;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l585_c3_d5a5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l585_c3_d5a5;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l592_c3_9b83 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l592_c3_9b83;
     VAR_MUX_uxn_opcodes_h_l598_c32_6f36_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l589_c3_31dd := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l589_c3_31dd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l578_c3_6b22 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l578_c3_6b22;
     VAR_current_deo_phase_uxn_opcodes_h_l614_c4_8055 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l614_c4_8055;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l598_c32_6f36_iffalse := resize(to_signed(-3, 3), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l575_c3_aacf := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l575_c3_aacf;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_31bb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_31bb;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l602_c16_1b60_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l603_c16_abee_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l603_c16_abee_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l603_c16_abee_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_left := t8;
     VAR_MUX_uxn_opcodes_h_l602_c16_1b60_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l577_c11_1d72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_left;
     BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output := BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l587_c11_995d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_left;
     BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output := BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l598_c32_6611] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_left;
     BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_return_output := BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l570_l587_DUPLICATE_76fd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l570_l587_DUPLICATE_76fd_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ff17 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ff17_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l580_c11_934b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_left;
     BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output := BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l591_c11_7582] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_left;
     BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output := BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;

     -- MUX[uxn_opcodes_h_l603_c16_abee] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l603_c16_abee_cond <= VAR_MUX_uxn_opcodes_h_l603_c16_abee_cond;
     MUX_uxn_opcodes_h_l603_c16_abee_iftrue <= VAR_MUX_uxn_opcodes_h_l603_c16_abee_iftrue;
     MUX_uxn_opcodes_h_l603_c16_abee_iffalse <= VAR_MUX_uxn_opcodes_h_l603_c16_abee_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l603_c16_abee_return_output := MUX_uxn_opcodes_h_l603_c16_abee_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l587_DUPLICATE_c390 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l587_DUPLICATE_c390_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_2d7a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_2d7a_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_22d5 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_22d5_return_output := result.vram_value;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_523c LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_523c_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l570_c6_181b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_left;
     BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output := BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l594_c11_db20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_left;
     BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output := BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_429b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_429b_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l584_c11_82de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_left;
     BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output := BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l602_c32_e71c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l617_c4_72ce] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_left;
     BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_return_output := BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_b4e1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_b4e1_return_output := result.device_ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ed9f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ed9f_return_output := result.is_vram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l594_c7_db19_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_24dc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_24dc_return_output := result.is_device_ram_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_6611_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_181b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_1d72_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_934b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_82de_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_995d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_7582_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_db20_return_output;
     VAR_MUX_uxn_opcodes_h_l602_c16_1b60_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_e71c_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l617_c4_ca04 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_72ce_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ff17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ff17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ff17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ff17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ff17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ff17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ff17_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_24dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_24dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_24dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_24dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_24dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_24dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_24dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l587_DUPLICATE_c390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l587_DUPLICATE_c390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l587_DUPLICATE_c390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l587_DUPLICATE_c390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l587_DUPLICATE_c390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l587_DUPLICATE_c390_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l570_l587_DUPLICATE_76fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l570_l587_DUPLICATE_76fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l570_l587_DUPLICATE_76fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l570_l587_DUPLICATE_76fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l570_l587_DUPLICATE_76fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l577_l591_l580_l570_l587_DUPLICATE_76fd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ed9f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ed9f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ed9f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ed9f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ed9f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ed9f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_ed9f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_2d7a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_2d7a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_2d7a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_2d7a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_2d7a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_2d7a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_2d7a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_22d5_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_22d5_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_22d5_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_22d5_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_22d5_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_22d5_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_22d5_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_523c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_523c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_523c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_523c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_523c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_523c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_523c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_429b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_429b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_429b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_429b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_429b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_429b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_429b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_b4e1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_b4e1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_b4e1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_b4e1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_b4e1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_b4e1_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l584_l577_l591_l580_l594_l570_l587_DUPLICATE_b4e1_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_MUX_uxn_opcodes_h_l603_c16_abee_return_output;
     VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_value := VAR_MUX_uxn_opcodes_h_l603_c16_abee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l617_c4_ca04;
     -- l8_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_l8_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     l8_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     l8_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l594_c7_db19_return_output := l8_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l598_c32_d41f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_left;
     BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_return_output := BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_return_output;

     -- MUX[uxn_opcodes_h_l602_c16_1b60] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l602_c16_1b60_cond <= VAR_MUX_uxn_opcodes_h_l602_c16_1b60_cond;
     MUX_uxn_opcodes_h_l602_c16_1b60_iftrue <= VAR_MUX_uxn_opcodes_h_l602_c16_1b60_iftrue;
     MUX_uxn_opcodes_h_l602_c16_1b60_iffalse <= VAR_MUX_uxn_opcodes_h_l602_c16_1b60_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l602_c16_1b60_return_output := MUX_uxn_opcodes_h_l602_c16_1b60_return_output;

     -- n8_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_n8_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     n8_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     n8_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := n8_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- t8_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_t8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     t8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     t8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := t8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_return_output := deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l598_c32_6f36_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_d41f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_MUX_uxn_opcodes_h_l602_c16_1b60_return_output;
     VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_device_address := VAR_MUX_uxn_opcodes_h_l602_c16_1b60_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_l8_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_n8_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     -- t8_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_t8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     t8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     t8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := t8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- MUX[uxn_opcodes_h_l598_c32_6f36] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l598_c32_6f36_cond <= VAR_MUX_uxn_opcodes_h_l598_c32_6f36_cond;
     MUX_uxn_opcodes_h_l598_c32_6f36_iftrue <= VAR_MUX_uxn_opcodes_h_l598_c32_6f36_iftrue;
     MUX_uxn_opcodes_h_l598_c32_6f36_iffalse <= VAR_MUX_uxn_opcodes_h_l598_c32_6f36_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l598_c32_6f36_return_output := MUX_uxn_opcodes_h_l598_c32_6f36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- l8_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_l8_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     l8_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     l8_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := l8_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_return_output := deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- n8_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_n8_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     n8_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     n8_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := n8_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_iftrue := VAR_MUX_uxn_opcodes_h_l598_c32_6f36_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_l8_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     -- l8_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_l8_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     l8_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     l8_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := l8_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- t8_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_t8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     t8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     t8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := t8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- n8_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_n8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     n8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     n8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := n8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_l8_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- n8_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_n8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     n8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     n8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := n8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- l8_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_l8_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     l8_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     l8_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := l8_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_l8_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- n8_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_n8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     n8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     n8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := n8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- l8_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_l8_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     l8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     l8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := l8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_l8_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     -- l8_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_l8_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     l8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     l8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := l8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_l8_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l600_c1_0ba7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- l8_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_l8_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     l8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     l8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := l8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_0ba7_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- device_out[uxn_opcodes_h_l604_c23_b1c2] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l604_c23_b1c2_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l604_c23_b1c2_device_address <= VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_device_address;
     device_out_uxn_opcodes_h_l604_c23_b1c2_value <= VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_value;
     device_out_uxn_opcodes_h_l604_c23_b1c2_phase <= VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_phase;
     device_out_uxn_opcodes_h_l604_c23_b1c2_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_return_output := device_out_uxn_opcodes_h_l604_c23_b1c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l613_l612_DUPLICATE_b666 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l613_l612_DUPLICATE_b666_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l605_c32_9ac7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l605_c32_9ac7_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l606_c31_ad3a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_c31_ad3a_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l609_c29_d1d8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l609_c29_d1d8_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_return_output.vram_write_layer;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l610_c25_ffb1] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l610_c25_ffb1_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l608_c26_43fb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l608_c26_43fb_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_return_output.is_vram_write;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l611_c23_88ce] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l611_c23_88ce_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_return_output.vram_value;

     -- device_out_result_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_return_output := device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l607_c29_4105] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l607_c29_4105_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_b1c2_return_output.device_ram_value;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l613_l612_DUPLICATE_b666_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l613_l612_DUPLICATE_b666_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l613_l612_DUPLICATE_b666_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l605_c32_9ac7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l608_c26_43fb_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l609_c29_d1d8_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l611_c23_88ce_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l610_c25_ffb1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_c31_ad3a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l607_c29_4105_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l613_c3_f71f] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_cond;
     is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_return_output := is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l613_c3_f71f] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_return_output := current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_return_output := result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l612_c24_26f7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_left;
     BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_return_output := BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_return_output := result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_26f7_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_f71f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_f71f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_return_output := current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_return_output := is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l594_c7_db19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_db19_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l591_c7_92c0] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_return_output := current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_92c0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l587_c7_3b7e] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output := current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_3b7e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l584_c7_ddcf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_ddcf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l580_c7_ea1e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_ea1e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l577_c7_8bb7] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_cond;
     is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output := is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_8bb7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l570_c2_2ce4] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output := current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6b0b_uxn_opcodes_h_l621_l563_DUPLICATE_ab5c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6b0b_uxn_opcodes_h_l621_l563_DUPLICATE_ab5c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6b0b(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_2ce4_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6b0b_uxn_opcodes_h_l621_l563_DUPLICATE_ab5c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6b0b_uxn_opcodes_h_l621_l563_DUPLICATE_ab5c_return_output;
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
