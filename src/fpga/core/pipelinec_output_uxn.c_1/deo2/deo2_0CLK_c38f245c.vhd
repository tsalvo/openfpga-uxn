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
-- BIN_OP_EQ[uxn_opcodes_h_l564_c6_b241]
signal BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l564_c1_96f5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l571_c7_c42a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l564_c2_a896]
signal deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l564_c2_a896]
signal deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l564_c2_a896]
signal n8_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l564_c2_a896]
signal current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l564_c2_a896]
signal is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l564_c2_a896]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l564_c2_a896]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l564_c2_a896]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l564_c2_a896]
signal result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l564_c2_a896]
signal result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l564_c2_a896]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l564_c2_a896]
signal result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l564_c2_a896]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l564_c2_a896]
signal result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l564_c2_a896]
signal result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(31 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l564_c2_a896]
signal device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l564_c2_a896]
signal t8_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l564_c2_a896]
signal l8_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l565_c3_7321[uxn_opcodes_h_l565_c3_7321]
signal printf_uxn_opcodes_h_l565_c3_7321_uxn_opcodes_h_l565_c3_7321_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l571_c11_34f8]
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l571_c7_c42a]
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l571_c7_c42a]
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l571_c7_c42a]
signal n8_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l571_c7_c42a]
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l571_c7_c42a]
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l571_c7_c42a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l571_c7_c42a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l571_c7_c42a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l571_c7_c42a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l571_c7_c42a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l571_c7_c42a]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l571_c7_c42a]
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l571_c7_c42a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l571_c7_c42a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l571_c7_c42a]
signal result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(31 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l571_c7_c42a]
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l571_c7_c42a]
signal t8_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l571_c7_c42a]
signal l8_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l574_c11_d3c2]
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c7_da87]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal n8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(31 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal t8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l574_c7_c1fe]
signal l8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l578_c11_7da5]
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l581_c7_05a4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l578_c7_da87]
signal deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l578_c7_da87]
signal deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l578_c7_da87]
signal n8_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l578_c7_da87]
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l578_c7_da87]
signal is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l578_c7_da87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l578_c7_da87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l578_c7_da87]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l578_c7_da87]
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l578_c7_da87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l578_c7_da87]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l578_c7_da87]
signal result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l578_c7_da87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l578_c7_da87]
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l578_c7_da87]
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(31 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l578_c7_da87]
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l578_c7_da87]
signal l8_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l581_c11_9702]
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l585_c7_0959]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l581_c7_05a4]
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l581_c7_05a4]
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l581_c7_05a4]
signal n8_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l581_c7_05a4]
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l581_c7_05a4]
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l581_c7_05a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l581_c7_05a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l581_c7_05a4]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l581_c7_05a4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l581_c7_05a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l581_c7_05a4]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l581_c7_05a4]
signal result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l581_c7_05a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l581_c7_05a4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l581_c7_05a4]
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(31 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l581_c7_05a4]
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l581_c7_05a4]
signal l8_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l585_c11_e6ac]
signal BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l588_c7_3dae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l585_c7_0959]
signal deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l585_c7_0959]
signal deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l585_c7_0959]
signal current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l585_c7_0959]
signal is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l585_c7_0959]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l585_c7_0959]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l585_c7_0959]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l585_c7_0959]
signal result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l585_c7_0959]
signal result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l585_c7_0959]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l585_c7_0959]
signal result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l585_c7_0959]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l585_c7_0959]
signal result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l585_c7_0959]
signal result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(31 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l585_c7_0959]
signal device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l585_c7_0959]
signal l8_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l588_c11_6b9a]
signal BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l594_c1_84dd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_return_output : unsigned(0 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l588_c7_3dae]
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(7 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l588_c7_3dae]
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l588_c7_3dae]
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l588_c7_3dae]
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l588_c7_3dae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l588_c7_3dae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l588_c7_3dae]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l588_c7_3dae]
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l588_c7_3dae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l588_c7_3dae]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l588_c7_3dae]
signal result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l588_c7_3dae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l588_c7_3dae]
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l588_c7_3dae]
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(31 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l588_c7_3dae]
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : device_out_result_t;

