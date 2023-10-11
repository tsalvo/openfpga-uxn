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
-- Submodules: 155
entity deo2_0CLK_bb5893d2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_bb5893d2;
architecture arch of deo2_0CLK_bb5893d2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l570_c6_de07]
signal BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l570_c1_a9b1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l577_c7_568a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l570_c2_172e]
signal n8_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l570_c2_172e]
signal device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l570_c2_172e]
signal current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l570_c2_172e]
signal deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l570_c2_172e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l570_c2_172e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l570_c2_172e]
signal result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l570_c2_172e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l570_c2_172e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l570_c2_172e]
signal result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l570_c2_172e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l570_c2_172e]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l570_c2_172e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_return_output : signed(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l570_c2_172e]
signal result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l570_c2_172e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l570_c2_172e]
signal deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l570_c2_172e]
signal l8_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l570_c2_172e]
signal is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l570_c2_172e]
signal t8_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l571_c3_d7d0[uxn_opcodes_h_l571_c3_d7d0]
signal printf_uxn_opcodes_h_l571_c3_d7d0_uxn_opcodes_h_l571_c3_d7d0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l577_c11_f245]
signal BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l580_c7_b557]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l577_c7_568a]
signal n8_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l577_c7_568a]
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l577_c7_568a]
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l577_c7_568a]
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l577_c7_568a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l577_c7_568a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l577_c7_568a]
signal result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l577_c7_568a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l577_c7_568a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l577_c7_568a]
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l577_c7_568a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l577_c7_568a]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l577_c7_568a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_return_output : signed(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l577_c7_568a]
signal result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l577_c7_568a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l577_c7_568a]
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l577_c7_568a]
signal l8_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l577_c7_568a]
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l577_c7_568a]
signal t8_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l580_c11_56c0]
signal BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c7_e158]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l580_c7_b557]
signal n8_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l580_c7_b557]
signal device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l580_c7_b557]
signal current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l580_c7_b557]
signal deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l580_c7_b557]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l580_c7_b557]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l580_c7_b557]
signal result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l580_c7_b557]
signal result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l580_c7_b557]
signal result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l580_c7_b557]
signal result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l580_c7_b557]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l580_c7_b557]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l580_c7_b557]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_return_output : signed(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l580_c7_b557]
signal result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l580_c7_b557]
signal result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l580_c7_b557]
signal deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l580_c7_b557]
signal l8_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l580_c7_b557]
signal is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l580_c7_b557]
signal t8_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l584_c11_0e90]
signal BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l587_c7_a652]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l584_c7_e158]
signal n8_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l584_c7_e158]
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l584_c7_e158]
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l584_c7_e158]
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c7_e158]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c7_e158]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l584_c7_e158]
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l584_c7_e158]
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l584_c7_e158]
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l584_c7_e158]
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l584_c7_e158]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l584_c7_e158]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c7_e158]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_return_output : signed(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l584_c7_e158]
signal result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l584_c7_e158]
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l584_c7_e158]
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l584_c7_e158]
signal l8_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l584_c7_e158]
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l587_c11_506e]
signal BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l591_c7_4974]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l587_c7_a652]
signal n8_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l587_c7_a652]
signal device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l587_c7_a652]
signal current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l587_c7_a652]
signal deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l587_c7_a652]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l587_c7_a652]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l587_c7_a652]
signal result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l587_c7_a652]
signal result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l587_c7_a652]
signal result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l587_c7_a652]
signal result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l587_c7_a652]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l587_c7_a652]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l587_c7_a652]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_return_output : signed(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l587_c7_a652]
signal result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l587_c7_a652]
signal result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l587_c7_a652]
signal deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l587_c7_a652]
signal l8_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l587_c7_a652]
signal is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l591_c11_fdbd]
signal BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l594_c7_7a15]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l591_c7_4974]
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l591_c7_4974]
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l591_c7_4974]
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l591_c7_4974]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l591_c7_4974]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l591_c7_4974]
signal result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l591_c7_4974]
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l591_c7_4974]
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l591_c7_4974]
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l591_c7_4974]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l591_c7_4974]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l591_c7_4974]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_return_output : signed(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l591_c7_4974]
signal result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l591_c7_4974]
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l591_c7_4974]
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l591_c7_4974]
signal l8_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l591_c7_4974]
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l594_c11_1ab2]
signal BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l600_c1_2003]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l594_c7_7a15]
signal device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : device_out_result_t;

