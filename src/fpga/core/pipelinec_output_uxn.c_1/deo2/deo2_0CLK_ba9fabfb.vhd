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
entity deo2_0CLK_ba9fabfb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo2_0CLK_ba9fabfb;
architecture arch of deo2_0CLK_ba9fabfb is
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
-- BIN_OP_EQ[uxn_opcodes_h_l539_c6_e434]
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c7_d19d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l539_c2_bfcf]
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l539_c2_bfcf]
signal l8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l539_c2_bfcf]
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l539_c2_bfcf]
signal result_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : opcode_result_t;

-- deo_param1_MUX[uxn_opcodes_h_l539_c2_bfcf]
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l539_c2_bfcf]
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l539_c2_bfcf]
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : device_out_result_t;

-- is_phase_4_MUX[uxn_opcodes_h_l539_c2_bfcf]
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l539_c2_bfcf]
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l539_c2_bfcf]
signal t8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l539_c2_bfcf]
signal n8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l554_c11_5b0b]
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l554_c7_d19d]
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l554_c7_d19d]
signal l8_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l554_c7_d19d]
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l554_c7_d19d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l554_c7_d19d]
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l554_c7_d19d]
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(15 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l554_c7_d19d]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l554_c7_d19d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c7_d19d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c7_d19d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l554_c7_d19d]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l554_c7_d19d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l554_c7_d19d]
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l554_c7_d19d]
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l554_c7_d19d]
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : device_out_result_t;

-- is_phase_4_MUX[uxn_opcodes_h_l554_c7_d19d]
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l554_c7_d19d]
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l554_c7_d19d]
signal t8_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l554_c7_d19d]
signal n8_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l557_c11_caaa]
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_d845]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_return_output : unsigned(0 downto 0);

-- is_phase_3_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
signal is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal l8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);

-- deo_param0_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
signal deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(15 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);

-- deo_param1_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
signal deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : device_out_result_t;

-- is_phase_4_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
signal is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal t8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l557_c7_f1e6]
signal n8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l562_c17_8b33]
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l562_c17_b76d]
signal MUX_uxn_opcodes_h_l562_c17_b76d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_b76d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_b76d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l562_c17_b76d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l563_c17_5993]
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l563_c17_0cc0]
signal MUX_uxn_opcodes_h_l563_c17_0cc0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_0cc0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_0cc0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l563_c17_0cc0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l564_c8_bb08]
signal MUX_uxn_opcodes_h_l564_c8_bb08_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_bb08_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_bb08_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l564_c8_bb08_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l565_c8_7573]
signal MUX_uxn_opcodes_h_l565_c8_7573_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_7573_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_7573_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l565_c8_7573_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l566_c32_acab]
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l566_c16_456f]
signal MUX_uxn_opcodes_h_l566_c16_456f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_456f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_456f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l566_c16_456f_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l567_c16_7b44]
signal MUX_uxn_opcodes_h_l567_c16_7b44_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_7b44_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_7b44_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l567_c16_7b44_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l568_c43_a010]
signal sp_relative_shift_uxn_opcodes_h_l568_c43_a010_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_a010_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_a010_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l568_c43_a010_return_output : signed(3 downto 0);

-- MUX[uxn_opcodes_h_l568_c30_1f39]
signal MUX_uxn_opcodes_h_l568_c30_1f39_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_1f39_iftrue : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_1f39_iffalse : signed(3 downto 0);
signal MUX_uxn_opcodes_h_l568_c30_1f39_return_output : signed(3 downto 0);

-- device_out[uxn_opcodes_h_l569_c23_1e90]
signal device_out_uxn_opcodes_h_l569_c23_1e90_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_1e90_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_1e90_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_1e90_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_1e90_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_1e90_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l569_c23_1e90_return_output : device_out_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l576_c24_9635]
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_return_output : unsigned(0 downto 0);

-- current_deo_phase_MUX[uxn_opcodes_h_l577_c3_c543]
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_cond : unsigned(0 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_iftrue : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_iffalse : unsigned(7 downto 0);
signal current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_return_output : unsigned(7 downto 0);

-- is_second_deo_MUX[uxn_opcodes_h_l577_c3_c543]
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_cond : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_iftrue : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_iffalse : unsigned(0 downto 0);
signal is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l581_c4_a825]
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_19da( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.vram_write_layer := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434
BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_left,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_right,
BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf
is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_cond,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output);