-- l8_MUX[uxn_opcodes_h_l588_c7_3dae]
signal l8_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l592_c30_d7d1]
signal sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l596_c32_9838]
signal BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l596_c16_09db]
signal MUX_uxn_opcodes_h_l596_c16_09db_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l596_c16_09db_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l596_c16_09db_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l596_c16_09db_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l597_c16_6dd0]
signal MUX_uxn_opcodes_h_l597_c16_6dd0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l597_c16_6dd0_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l597_c16_6dd0_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l597_c16_6dd0_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l598_c23_bd57]
signal device_out_uxn_opcodes_h_l598_c23_bd57_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l598_c23_bd57_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l598_c23_bd57_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l598_c23_bd57_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l598_c23_bd57_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l598_c23_bd57_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l605_c24_88fd]
signal BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l606_c3_8ce1]
signal current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l606_c3_8ce1]
signal is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l610_c4_5b9b]
signal BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_336e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.vram_write_layer := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.device_ram_address := ref_toks_9;
      base.vram_address := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241
BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_left,
BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_right,
BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l564_c2_a896
deo_param0_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_cond,
deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l564_c2_a896
deo_param1_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_cond,
deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- n8_MUX_uxn_opcodes_h_l564_c2_a896
n8_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l564_c2_a896_cond,
n8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
n8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
n8_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896
current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_cond,
current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896
is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_cond,
is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896
result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896
result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896
result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896
result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896
result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896
result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_cond,
result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896
result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896
result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896
result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_cond,
result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l564_c2_a896
device_out_result_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_cond,
device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- t8_MUX_uxn_opcodes_h_l564_c2_a896
t8_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l564_c2_a896_cond,
t8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
t8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
t8_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- l8_MUX_uxn_opcodes_h_l564_c2_a896
l8_MUX_uxn_opcodes_h_l564_c2_a896 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l564_c2_a896_cond,
l8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue,
l8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse,
l8_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

-- printf_uxn_opcodes_h_l565_c3_7321_uxn_opcodes_h_l565_c3_7321
printf_uxn_opcodes_h_l565_c3_7321_uxn_opcodes_h_l565_c3_7321 : entity work.printf_uxn_opcodes_h_l565_c3_7321_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l565_c3_7321_uxn_opcodes_h_l565_c3_7321_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8
BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_left,
BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_right,
BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a
deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a
deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- n8_MUX_uxn_opcodes_h_l571_c7_c42a
n8_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
n8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
n8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
n8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a
is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a
result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a
result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a
device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- t8_MUX_uxn_opcodes_h_l571_c7_c42a
t8_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
t8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
t8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
t8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- l8_MUX_uxn_opcodes_h_l571_c7_c42a
l8_MUX_uxn_opcodes_h_l571_c7_c42a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l571_c7_c42a_cond,
l8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue,
l8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse,
l8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2
BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_left,
BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_right,
BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe
deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe
deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- n8_MUX_uxn_opcodes_h_l574_c7_c1fe
n8_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
n8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
n8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
n8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe
is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe
result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe
result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe
device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- t8_MUX_uxn_opcodes_h_l574_c7_c1fe
t8_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
t8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
t8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
t8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- l8_MUX_uxn_opcodes_h_l574_c7_c1fe
l8_MUX_uxn_opcodes_h_l574_c7_c1fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond,
l8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue,
l8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse,
l8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5
BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_left,
BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_right,
BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l578_c7_da87
deo_param0_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_cond,
deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l578_c7_da87
deo_param1_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_cond,
deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- n8_MUX_uxn_opcodes_h_l578_c7_da87
n8_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l578_c7_da87_cond,
n8_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
n8_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
n8_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87
current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_cond,
current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87
is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_cond,
is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87
result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87
result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_cond,
result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87
result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_cond,
result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l578_c7_da87
device_out_result_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_cond,
device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- l8_MUX_uxn_opcodes_h_l578_c7_da87
l8_MUX_uxn_opcodes_h_l578_c7_da87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l578_c7_da87_cond,
l8_MUX_uxn_opcodes_h_l578_c7_da87_iftrue,
l8_MUX_uxn_opcodes_h_l578_c7_da87_iffalse,
l8_MUX_uxn_opcodes_h_l578_c7_da87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702
BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_left,
BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_right,
BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4
deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4
deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- n8_MUX_uxn_opcodes_h_l581_c7_05a4
n8_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
n8_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
n8_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
n8_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4
is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4
result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4
result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4
result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4
device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- l8_MUX_uxn_opcodes_h_l581_c7_05a4
l8_MUX_uxn_opcodes_h_l581_c7_05a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l581_c7_05a4_cond,
l8_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue,
l8_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse,
l8_MUX_uxn_opcodes_h_l581_c7_05a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac
BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_left,
BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_right,
BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l585_c7_0959
deo_param0_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_cond,
deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l585_c7_0959
deo_param1_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_cond,
deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959
current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_cond,
current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959
is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_cond,
is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959
result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959
result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959
result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959
result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959
result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959
result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_cond,
result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959
result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959
result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959
result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_cond,
result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l585_c7_0959
device_out_result_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_cond,
device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- l8_MUX_uxn_opcodes_h_l585_c7_0959
l8_MUX_uxn_opcodes_h_l585_c7_0959 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l585_c7_0959_cond,
l8_MUX_uxn_opcodes_h_l585_c7_0959_iftrue,
l8_MUX_uxn_opcodes_h_l585_c7_0959_iffalse,
l8_MUX_uxn_opcodes_h_l585_c7_0959_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a
BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_left,
BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_right,
BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae
deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae
deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae
is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae
result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae
result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae
result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae
device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- l8_MUX_uxn_opcodes_h_l588_c7_3dae
l8_MUX_uxn_opcodes_h_l588_c7_3dae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l588_c7_3dae_cond,
l8_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue,
l8_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse,
l8_MUX_uxn_opcodes_h_l588_c7_3dae_return_output);

-- sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1
sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_ins,
sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_x,
sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_y,
sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838
BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_left,
BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_right,
BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_return_output);

-- MUX_uxn_opcodes_h_l596_c16_09db
MUX_uxn_opcodes_h_l596_c16_09db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l596_c16_09db_cond,
MUX_uxn_opcodes_h_l596_c16_09db_iftrue,
MUX_uxn_opcodes_h_l596_c16_09db_iffalse,
MUX_uxn_opcodes_h_l596_c16_09db_return_output);

-- MUX_uxn_opcodes_h_l597_c16_6dd0
MUX_uxn_opcodes_h_l597_c16_6dd0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l597_c16_6dd0_cond,
MUX_uxn_opcodes_h_l597_c16_6dd0_iftrue,
MUX_uxn_opcodes_h_l597_c16_6dd0_iffalse,
MUX_uxn_opcodes_h_l597_c16_6dd0_return_output);

-- device_out_uxn_opcodes_h_l598_c23_bd57
device_out_uxn_opcodes_h_l598_c23_bd57 : entity work.device_out_0CLK_b285e9e3 port map (
clk,
device_out_uxn_opcodes_h_l598_c23_bd57_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l598_c23_bd57_device_address,
device_out_uxn_opcodes_h_l598_c23_bd57_value,
device_out_uxn_opcodes_h_l598_c23_bd57_phase,
device_out_uxn_opcodes_h_l598_c23_bd57_previous_device_ram_read,
device_out_uxn_opcodes_h_l598_c23_bd57_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd
BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_left,
BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_right,
BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1
current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_cond,
current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1
is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_cond,
is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b
BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_left,
BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_right,
BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 n8_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 t8_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 l8_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 n8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 t8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 l8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 n8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 t8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 l8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 n8_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 l8_MUX_uxn_opcodes_h_l578_c7_da87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 n8_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 l8_MUX_uxn_opcodes_h_l581_c7_05a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 l8_MUX_uxn_opcodes_h_l585_c7_0959_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_return_output,
 deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 l8_MUX_uxn_opcodes_h_l588_c7_3dae_return_output,
 sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_return_output,
 MUX_uxn_opcodes_h_l596_c16_09db_return_output,
 MUX_uxn_opcodes_h_l597_c16_6dd0_return_output,
 device_out_uxn_opcodes_h_l598_c23_bd57_return_output,
 BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l569_c3_829a : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l566_c3_47d5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l564_c2_a896_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l564_c2_a896_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l565_c3_7321_uxn_opcodes_h_l565_c3_7321_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_cf77 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l571_c7_c42a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l576_c3_a671 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l578_c7_da87_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_4e02 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l578_c7_da87_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l578_c7_da87_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_05a4_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l578_c7_da87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l583_c3_1ec0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l585_c7_0959_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l581_c7_05a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_2559 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l585_c7_0959_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l585_c7_0959_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l585_c7_0959_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_iffalse : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_fdb1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l588_c7_3dae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l588_c7_3dae_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l596_c16_09db_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l596_c16_09db_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l596_c16_09db_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l596_c16_09db_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l597_c16_6dd0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l597_c16_6dd0_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l597_c16_6dd0_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l597_c16_6dd0_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l598_c23_bd57_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l598_c23_bd57_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l598_c23_bd57_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l598_c23_bd57_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l598_c23_bd57_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l598_c23_bd57_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l599_c32_4063_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l600_c31_32b5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l601_c26_c9ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l602_c29_0f71_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l603_c25_7f7b_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l604_c21_3735_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l607_c4_e075 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l610_c4_8bfd : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l564_DUPLICATE_44bc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_5429_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_e470_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d162_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_6b4e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d2b0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_ea95_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_8734_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_DUPLICATE_964c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l606_l605_DUPLICATE_53dd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_336e_uxn_opcodes_h_l557_l614_DUPLICATE_8a2e_return_output : opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l576_c3_a671 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l576_c3_a671;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l583_c3_1ec0 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l583_c3_1ec0;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_right := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l569_c3_829a := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l569_c3_829a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_4e02 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l579_c3_4e02;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_fdb1 := resize(to_unsigned(0, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_fdb1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l566_c3_47d5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l566_c3_47d5;
     VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_cf77 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l572_c3_cf77;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := to_unsigned(0, 1);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_y := resize(to_signed(-3, 3), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_2559 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_2559;
     VAR_current_deo_phase_uxn_opcodes_h_l607_c4_e075 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l607_c4_e075;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_right := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l598_c23_bd57_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l596_c16_09db_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l597_c16_6dd0_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l597_c16_6dd0_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := l8;
     VAR_MUX_uxn_opcodes_h_l597_c16_6dd0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l598_c23_bd57_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_left := t8;
     VAR_MUX_uxn_opcodes_h_l596_c16_09db_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d162 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d162_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_8734 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_8734_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l571_c11_34f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_6b4e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_6b4e_return_output := result.u8_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_ea95 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_ea95_return_output := result.device_ram_address;

     -- BIN_OP_PLUS[uxn_opcodes_h_l596_c32_9838] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_left;
     BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_return_output := BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l588_c11_6b9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_left;
     BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output := BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l592_c30_d7d1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_ins;
     sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_x;
     sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_return_output := sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l564_c6_b241] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_left;
     BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output := BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l564_DUPLICATE_44bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l564_DUPLICATE_44bc_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_e470 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_e470_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l581_c11_9702] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_left;
     BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output := BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_DUPLICATE_964c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_DUPLICATE_964c_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l610_c4_5b9b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l588_c7_3dae_return_output := result.stack_address_sp_offset;

     -- MUX[uxn_opcodes_h_l597_c16_6dd0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l597_c16_6dd0_cond <= VAR_MUX_uxn_opcodes_h_l597_c16_6dd0_cond;
     MUX_uxn_opcodes_h_l597_c16_6dd0_iftrue <= VAR_MUX_uxn_opcodes_h_l597_c16_6dd0_iftrue;
     MUX_uxn_opcodes_h_l597_c16_6dd0_iffalse <= VAR_MUX_uxn_opcodes_h_l597_c16_6dd0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l597_c16_6dd0_return_output := MUX_uxn_opcodes_h_l597_c16_6dd0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l578_c11_7da5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_left;
     BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output := BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l585_c11_e6ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d2b0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d2b0_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l574_c11_d3c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_5429 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_5429_return_output := result.is_device_ram_write;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l564_c2_a896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c6_b241_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_c42a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_34f8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l574_c11_d3c2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_7da5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l581_c11_9702_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l585_c11_e6ac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l588_c11_6b9a_return_output;
     VAR_MUX_uxn_opcodes_h_l596_c16_09db_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l596_c32_9838_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l610_c4_8bfd := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c4_5b9b_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d2b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d2b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d2b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d2b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d2b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d2b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d2b0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_5429_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_5429_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_5429_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_5429_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_5429_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_5429_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_5429_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_DUPLICATE_964c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_DUPLICATE_964c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_DUPLICATE_964c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_DUPLICATE_964c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_DUPLICATE_964c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_DUPLICATE_964c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l564_DUPLICATE_44bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l564_DUPLICATE_44bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l564_DUPLICATE_44bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l564_DUPLICATE_44bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l564_DUPLICATE_44bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l564_DUPLICATE_44bc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_e470_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_e470_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_e470_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_e470_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_e470_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_e470_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_e470_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d162_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d162_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d162_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d162_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d162_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d162_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_d162_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_8734_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_8734_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_8734_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_8734_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_8734_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_8734_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_8734_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_ea95_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_ea95_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_ea95_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_ea95_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_ea95_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_ea95_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_ea95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_6b4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_6b4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_6b4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_6b4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_6b4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_6b4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l578_l571_l581_l574_l585_l588_l564_DUPLICATE_6b4e_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := VAR_MUX_uxn_opcodes_h_l597_c16_6dd0_return_output;
     VAR_device_out_uxn_opcodes_h_l598_c23_bd57_value := VAR_MUX_uxn_opcodes_h_l597_c16_6dd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l592_c30_d7d1_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l610_c4_8bfd;
     -- deo_param1_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l564_c1_96f5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- n8_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_n8_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     n8_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     n8_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := n8_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- MUX[uxn_opcodes_h_l596_c16_09db] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l596_c16_09db_cond <= VAR_MUX_uxn_opcodes_h_l596_c16_09db_cond;
     MUX_uxn_opcodes_h_l596_c16_09db_iftrue <= VAR_MUX_uxn_opcodes_h_l596_c16_09db_iftrue;
     MUX_uxn_opcodes_h_l596_c16_09db_iffalse <= VAR_MUX_uxn_opcodes_h_l596_c16_09db_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l596_c16_09db_return_output := MUX_uxn_opcodes_h_l596_c16_09db_return_output;

     -- l8_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_l8_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     l8_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     l8_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := l8_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- t8_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     t8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     t8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := t8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := VAR_MUX_uxn_opcodes_h_l596_c16_09db_return_output;
     VAR_device_out_uxn_opcodes_h_l598_c23_bd57_device_address := VAR_MUX_uxn_opcodes_h_l596_c16_09db_return_output;
     VAR_printf_uxn_opcodes_h_l565_c3_7321_uxn_opcodes_h_l565_c3_7321_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_96f5_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_l8_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_n8_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     -- l8_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_l8_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     l8_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     l8_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l585_c7_0959_return_output := l8_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- t8_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_t8_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     t8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     t8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := t8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- n8_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_n8_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     n8_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     n8_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l578_c7_da87_return_output := n8_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_return_output := deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- printf_uxn_opcodes_h_l565_c3_7321[uxn_opcodes_h_l565_c3_7321] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l565_c3_7321_uxn_opcodes_h_l565_c3_7321_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l565_c3_7321_uxn_opcodes_h_l565_c3_7321_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_l8_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_n8_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_t8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_return_output := deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- l8_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_l8_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     l8_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     l8_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := l8_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- n8_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     n8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     n8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := n8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- t8_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_t8_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     t8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     t8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l564_c2_a896_return_output := t8_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_l8_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l564_c2_a896_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_return_output := deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- l8_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_l8_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     l8_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     l8_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l578_c7_da87_return_output := l8_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- n8_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_n8_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     n8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     n8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := n8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_l8_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_n8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- l8_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     l8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     l8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := l8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_return_output := deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- n8_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_n8_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     n8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     n8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l564_c2_a896_return_output := n8_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_l8_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l564_c2_a896_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- l8_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_l8_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     l8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     l8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := l8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_l8_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_return_output := deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l594_c1_84dd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_return_output;

     -- l8_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_l8_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     l8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     l8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l564_c2_a896_return_output := l8_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- Submodule level 8
     VAR_device_out_uxn_opcodes_h_l598_c23_bd57_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l594_c1_84dd_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l564_c2_a896_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l564_c2_a896_return_output;
     -- deo_param0_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_return_output := deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- device_out[uxn_opcodes_h_l598_c23_bd57] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l598_c23_bd57_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l598_c23_bd57_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l598_c23_bd57_device_address <= VAR_device_out_uxn_opcodes_h_l598_c23_bd57_device_address;
     device_out_uxn_opcodes_h_l598_c23_bd57_value <= VAR_device_out_uxn_opcodes_h_l598_c23_bd57_value;
     device_out_uxn_opcodes_h_l598_c23_bd57_phase <= VAR_device_out_uxn_opcodes_h_l598_c23_bd57_phase;
     device_out_uxn_opcodes_h_l598_c23_bd57_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l598_c23_bd57_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l598_c23_bd57_return_output := device_out_uxn_opcodes_h_l598_c23_bd57_return_output;

     -- Submodule level 9
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l564_c2_a896_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := VAR_device_out_uxn_opcodes_h_l598_c23_bd57_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l606_l605_DUPLICATE_53dd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l606_l605_DUPLICATE_53dd_return_output := VAR_device_out_uxn_opcodes_h_l598_c23_bd57_return_output.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l600_c31_32b5] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l600_c31_32b5_return_output := VAR_device_out_uxn_opcodes_h_l598_c23_bd57_return_output.device_ram_address;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l603_c25_7f7b] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l603_c25_7f7b_return_output := VAR_device_out_uxn_opcodes_h_l598_c23_bd57_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l604_c21_3735] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l604_c21_3735_return_output := VAR_device_out_uxn_opcodes_h_l598_c23_bd57_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l599_c32_4063] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l599_c32_4063_return_output := VAR_device_out_uxn_opcodes_h_l598_c23_bd57_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l602_c29_0f71] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l602_c29_0f71_return_output := VAR_device_out_uxn_opcodes_h_l598_c23_bd57_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l601_c26_c9ab] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l601_c26_c9ab_return_output := VAR_device_out_uxn_opcodes_h_l598_c23_bd57_return_output.is_vram_write;

     -- Submodule level 10
     VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l606_l605_DUPLICATE_53dd_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l606_l605_DUPLICATE_53dd_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l606_l605_DUPLICATE_53dd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l599_c32_4063_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l601_c26_c9ab_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l602_c29_0f71_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l603_c25_7f7b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l600_c31_32b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l604_c21_3735_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_return_output := device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l606_c3_8ce1] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_return_output := current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l605_c24_88fd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_left;
     BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_return_output := BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l606_c3_8ce1] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_cond;
     is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_return_output := is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l605_c24_88fd_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l606_c3_8ce1_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l606_c3_8ce1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_return_output := result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_return_output := result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l588_c7_3dae] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_cond;
     is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_return_output := is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- Submodule level 12
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l588_c7_3dae_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_return_output := current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_return_output := device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l585_c7_0959] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_cond;
     is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_return_output := is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- Submodule level 13
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l585_c7_0959_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_return_output := result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_return_output := result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l581_c7_05a4] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_cond;
     is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_return_output := is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;

     -- Submodule level 14
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l581_c7_05a4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     -- current_deo_phase_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_return_output := current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l578_c7_da87] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_cond;
     is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_return_output := is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- Submodule level 15
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_da87_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_return_output := device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l574_c7_c1fe] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output := current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;

     -- Submodule level 16
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l564_c2_a896_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l574_c7_c1fe_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_return_output := result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_return_output := result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l571_c7_c42a] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_return_output := current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;

     -- Submodule level 17
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_c42a_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_return_output := is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_return_output := current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l564_c2_a896] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_return_output;

     -- Submodule level 18
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l564_c2_a896_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l564_c2_a896_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_336e_uxn_opcodes_h_l557_l614_DUPLICATE_8a2e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_336e_uxn_opcodes_h_l557_l614_DUPLICATE_8a2e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_336e(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c2_a896_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c2_a896_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_336e_uxn_opcodes_h_l557_l614_DUPLICATE_8a2e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_336e_uxn_opcodes_h_l557_l614_DUPLICATE_8a2e_return_output;
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
