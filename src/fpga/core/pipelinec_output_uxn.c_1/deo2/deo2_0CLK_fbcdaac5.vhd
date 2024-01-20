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
entity deo2_0CLK_fbcdaac5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_fbcdaac5;
architecture arch of deo2_0CLK_fbcdaac5 is
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
signal is_phase_3 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_phase_4 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_current_deo_phase : unsigned(7 downto 0);
signal REG_COMB_deo_param0 : unsigned(7 downto 0);
signal REG_COMB_deo_param1 : unsigned(7 downto 0);
signal REG_COMB_is_second_deo : unsigned(0 downto 0);
signal REG_COMB_is_phase_3 : unsigned(0 downto 0);
signal REG_COMB_is_phase_4 : unsigned(0 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l539_c6_ce6d]
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c7_df5a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l539_c2_7e98]
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l539_c2_7e98]
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l539_c2_7e98]
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l539_c2_7e98]
signal l8_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l539_c2_7e98]
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l539_c2_7e98]
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l539_c2_7e98]
signal n8_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l539_c2_7e98]
signal result_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : opcode_result_t;

-- is_phase_3_MUX[uxn_opcodes_h_l539_c2_7e98]
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l539_c2_7e98]
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l539_c2_7e98]
signal t8_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l554_c11_5bbf]
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l554_c7_df5a]
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l554_c7_df5a]
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l554_c7_df5a]
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l554_c7_df5a]
signal l8_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l554_c7_df5a]
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l554_c7_df5a]
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l554_c7_df5a]
signal n8_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l554_c7_df5a]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l554_c7_df5a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l554_c7_df5a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l554_c7_df5a]
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l554_c7_df5a]
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l554_c7_df5a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c7_df5a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l554_c7_df5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c7_df5a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(3 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l554_c7_df5a]
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l554_c7_df5a]
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l554_c7_df5a]
signal t8_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l557_c11_58c1]
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_7b73]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);

-- is_phase_4_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal l8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal n8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(3 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l557_c7_a4a6]
signal t8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l562_c17_a8db]
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l562_c17_932c]
signal MUX_uxn_opcodes_h_l562_c17_932c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_932c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_932c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_932c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l563_c17_7832]
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l563_c17_bd6e]
signal MUX_uxn_opcodes_h_l563_c17_bd6e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_bd6e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_bd6e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_bd6e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l564_c8_f0bc]
signal MUX_uxn_opcodes_h_l564_c8_f0bc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_f0bc_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_f0bc_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_f0bc_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l565_c8_25de]
signal MUX_uxn_opcodes_h_l565_c8_25de_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_25de_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_25de_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_25de_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l566_c32_4e02]
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l566_c16_dd54]
signal MUX_uxn_opcodes_h_l566_c16_dd54_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_dd54_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_dd54_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_dd54_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l567_c16_f722]
signal MUX_uxn_opcodes_h_l567_c16_f722_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_f722_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_f722_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_f722_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l568_c43_1e88]
signal sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_return_output : signed(3 downto 0);

-- MUX[uxn_opcodes_h_l568_c30_462a]
signal MUX_uxn_opcodes_h_l568_c30_462a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_462a_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_462a_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_462a_return_output : signed(3 downto 0);

-- device_out[uxn_opcodes_h_l569_c23_3473]
signal device_out_uxn_opcodes_h_l569_c23_3473_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_3473_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_3473_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_3473_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_3473_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_3473_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_3473_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l576_c24_2e3c]
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l577_c3_8d41]
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l577_c3_8d41]
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l581_c4_4ad4]
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4b5f( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.vram_write_layer := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d
BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_left,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_right,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_cond,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98
is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_cond,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98
is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_cond,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_return_output);

-- l8_MUX_uxn_opcodes_h_l539_c2_7e98
l8_MUX_uxn_opcodes_h_l539_c2_7e98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l539_c2_7e98_cond,
l8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue,
l8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse,
l8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98
deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_cond,
deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue,
deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse,
deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98
device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_cond,
device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue,
device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse,
device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_return_output);

-- n8_MUX_uxn_opcodes_h_l539_c2_7e98
n8_MUX_uxn_opcodes_h_l539_c2_7e98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l539_c2_7e98_cond,
n8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue,
n8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse,
n8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output);