-- l8_MUX_uxn_opcodes_h_l539_c2_bfcf
l8_MUX_uxn_opcodes_h_l539_c2_bfcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond,
l8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue,
l8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse,
l8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf
deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_cond,
deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue,
deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse,
deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output);

-- result_MUX_uxn_opcodes_h_l539_c2_bfcf
result_MUX_uxn_opcodes_h_l539_c2_bfcf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l539_c2_bfcf_cond,
result_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue,
result_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse,
result_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf
deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_cond,
deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue,
deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse,
deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_cond,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf
device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_cond,
device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue,
device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse,
device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf
is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_cond,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf
is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_cond,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output);

-- t8_MUX_uxn_opcodes_h_l539_c2_bfcf
t8_MUX_uxn_opcodes_h_l539_c2_bfcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond,
t8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue,
t8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse,
t8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output);

-- n8_MUX_uxn_opcodes_h_l539_c2_bfcf
n8_MUX_uxn_opcodes_h_l539_c2_bfcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond,
n8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue,
n8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse,
n8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b
BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_left,
BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_right,
BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d
is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- l8_MUX_uxn_opcodes_h_l554_c7_d19d
l8_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
l8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
l8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
l8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d
deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d
result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d
result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d
deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d
device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d
is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d
is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- t8_MUX_uxn_opcodes_h_l554_c7_d19d
t8_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
t8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
t8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
t8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- n8_MUX_uxn_opcodes_h_l554_c7_d19d
n8_MUX_uxn_opcodes_h_l554_c7_d19d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l554_c7_d19d_cond,
n8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue,
n8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse,
n8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa
BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_left,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_right,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_return_output);

-- is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6
is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- l8_MUX_uxn_opcodes_h_l557_c7_f1e6
l8_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
l8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
l8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
l8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6
deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6
result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6
result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6
deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6
device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6
is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6
is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- t8_MUX_uxn_opcodes_h_l557_c7_f1e6
t8_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
t8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
t8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
t8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- n8_MUX_uxn_opcodes_h_l557_c7_f1e6
n8_MUX_uxn_opcodes_h_l557_c7_f1e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond,
n8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue,
n8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse,
n8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33
BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_left,
BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_right,
BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_return_output);

-- MUX_uxn_opcodes_h_l562_c17_b76d
MUX_uxn_opcodes_h_l562_c17_b76d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l562_c17_b76d_cond,
MUX_uxn_opcodes_h_l562_c17_b76d_iftrue,
MUX_uxn_opcodes_h_l562_c17_b76d_iffalse,
MUX_uxn_opcodes_h_l562_c17_b76d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993
BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_left,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_right,
BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_return_output);

-- MUX_uxn_opcodes_h_l563_c17_0cc0
MUX_uxn_opcodes_h_l563_c17_0cc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l563_c17_0cc0_cond,
MUX_uxn_opcodes_h_l563_c17_0cc0_iftrue,
MUX_uxn_opcodes_h_l563_c17_0cc0_iffalse,
MUX_uxn_opcodes_h_l563_c17_0cc0_return_output);

-- MUX_uxn_opcodes_h_l564_c8_bb08
MUX_uxn_opcodes_h_l564_c8_bb08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l564_c8_bb08_cond,
MUX_uxn_opcodes_h_l564_c8_bb08_iftrue,
MUX_uxn_opcodes_h_l564_c8_bb08_iffalse,
MUX_uxn_opcodes_h_l564_c8_bb08_return_output);

-- MUX_uxn_opcodes_h_l565_c8_7573
MUX_uxn_opcodes_h_l565_c8_7573 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l565_c8_7573_cond,
MUX_uxn_opcodes_h_l565_c8_7573_iftrue,
MUX_uxn_opcodes_h_l565_c8_7573_iffalse,
MUX_uxn_opcodes_h_l565_c8_7573_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_left,
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_right,
BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_return_output);