-- current_deo_phase_MUX[uxn_opcodes_h_l594_c7_7a15]
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l594_c7_7a15]
signal deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l594_c7_7a15]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l594_c7_7a15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l594_c7_7a15]
signal result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l594_c7_7a15]
signal result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l594_c7_7a15]
signal result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l594_c7_7a15]
signal result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l594_c7_7a15]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l594_c7_7a15]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l594_c7_7a15]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : signed(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l594_c7_7a15]
signal result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l594_c7_7a15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l594_c7_7a15]
signal deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l594_c7_7a15]
signal l8_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l594_c7_7a15]
signal is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l598_c32_cc9c]
signal BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l598_c32_a966]
signal BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l598_c32_6c47]
signal MUX_uxn_opcodes_h_l598_c32_6c47_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l598_c32_6c47_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l598_c32_6c47_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l598_c32_6c47_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l602_c32_fd39]
signal BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l602_c16_ba77]
signal MUX_uxn_opcodes_h_l602_c16_ba77_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l602_c16_ba77_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l602_c16_ba77_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l602_c16_ba77_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l603_c16_f92e]
signal MUX_uxn_opcodes_h_l603_c16_f92e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l603_c16_f92e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l603_c16_f92e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l603_c16_f92e_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l604_c23_d681]
signal device_out_uxn_opcodes_h_l604_c23_d681_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l604_c23_d681_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l604_c23_d681_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l604_c23_d681_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l604_c23_d681_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l604_c23_d681_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l612_c24_1d5b]
signal BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l613_c3_2e50]
signal current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l613_c3_2e50]
signal is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l617_c4_c705]
signal BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_95d5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.device_ram_value := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.vram_address := ref_toks_6;
      base.is_device_ram_write := ref_toks_7;
      base.vram_write_layer := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.vram_value := ref_toks_10;
      base.is_opc_done := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07
BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_left,
BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_right,
BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- n8_MUX_uxn_opcodes_h_l570_c2_172e
n8_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l570_c2_172e_cond,
n8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
n8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
n8_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l570_c2_172e
device_out_result_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_cond,
device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e
current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_cond,
current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l570_c2_172e
deo_param1_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_cond,
deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e
result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e
result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e
result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e
result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_cond,
result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e
result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e
result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e
result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_cond,
result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e
result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l570_c2_172e
deo_param0_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_cond,
deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- l8_MUX_uxn_opcodes_h_l570_c2_172e
l8_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l570_c2_172e_cond,
l8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
l8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
l8_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e
is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_cond,
is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- t8_MUX_uxn_opcodes_h_l570_c2_172e
t8_MUX_uxn_opcodes_h_l570_c2_172e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l570_c2_172e_cond,
t8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue,
t8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse,
t8_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