-- result_MUX_uxn_opcodes_h_l539_c2_7e98
result_MUX_uxn_opcodes_h_l539_c2_7e98 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l539_c2_7e98_cond,
result_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue,
result_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse,
result_MUX_uxn_opcodes_h_l539_c2_7e98_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98
is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_cond,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98
deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_cond,
deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue,
deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse,
deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_return_output);

-- t8_MUX_uxn_opcodes_h_l539_c2_7e98
t8_MUX_uxn_opcodes_h_l539_c2_7e98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l539_c2_7e98_cond,
t8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue,
t8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse,
t8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf
BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_left,
BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_right,
BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a
is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a
is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- l8_MUX_uxn_opcodes_h_l554_c7_df5a
l8_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
l8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
l8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
l8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a
deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a
device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- n8_MUX_uxn_opcodes_h_l554_c7_df5a
n8_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
n8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
n8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
n8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a
result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a
result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a
is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a
deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- t8_MUX_uxn_opcodes_h_l554_c7_df5a
t8_MUX_uxn_opcodes_h_l554_c7_df5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l554_c7_df5a_cond,
t8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue,
t8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse,
t8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1
BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_left,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_right,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6
is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6
is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- l8_MUX_uxn_opcodes_h_l557_c7_a4a6
l8_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
l8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
l8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
l8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6
deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6
device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- n8_MUX_uxn_opcodes_h_l557_c7_a4a6
n8_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
n8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
n8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
n8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6
result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6
result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6
is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6
deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- t8_MUX_uxn_opcodes_h_l557_c7_a4a6
t8_MUX_uxn_opcodes_h_l557_c7_a4a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond,
t8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue,
t8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse,
t8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db
BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_left,
BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_right,
BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_return_output);

-- MUX_uxn_opcodes_h_l562_c17_932c
MUX_uxn_opcodes_h_l562_c17_932c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l562_c17_932c_cond,
MUX_uxn_opcodes_h_l562_c17_932c_iftrue,
MUX_uxn_opcodes_h_l562_c17_932c_iffalse,
MUX_uxn_opcodes_h_l562_c17_932c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832
BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_left,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_right,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_return_output);

-- MUX_uxn_opcodes_h_l563_c17_bd6e
MUX_uxn_opcodes_h_l563_c17_bd6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l563_c17_bd6e_cond,
MUX_uxn_opcodes_h_l563_c17_bd6e_iftrue,
MUX_uxn_opcodes_h_l563_c17_bd6e_iffalse,
MUX_uxn_opcodes_h_l563_c17_bd6e_return_output);

-- MUX_uxn_opcodes_h_l564_c8_f0bc
MUX_uxn_opcodes_h_l564_c8_f0bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l564_c8_f0bc_cond,
MUX_uxn_opcodes_h_l564_c8_f0bc_iftrue,
MUX_uxn_opcodes_h_l564_c8_f0bc_iffalse,
MUX_uxn_opcodes_h_l564_c8_f0bc_return_output);

-- MUX_uxn_opcodes_h_l565_c8_25de
MUX_uxn_opcodes_h_l565_c8_25de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l565_c8_25de_cond,
MUX_uxn_opcodes_h_l565_c8_25de_iftrue,
MUX_uxn_opcodes_h_l565_c8_25de_iffalse,
MUX_uxn_opcodes_h_l565_c8_25de_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_left,
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_right,
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_return_output);

-- MUX_uxn_opcodes_h_l566_c16_dd54
MUX_uxn_opcodes_h_l566_c16_dd54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l566_c16_dd54_cond,
MUX_uxn_opcodes_h_l566_c16_dd54_iftrue,
MUX_uxn_opcodes_h_l566_c16_dd54_iffalse,
MUX_uxn_opcodes_h_l566_c16_dd54_return_output);

-- MUX_uxn_opcodes_h_l567_c16_f722
MUX_uxn_opcodes_h_l567_c16_f722 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l567_c16_f722_cond,
MUX_uxn_opcodes_h_l567_c16_f722_iftrue,
MUX_uxn_opcodes_h_l567_c16_f722_iffalse,
MUX_uxn_opcodes_h_l567_c16_f722_return_output);