-- MUX_uxn_opcodes_h_l566_c16_456f
MUX_uxn_opcodes_h_l566_c16_456f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l566_c16_456f_cond,
MUX_uxn_opcodes_h_l566_c16_456f_iftrue,
MUX_uxn_opcodes_h_l566_c16_456f_iffalse,
MUX_uxn_opcodes_h_l566_c16_456f_return_output);

-- MUX_uxn_opcodes_h_l567_c16_7b44
MUX_uxn_opcodes_h_l567_c16_7b44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l567_c16_7b44_cond,
MUX_uxn_opcodes_h_l567_c16_7b44_iftrue,
MUX_uxn_opcodes_h_l567_c16_7b44_iffalse,
MUX_uxn_opcodes_h_l567_c16_7b44_return_output);

-- sp_relative_shift_uxn_opcodes_h_l568_c43_a010
sp_relative_shift_uxn_opcodes_h_l568_c43_a010 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l568_c43_a010_ins,
sp_relative_shift_uxn_opcodes_h_l568_c43_a010_x,
sp_relative_shift_uxn_opcodes_h_l568_c43_a010_y,
sp_relative_shift_uxn_opcodes_h_l568_c43_a010_return_output);

-- MUX_uxn_opcodes_h_l568_c30_1f39
MUX_uxn_opcodes_h_l568_c30_1f39 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l568_c30_1f39_cond,
MUX_uxn_opcodes_h_l568_c30_1f39_iftrue,
MUX_uxn_opcodes_h_l568_c30_1f39_iffalse,
MUX_uxn_opcodes_h_l568_c30_1f39_return_output);

-- device_out_uxn_opcodes_h_l569_c23_1e90
device_out_uxn_opcodes_h_l569_c23_1e90 : entity work.device_out_0CLK_3946f298 port map (
clk,
device_out_uxn_opcodes_h_l569_c23_1e90_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l569_c23_1e90_device_address,
device_out_uxn_opcodes_h_l569_c23_1e90_value,
device_out_uxn_opcodes_h_l569_c23_1e90_phase,
device_out_uxn_opcodes_h_l569_c23_1e90_previous_device_ram_read,
device_out_uxn_opcodes_h_l569_c23_1e90_previous_ram_read,
device_out_uxn_opcodes_h_l569_c23_1e90_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l576_c24_9635
BIN_OP_AND_uxn_opcodes_h_l576_c24_9635 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_left,
BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_right,
BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_return_output);

-- current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_cond,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_iftrue,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_iffalse,
current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_return_output);