-- printf_uxn_opcodes_h_l571_c3_d7d0_uxn_opcodes_h_l571_c3_d7d0
printf_uxn_opcodes_h_l571_c3_d7d0_uxn_opcodes_h_l571_c3_d7d0 : entity work.printf_uxn_opcodes_h_l571_c3_d7d0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l571_c3_d7d0_uxn_opcodes_h_l571_c3_d7d0_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245
BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_left,
BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_right,
BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- n8_MUX_uxn_opcodes_h_l577_c7_568a
n8_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l577_c7_568a_cond,
n8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
n8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
n8_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l577_c7_568a
device_out_result_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_cond,
device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_cond,
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l577_c7_568a
deo_param1_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_cond,
deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a
result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a
result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_cond,
result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a
result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a
result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_cond,
result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l577_c7_568a
deo_param0_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_cond,
deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- l8_MUX_uxn_opcodes_h_l577_c7_568a
l8_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l577_c7_568a_cond,
l8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
l8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
l8_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a
is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_cond,
is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- t8_MUX_uxn_opcodes_h_l577_c7_568a
t8_MUX_uxn_opcodes_h_l577_c7_568a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l577_c7_568a_cond,
t8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue,
t8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse,
t8_MUX_uxn_opcodes_h_l577_c7_568a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0
BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_left,
BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_right,
BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- n8_MUX_uxn_opcodes_h_l580_c7_b557
n8_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l580_c7_b557_cond,
n8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
n8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
n8_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l580_c7_b557
device_out_result_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_cond,
device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557
current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_cond,
current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l580_c7_b557
deo_param1_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_cond,
deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557
result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557
result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557
result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557
result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557
result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_cond,
result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557
result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557
result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557
result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557
result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_cond,
result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557
result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l580_c7_b557
deo_param0_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_cond,
deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- l8_MUX_uxn_opcodes_h_l580_c7_b557
l8_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l580_c7_b557_cond,
l8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
l8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
l8_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557
is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_cond,
is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- t8_MUX_uxn_opcodes_h_l580_c7_b557
t8_MUX_uxn_opcodes_h_l580_c7_b557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l580_c7_b557_cond,
t8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue,
t8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse,
t8_MUX_uxn_opcodes_h_l580_c7_b557_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90
BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_left,
BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_right,
BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- n8_MUX_uxn_opcodes_h_l584_c7_e158
n8_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l584_c7_e158_cond,
n8_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
n8_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
n8_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l584_c7_e158
device_out_result_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_cond,
device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_cond,
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l584_c7_e158
deo_param1_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_cond,
deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158
result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158
result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_cond,
result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158
result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158
result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_cond,
result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l584_c7_e158
deo_param0_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_cond,
deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- l8_MUX_uxn_opcodes_h_l584_c7_e158
l8_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l584_c7_e158_cond,
l8_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
l8_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
l8_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158
is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_cond,
is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e
BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_left,
BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_right,
BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- n8_MUX_uxn_opcodes_h_l587_c7_a652
n8_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l587_c7_a652_cond,
n8_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
n8_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
n8_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l587_c7_a652
device_out_result_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_cond,
device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652
current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_cond,
current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l587_c7_a652
deo_param1_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_cond,
deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652
result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652
result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652
result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652
result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652
result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_cond,
result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652
result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652
result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652
result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652
result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_cond,
result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652
result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l587_c7_a652
deo_param0_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_cond,
deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- l8_MUX_uxn_opcodes_h_l587_c7_a652
l8_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l587_c7_a652_cond,
l8_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
l8_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
l8_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652
is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_cond,
is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd
BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_left,
BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_right,
BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l591_c7_4974
device_out_result_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_cond,
device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_cond,
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l591_c7_4974
deo_param1_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_cond,
deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974
result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974
result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_cond,
result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974
result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974
result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_cond,
result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l591_c7_4974
deo_param0_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_cond,
deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- l8_MUX_uxn_opcodes_h_l591_c7_4974
l8_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l591_c7_4974_cond,
l8_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
l8_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
l8_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974
is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_cond,
is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2
BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_left,
BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_right,
BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15
device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15
current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15
deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15
result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15
result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15
result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15
result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15
result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15
result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15
result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15
result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15
result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15
result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15
deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- l8_MUX_uxn_opcodes_h_l594_c7_7a15
l8_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
l8_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
l8_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
l8_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15
is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_cond,
is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c
BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_left,
BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_right,
BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l598_c32_a966
BIN_OP_GT_uxn_opcodes_h_l598_c32_a966 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_left,
BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_right,
BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_return_output);

-- MUX_uxn_opcodes_h_l598_c32_6c47
MUX_uxn_opcodes_h_l598_c32_6c47 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l598_c32_6c47_cond,
MUX_uxn_opcodes_h_l598_c32_6c47_iftrue,
MUX_uxn_opcodes_h_l598_c32_6c47_iffalse,
MUX_uxn_opcodes_h_l598_c32_6c47_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39
BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_left,
BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_right,
BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_return_output);