-- sp_relative_shift_uxn_opcodes_h_l568_c43_1e88
sp_relative_shift_uxn_opcodes_h_l568_c43_1e88 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_ins,
sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_x,
sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_y,
sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_return_output);

-- MUX_uxn_opcodes_h_l568_c30_462a
MUX_uxn_opcodes_h_l568_c30_462a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l568_c30_462a_cond,
MUX_uxn_opcodes_h_l568_c30_462a_iftrue,
MUX_uxn_opcodes_h_l568_c30_462a_iffalse,
MUX_uxn_opcodes_h_l568_c30_462a_return_output);

-- device_out_uxn_opcodes_h_l569_c23_3473
device_out_uxn_opcodes_h_l569_c23_3473 : entity work.device_out_0CLK_45827a5f port map (
clk,
device_out_uxn_opcodes_h_l569_c23_3473_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l569_c23_3473_device_address,
device_out_uxn_opcodes_h_l569_c23_3473_value,
device_out_uxn_opcodes_h_l569_c23_3473_phase,
device_out_uxn_opcodes_h_l569_c23_3473_previous_device_ram_read,
device_out_uxn_opcodes_h_l569_c23_3473_previous_ram_read,
device_out_uxn_opcodes_h_l569_c23_3473_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c
BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_left,
BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_right,
BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_cond,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41
is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_cond,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_left,
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_right,
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_return_output);



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
 is_phase_3,
 is_phase_4,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_return_output,
 l8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output,
 deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_return_output,
 device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_return_output,
 n8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output,
 result_MUX_uxn_opcodes_h_l539_c2_7e98_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_return_output,
 deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_return_output,
 t8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 l8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 n8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 t8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 l8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 n8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 t8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_return_output,
 MUX_uxn_opcodes_h_l562_c17_932c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_return_output,
 MUX_uxn_opcodes_h_l563_c17_bd6e_return_output,
 MUX_uxn_opcodes_h_l564_c8_f0bc_return_output,
 MUX_uxn_opcodes_h_l565_c8_25de_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_return_output,
 MUX_uxn_opcodes_h_l566_c16_dd54_return_output,
 MUX_uxn_opcodes_h_l567_c16_f722_return_output,
 sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_return_output,
 MUX_uxn_opcodes_h_l568_c30_462a_return_output,
 device_out_uxn_opcodes_h_l569_c23_3473_return_output,
 BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l552_c3_39d9 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_7e98_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4b5f_uxn_opcodes_h_l539_c2_7e98_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_7e98_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_b22d : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_3c30 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_76a3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_df5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_iffalse : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_7cb5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_a4a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_932c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_932c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_932c_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_932c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_bd6e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_bd6e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_bd6e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_bd6e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_f0bc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_f0bc_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_f0bc_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_f0bc_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_25de_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_25de_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_25de_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_25de_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_dd54_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_dd54_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_dd54_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_dd54_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_f722_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_f722_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_f722_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_f722_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_462a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_462a_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_462a_iffalse : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_462a_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_3473_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_3473_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_3473_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_3473_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_3473_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_3473_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_3473_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_f76a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_0d71_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_d264_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_862a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_e8d1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_a55d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l578_c4_9f0d : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l581_c4_3dbe : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_1af8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_aff1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_eb10_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8250_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c79b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_4784_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_2b9b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_29f6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_17db_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_current_deo_phase : unsigned(7 downto 0);