-- is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543
is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_cond,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_iftrue,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_iffalse,
is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_left,
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_right,
BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output,
 l8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output,
 deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output,
 result_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output,
 deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output,
 device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output,
 t8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output,
 n8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 l8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 t8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 n8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_return_output,
 is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 l8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 t8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 n8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_return_output,
 MUX_uxn_opcodes_h_l562_c17_b76d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_return_output,
 MUX_uxn_opcodes_h_l563_c17_0cc0_return_output,
 MUX_uxn_opcodes_h_l564_c8_bb08_return_output,
 MUX_uxn_opcodes_h_l565_c8_7573_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_return_output,
 MUX_uxn_opcodes_h_l566_c16_456f_return_output,
 MUX_uxn_opcodes_h_l567_c16_7b44_return_output,
 sp_relative_shift_uxn_opcodes_h_l568_c43_a010_return_output,
 MUX_uxn_opcodes_h_l568_c30_1f39_return_output,
 device_out_uxn_opcodes_h_l569_c23_1e90_return_output,
 BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_return_output,
 current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_return_output,
 is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_bfcf_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_19da_uxn_opcodes_h_l539_c2_bfcf_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l552_c3_6052 : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_618f : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_24ff : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_07c0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l554_c7_d19d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_f0c8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_f1e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
 variable VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_return_output : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
 variable VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_return_output : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_b76d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_b76d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_b76d_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l562_c17_b76d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_0cc0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_0cc0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_0cc0_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l563_c17_0cc0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_bb08_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_bb08_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_bb08_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l564_c8_bb08_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_7573_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_7573_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_7573_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l565_c8_7573_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_456f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_456f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_456f_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l566_c16_456f_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_7b44_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_7b44_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_7b44_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l567_c16_7b44_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_1f39_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_1f39_iftrue : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_1f39_iffalse : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_a010_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_a010_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_a010_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_a010_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l568_c30_1f39_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_1e90_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_1e90_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_1e90_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_1e90_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_1e90_previous_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_1e90_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l569_c23_1e90_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_c53e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_e132_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_612f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_872e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_caab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_fd0f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_return_output : unsigned(0 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_iftrue : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l578_c4_d47e : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_iffalse : unsigned(7 downto 0);
 variable VAR_current_deo_phase_uxn_opcodes_h_l581_c4_3eed : unsigned(7 downto 0);
 variable VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_cond : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_iftrue : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_iffalse : unsigned(0 downto 0);
 variable VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c707_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_ed70_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_1e5a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_2c9f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_efc8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_5feb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_43b0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_503a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_1fb8_return_output : unsigned(0 downto 0);
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
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l563_c17_0cc0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_right := to_unsigned(4, 3);
     VAR_current_deo_phase_uxn_opcodes_h_l578_c4_d47e := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l578_c4_d47e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_f0c8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_f0c8;
     VAR_MUX_uxn_opcodes_h_l563_c17_0cc0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_right := to_unsigned(1, 1);
     VAR_current_deo_phase_uxn_opcodes_h_l552_c3_6052 := resize(to_unsigned(0, 1), 8);
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue := VAR_current_deo_phase_uxn_opcodes_h_l552_c3_6052;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_right := to_unsigned(3, 2);
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_a010_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_24ff := resize(to_unsigned(1, 1), 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l562_c17_b76d_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_07c0 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l555_c3_07c0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l562_c17_b76d_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_a010_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l568_c30_1f39_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_618f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_right := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_left := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := current_deo_phase;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := current_deo_phase;
     VAR_device_out_uxn_opcodes_h_l569_c23_1e90_phase := current_deo_phase;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := deo_param0;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := deo_param0;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := deo_param1;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := deo_param1;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_a010_ins := VAR_ins;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := is_phase_3;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := is_phase_3;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := is_phase_4;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := is_phase_4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_right := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l566_c16_456f_cond := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l567_c16_7b44_cond := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := is_second_deo;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_iffalse := is_second_deo;
     VAR_MUX_uxn_opcodes_h_l564_c8_bb08_iffalse := l8;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := l8;
     VAR_MUX_uxn_opcodes_h_l565_c8_7573_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l569_c23_1e90_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l569_c23_1e90_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l564_c8_bb08_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l565_c8_7573_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_left := t8;
     VAR_MUX_uxn_opcodes_h_l566_c16_456f_iffalse := t8;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_43b0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_43b0_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_503a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_503a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l562_c17_8b33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_left;
     BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_return_output := BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l539_c6_e434] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_left;
     BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output := BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l554_c11_5b0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c707 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c707_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_ed70 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_ed70_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_1e5a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_1e5a_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_efc8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_efc8_return_output := result.device_ram_address;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_5feb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_5feb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l557_c11_caaa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_left;
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output := BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l566_c32_acab] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_left;
     BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_return_output := BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_2c9f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_2c9f_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_opcodes_h_l563_c17_5993] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_left;
     BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_return_output := BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_f1e6_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l568_c43_a010] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l568_c43_a010_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_a010_ins;
     sp_relative_shift_uxn_opcodes_h_l568_c43_a010_x <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_a010_x;
     sp_relative_shift_uxn_opcodes_h_l568_c43_a010_y <= VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_a010_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_a010_return_output := sp_relative_shift_uxn_opcodes_h_l568_c43_a010_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l539_c2_bfcf] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_bfcf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l544_c3_618f,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l549_c3_24ff,
     to_unsigned(0, 1));

     -- BIN_OP_PLUS[uxn_opcodes_h_l581_c4_a825] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_left;
     BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_return_output := BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_bfcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c6_e434_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_d19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c11_5b0b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_caaa_return_output;
     VAR_MUX_uxn_opcodes_h_l562_c17_b76d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l562_c17_8b33_return_output;
     VAR_MUX_uxn_opcodes_h_l563_c17_0cc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c17_5993_return_output;
     VAR_MUX_uxn_opcodes_h_l566_c16_456f_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l566_c32_acab_return_output, 8);
     VAR_current_deo_phase_uxn_opcodes_h_l581_c4_3eed := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l581_c4_a825_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_5feb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_5feb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_1e5a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_1e5a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_43b0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_43b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_503a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_503a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c707_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_c707_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_2c9f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_2c9f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_efc8_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_efc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_ed70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l554_l557_DUPLICATE_ed70_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l539_c2_bfcf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l557_c7_f1e6_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c30_1f39_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l568_c43_a010_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_iffalse := VAR_current_deo_phase_uxn_opcodes_h_l581_c4_3eed;
     -- MUX[uxn_opcodes_h_l562_c17_b76d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l562_c17_b76d_cond <= VAR_MUX_uxn_opcodes_h_l562_c17_b76d_cond;
     MUX_uxn_opcodes_h_l562_c17_b76d_iftrue <= VAR_MUX_uxn_opcodes_h_l562_c17_b76d_iftrue;
     MUX_uxn_opcodes_h_l562_c17_b76d_iffalse <= VAR_MUX_uxn_opcodes_h_l562_c17_b76d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l562_c17_b76d_return_output := MUX_uxn_opcodes_h_l562_c17_b76d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- MUX[uxn_opcodes_h_l566_c16_456f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l566_c16_456f_cond <= VAR_MUX_uxn_opcodes_h_l566_c16_456f_cond;
     MUX_uxn_opcodes_h_l566_c16_456f_iftrue <= VAR_MUX_uxn_opcodes_h_l566_c16_456f_iftrue;
     MUX_uxn_opcodes_h_l566_c16_456f_iffalse <= VAR_MUX_uxn_opcodes_h_l566_c16_456f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l566_c16_456f_return_output := MUX_uxn_opcodes_h_l566_c16_456f_return_output;

     -- t8_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     t8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     t8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := t8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- MUX[uxn_opcodes_h_l563_c17_0cc0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l563_c17_0cc0_cond <= VAR_MUX_uxn_opcodes_h_l563_c17_0cc0_cond;
     MUX_uxn_opcodes_h_l563_c17_0cc0_iftrue <= VAR_MUX_uxn_opcodes_h_l563_c17_0cc0_iftrue;
     MUX_uxn_opcodes_h_l563_c17_0cc0_iffalse <= VAR_MUX_uxn_opcodes_h_l563_c17_0cc0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l563_c17_0cc0_return_output := MUX_uxn_opcodes_h_l563_c17_0cc0_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;
     VAR_MUX_uxn_opcodes_h_l564_c8_bb08_cond := VAR_MUX_uxn_opcodes_h_l562_c17_b76d_return_output;
     VAR_MUX_uxn_opcodes_h_l568_c30_1f39_cond := VAR_MUX_uxn_opcodes_h_l562_c17_b76d_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_MUX_uxn_opcodes_h_l562_c17_b76d_return_output;
     VAR_MUX_uxn_opcodes_h_l565_c8_7573_cond := VAR_MUX_uxn_opcodes_h_l563_c17_0cc0_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_MUX_uxn_opcodes_h_l563_c17_0cc0_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_MUX_uxn_opcodes_h_l566_c16_456f_return_output;
     VAR_device_out_uxn_opcodes_h_l569_c23_1e90_device_address := VAR_MUX_uxn_opcodes_h_l566_c16_456f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- t8_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     t8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     t8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := t8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- MUX[uxn_opcodes_h_l565_c8_7573] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l565_c8_7573_cond <= VAR_MUX_uxn_opcodes_h_l565_c8_7573_cond;
     MUX_uxn_opcodes_h_l565_c8_7573_iftrue <= VAR_MUX_uxn_opcodes_h_l565_c8_7573_iftrue;
     MUX_uxn_opcodes_h_l565_c8_7573_iffalse <= VAR_MUX_uxn_opcodes_h_l565_c8_7573_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l565_c8_7573_return_output := MUX_uxn_opcodes_h_l565_c8_7573_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- MUX[uxn_opcodes_h_l564_c8_bb08] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l564_c8_bb08_cond <= VAR_MUX_uxn_opcodes_h_l564_c8_bb08_cond;
     MUX_uxn_opcodes_h_l564_c8_bb08_iftrue <= VAR_MUX_uxn_opcodes_h_l564_c8_bb08_iftrue;
     MUX_uxn_opcodes_h_l564_c8_bb08_iffalse <= VAR_MUX_uxn_opcodes_h_l564_c8_bb08_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l564_c8_bb08_return_output := MUX_uxn_opcodes_h_l564_c8_bb08_return_output;

     -- is_phase_4_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- MUX[uxn_opcodes_h_l568_c30_1f39] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l568_c30_1f39_cond <= VAR_MUX_uxn_opcodes_h_l568_c30_1f39_cond;
     MUX_uxn_opcodes_h_l568_c30_1f39_iftrue <= VAR_MUX_uxn_opcodes_h_l568_c30_1f39_iftrue;
     MUX_uxn_opcodes_h_l568_c30_1f39_iffalse <= VAR_MUX_uxn_opcodes_h_l568_c30_1f39_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l568_c30_1f39_return_output := MUX_uxn_opcodes_h_l568_c30_1f39_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_7b44_iffalse := VAR_MUX_uxn_opcodes_h_l564_c8_bb08_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_MUX_uxn_opcodes_h_l564_c8_bb08_return_output;
     VAR_MUX_uxn_opcodes_h_l567_c16_7b44_iftrue := VAR_MUX_uxn_opcodes_h_l565_c8_7573_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_MUX_uxn_opcodes_h_l565_c8_7573_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_MUX_uxn_opcodes_h_l568_c30_1f39_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse := VAR_t8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;
     -- is_phase_4_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l561_c1_d845] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_return_output;

     -- l8_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     l8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     l8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := l8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- t8_MUX[uxn_opcodes_h_l539_c2_bfcf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond;
     t8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue;
     t8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output := t8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- n8_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     n8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     n8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := n8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- MUX[uxn_opcodes_h_l567_c16_7b44] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l567_c16_7b44_cond <= VAR_MUX_uxn_opcodes_h_l567_c16_7b44_cond;
     MUX_uxn_opcodes_h_l567_c16_7b44_iftrue <= VAR_MUX_uxn_opcodes_h_l567_c16_7b44_iftrue;
     MUX_uxn_opcodes_h_l567_c16_7b44_iffalse <= VAR_MUX_uxn_opcodes_h_l567_c16_7b44_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l567_c16_7b44_return_output := MUX_uxn_opcodes_h_l567_c16_7b44_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l569_c23_1e90_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l561_c1_d845_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_MUX_uxn_opcodes_h_l567_c16_7b44_return_output;
     VAR_device_out_uxn_opcodes_h_l569_c23_1e90_value := VAR_MUX_uxn_opcodes_h_l567_c16_7b44_return_output;
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse := VAR_deo_param0_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse := VAR_is_phase_3_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse := VAR_is_phase_4_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_l8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;
     -- is_phase_4_MUX[uxn_opcodes_h_l539_c2_bfcf] LATENCY=0
     -- Inputs
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_cond <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_cond;
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue;
     is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse <= VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse;
     -- Outputs
     VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output := is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;

     -- n8_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     n8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     n8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := n8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- l8_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     l8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     l8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := l8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- deo_param0_MUX[uxn_opcodes_h_l539_c2_bfcf] LATENCY=0
     -- Inputs
     deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_cond <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_cond;
     deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue;
     deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse <= VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse;
     -- Outputs
     VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output := deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- device_out[uxn_opcodes_h_l569_c23_1e90] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l569_c23_1e90_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l569_c23_1e90_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l569_c23_1e90_device_address <= VAR_device_out_uxn_opcodes_h_l569_c23_1e90_device_address;
     device_out_uxn_opcodes_h_l569_c23_1e90_value <= VAR_device_out_uxn_opcodes_h_l569_c23_1e90_value;
     device_out_uxn_opcodes_h_l569_c23_1e90_phase <= VAR_device_out_uxn_opcodes_h_l569_c23_1e90_phase;
     device_out_uxn_opcodes_h_l569_c23_1e90_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l569_c23_1e90_previous_device_ram_read;
     device_out_uxn_opcodes_h_l569_c23_1e90_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l569_c23_1e90_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l569_c23_1e90_return_output := device_out_uxn_opcodes_h_l569_c23_1e90_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- is_phase_3_MUX[uxn_opcodes_h_l539_c2_bfcf] LATENCY=0
     -- Inputs
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_cond <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_cond;
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue;
     is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse <= VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse;
     -- Outputs
     VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output := is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;

     -- Submodule level 5
     REG_VAR_deo_param0 := VAR_deo_param0_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_device_out_uxn_opcodes_h_l569_c23_1e90_return_output;
     REG_VAR_is_phase_3 := VAR_is_phase_3_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;
     REG_VAR_is_phase_4 := VAR_is_phase_4_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse := VAR_l8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse := VAR_n8_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l575_c21_fd0f] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_fd0f_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_1e90_return_output.u8_value;

     -- deo_param1_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l571_c31_e132] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_e132_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_1e90_return_output.device_ram_address;

     -- n8_MUX[uxn_opcodes_h_l539_c2_bfcf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond;
     n8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue;
     n8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output := n8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l572_c26_612f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_612f_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_1e90_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l573_c29_872e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_872e_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_1e90_return_output.vram_write_layer;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l574_c22_caab] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_caab_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_1e90_return_output.u16_addr;

     -- l8_MUX[uxn_opcodes_h_l539_c2_bfcf] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_bfcf_cond;
     l8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue;
     l8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output := l8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l570_c32_c53e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_c53e_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_1e90_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_1fb8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_1fb8_return_output := VAR_device_out_uxn_opcodes_h_l569_c23_1e90_return_output.is_deo_done;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l574_c22_caab_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_left := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_1fb8_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_1fb8_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_cond := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l576_l577_DUPLICATE_1fb8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l570_c32_c53e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l572_c26_612f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l573_c29_872e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l571_c31_e132_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l575_c21_fd0f_return_output;
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse := VAR_deo_param1_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- deo_param1_MUX[uxn_opcodes_h_l539_c2_bfcf] LATENCY=0
     -- Inputs
     deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_cond <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_cond;
     deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue;
     deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse <= VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse;
     -- Outputs
     VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output := deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l576_c24_9635] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_left;
     BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_return_output := BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l577_c3_c543] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_return_output := current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l577_c3_c543] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_cond;
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_return_output := is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l576_c24_9635_return_output;
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l577_c3_c543_return_output;
     REG_VAR_deo_param1 := VAR_deo_param1_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l577_c3_c543_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l557_c7_f1e6] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output := current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l539_c2_bfcf] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_cond;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output := device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- Submodule level 8
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_f1e6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- is_second_deo_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l554_c7_d19d] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_return_output := current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;

     -- Submodule level 9
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse := VAR_current_deo_phase_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse := VAR_is_second_deo_MUX_uxn_opcodes_h_l554_c7_d19d_return_output;
     -- is_second_deo_MUX[uxn_opcodes_h_l539_c2_bfcf] LATENCY=0
     -- Inputs
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_cond <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_cond;
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue;
     is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse <= VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse;
     -- Outputs
     VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output := is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;

     -- current_deo_phase_MUX[uxn_opcodes_h_l539_c2_bfcf] LATENCY=0
     -- Inputs
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_cond <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_cond;
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue;
     current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse <= VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse;
     -- Outputs
     VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output := current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_19da[uxn_opcodes_h_l539_c2_bfcf] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_19da_uxn_opcodes_h_l539_c2_bfcf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_19da(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l554_c7_d19d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c7_d19d_return_output);

     -- Submodule level 10
     REG_VAR_current_deo_phase := VAR_current_deo_phase_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;
     REG_VAR_is_second_deo := VAR_is_second_deo_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;
     VAR_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_19da_uxn_opcodes_h_l539_c2_bfcf_return_output;
     -- result_MUX[uxn_opcodes_h_l539_c2_bfcf] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l539_c2_bfcf_cond <= VAR_result_MUX_uxn_opcodes_h_l539_c2_bfcf_cond;
     result_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue <= VAR_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iftrue;
     result_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse <= VAR_result_MUX_uxn_opcodes_h_l539_c2_bfcf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output := result_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l539_c2_bfcf_return_output;
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