-- MUX_uxn_opcodes_h_l602_c16_ba77
MUX_uxn_opcodes_h_l602_c16_ba77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l602_c16_ba77_cond,
MUX_uxn_opcodes_h_l602_c16_ba77_iftrue,
MUX_uxn_opcodes_h_l602_c16_ba77_iffalse,
MUX_uxn_opcodes_h_l602_c16_ba77_return_output);

-- MUX_uxn_opcodes_h_l603_c16_f92e
MUX_uxn_opcodes_h_l603_c16_f92e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l603_c16_f92e_cond,
MUX_uxn_opcodes_h_l603_c16_f92e_iftrue,
MUX_uxn_opcodes_h_l603_c16_f92e_iffalse,
MUX_uxn_opcodes_h_l603_c16_f92e_return_output);

-- device_out_uxn_opcodes_h_l604_c23_d681
device_out_uxn_opcodes_h_l604_c23_d681 : entity work.device_out_0CLK_8baf3119 port map (
clk,
device_out_uxn_opcodes_h_l604_c23_d681_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l604_c23_d681_device_address,
device_out_uxn_opcodes_h_l604_c23_d681_value,
device_out_uxn_opcodes_h_l604_c23_d681_phase,
device_out_uxn_opcodes_h_l604_c23_d681_previous_device_ram_read,
device_out_uxn_opcodes_h_l604_c23_d681_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b
BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_left,
BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_right,
BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50
current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_cond,
current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50
is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_cond,
is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705
BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_left,
BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_right,
BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 n8_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 l8_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 t8_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 n8_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 l8_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 t8_MUX_uxn_opcodes_h_l577_c7_568a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 n8_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 l8_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 t8_MUX_uxn_opcodes_h_l580_c7_b557_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 n8_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 l8_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 n8_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 l8_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 l8_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_return_output,
 device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 l8_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_return_output,
 BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_return_output,
 MUX_uxn_opcodes_h_l598_c32_6c47_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_return_output,
 MUX_uxn_opcodes_h_l602_c16_ba77_return_output,
 MUX_uxn_opcodes_h_l603_c16_f92e_return_output,
 device_out_uxn_opcodes_h_l604_c23_d681_return_output,
 BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l575_c3_f303 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_37d9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_568a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c2_172e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l570_c2_172e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l571_c3_d7d0_uxn_opcodes_h_l571_c3_d7d0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l578_c3_7524 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l580_c7_b557_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l577_c7_568a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l582_c3_2eac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l580_c7_b557_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l585_c3_1ecc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l589_c3_dd07 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l592_c3_a791 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l596_c3_300f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l594_c7_7a15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l598_c32_6c47_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l598_c32_6c47_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l598_c32_6c47_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l598_c32_6c47_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l602_c16_ba77_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l602_c16_ba77_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l602_c16_ba77_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l602_c16_ba77_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l603_c16_f92e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l603_c16_f92e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l603_c16_f92e_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l603_c16_f92e_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l604_c23_d681_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l604_c23_d681_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l604_c23_d681_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l604_c23_d681_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l604_c23_d681_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l604_c23_d681_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l605_c32_a234_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_c31_eb8a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l607_c29_7f13_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l608_c26_5b30_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l609_c29_0b26_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l610_c25_d840_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l611_c23_ff3c_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l614_c4_bcf9 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l617_c4_86af : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_DUPLICATE_319d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_0943_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_8406_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_5ac0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_1c87_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_96b5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_262f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_7f21_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_16c4_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l594_DUPLICATE_bda8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l612_l613_DUPLICATE_4675_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_95d5_uxn_opcodes_h_l563_l621_DUPLICATE_18eb_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l598_c32_6c47_iffalse := resize(to_signed(-3, 3), 8);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l578_c3_7524 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l578_c3_7524;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l598_c32_6c47_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_37d9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_37d9;
     VAR_current_deo_phase_uxn_opcodes_h_l575_c3_f303 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l575_c3_f303;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l582_c3_2eac := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l582_c3_2eac;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l592_c3_a791 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l592_c3_a791;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l596_c3_300f := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l596_c3_300f;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l585_c3_1ecc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l585_c3_1ecc;
     VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_right := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l614_c4_bcf9 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l614_c4_bcf9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l589_c3_dd07 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l589_c3_dd07;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_right := to_unsigned(5, 3);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l604_c23_d681_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l602_c16_ba77_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l603_c16_f92e_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l603_c16_f92e_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l603_c16_f92e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l604_c23_d681_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_left := t8;
     VAR_MUX_uxn_opcodes_h_l602_c16_ba77_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_5ac0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_5ac0_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l594_c11_1ab2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_left;
     BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output := BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_16c4 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_16c4_return_output := result.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_262f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_262f_return_output := result.vram_write_layer;

     -- BIN_OP_PLUS[uxn_opcodes_h_l617_c4_c705] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_left;
     BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_return_output := BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_8406 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_8406_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l570_c6_de07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_left;
     BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output := BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l580_c11_56c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_96b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_96b5_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l591_c11_fdbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_1c87 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_1c87_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l577_c11_f245] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_left;
     BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output := BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;

     -- MUX[uxn_opcodes_h_l603_c16_f92e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l603_c16_f92e_cond <= VAR_MUX_uxn_opcodes_h_l603_c16_f92e_cond;
     MUX_uxn_opcodes_h_l603_c16_f92e_iftrue <= VAR_MUX_uxn_opcodes_h_l603_c16_f92e_iftrue;
     MUX_uxn_opcodes_h_l603_c16_f92e_iffalse <= VAR_MUX_uxn_opcodes_h_l603_c16_f92e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l603_c16_f92e_return_output := MUX_uxn_opcodes_h_l603_c16_f92e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_DUPLICATE_319d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_DUPLICATE_319d_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l598_c32_cc9c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_left;
     BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_return_output := BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l594_DUPLICATE_bda8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l594_DUPLICATE_bda8_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_0943 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_0943_return_output := result.device_ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l584_c11_0e90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_left;
     BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output := BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_7f21 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_7f21_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l594_c7_7a15_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l602_c32_fd39] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_left;
     BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_return_output := BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l587_c11_506e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_left;
     BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output := BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_left := VAR_BIN_OP_AND_uxn_opcodes_h_l598_c32_cc9c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l570_c2_172e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l570_c6_de07_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_568a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l577_c11_f245_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l580_c7_b557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l580_c11_56c0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c11_0e90_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l587_c11_506e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l591_c11_fdbd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l594_c11_1ab2_return_output;
     VAR_MUX_uxn_opcodes_h_l602_c16_ba77_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l602_c32_fd39_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l617_c4_86af := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l617_c4_c705_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_7f21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_7f21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_7f21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_7f21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_7f21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_7f21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_7f21_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_96b5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_96b5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_96b5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_96b5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_96b5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_96b5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_96b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l594_DUPLICATE_bda8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l594_DUPLICATE_bda8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l594_DUPLICATE_bda8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l594_DUPLICATE_bda8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l594_DUPLICATE_bda8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l594_DUPLICATE_bda8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_DUPLICATE_319d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_DUPLICATE_319d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_DUPLICATE_319d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_DUPLICATE_319d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_DUPLICATE_319d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_DUPLICATE_319d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_8406_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_8406_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_8406_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_8406_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_8406_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_8406_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_8406_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_262f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_262f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_262f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_262f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_262f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_262f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_262f_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_16c4_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_16c4_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_16c4_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_16c4_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_16c4_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_16c4_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_16c4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_1c87_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_1c87_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_1c87_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_1c87_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_1c87_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_1c87_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_1c87_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_5ac0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_5ac0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_5ac0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_5ac0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_5ac0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_5ac0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_5ac0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_0943_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_0943_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_0943_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_0943_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_0943_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_0943_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l577_l587_l580_l591_l584_l570_l594_DUPLICATE_0943_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_MUX_uxn_opcodes_h_l603_c16_f92e_return_output;
     VAR_device_out_uxn_opcodes_h_l604_c23_d681_value := VAR_MUX_uxn_opcodes_h_l603_c16_f92e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l617_c4_86af;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- t8_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_t8_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     t8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     t8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l580_c7_b557_return_output := t8_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l598_c32_a966] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_left;
     BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_return_output := BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- MUX[uxn_opcodes_h_l602_c16_ba77] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l602_c16_ba77_cond <= VAR_MUX_uxn_opcodes_h_l602_c16_ba77_cond;
     MUX_uxn_opcodes_h_l602_c16_ba77_iftrue <= VAR_MUX_uxn_opcodes_h_l602_c16_ba77_iftrue;
     MUX_uxn_opcodes_h_l602_c16_ba77_iffalse <= VAR_MUX_uxn_opcodes_h_l602_c16_ba77_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l602_c16_ba77_return_output := MUX_uxn_opcodes_h_l602_c16_ba77_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l570_c1_a9b1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- n8_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_n8_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     n8_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     n8_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l587_c7_a652_return_output := n8_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- l8_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_l8_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     l8_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     l8_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := l8_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l598_c32_6c47_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l598_c32_a966_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_MUX_uxn_opcodes_h_l602_c16_ba77_return_output;
     VAR_device_out_uxn_opcodes_h_l604_c23_d681_device_address := VAR_MUX_uxn_opcodes_h_l602_c16_ba77_return_output;
     VAR_printf_uxn_opcodes_h_l571_c3_d7d0_uxn_opcodes_h_l571_c3_d7d0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l570_c1_a9b1_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_l8_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_n8_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     -- n8_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_n8_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     n8_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     n8_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l584_c7_e158_return_output := n8_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- MUX[uxn_opcodes_h_l598_c32_6c47] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l598_c32_6c47_cond <= VAR_MUX_uxn_opcodes_h_l598_c32_6c47_cond;
     MUX_uxn_opcodes_h_l598_c32_6c47_iftrue <= VAR_MUX_uxn_opcodes_h_l598_c32_6c47_iftrue;
     MUX_uxn_opcodes_h_l598_c32_6c47_iffalse <= VAR_MUX_uxn_opcodes_h_l598_c32_6c47_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l598_c32_6c47_return_output := MUX_uxn_opcodes_h_l598_c32_6c47_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- printf_uxn_opcodes_h_l571_c3_d7d0[uxn_opcodes_h_l571_c3_d7d0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l571_c3_d7d0_uxn_opcodes_h_l571_c3_d7d0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l571_c3_d7d0_uxn_opcodes_h_l571_c3_d7d0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- deo_param1_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_return_output := deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- t8_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_t8_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     t8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     t8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l577_c7_568a_return_output := t8_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- l8_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_l8_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     l8_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     l8_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l591_c7_4974_return_output := l8_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue := VAR_MUX_uxn_opcodes_h_l598_c32_6c47_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_l8_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_n8_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_return_output := deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- t8_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_t8_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     t8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     t8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l570_c2_172e_return_output := t8_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_return_output := deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- l8_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_l8_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     l8_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     l8_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l587_c7_a652_return_output := l8_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- n8_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_n8_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     n8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     n8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l580_c7_b557_return_output := n8_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_l8_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l570_c2_172e_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_return_output := deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- n8_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_n8_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     n8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     n8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l577_c7_568a_return_output := n8_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- l8_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_l8_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     l8_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     l8_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l584_c7_e158_return_output := l8_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_return_output := deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_l8_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- n8_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_n8_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     n8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     n8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l570_c2_172e_return_output := n8_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_return_output := deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_return_output := deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- l8_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_l8_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     l8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     l8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l580_c7_b557_return_output := l8_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_l8_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l570_c2_172e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- l8_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_l8_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     l8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     l8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l577_c7_568a_return_output := l8_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_return_output := deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_return_output := deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_l8_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_return_output := deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- l8_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_l8_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     l8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     l8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l570_c2_172e_return_output := l8_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_return_output := deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l600_c1_2003] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l604_c23_d681_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l600_c1_2003_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l570_c2_172e_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l570_c2_172e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_return_output := deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- device_out[uxn_opcodes_h_l604_c23_d681] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l604_c23_d681_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l604_c23_d681_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l604_c23_d681_device_address <= VAR_device_out_uxn_opcodes_h_l604_c23_d681_device_address;
     device_out_uxn_opcodes_h_l604_c23_d681_value <= VAR_device_out_uxn_opcodes_h_l604_c23_d681_value;
     device_out_uxn_opcodes_h_l604_c23_d681_phase <= VAR_device_out_uxn_opcodes_h_l604_c23_d681_phase;
     device_out_uxn_opcodes_h_l604_c23_d681_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l604_c23_d681_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l604_c23_d681_return_output := device_out_uxn_opcodes_h_l604_c23_d681_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l570_c2_172e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_device_out_uxn_opcodes_h_l604_c23_d681_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l608_c26_5b30] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l608_c26_5b30_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_d681_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l606_c31_eb8a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_c31_eb8a_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_d681_return_output.device_ram_address;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l610_c25_d840] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l610_c25_d840_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_d681_return_output.vram_address;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l611_c23_ff3c] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l611_c23_ff3c_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_d681_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l605_c32_a234] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l605_c32_a234_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_d681_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l607_c29_7f13] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l607_c29_7f13_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_d681_return_output.device_ram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l612_l613_DUPLICATE_4675 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l612_l613_DUPLICATE_4675_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_d681_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l609_c29_0b26] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l609_c29_0b26_return_output := VAR_device_out_uxn_opcodes_h_l604_c23_d681_return_output.vram_write_layer;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l612_l613_DUPLICATE_4675_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l612_l613_DUPLICATE_4675_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l612_l613_DUPLICATE_4675_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l605_c32_a234_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l608_c26_5b30_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l609_c29_0b26_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l611_c23_ff3c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l610_c25_d840_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l606_c31_eb8a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l607_c29_7f13_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l613_c3_2e50] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_return_output := current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l612_c24_1d5b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_left;
     BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_return_output := BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_return_output := device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l613_c3_2e50] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_cond;
     is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_return_output := is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l612_c24_1d5b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l613_c3_2e50_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l613_c3_2e50_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_return_output := result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_return_output := result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_return_output := device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l594_c7_7a15] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_return_output := current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l594_c7_7a15_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_return_output := current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_return_output := result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_return_output := device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_return_output := result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l591_c7_4974] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_cond;
     is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_return_output := is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l591_c7_4974_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_return_output := current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_return_output := device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l587_c7_a652] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_cond;
     is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_return_output := is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_return_output := result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_return_output := result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l587_c7_a652_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_return_output := result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_return_output := is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_return_output := result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_return_output := current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l584_c7_e158] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_return_output := device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c7_e158_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_return_output := result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_return_output := device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_return_output := current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l580_c7_b557] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_cond;
     is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_return_output := is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_return_output := result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l570_c2_172e_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l580_c7_b557_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_return_output := is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_return_output := current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l577_c7_568a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_return_output := result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_return_output := result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l577_c7_568a_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_return_output := current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l570_c2_172e] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_cond;
     is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_return_output := is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l570_c2_172e_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l570_c2_172e_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_95d5_uxn_opcodes_h_l563_l621_DUPLICATE_18eb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_95d5_uxn_opcodes_h_l563_l621_DUPLICATE_18eb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_95d5(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l570_c2_172e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l570_c2_172e_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_95d5_uxn_opcodes_h_l563_l621_DUPLICATE_18eb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_95d5_uxn_opcodes_h_l563_l621_DUPLICATE_18eb_return_output;
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