variable REG_VAR_deo_param0 : unsigned(7 downto 0);
variable REG_VAR_deo_param1 : unsigned(7 downto 0);
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
  REG_VAR_current_deo_phase := current_deo_phase;
  REG_VAR_deo_param0 := deo_param0;
  REG_VAR_deo_param1 := deo_param1;
  REG_VAR_is_second_deo := is_second_deo;
  REG_VAR_is_phase_3 := is_phase_3;
  REG_VAR_is_phase_4 := is_phase_4;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_b22d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_current_deo_phase_uxn_opcodes_h_l578_c4_9f0d := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l578_c4_9f0d;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_right := to_unsigned(2, 2);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_3c30 := resize(to_unsigned(1, 1), 4);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := to_unsigned(0, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l552_c3_39d9 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l552_c3_39d9;
     VAR_MUX_uxn_opcodes_h_l562_c17_932c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_MUX_uxn_opcodes_h_l563_c17_bd6e_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l563_c17_bd6e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l562_c17_932c_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_7cb5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_7cb5;
     VAR_MUX_uxn_opcodes_h_l568_c30_462a_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_76a3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_76a3;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l569_c23_3473_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_ins := VAR_ins;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := is_phase_3;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := is_phase_4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l566_c16_dd54_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l567_c16_f722_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l564_c8_f0bc_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l565_c8_25de_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l569_c23_3473_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l569_c23_3473_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l564_c8_f0bc_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l565_c8_25de_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_left := t8;
     VAR_MUX_uxn_opcodes_h_l566_c16_dd54_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l562_c17_a8db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_left;
     BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_return_output := BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l539_c2_7e98] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_7e98_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_b22d,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_3c30,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_29f6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_29f6_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_a4a6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l581_c4_4ad4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_eb10 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_eb10_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l557_c11_58c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_4784 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_4784_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l539_c6_ce6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_1af8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_1af8_return_output := result.vram_write_layer;

     -- sp_relative_shift[uxn_opcodes_h_l568_c43_1e88] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_ins;
     sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_x <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_x;
     sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_y <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_return_output := sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_2b9b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_2b9b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l554_c11_5bbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l563_c17_7832] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_left;
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_return_output := BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l566_c32_4e02] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_left;
     BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_return_output := BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c79b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c79b_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8250 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8250_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_aff1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_aff1_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_7e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_7e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_7e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_7e98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_ce6d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_df5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5bbf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_58c1_return_output;
     VAR_MUX_uxn_opcodes_h_l562_c17_932c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_a8db_return_output;
     VAR_MUX_uxn_opcodes_h_l563_c17_bd6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_7832_return_output;
     VAR_MUX_uxn_opcodes_h_l566_c16_dd54_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_4e02_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l581_c4_3dbe := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_4ad4_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_2b9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_2b9b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c79b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c79b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_eb10_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_eb10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_29f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_29f6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_aff1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_aff1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_1af8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_1af8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_4784_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_4784_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8250_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_8250_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_7e98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_a4a6_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c30_462a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_1e88_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l581_c4_3dbe;
     -- t8_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     t8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     t8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := t8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- MUX[uxn_opcodes_h_l563_c17_bd6e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l563_c17_bd6e_cond <= VAR_MUX_uxn_opcodes_h_l563_c17_bd6e_cond;
     MUX_uxn_opcodes_h_l563_c17_bd6e_iftrue <= VAR_MUX_uxn_opcodes_h_l563_c17_bd6e_iftrue;
     MUX_uxn_opcodes_h_l563_c17_bd6e_iffalse <= VAR_MUX_uxn_opcodes_h_l563_c17_bd6e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l563_c17_bd6e_return_output := MUX_uxn_opcodes_h_l563_c17_bd6e_return_output;

     -- MUX[uxn_opcodes_h_l562_c17_932c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l562_c17_932c_cond <= VAR_MUX_uxn_opcodes_h_l562_c17_932c_cond;
     MUX_uxn_opcodes_h_l562_c17_932c_iftrue <= VAR_MUX_uxn_opcodes_h_l562_c17_932c_iftrue;
     MUX_uxn_opcodes_h_l562_c17_932c_iffalse <= VAR_MUX_uxn_opcodes_h_l562_c17_932c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l562_c17_932c_return_output := MUX_uxn_opcodes_h_l562_c17_932c_return_output;

     -- MUX[uxn_opcodes_h_l566_c16_dd54] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l566_c16_dd54_cond <= VAR_MUX_uxn_opcodes_h_l566_c16_dd54_cond;
     MUX_uxn_opcodes_h_l566_c16_dd54_iftrue <= VAR_MUX_uxn_opcodes_h_l566_c16_dd54_iftrue;
     MUX_uxn_opcodes_h_l566_c16_dd54_iffalse <= VAR_MUX_uxn_opcodes_h_l566_c16_dd54_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l566_c16_dd54_return_output := MUX_uxn_opcodes_h_l566_c16_dd54_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;
     VAR_MUX_uxn_opcodes_h_l564_c8_f0bc_cond := VAR_MUX_uxn_opcodes_h_l562_c17_932c_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c30_462a_cond := VAR_MUX_uxn_opcodes_h_l562_c17_932c_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_MUX_uxn_opcodes_h_l562_c17_932c_return_output;
     VAR_MUX_uxn_opcodes_h_l565_c8_25de_cond := VAR_MUX_uxn_opcodes_h_l563_c17_bd6e_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_MUX_uxn_opcodes_h_l563_c17_bd6e_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_MUX_uxn_opcodes_h_l566_c16_dd54_return_output;
     VAR_device_out_uxn_opcodes_h_l569_c23_3473_device_address := VAR_MUX_uxn_opcodes_h_l566_c16_dd54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     -- is_phase_4_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- MUX[uxn_opcodes_h_l568_c30_462a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l568_c30_462a_cond <= VAR_MUX_uxn_opcodes_h_l568_c30_462a_cond;
     MUX_uxn_opcodes_h_l568_c30_462a_iftrue <= VAR_MUX_uxn_opcodes_h_l568_c30_462a_iftrue;
     MUX_uxn_opcodes_h_l568_c30_462a_iffalse <= VAR_MUX_uxn_opcodes_h_l568_c30_462a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l568_c30_462a_return_output := MUX_uxn_opcodes_h_l568_c30_462a_return_output;

     -- t8_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     t8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     t8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := t8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- MUX[uxn_opcodes_h_l564_c8_f0bc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l564_c8_f0bc_cond <= VAR_MUX_uxn_opcodes_h_l564_c8_f0bc_cond;
     MUX_uxn_opcodes_h_l564_c8_f0bc_iftrue <= VAR_MUX_uxn_opcodes_h_l564_c8_f0bc_iftrue;
     MUX_uxn_opcodes_h_l564_c8_f0bc_iffalse <= VAR_MUX_uxn_opcodes_h_l564_c8_f0bc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l564_c8_f0bc_return_output := MUX_uxn_opcodes_h_l564_c8_f0bc_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- MUX[uxn_opcodes_h_l565_c8_25de] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l565_c8_25de_cond <= VAR_MUX_uxn_opcodes_h_l565_c8_25de_cond;
     MUX_uxn_opcodes_h_l565_c8_25de_iftrue <= VAR_MUX_uxn_opcodes_h_l565_c8_25de_iftrue;
     MUX_uxn_opcodes_h_l565_c8_25de_iffalse <= VAR_MUX_uxn_opcodes_h_l565_c8_25de_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l565_c8_25de_return_output := MUX_uxn_opcodes_h_l565_c8_25de_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_f722_iffalse := VAR_MUX_uxn_opcodes_h_l564_c8_f0bc_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_MUX_uxn_opcodes_h_l564_c8_f0bc_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_f722_iftrue := VAR_MUX_uxn_opcodes_h_l565_c8_25de_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_MUX_uxn_opcodes_h_l565_c8_25de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_MUX_uxn_opcodes_h_l568_c30_462a_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse := VAR_t8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;
     -- l8_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     l8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     l8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := l8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- MUX[uxn_opcodes_h_l567_c16_f722] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l567_c16_f722_cond <= VAR_MUX_uxn_opcodes_h_l567_c16_f722_cond;
     MUX_uxn_opcodes_h_l567_c16_f722_iftrue <= VAR_MUX_uxn_opcodes_h_l567_c16_f722_iftrue;
     MUX_uxn_opcodes_h_l567_c16_f722_iffalse <= VAR_MUX_uxn_opcodes_h_l567_c16_f722_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l567_c16_f722_return_output := MUX_uxn_opcodes_h_l567_c16_f722_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- t8_MUX[uxn_opcodes_h_l539_c2_7e98] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l539_c2_7e98_cond <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_7e98_cond;
     t8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue;
     t8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output := t8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;

     -- n8_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     n8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     n8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := n8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_7b73] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l569_c23_3473_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_7b73_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_MUX_uxn_opcodes_h_l567_c16_f722_return_output;
     VAR_device_out_uxn_opcodes_h_l569_c23_3473_value := VAR_MUX_uxn_opcodes_h_l567_c16_f722_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_l8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;
     -- n8_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     n8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     n8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := n8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- device_out[uxn_opcodes_h_l569_c23_3473] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l569_c23_3473_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l569_c23_3473_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l569_c23_3473_device_address <= VAR_device_out_uxn_opcodes_h_l569_c23_3473_device_address;
     device_out_uxn_opcodes_h_l569_c23_3473_value <= VAR_device_out_uxn_opcodes_h_l569_c23_3473_value;
     device_out_uxn_opcodes_h_l569_c23_3473_phase <= VAR_device_out_uxn_opcodes_h_l569_c23_3473_phase;
     device_out_uxn_opcodes_h_l569_c23_3473_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l569_c23_3473_previous_device_ram_read;
     device_out_uxn_opcodes_h_l569_c23_3473_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l569_c23_3473_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l569_c23_3473_return_output := device_out_uxn_opcodes_h_l569_c23_3473_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l539_c2_7e98] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_cond;
     deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_return_output := deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l539_c2_7e98] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_cond;
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_return_output := is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;

     -- l8_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     l8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     l8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := l8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l539_c2_7e98] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_cond;
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_return_output := is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_device_out_uxn_opcodes_h_l569_c23_3473_return_output;
     REG_VAR_is_phase_3 := VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;
     REG_VAR_is_phase_4 := VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse := VAR_l8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse := VAR_n8_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;
     -- deo_param1_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l575_c21_a55d] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_a55d_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_3473_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l570_c32_f76a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_f76a_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_3473_return_output.is_device_ram_write;

     -- l8_MUX[uxn_opcodes_h_l539_c2_7e98] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l539_c2_7e98_cond <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_7e98_cond;
     l8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue;
     l8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output := l8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;

     -- n8_MUX[uxn_opcodes_h_l539_c2_7e98] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l539_c2_7e98_cond <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_7e98_cond;
     n8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue;
     n8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output := n8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l573_c29_862a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_862a_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_3473_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_17db LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_17db_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_3473_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l572_c26_d264] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_d264_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_3473_return_output.is_vram_write;

     -- device_out_result_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l571_c31_0d71] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_0d71_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_3473_return_output.device_ram_address;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l574_c22_e8d1] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_e8d1_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_3473_return_output.u16_addr;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_e8d1_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_17db_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_17db_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_17db_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_f76a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_d264_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_862a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_0d71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_a55d_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l577_c3_8d41] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_cond;
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_return_output := is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l576_c24_2e3c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_left;
     BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_return_output := BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l577_c3_8d41] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_return_output := current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l539_c2_7e98] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_cond;
     deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_return_output := deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_2e3c_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_8d41_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_8d41_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l539_c2_7e98] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_cond;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_return_output := device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l557_c7_a4a6] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output := current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_a4a6_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l554_c7_df5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_df5a_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l539_c2_7e98] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_cond;
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_return_output := is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l539_c2_7e98] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_return_output := current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4b5f[uxn_opcodes_h_l539_c2_7e98] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4b5f_uxn_opcodes_h_l539_c2_7e98_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4b5f(
     result,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_df5a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_df5a_return_output);

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4b5f_uxn_opcodes_h_l539_c2_7e98_return_output;
     -- result_MUX[uxn_opcodes_h_l539_c2_7e98] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l539_c2_7e98_cond <= VAR_result_MUX_uxn_opcodes_h_l539_c2_7e98_cond;
     result_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue <= VAR_result_MUX_uxn_opcodes_h_l539_c2_7e98_iftrue;
     result_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse <= VAR_result_MUX_uxn_opcodes_h_l539_c2_7e98_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l539_c2_7e98_return_output := result_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l539_c2_7e98_return_output;
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
     current_deo_phase <= REG_COMB_current_deo_phase;
     deo_param0 <= REG_COMB_deo_param0;
     deo_param1 <= REG_COMB_deo_param1;
     is_second_deo <= REG_COMB_is_second_deo;
     is_phase_3 <= REG_COMB_is_phase_3;
     is_phase_4 <= REG_COMB_is_phase_4;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
